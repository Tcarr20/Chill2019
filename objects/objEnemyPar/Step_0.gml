///@description 
event_inherited();
if (myState == ActorState.Fall) {
	image_xscale -= 0.025;
	image_yscale -= 0.025;
	if (image_xscale <= 0) {
		//Respawn & take damage
		image_xscale = 1;
		image_yscale = 1;
		x = respawnPos[X];
		y = respawnPos[Y];
		myHealth -= 1;
		if (myHealth <= 0) { event_perform(ev_other, ev_user1); }
		else {
			myState = ActorState.Idle;
			hitStun = hitStunTime; 
		}
	}
}