/// @desc Clear buffer and sockets	
	
	show_debug_message("C: Disconnecting");
	if (socket > -1) {
		network_destroy(socket);
	}
	if (connect > -1) {
		network_destroy(connect);
	}
	if (udp > -1) {
		network_destroy(udp);
	}
	
	scr_go_back_menu();