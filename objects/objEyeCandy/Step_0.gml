///@description State Machine
//Update facing
	 if (moveDir < 30 || moveDir > 330) { myFace = Face.Right; }
else if (moveDir > 60 && moveDir < 120) { myFace = Face.Up; }
else if (moveDir > 150 && moveDir < 210) { myFace = Face.Left; }
else if (moveDir > 240 && moveDir < 300) { myFace = Face.Down; }

if (hitStun > 0) { 
	hitStun--;
	if (hitStun < 30 && myState == ActorState.Hurt) {
		myState = ActorState.Idle;
		hspeed = 0;
		vspeed = 0;
		alarm[2] = 1;
	}
}

if (myState == ActorState.Idle) {
	//Update sprite
	if (wander) {
		switch(myFace) {
			case Face.Right: sprite_index = sprEyeR; break;
			case Face.Left: sprite_index = sprEyeL; break;
			case Face.Up: sprite_index = sprEyeU; break;
			case Face.Down: sprite_index = sprEyeD; break;
		}
		image_speed = moveImageSpeed;
	}
	else {
		switch(myFace) {
			case Face.Right: sprite_index = sprEyeR; break;
			case Face.Left: sprite_index = sprEyeL; break;
			case Face.Up: sprite_index = sprEyeU; break;
			case Face.Down: sprite_index = sprEyeD; break;
		}
		image_speed = idleImageSpeed;
	}
	
	//Wander about aimlessly
	if (wander) {
		//Move to goal
		if (mp_potential_step_object(myTargetPos[X], myTargetPos[Y], moveSpeed, objSolid)) {
			//Chance to barf
			var z=irandom(100);
			if (z < 33) { 
				myState = ActorState.Attack2;
				image_index = 0;
				image_speed = attackImageSpeed;
				switch(myFace) {
					case Face.Right: sprite_index=sprEyeR; break;
					case Face.Left: sprite_index=sprEyeL; break;
					case Face.Up: sprite_index=sprEyeU; break;
					case Face.Down: sprite_index=sprEyeD; break;
				}
			}
			else { wander=false; }
		}
	}
	if (!wander && alarm_get(0) == -1) { alarm[0] = irandom_range(45, 100); }
}
//Seek player
else if (myState == ActorState.Seek) {
	wander = true;
	mp_potential_step_object(myTargetPos[X], myTargetPos[Y], moveSpeed, objSolid);
	var _dist = point_to_point(x, y, myTargetPos[X], myTargetPos[Y]);
	if (_dist < 48) {
		myState = ActorState.Attack2;
		image_index = 0;
		image_speed = attackImageSpeed;
		switch(myFace) {
			case Face.Right: sprite_index=sprEyeR; break;
			case Face.Left: sprite_index=sprEyeL; break;
			case Face.Up: sprite_index=sprEyeU; break;
			case Face.Down: sprite_index=sprEyeD; break;
		}
	}
	else if (_dist > 256) {
		var z=irandom(100);
		if (z<10) { 
			wander = false;
			myState = ActorState.Idle; 
		}
	}
}