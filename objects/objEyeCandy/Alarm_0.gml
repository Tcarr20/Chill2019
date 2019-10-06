///@description Choose a new wander location
var _radius = 600, _valid = false;
var _xx = x, _yy = y, _count = 0;
while(!_valid && _count < 5) {
	//Pick a point in the radius
	var _angle = irandom(360);
	_xx = x + lengthdir_x(irandom_range(48, _radius), _angle);
	_yy = y + lengthdir_y(irandom_range(48, _radius), _angle);
	//Check if it rests on an invalid spot
	_valid = (_xx > 10 && _xx < room_width && _yy > 64 && _yy < (room_height - 10) &&
			  !instance_place(_xx, _yy, objSolid) && 
			  !instance_place(_xx, _yy, objTrapDoor) &&
			  !instance_place(_xx, _yy, objDoorBack));
	//Only try so many points in one pass
	_count++;
}
if (_valid) {
	myTargetPos = [_xx, _yy];
	wander = true;
}
else { alarm[0] = irandom_range(15, 45); }