

	var _type = async_load[? "type"];
	var _sock = async_load[? "id"];
	
	if (_sock == socket) {
		// network_type_disconnect seems to never hapen if server is closed
		/*if (_type == network_type_disconnect) {
				// server eneded game
				instance_destroy();
		}*/
		if (_type == network_type_data) {
			var _buff = async_load[? "buffer"]; // this is data we got
			
			seize_buffer(_buff); // copy GM temp buffer to global one
		
			if (option_39_check_for_static_key_in_header) {
				var _key = readbyte();
				if (_key != option_39_static_key) {
					show_debug_message($"C: got packets, but security key={_key} instead {option_39_static_key}. Skipping.");
					exit;
				}
			}
		
			var _command = readbyte(); // get first byte, which marks our command
			
			timeout = 0;
			
			switch(_command) {
				case COMMAND_SEND_UDP_ID:
					my_udp_id = readbyte();
					show_debug_message($"C: got UDP id {my_udp_id}");
				break;
				
				case COMMAND_PLAYERS_POS:
					var _synced = false;
					var _player_id = readbyte();
					var _destx = readshort();
					var _desty = readshort();
					
					with (obj_client_remote_player) {
						if (socket == _player_id) {
							destx = _destx;
							desty = _desty;
							timeout = 0; // reset timeout
							_synced = true;
						}
					}
					
					if (_synced == false) {
						// there was no object to sync, create new remote player
						var a = instance_create_layer(_destx, _desty, layer, obj_client_remote_player);
						a.socket = _player_id;
					}
					
				break;
				
				case COMMAND_FIRE:
					var _dir = readshort();
					var _x = readshort();
					var _y = readshort();
					
					instance_create_layer(_x, _y, layer, obj_bullet, {direction: _dir});
				break;
				
				case COMMAND_PING:
					// do nothing
				break;
					
				default:
					show_debug_message($"C: got command {_command} from server, which got no action assigned to it.");
			}
		//} else {
		//	show_debug_message($"C: got strange message of type {_type}");
		}
	//} else {
	//	show_debug_message($"C: got strange message on socket {socket} of type {_type}");
	}