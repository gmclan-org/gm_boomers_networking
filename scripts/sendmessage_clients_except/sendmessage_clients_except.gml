/// @param {Id.Socket} _socket
/// @param {Id.Buffer} _buff
/// @param {Asset.GMObject} _clients_object
function sendmessage_clients_except(_socket, _buff = global.buffer, _clients_object = obj_server_player) {
	with(_clients_object) {
		if (socket != _socket) {
			// don't send data to player which is processed now, only to others
			sendmessage(socket);
		}
	}
}