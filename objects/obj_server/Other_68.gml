

	var _sock = async_load[? "id"]; // id of socket from which data comes
	
	if (_sock == server) {
		#region CLIENTS new/disconnect
		// if data incoming to our server (server socket)
		
		var _type = async_load[? "type"]; // GM internal event type
		var _incoming_socket = async_load[? "socket"]; // id of socket on which data came
		
		if (_type == network_type_connect) {
			// that's new connection, so new socket was just created - we need to save it
			// so whe later can differentiate clients
			show_debug_message($"S: + new client connected on socket {_incoming_socket}");
			
			clients[? _incoming_socket] = instance_create_layer(room_width/2, room_height/2, layer, obj_server_player);
			clients[? _incoming_socket].desc = $"Player: {_incoming_socket}";
			clients[? _incoming_socket].socket = _incoming_socket;
		} else if (_type == network_type_disconnect) {
			// player disconnected
			show_debug_message($"S: - client {_incoming_socket} disconnected");
			
			var _player = clients[? _incoming_socket];
			if (instance_exists(_player)) {
				instance_destroy(_player);
			}
			
			ds_map_delete(clients, _incoming_socket);
			network_destroy(_incoming_socket);
		}
		#endregion
	} else {
		// that's data received on another socket, which means it's someone connected
		
		if (!ds_map_find_value(clients, _sock) < 0) {
			show_debug_message($"S: There's incoming data, but seems that this player ({_sock}) doesn't exists anymore...");
			exit; // don't process
		}
		
		var _buff = async_load[? "buffer"]; // this is data we got
		
		seize_buffer(_buff); // this copies temporary _buff to global.buffer :)
		
		if (option_39_check_for_static_key_in_header) {
			var _key = readbyte();
			if (_key != option_39_static_key) {
				show_debug_message($"S: got packets, but security key={_key} instead {option_39_static_key}. Skipping.");
				exit;
			}
		}
		
		var _command = readbyte(); // get first byte, which marks our command
		var _p = clients[? _sock]; // get player instance
		
		#region commands
		switch(_command) {
			case COMMAND_POSITION:
				_p.destx = readshort();		
				_p.desty = readshort();
				break;
				
			case COMMAND_FIRE:
				var _dir = readshort();
				var _x = readshort();
				var _y = readshort();
				
				instance_create_layer(_x, _y, layer, obj_bullet, {direction: _dir});
				
				// write new message to send data further
				// remember that global buffer is cleaned here, so we can't read it anymore now
				clearbuffer();
				writebyte(COMMAND_FIRE);
				writeshort(_dir);
				writeshort(_x);
				writeshort(_y);
				
				sendmessage_clients_except(_sock);
			break;
				
			default:
				show_debug_message($"S: Got unknown command {_command} from player on socket {_sock}");
		}
		#endregion
	}