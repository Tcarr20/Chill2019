///@function opmenu_create(displayEntries, [defaultCursorPos], [cancelCallback], [callbackArgs])
///@description Create an OpMenu that displays displayEntries number of lines
///@param displayEntries
///@param [defaultCursorPos]
///@param [cancelCallback]
///@param [callbackArgs]
var display = argument[0];
var cursor = (argument_count > 1)? argument[1] : 0;
var callback = (argument_count > 2)? argument[2] : undefined;
var args = (argument_count > 3)? argument[3] : undefined;
//Create structures
var _menu = ds_list_create(); 
var _data = ds_map_create();
//Fill out menu info
_data[? "cursor"] = cursor;
_data[? "select"] = false;
_data[? "num_entries"] = 0;
_data[? "display_entries"] = display;
_data[? "first_line"] = 0;
_data[? "memory"] = undefined;
_data[? "callback"] = callback;
_data[? "args"] = args;
ds_list_add(_menu, _data);
return _menu;