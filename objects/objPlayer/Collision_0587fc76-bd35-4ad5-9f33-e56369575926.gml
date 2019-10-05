///@description Take damage
if (other.myDamage > 0 && hitStun == 0) {
	if (attackInstance != noone) { instance_destroy(attackInstance); }
	myHealth -= other.myDamage;
	//Death
	if (myHealth <= 0) {
		myHealth = 0;
		show_message("Oopsie Woopsie Fucky Wucky");
		game_restart();
	}
	//Knockback
	else {
		//Set sprite
		myState = PlayerState.Hurt;
		hitStun = hitStunTime;
		switch(myFace) {
			case Face.Right: sprite_index = sprPlayerHurtR; break;
			case Face.Left: sprite_index = sprPlayerHurtL; break;
			case Face.Up: sprite_index = sprPlayerHurtU; break;
			case Face.Down: sprite_index = sprPlayerHurtD; break;
		}
		image_speed = 0;
		
		//Set motion
		var _angle = point_direction(other.x, other.y, x, y);
		vx = lengthdir_x(moveSpeed / 3, _angle);
		vy = lengthdir_y(moveSpeed / 3, _angle);
	}
}