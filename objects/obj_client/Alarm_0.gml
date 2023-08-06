

	// clear buffer
	clearbuffer();
	writebyte(COMMAND_POSITION);
	if (my_udp_id > -1 and option_try_udp) {
		writebyte(my_udp_id);
	}
	writeshort(round(x));
	writeshort(round(y));
	
	if (my_udp_id > -1 and option_try_udp) {
		sendmessage_udp(udp);
	} else {
		sendmessage(socket);
	}
	
	alarm[0] = option_sync_every_frames; // send this data every X frames