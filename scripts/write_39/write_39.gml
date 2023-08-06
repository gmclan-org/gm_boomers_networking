/// @desc writes unsigned 1-byte integer to buffer (0 to +255)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
/// !!! Writebyte() is the only function which operates on UNSIGNED values by default!
function writebyte(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_u8, _val);
}

/// @desc Writes signed 1-byte integer to buffer (-128 to +127)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
/// !!! it's write_sbyte() instead of writeubyte(), because byte in 39dll was always 0-255
function write_sbyte(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_s8, _val);
}

/// @desc Writes signed 2-bytes integer to buffer (-32_768 to +32_767)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writeshort(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_s16, _val);
}

/// @desc Writes unsigned 2-bytes integer to buffer (0 to +65_536)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writeushort(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_u16, _val);
}

/// @desc Writes signed 4-bytes integer to buffer (-2_147_483_648 to +2_147_483_647)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writeint(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_s32, _val);
}

/// @desc Writes unsigned 4-bytes integer to buffer (0 to +4_294_967_296)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writeuint(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_u32, _val);
}

/// @desc Writes 4-bytes float to buffer (~ -16_777_216.0 to +16_777_216.0)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writefloat(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_f32, _val);
}

/// @desc Writes 8-bytes (64-bit) float to buffer (... lot of decimal numbers)
/// @param {Real} _val Number to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writedouble(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_f64, _val);
}

/// @desc Writes string to buffer, terminated by \0 (0b0000_0000, 0x00)
/// @param {Real} _val String to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writestring(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_string, string(_val));
}

/// @desc Writes string to buffer, unterminated (so you need to know length when reading)
/// @param {Real} _val String to write
/// @param {Id.Buffer} _buff Id of Buffer to write
function writechars(_val, _buff = global.buffer) {
	buffer_write(_buff, buffer_text, string(_val));
}