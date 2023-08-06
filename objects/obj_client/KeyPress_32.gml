

	var a = instance_create_layer(x, y, layer, obj_bullet);
	a.direction = irandom(360);
	
	// clear buffer
	clearbuffer();
	writebyte(COMMAND_FIRE);
	writeshort(a.direction);
	writeshort(a.x);
	writeshort(a.y);
	
	sendmessage(socket);