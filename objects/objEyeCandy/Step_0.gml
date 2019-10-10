///@description State Machine
if (scareTimer > 0) {
	scareTimer--;
	if (scareTimer == 0 && myState == ActorState.Scared) { 
		myState = ActorState.Idle; 
		wander = false;
		myTargetPos = [x, y];
	}
}

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
		var _spd = (myState == ActorState.Scared)? moveSpeed*2 : moveSpeed;
		mp_potential_step_object(myTargetPos[X], myTargetPos[Y], _spd, objSolid);
	}
	if (!wander && alarm_get(0) == -1) { alarm[0] = irandom_range(25, 75); }
}
//Seek player
else if (myState == ActorState.Seek) {
	wander = true;
	if (!instance_exists(myTarget)) {
		myState = ActorState.Idle;
		exit;
	}
	mp_potential_step_object(myTarget.x, myTarget.y, moveSpeed, objSolid);
	var _dist = point_to_point(x, y, myTarget.x, myTarget.y);
	if (_dist < 16) {
		//Fly away
		myState = ActorState.Idle;
		var _angle = point_direction(myTarget.x, myTarget.y, x, y);
		myTargetPos = [lengthdir_x(_angle, 64), lengthdir_y(_angle, 64)];
		alarm[0] = irandom_range(45, 75);
	}
	else if (_dist > 256) {
		var z=irandom(100);
		if (z<10) { 
			wander = false;
			myState = ActorState.Idle; 
		}
	}
}