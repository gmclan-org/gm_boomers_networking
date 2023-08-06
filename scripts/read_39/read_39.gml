/// Feather disable GM1045

/// @desc Reads unsigned 1-byte integer from buffer (0 to +255)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
/// !!! Readbyte() is the only function which operates on UNSIGNED values by default!
function readbyte(_buff = global.buffer)
{
	//Returns a byte from the buffer.
	return buffer_read(_buff, buffer_u8);
}

/// @desc Reads signed 1-byte integer from buffer (-128 to +127)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
/// !!! it's read_sbyte() instead of readubyte(), because byte in 39dll was always 0-255
function read_sbyte(_buff = global.buffer) {
	//Returns a byte from the buffer.
	return buffer_read(_buff, buffer_s8);
}

/// @desc Reads signed 2-bytes integer from buffer (-32_768 to +32_767)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readshort(_buff = global.buffer) {
	//Returns a short int from the buffer.
	return buffer_read(_buff, buffer_s16);
}

/// @desc Reads unsigned 2-bytes integer from buffer (0 to +65_536)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readushort(_buff = global.buffer) {
	//Returns a unsigned short int from the buffer.
	return buffer_read(_buff, buffer_u16);
}

/// @desc Reads signed 4-bytes integer from buffer (-2_147_483_648 to +2_147_483_647)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readint(_buff = global.buffer) {
	//Returns a int from the buffer.
	return buffer_read(_buff, buffer_s32);
}

/// @desc Reads unsigned 4-bytes integer from buffer (0 to +4_294_967_296)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readuint(_buff = global.buffer) {
	//Returns a unsigned int from the buffer.
	return buffer_read(_buff, buffer_u32);
}

/// @desc Reads 4-bytes float from buffer (~ -16_777_216.0 to +16_777_216.0)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readfloat(_buff = global.buffer) {
	//Returns a float from the buffer.
	return buffer_read(_buff, buffer_f32);
}

/// @desc Reads 8-bytes (64-bit) float from buffer (... lot of decimal numbers)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {Real}
function readdouble(_buff = global.buffer) {
	//Returns a double from the buffer.
	return buffer_read(_buff, buffer_f64);
}

/// @desc Reads string until \0 is found (0b0000_0000, 0x00)
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {String}
function readstring(_buff = global.buffer) {
	return buffer_read(_buff, buffer_string);
}

/// @desc Reads given amount of bytes but returns them as string
/// @param {Real} _amnt Amount of bytes to read
/// @param {Id.Buffer} _buff Id of Buffer to Read
/// @returns {String}
function readchars(_amnt = 1, _buff = global.buffer) {
	var _r = "";
	repeat(_amnt) {
		_r += chr(readbyte(_buff));
	}
	return _r;
}