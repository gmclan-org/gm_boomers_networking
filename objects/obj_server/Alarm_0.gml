/// @desc sync clients

	alarm[0] = option_sync_every_frames; // send data again in next X frames
	
	if (ds_map_size(clients) < 1) then exit;
	
	if (ds_map_size(clients) > 1) {
		// send only if there's more than one player
		
		var _players = ds_map_keys_to_array(clients);
		
		// foreach player
		for(var i = 0, isize = array_length(_players); i < isize; i++) {
			
			var _socket = _players[i]; // player which is processed now
			var _p = clients[? _socket];
			
			clearbuffer();
			writebyte(COMMAND_PLAYERS_POS);
			writebyte(_socket);
			writeshort(round(_p.destx));
			writeshort(round(_p.desty));
			
			sendmessage_clients_except(_socket);
		}
	} else {
		// ping this user, to reset his timeout
		clearbuffer();
		writebyte(COMMAND_PING);
		
		sendmessage_clients_except(-1);
	}