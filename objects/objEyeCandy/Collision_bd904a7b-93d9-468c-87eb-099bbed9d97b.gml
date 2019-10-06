///@description Get scared
if (myState != ActorState.Scared) {
	var _obj = other.myPar;
	var _dir = point_direction(_obj.x, _obj.y, x, y);
	var _dis = clamp(point_to_point(x, y, _obj.x, _obj.y) + irandom_range(16, 48), 48, 256);
	myTargetPos = [ _obj.x + lengthdir_x(_dis, _dir), _obj.y + lengthdir_y(_dis, _dir) ];
	myState = ActorState.Scared;
	scareTimer = 60;
}