/// @description Draw box & text
//Top Left
if (tb_border_spr[0] != undefined) { draw_sprite(tb_border_spr[0], 0, x - drawW - tb_border, y - drawH - tb_border); }
//Top Right
if (tb_border_spr[2] != undefined) { draw_sprite(tb_border_spr[2], 0, x + drawW, y - drawH - tb_border); }
//Bottom Left
if (tb_border_spr[6] != undefined) { draw_sprite(tb_border_spr[6], 0, x - drawW - tb_border, y + drawH); }
//Bottom Right
if (tb_border_spr[8] != undefined) { draw_sprite(tb_border_spr[8], 0, x + drawW, y + drawH); }

//Left edge
if (tb_border_spr[3] != undefined) { draw_sprite_ext(tb_border_spr[3], 0, x - drawW - tb_border, y - drawH, 1, (drawH * 2), 0, c_white, 1); }
//Right edge
if (tb_border_spr[5] != undefined) { draw_sprite_ext(tb_border_spr[5], 0, x + drawW, y - drawH, 1, (drawH * 2), 0, c_white, 1) }
//Top edge
if (tb_border_spr[1] != undefined) { draw_sprite_ext(tb_border_spr[1], 0, x - drawW, y - drawH - tb_border, (drawW * 2), 1, 0, c_white, 1); }
//Bottom edge
if (tb_border_spr[7] != undefined) { draw_sprite_ext(tb_border_spr[7], 0, x - drawW, y + drawH, (drawW * 2), 1, 0, c_white, 1); }

//Center
if (tb_border_spr[4] != undefined) { draw_sprite_ext(tb_border_spr[4], 0, x - drawW, y - drawH, (drawW * 2), (drawH * 2), 0, c_white, 1); }

//Name & Portrait
if (!growing)
{
	if (myName != undefined)
	{
		draw_sprite_ext(tb_border_spr[4], 0, x - drawW, y - drawH - tb_border, nameLength*font_w, tb_border, 0, c_white, 1);
		//draw_text_formatted(x - drawW, y - drawH - tb_border, myName);
		draw_textbox(tb_border_spr, tb_border, x - drawW - tb_border, y - drawH - tb_border - (font_h*2), myName);
	}
	if (myPortrait != undefined)
	{
		draw_sprite(myPortrait, 0, x - boxW + (font_w/2), y - (portraitSize/2));
	}
}

//Text
if (!cpt_running(sizePath)) { draw_text_formatted(drawTextX, drawTextY, drawText); }
//Arrows
var _frame = ((global.frameTimer mod (GAME_SPEED/2)) < (GAME_SPEED/4));
if (myState == 1) { draw_sprite(sprBoxNext, _frame, x + drawW, y + drawH); }
if (myState == 2) { 
	if (myType == tb_select) { draw_sprite(tb_cursor_spr, 0, drawTextX, drawTextY + (font_h * (choiceSelect + choiceLine))); }
	else { draw_sprite(sprBoxStop, _frame, x + drawW, y + drawH); }
}