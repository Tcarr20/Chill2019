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

if (myState == ActorState.Idle || myState == ActorState.Scared) {
	//Update sprite
	if (wander) {
		switch(myFace) {
			case Face.Right: sprite_index = sprCornMoveR; break;
			case Face.Left: sprite_index = sprCornMoveL; break;
			case Face.Up: sprite_index = sprCornMoveU; break;
			case Face.Down: sprite_index = sprCornMoveD; break;
		}
		image_speed = moveImageSpeed;
	}
	else {
		switch(myFace) {
			case Face.Right: sprite_index = sprCornIdleR; break;
			case Face.Left: sprite_index = sprCornIdleL; break;
			case Face.Up: sprite_index = sprCornIdleU; break;
			case Face.Down: sprite_index = sprCornIdleD; break;
		}
		image_speed = idleImageSpeed;
	}
	
	//Wander about aimlessly
	if (wander) {
		//Move to goal
		var _spd = (myState == ActorState.Scared)? moveSpeed*2 : moveSpeed;
		if (mp_potential_step_object(myTargetPos[X], myTargetPos[Y], _spd, objSolid)) {
			//Chance to barf
			var z=irandom(100);
			if (z < 33) { 
				myState = ActorState.Attack2;
				image_index = 0;
				image_speed = attackImageSpeed;
				switch(myFace) {
					case Face.Right: sprite_index=sprCornAttackR; break;
					case Face.Left: sprite_index=sprCornAttackL; break;
					case Face.Up: sprite_index=sprCornAttackU; break;
					case Face.Down: sprite_index=sprCornAttackD; break;
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
			case Face.Right: sprite_index=sprCornAttackR; break;
			case Face.Left: sprite_index=sprCornAttackL; break;
			case Face.Up: sprite_index=sprCornAttackU; break;
			case Face.Down: sprite_index=sprCornAttackD; break;
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
//Barf
else if (myState == ActorState.Attack2) {
	if (image_index == (image_number - 1)) {
		var _xx = x, _yy = y;
		switch(myFace) {
			case Face.Right: _xx += 32; break;
			case Face.Left: _xx -= 32; break;
			case Face.Up: _yy -= 32; break;
			case Face.Down: _yy += 32; break;
		}
		instance_create_v(_xx, _yy, "InstanceFloor", objCornKinVomit);
		audio_play_sound(Corn_Vomit, 1, false);
		myState = ActorState.Idle;
		wander=false;
	}
}