///@description Damage reaction
myHealth -= takeDamage;
takeDamage = 0;
//Death
if (myHealth <= 0) { audio_play_sound(Corn_Die, 1, false); instance_destroy(); }
//Knockback
else {
	//Set sprite
	myState = ActorState.Hurt;
	hitStun = hitStunTime;
	image_speed = 0;
		
	//Set motion
	hspeed = lengthdir_x(2*takeKnockback, knockbackDirection);
	vspeed = lengthdir_y(2*takeKnockback, knockbackDirection);
	takeKnockback = 0;
	knockbackDirection = 0;
	
	//Play hurt sound effect
	audio_play_sound(Corn_Hit, 1, false);
}
