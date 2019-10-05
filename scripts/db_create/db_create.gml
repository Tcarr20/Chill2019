///@function draw_textbox(type, x, y, speed, animate, text, [choices], [values], [portrait], [name], [callback], [arguments])
///@description Draw a textbox with formatted text scrolling at a speed, and if it should animate when it appears
///@param type
///@param x
///@param y
///@param text
///@param [speed]
///@param [animate]
///@param [choices]
///@param [values]
///@param [portrait]
///@param [name]
///@param [callback]
///@param [arguments]
//if (!db_exists)
//{
	var type = argument[0], text = argument[3];
	var xx = (argument[1] >= 0)? argument[1] : get_camera_x();
	var yy = (argument[2] >= 0)? argument[2] : get_camera_b();
	var spd = (argument_count > 4)? argument[4] : 1;
	var anim = (argument_count > 5)? argument[5] : true;
	//Get choices & values
	var choices = undefined, values = undefined;
	if (type == tb_select) {
		choices = argument[6];
		if (argument_count > 7) { values = argument[7]; }
		else 
		{
			for(var i=array_length_1d(choices)-1; i>=0; i--) { values[i] = i; }
		}
	}
	//Get portrait & name
	var portrait = (argument_count > 8)? argument[8] : undefined;
	var name = (argument_count > 9)? argument[9] : undefined;
	
	//Get callback & arguments
	var callback = (argument_count > 10)? argument[10] : undefined;
	var args = undefined;
	if (argument_count > 11)
	{
		if (!is_array(argument[11])) { args = [argument[1]]; }
		else { args = argument[11]; }
	}
	instance_create_v(xx, yy, "InstanceControl", objDialogueBox, type, text, spd, anim, choices, values, portrait, name, callback, args);
//}