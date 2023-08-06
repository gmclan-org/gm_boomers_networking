

	draw_reset(c_purple, 1, fnt_main, fa_left, fa_top);
	
	var _udp = "";
	if (option_try_udp and udp > -1) {
		_udp = $"\n+ UDP listening on {option_udp_port}";
	}
	
	draw_text(80, 10, $"Server is listening on port: {option_port}{_udp}\nConnected players: {ds_map_size(clients)} | Esc - quit.");
	
	scr_dim_if_inactive();