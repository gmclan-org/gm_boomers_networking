

	port = option_port;
	
	// try creating server, max 10 players
	server = network_create_server(network_socket_tcp, port, 10);
	
	if (server == -1) {
		/* error creating server - usually port is alrady in use by another app,
		but this might also happen if our server crashed - port will be still taken for few seconds by OS */
		
		network_destroy(server); // to prevent blocking port
		show_error($"Can't create Server - port {port} in use", true);
		exit;
	}
	
	udp = -1;
	if (option_try_udp) {
		udp = network_create_server(network_socket_udp, option_udp_port, 10);
		if (udp == -1) {
			network_destroy(udp); // to prevent blocking port
			show_error($"Can't create Server - port {option_udp_port} in use", true);
			exit;
		}
	}
	
	// create database of connections
	clients = ds_map_create(); // this is cleared in Clean Up event to avoid memory leak
	
	alarm[0] = 1; // send data about players
	