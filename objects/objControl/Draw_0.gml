/// @description Draw batched shadow text
if (ds_exists(global.textBuffer, ds_type_queue) && !ds_queue_empty(global.textBuffer))
{
	//Set shadow shader
	shader_set(shdTextShadow);
	
	//Draw batched text
	while(!ds_queue_empty(global.textBuffer))
	{
		//Get text properties
		var _text_prop = ds_queue_dequeue(global.textBuffer);
		if (draw_get_color() != _text_prop[4]) { draw_set_color(_text_prop[4]); }
		var _r = color_get_red(_text_prop[3]);
		var _g = color_get_green(_text_prop[3]);
		var _b = color_get_blue(_text_prop[3]);
		
		//Draw text
		shader_set_uniform_f(global.upixel_w, global.texel_w);
		shader_set_uniform_f(global.upixel_h, global.texel_h);
		shader_set_uniform_f(global.upixel_c, _r, _g, _b);
		draw_text(_text_prop[0], _text_prop[1], _text_prop[2]);
	}
	
	//Reset shader
	shader_reset();
}

if(room_width)
{
    
    shader_set(shdRoomMask);
    var roomWidth = shader_get_uniform(shdRoomMask, "roomWidth");
    var roomHeight = shader_get_uniform(shdRoomMask, "roomHeight");
	
    shader_set_uniform_f(roomWidth, room_width);
    shader_set_uniform_f(roomHeight, room_height);

    shader_reset();
    
}