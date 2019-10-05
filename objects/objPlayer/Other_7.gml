/// @description Stop attacking
if (attackComboLevel == 1) { 
	//Check for buffered attacks
	if (!ds_queue_empty(attackBuffer)) {
		var _in = ds_queue_dequeue(attackBuffer);
		//If the main attack button was buffered,
		if (_in == in_x) {
			//Do a level 2 attack
			attackComboLevel = 2;
			myState = PlayerState.Attack2;
			image_speed = attackImageSpeed;
			attackInstance = instance_create_v(x, y, layer, objAttackSlash2, self, myFace, attackImageSpeed);
		}
	}
	else { 
		myState = PlayerState.Idle; 
		attackComboLevel = 0;
		attackInstance = noone;
	}
}
else { 
	myState = PlayerState.Idle; 
	attackComboLevel = 0;
	attackInstance = noone;
}