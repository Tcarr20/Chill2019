///@description Take damage
if (other.myDamage > 0 && hitStun == 0) {
	if (attackInstance != noone) { instance_destroy(attackInstance); }
	myHealth -= other.myDamage;
	//Death
	if (myHealth <= 0) { event_perform(ev_other, ev_user0); }
	//Knockback
	else {
		//Set sprite
		myState = PlayerState.Hurt;
		hitStun = hitStunTime;
		sprite_index = hurtSprites[myFace];
		image_speed = 0;
		
		//Set motion
		var _angle = point_direction(other.x, other.y, x, y);
		vx = lengthdir_x(moveSpeed / 3, _angle);
		vy = lengthdir_y(moveSpeed / 3, _angle);
	}
}