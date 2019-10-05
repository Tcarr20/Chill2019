///@function opmenu_draw(x, y, menu)
///@description Draw the given menu at the given position
///@param x
///@param y
///@param menu
var xx = argument0, yy = argument1, menu = argument2;
var _col_width = 20, _slider_width = 7, _draw_string = "";
if (ds_exists(menu, ds_type_list))
{
	//Get menu properties
	var _data = menu[| 0];
	var _num_lines = min(_data[? "num_entries"], _data[? "display_entries"]);
	var _line = _data[? "first_line"];
	var _cursor = _data[? "cursor"];
	var _select = _data[? "select"];
	var _dx = xx, _dy = yy;
	
	for(var i=0; i<_num_lines; i++)
	{
		//Get the entry properties
		var _entry = menu[| _line + 1];
		var _active = _entry[? "active"];
		var _type = _entry[? "type"];
		
		//Get entry name
		var _str_name = "";
		if (!_active) { _str_name += "{C=gray}"; }
		else if (_cursor == _line) { _str_name += "{C=lblue,S=blue}"; }
		_str_name += _entry[? "key"];
		if (!_active || _cursor == _line) { _str_name += "{C=white,S=black}"; }
		_str_name = string_format_left(_str_name, _col_width);
		_draw_string += _str_name;
		
		//Get entry value
		var _str_value = "";
		if (_type == om_type_display)
		{
			//Get selection name
			var _pos = _entry[? "position"], _pair = _entry[? "options"];
			if (_pair[? "name"] != undefined)
			{
				if (!_active) { _str_value += "{C=gray}"; }
				else if (_select && _cursor == _line) { _str_value += "{C=lblue,S=blue}"; }
				_str_value += _pair[? "name"];
				if (!_active || (_select && _cursor == _line)) { _str_value += "{C=white,S=black}"; }
				_draw_string += _str_value;
			}
		}
		else if (_type == om_type_select)
		{
			//Get selection name
			var _pos = _entry[? "position"];
			var _list = _entry[? "options"];
			var _pair = _list[| _pos];
			if (_pair[? "name"] != undefined)
			{
				if (!_active) { _str_value += "{C=gray}"; }
				else if (_select && _cursor == _line) { _str_value += "{C=lblue,S=blue}"; }
				_str_value += _pair[? "name"];
				if (!_active || (_select && _cursor == _line)) { _str_value += "{C=white,S=black}"; }
				_draw_string += _str_value;
			
				//Draw cursor
				if (_select && _cursor == _line)
				{
					_dx = xx + (font_w*(_col_width - 1));
					draw_sprite(sprArrowSmallLeft, 0, _dx, _dy);
					_dx += (font_w*(string_length_formatted(_str_value)+1));
					draw_sprite(sprArrowSmallRight, 0, _dx, _dy);
				}
			}
		}
		else if (_type == om_type_toggle)
		{
			var _pos = _entry[? "position"];
			var _spr = (_select && _cursor == _line)? sprOptionHighlightToggle : sprOptionToggle;
			draw_sprite(_spr, _pos, _dx + (font_w*_col_width), _dy);
		}
		else if (_type == om_type_slider)
		{
			var _pos = _entry[? "position"];
			var _list = _entry[? "options"];
			var _min = _list[| 0], _max = _list[| 1];
			
			//Draw min
			if (!_active) { _str_value += "{C=gray}"; }
			else if (_select && _cursor == _line) { _str_value += "{C=lblue,S=blue}"; }
			_str_value += _min[? "name"];
			if (!_active || (_select && _cursor == _line)) { _str_value += "{C=white,S=black}"; }
			
			//Draw bar
			_dx = xx + (font_w*(string_length_formatted(_str_value) + _col_width + 1));
			draw_sprite(sprOptionSliderBack, 0, _dx, _dy);
			
			//Draw slider
			var _spr = (_select && _cursor == _line)? sprOptionHighlightSliderFill : sprOptionSliderFill;
			_dx += round((sprite_get_width(sprOptionSliderBack) - sprite_get_width(_spr)) * ((_pos - _min[? "value"])/(_max[? "value"] - _min[? "value"])));
			draw_sprite(_spr, 0, _dx, _dy);
			
			//Draw max
			_str_value += string_repeat(" ", _slider_width);
			if (!_active) { _str_value += "{C=gray}"; }
			else if (_select && _cursor == _line) { _str_value += "{C=lblue,S=blue}"; }
			_str_value += _max[? "name"];
			if (!_active || (_select && _cursor == _line)) { _str_value += "{C=white,S=black}"; }
			_draw_string += _str_value;
		}
		
		//Go to the next line
		_draw_string += "\n";
		_dy += font_h;
		_line++;
	}
	
	//Draw string
	draw_text_formatted(xx, yy, _draw_string);
}