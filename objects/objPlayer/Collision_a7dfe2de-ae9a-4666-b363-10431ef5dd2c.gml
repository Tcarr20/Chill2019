///@description Falling in pits
if (other.image_index > 0 && myState != PlayerState.Fall) {
	//Get distance to center
	var _dist = point_to_point(x, y, other.x + 32, other.y + 32);
	var _angle = point_direction(other.x + 16, other.y + 16, x, y);
	//Fall in pit
	if (_dist < 24) {
		//Set respawn position
		respawnPos = [other.x + 32 + lengthdir_x(96, _angle), other.y + 32 + lengthdir_y(96, _angle)];
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