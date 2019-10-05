///@function draw_9slice(sprite, border_size, xx, yy, ww, hh)
///@description Draw dynamically sized box
///@param sprite
///@param border_size
///@param xx
///@param yy
///@param ww
///@param hh
var spr = argument[0], border = argument[1], xx = argument[2], yy = argument[3], ww = argument[4], hh = argument[5];
//var _sp_w = sprite_get_width(spr), _sp_h = sprite_get_height(spr);
//Top Left
//draw_sprite_part(spr, 0, 0, 0, border, border, xx, yy);
if (spr[0] != undefined) { draw_sprite(spr[0], 0, xx, yy); }
//Top Right
//draw_sprite_part(spr, 0, _sp_w - border, 0, border, border, xx + border + ww, yy);
if (spr[2] != undefined) { draw_sprite(spr[2], 0, xx + border + ww, yy); }
//Bottom Left
//draw_sprite_part(spr, 0, 0, _sp_h - border, border, border, xx, yy + border + hh);
if (spr[6] != undefined) { draw_sprite(spr[6], 0, xx, yy + border + hh); }
//Bottom Right
//draw_sprite_part(spr, 0, _sp_w - border, _sp_h - border, border, border, xx + border + ww, yy + border + hh);
if (spr[8] != undefined) { draw_sprite(spr[8], 0, xx + border + ww, yy + border + hh); }

//Left edge
//draw_sprite_part_tiled(spr, 0, 0, border, border, _sp_h - (2*border), xx, yy + border, border, hh);
if (spr[3] != undefined) { draw_sprite_ext(spr[3], 0, xx, yy + border, 1, hh, 0, c_white, 1); }
//Right edge
//draw_sprite_part_tiled(spr, 0, _sp_w - border, border, border, _sp_h - (2*border), xx + border + ww, yy + border, border, hh);
if (spr[5] != undefined) { draw_sprite_ext(spr[5], 0, xx + border + ww, yy + border, 1, hh, 0, c_white, 1) }
//Top edge
//draw_sprite_part_tiled(spr, 0, border, 0, _sp_w - (2*border), border, xx + border, yy, ww, border);
if (spr[1] != undefined) { draw_sprite_ext(spr[1], 0, xx + border, yy, ww, 1, 0, c_white, 1); }
//Bottom edge
//draw_sprite_part_tiled(spr, 0, border, _sp_h - border, _sp_w - (2*border), border, xx + border, yy + border + hh, ww, border);
if (spr[7] != undefined) { draw_sprite_ext(spr[7], 0, xx + border, yy + border + hh, ww, 1, 0, c_white, 1); }

//Center
//draw_sprite_part_tiled(spr, 0, border, border, _sp_w - (2*border), _sp_h - (2*border), xx + border, yy + border, ww, hh);
if (spr[4] != undefined) { draw_sprite_ext(spr[4], 0, xx + border, yy + border, ww, hh, 0, c_white, 1); }