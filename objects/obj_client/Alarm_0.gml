

	// clear buffer
	clearbuffer();
	writebyte(COMMAND_POSITION);
	writeshort(round(x));
	writeshort(round(y));
	
	sendmessage(socket);
	
	alarm[0] = option_sync_every_frames; // send this data every X frames