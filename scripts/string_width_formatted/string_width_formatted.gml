///@function string_width_formatted(text)
///@description Returns the pixel width of the longest line in a string with formatting tags
///@param text
var text = argument0, _length = 0;
while(string_length(text) > 0)
{
	//Get next chunk
	var _chunk_pos = string_pos("\n", text);
	var _chunk_len = (_chunk_pos > 0)? _chunk_pos : string_length(text);
	var _chunk_text = string_copy(text, 1, _chunk_len);
	
	//Count the chunks length
	_length = max(_length, (font_w*string_length_formatted(_chunk_text)));
	
	//Trim down remaining text
	text = string_delete(text, 1, _chunk_len);
}
return _length;