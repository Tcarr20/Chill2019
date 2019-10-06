///@description Look for players around you
var _o = instance_nearest(x, y, objPlayer);
if (_o != noone) {
	if (point_to_point(x, y, _o.x, _o.y) < 300) {
		var z = irandom(100);
		if (z < 75) {
			//Target the player
			myState = ActorState.Seek;
			myTarget = _o;
			myTargetPos = [_o.x, _o.y];
		}
	}
}
alarm[2] = irandom_range(10, 30);