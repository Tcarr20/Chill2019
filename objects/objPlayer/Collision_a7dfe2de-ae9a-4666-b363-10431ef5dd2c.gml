///@description Falling in pits
if (scrStop()) { exit; }
if (other.myDamage > 0 && myState != ActorState.Fall) {
	//Get distance to center
	var _angle = point_direction(other.x + 32, other.y + 32, x, y);
	var _dx = (other.x + 32) - x;
	var _dy = (other.y + 32) - y;
	//Fall in pit
	if (abs(_dx) < 24 && abs(_dy) < 24) {
		//Set respawn
			 if (_angle > 45 && _angle <= 135) { respawnPos = [other.x + 32, other.y - 32]; }
		else if (_angle < 135 && _angle <= 225) { respawnPos = [other.x - 32, other.y + 32]; }
		else if (_angle < 225 && _angle <= 315) { respawnPos = [other.x + 32, other.y + 96]; }
		else { respawnPos = [other.x + 96, other.y + 32]; }
		
		//Snap to pit center
		vx = 0;
		vy = 0;
		x = other.x + 32;
		y = other.y + 32;
		//Set sprite
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		attackComboLevel = 0;
		
		//Set falling state
		myState = ActorState.Fall;
		audio_play_sound(Fall_Out, 1, false);
	}
	//Get dragged in pit
	else {
		vx += lengthdir_x(-moveAcc, _angle);
		vy += lengthdir_y(-moveAcc, _angle);
	}
}