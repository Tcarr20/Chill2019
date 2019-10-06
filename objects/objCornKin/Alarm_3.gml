///@description Stop pathing if theres danger
if (wander) {
	//See if theres danger on the path
	var _trap_door = collision_line(x, y, myTargetPos[X], myTargetPos[Y], objTrapDoor, false, true);
	var _trap_spikes = collision_line(x, y, myTargetPos[X], myTargetPos[Y], objTrapSpikes, false, true);
	//Maybe avoid it
	if (_trap_door != noone) {
		if ((_trap_door.myDamage > 0) && (irandom(100) > 75)) {
			wander = false;
			myState = ActorState.Idle;
		}
	}
	else if (_trap_spikes != noone) {
		if ((_trap_spikes.myDamage > 0) && (irandom(100) > 75)) {
			wander = false;
			myState = ActorState.Idle;
		}
	}
}
alarm[3] = irandom_range(45, 85);