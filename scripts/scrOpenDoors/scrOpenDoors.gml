//Open any doors that need opening based on room config
//Get the current room
var _thisX = -1, _thisY = -1;
for(var i=0; i<global.roomGridW; i++) {
	for(var j=0; j<global.roomGridH; j++) {
		var _map = global.roomGrid[i, j];
		if (_map[? "room"] == room) {
			_thisX = i;
			_thisY = j;
			break;
		}
	}
}

//Front door
if (instance_exists(objDoorFront)) {
	var _d = instance_find(objDoorFront, 0);
	//If the door is closed
	if (_d.image_index == 0) {
		//See if the room below has a north opening
		var _new_map = global.roomGrid[_thisX, _thisY+1];
		if (_new_map != -1) {
		var _exits = _new_map[? "exits"];
			if (_exits[0]) {
				with(_d) { event_perform(ev_other, ev_user0); }
			}
		}
	}
}

//Back door
if (instance_exists(objDoorFront)) {
	var _d = instance_find(objDoorFront, 0);
	//If the door is closed
	if (_d.image_index == 0) {
		//See if the room below has a north opening
		var _new_map = global.roomGrid[_thisX, _thisY-1];
		if (_new_map != -1) {
		var _exits = _new_map[? "exits"];
			if (_exits[2]) {
				with(_d) { event_perform(ev_other, ev_user0); }
			}
		}
	}
}

//Left door
if (instance_exists(objDoorFront)) {
	var _d = instance_find(objDoorFront, 0);
	//If the door is closed
	if (_d.image_index == 0) {
		//See if the room below has a north opening
		var _new_map = global.roomGrid[_thisX-1, _thisY];
		if (_new_map != -1) {
			var _exits = _new_map[? "exits"];
			if (_exits[3]) {
				with(_d) { event_perform(ev_other, ev_user0); }
			}
		}
	}
}

//Right door
if (instance_exists(objDoorFront)) {
	var _d = instance_find(objDoorFront, 0);
	//If the door is closed
	if (_d.image_index == 0) {
		//See if the room below has a north opening
		var _new_map = global.roomGrid[_thisX+1, _thisY];
		if (_new_map != -1) {
			var _exits = _new_map[? "exits"];
			if (_exits[1]) {
				with(_d) { event_perform(ev_other, ev_user0); }
			}
		}
	}
}