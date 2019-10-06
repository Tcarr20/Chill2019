///@description Damage reaction
if (attackInstance != noone) { instance_destroy(attackInstance); }
attackComboLevel = 0;
myHealth -= takeDamage;
takeDamage = 0;
//Death
if (myHealth <= 0) { event_perform(ev_other, ev_user1); }
//Knockback
else {
	//Set sprite
	myState = ActorState.Hurt;
	hitStun = hitStunTime;
	sprite_index = hurtSprites[myFace];
	image_speed = 0;
		
	//Set motion
	vx = lengthdir_x(moveSpeed*takeKnockback, knockbackDirection);
	vy = lengthdir_y(moveSpeed*takeKnockback, knockbackDirection);
	takeKnockback = 0;
	knockbackDirection = 0;
		
	//SFX
			if (myClass == PlayerClass.Jack) { audio_play_sound(Jack_Hurt, 1, false); }
	else if (myClass == PlayerClass.Vamp) { audio_play_sound(Vamp_Hurt, 1, false); }
	else if (myClass == PlayerClass.Wolf) { audio_play_sound(Wolf_Hurt, 1, false); }
}
