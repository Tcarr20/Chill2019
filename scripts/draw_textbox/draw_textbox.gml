///@function draw_textbox(sprite, border_size, xx, yy, text, [cols], [rows])
///@description Draw dynamically sized box w/ text
///@param sprite
///@param border_size
///@param xx
///@param yy
///@param text
///@param [cols]
///@param [rows]
var spr = argument[0], border = argument[1], xx = argument[2], yy = argument[3], text = argument[4], cols = 0, rows = 0;
if (argument_count > 5) { cols = argument[5]; }
else
{
	var _c = 0;
	for(var i=0; i<string_length_formatted(text); i++)
	{
		if (string_char_at(text, i) == "\n") { _c = 0; }
		else { cols = max(cols, ++_c); }
	}
}
if (argument_count > 6) { rows = argument[6]; }
else { rows = string_count("\n", text) + 1; }
//var _sp_w = sprite_get_width(spr), _sp_h = sprite_get_height(spr);
/*
//Top Left
draw_sprite_part(spr, 0, 0, 0, border, border, xx, yy);
//Top Right
draw_sprite_part(spr, 0, _sp_w - border, 0, border, border, xx + border + (cols*font_w), yy);
//Bottom Left
draw_sprite_part(spr, 0, 0, _sp_h - border, border, border, xx, yy + border + (rows*font_h));
//Bottom Right
draw_sprite_part(spr, 0, _sp_w - border, _sp_h - border, border, border, xx + border + (cols*font_w), yy + border + (rows*font_h));

//Left edge
draw_sprite_part_tiled(spr, 0, 0, border, border, _sp_h - (2*border), xx, yy + border, border, (rows*font_h));
//Right edge
draw_sprite_part_tiled(spr, 0, _sp_w - border, border, border, _sp_h - (2*border), xx + border + (cols*font_w), yy + border, border, (rows*font_h));
//Top edge
draw_sprite_part_tiled(spr, 0, border, 0, _sp_w - (2*border), border, xx + border, yy, (cols*font_w), border);
//Bottom edge
draw_sprite_part_tiled(spr, 0, border, _sp_h - border, _sp_w - (2*border), border, xx + border, yy + border + (rows*font_h), (cols*font_w), border);

//Center
draw_sprite_part_tiled(spr, 0, border, border, _sp_w - (2*border), _sp_h - (2*border), xx + border, yy + border, (cols*font_w), (rows*font_h));
*/
//Top Left
//draw_sprite_part(spr, 0, 0, 0, border, border, xx, yy);
if (spr[0] != undefined) { draw_sprite(spr[0], 0, xx, yy); }
//Top Right
//draw_sprite_part(spr, 0, _sp_w - border, 0, border, border, xx + border + ww, yy);
if (spr[2] != undefined) { draw_sprite(spr[2], 0, xx + border + (font_w*cols), yy); }
//Bottom Left
//draw_sprite_part(spr, 0, 0, _sp_h - border, border, border, xx, yy + border + hh);
if (spr[6] != undefined) { draw_sprite(spr[6], 0, xx, yy + border + (font_h*rows)); }
//Bottom Right
//draw_sprite_part(spr, 0, _sp_w - border, _sp_h - border, border, border, xx + border + ww, yy + border + hh);
if (spr[8] != undefined) { draw_sprite(spr[8], 0, xx + border + (font_w*cols), yy + border + (font_h*rows)); }

//Left edge
//draw_sprite_part_tiled(spr, 0, 0, border, border, _sp_h - (2*border), xx, yy + border, border, hh);
if (spr[3] != undefined) { draw_sprite_ext(spr[3], 0, xx, yy + border, 1, (font_h*rows), 0, c_white, 1); }
//Right edge
//draw_sprite_part_tiled(spr, 0, _sp_w - border, border, border, _sp_h - (2*border), xx + border + ww, yy + border, border, hh);
if (spr[5] != undefined) { draw_sprite_ext(spr[5], 0, xx + border + (font_w*cols), yy + border, 1, (font_h*rows), 0, c_white, 1) }
//Top edge
//draw_sprite_part_tiled(spr, 0, border, 0, _sp_w - (2*border), border, xx + border, yy, ww, border);
if (spr[1] != undefined) { draw_sprite_ext(spr[1], 0, xx + border, yy, (font_w*cols), 1, 0, c_white, 1); }
//Bottom edge
//draw_sprite_part_tiled(spr, 0, border, _sp_h - border, _sp_w - (2*border), border, xx + border, yy + border + hh, ww, border);
if (spr[7] != undefined) { draw_sprite_ext(spr[7], 0, xx + border, yy + border + (font_h*rows), (font_w*cols), 1, 0, c_white, 1); }

//Center
//draw_sprite_part_tiled(spr, 0, border, border, _sp_w - (2*border), _sp_h - (2*border), xx + border, yy + border, ww, hh);
if (spr[4] != undefined) { draw_sprite_ext(spr[4], 0, xx + border, yy + border, (font_w*cols), (font_h*rows), 0, c_white, 1); }
//Text
draw_text_formatted(xx + border, yy + border, text);