/// this scripts setup everything that is needed to mimic 39dll functionality on GM native networking functions

#macro option_39_check_for_static_key_in_header false // wether to use additional integer to secure against broken TCP messages 
#macro option_39_auto_add_static_key false // automatically add static key in clearbuffer(); reqires previous option to be also true
#macro option_39_static_key 123 // 0 - 255, key used by previous two functions

global.buffer = buffer_create(0, buffer_grow, 1);
clearbuffer();


/// @desc Clears (given/global) buffer. Optinally may set a secret key as a first byte.
/// @param {Id.Buffer} _buff Id of Buffer to clear; global.buffer by default
/// @param {Bool} _add_secret_key Wheter to add secret key. Default to: (bool) option_39_check_for_static_key_in_header and option_39_auto_add_static_key
function clearbuffer(_buff = global.buffer, _add_secret_key = (option_39_check_for_static_key_in_header and option_39_auto_add_static_key)) {
	buffer_resize(_buff, 0);
	buffer_seek(_buff, buffer_seek_start, 0);
	
	if (_add_secret_key) {
		writebyte(option_39_static_key, _buff);
	}
}

/// @desc Sends buffer data (up to current write/read pos, not whole!) using selected socket
/// @param {Id.Socket} _socket Socket to use to send data
/// @param {Id.Buffer} _buff Buffer to use (only data from 0 to curr pos will be sent)
function sendmessage(_socket, _buff = global.buffer) {
	network_send_packet(_socket, _buff, buffer_tell(_buff));
}

/// @desc Sends buffer data (up to current write/read pos, not whole!) using selected socket
/// @param {Id.Socket} _socket Socket to use to send data
/// @param {Id.Buffer} _buff Buffer to use (only data from 0 to curr pos will be sent)
function sendmessage_udp(_socket, _buff = global.buffer) {
	network_send_udp(_socket, option_ip, option_udp_port, _buff, buffer_tell(_buff));
}

/// @desc Gets read/write position in buffer.
/// @param {Id.Buffer} _buff Id of Buffer to check
function getpos(_buff = global.buffer) {
	return buffer_tell(_buff);
}

/// @desc Gets read/write position in buffer.
/// @param {Real} _pos Position in bytes
/// @param {Id.Buffer} _buff Id of Buffer to check
function setpos(_pos = 0, _buff = global.buffer) {
	return buffer_seek(_buff, buffer_seek_start, _pos);
}


/// @desc Gets size of given buffer in bytes
/// @param {Id.Buffer} _buff Id of Buffer to check
function buffsize(_buff = global.buffer) {
	return buffer_get_size(_buff);
}

/// @desc Returns how many bytes there's between read/write pos and end of given buffer
/// @param {Id.Buffer} _buff Id of Buffer to check
function bytesleft(_buff = global.buffer) {
	return buffer_get_size(_buff) - buffer_tell(_buff);
}

/// @desc makes copy of one buffer to another buffer
/// @param {Id.Buffer} _from Id of Buffer from which to copy
/// @param {Id.Buffer} _dest Id of Buffer to fill
function seize_buffer(_from, _dest = global.buffer) {
	clearbuffer(_dest);
	buffer_copy(_from, 0, buffer_get_size(_from), _dest, 0);
	setpos(0);
}