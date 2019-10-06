///@function scrDefineMapCell(locked, room, sprite, exits[])
///@description Create a map of grid cell data
/*
	exits[] is an array of bools, where true means there is a door in the corresponding direction
	The order of doors is [N, E, S, W], so [true, false, false, false] would mean only a north exit
*/
///@param locked
///@param room
///@param sprite
///@param exits[]
var locked = argument0, rm = argument1, spr = argument2, exits = argument3;
var _map = ds_map_create();
_map[? "locked"] = locked;
_map[? "room"] = rm;
_map[? "sprite"] = spr;
_map[? "exits"] = exits;
return _map;