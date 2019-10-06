///@description Falling in pits
if (other.image_index > 0 && myState != PlayerState.Fall) {
	//Get distance to center
	var _angle = point_direction(other.x + 32, other.y + 32, x, y);
	var _dx = abs((other.x + 32) - x);
	var _dy = abs((other.y + 32) - y);
	//Fall in pit
	if (objPlayer.myFace == Face.Right && _dx < 24 && _dy < 24) {
		//Set respawn position
		respawnPos = [other.x - 32, other.y + 16];
		//Snap to pit center
		vx = 0;
		vy = 0;
		x = other.x + 32;
		y = other.y + 32;
		//Set sprite
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		//Set falling state
		myState = PlayerState.Fall;
	}
	else if (objPlayer.myFace == Face.Up && _dx < 24 && _dy < 24) {
		//Set respawn position
		respawnPos = [other.x + 32, other.y + 80];
		//Snap to pit center
		vx = 0;
		vy = 0;
		x = other.x + 32;
		y = other.y + 32;
		//Set sprite
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		//Set falling state
		myState = PlayerState.Fall;
	}
	else if (objPlayer.myFace == Face.Left && _dx < 24 && _dy < 24) {
		//Set respawn position
		respawnPos = [other.x + 96, other.y + 16];
		//Snap to pit center
		vx = 0;
		vy = 0;
		x = other.x + 32;
		y = other.y + 32;
		//Set sprite
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		//Set falling state
		myState = PlayerState.Fall;
	}
	else if (objPlayer.myFace == Face.Down && _dx < 24 && _dy < 24) {
		//Set respawn position
		respawnPos = [other.x + 32, other.y - 48];
		//Snap to pit center
		vx = 0;
		vy = 0;
		x = other.x + 32;
		y = other.y + 32;
		//Set sprite
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		//Set falling state
		myState = PlayerState.Fall;
	}
	//Get dragged in pit
	else {
		vx += lengthdir_x(-moveAcc, _angle);
		vy += lengthdir_y(-moveAcc, _angle);
	}
}