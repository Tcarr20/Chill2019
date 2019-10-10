///@description Go to room
if (image_index == (image_number - 1)) {
	//Find the current room
	var _thisX = -1, _thisY = -1;
	for(var i=0; i<global.roomGridW; i++) {
		for(var j=0; j<global.roomGridH; j++) {
			var _map = global.roomGrid[i, j];
			if (ds_exists(_map, ds_type_map)) {
				if (_map[? "room"] == room) {
					_thisX = i;
					_thisY = j;
					break;
				}
			}
		}
	}

	//Go north
	if (_thisX != -1 && _thisY != -1) {
		global.roomEnterFrom = Face.Down;
		var _up_map = global.roomGrid[_thisX, _thisY-1];
		if (_up_map != -1) { room_goto(_up_map[? "room"]); }
	}
}