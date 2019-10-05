///@description Movement & Collision
if (hitStun > 0) { hitStun--; }
if (myState == PlayerState.Hurt) {
	if (hitStun < hitStunFreeze) { myState = PlayerState.Idle; }
}
else if (myState != PlayerState.Hold) {
	//Poll attack input
	if (get_in(in_x, in_check_press, myID)) {
		//Scythe Swipe
		if (myClass == PlayerClass.Jack) {
			//Execute attack if you're not attacking
			if (attackComboLevel == 0) {
				attackComboLevel = 1;
				myState = PlayerState.Attack1;
				image_speed = attackImageSpeed;
				attackInstance = instance_create_v(x, y, layer, objAttackSlash, self, myFace, attackImageSpeed);
			}
			//Buffer attack otherwise
			else {
				if (ds_queue_size(attackBuffer) < attackBufferSize) { ds_queue_enqueue(attackBuffer, in_x); }
				if (alarm_get(0) == -1) { alarm[0] = attackBufferCycle; }
			}
		}
	}
	
	//Poll movement input
	if (attackComboLevel == 0)
	{
		if (get_in(in_left, in_check_hold, myID)) {
			myMove = Face.Left;
			myFace = Face.Left;
			myState = PlayerState.Move;
		}
		else if (get_in(in_down_left, in_check_hold, myID)) {
			myMove = Face.DownLeft;
			if (myFace == Face.Up || myFace == Face.Right) { myFace = Face.Down; }
			myState = PlayerState.Move;
		}
		else if (get_in(in_down, in_check_hold, myID)) {
			myMove = Face.Down;
			myFace = Face.Down;
			myState = PlayerState.Move;
		}
		else if (get_in(in_down_right, in_check_hold, myID)) {
			myMove = Face.DownRight;
			if (myFace == Face.Up || myFace == Face.Left) { myFace = Face.Down; }
			myState = PlayerState.Move;
		}
		else if (get_in(in_right, in_check_hold, myID)) {
			myMove = Face.Right;
			myFace = Face.Right;
			myState = PlayerState.Move;
		}
		else if (get_in(in_up_right, in_check_hold, myID)) {
			myMove = Face.UpRight;
			if (myFace == Face.Down || myFace == Face.Left) { myFace = Face.Up; }
			myState = PlayerState.Move;
		}
		else if (get_in(in_up, in_check_hold, myID)) {
			myMove = Face.Up;
			myFace = Face.Up;
			myState = PlayerState.Move;
		}
		else if (get_in(in_up_left, in_check_hold, myID)) {
			myMove = Face.UpLeft;
			if (myFace == Face.Down || myFace == Face.Right) { myFace = Face.Up; }
			myState = PlayerState.Move;
		}
		else { myState = PlayerState.Idle; }
	}
	
	//Handle motion based on direction & state
	if (myState == PlayerState.Move) {
		vx = approach(vx, faceOffsetX[myMove]*moveSpeed, moveAcc);
		vy = approach(vy, faceOffsetY[myMove]*moveSpeed, moveAcc);
	}
	else {
		vx = approach(vx, 0, moveFric);
		vy = approach(vy, 0, moveFric);
	}
	
	//Handle animation based on direction & state
	if (myState == PlayerState.Attack1 || myState == PlayerState.Attack2) {
		switch(myFace) {
			case Face.Right: sprite_index = sprPlayerAttackR; break;
			case Face.Left: sprite_index = sprPlayerAttackL; break;
			case Face.Up: sprite_index = sprPlayerAttackU; break;
			case Face.Down: sprite_index = sprPlayerAttackD; break;
		}
		image_speed = attackImageSpeed;
	}
	else if (myState == PlayerState.Idle) {
		switch(myFace) {
			case Face.Right: sprite_index = sprPlayerIdleR; break;
			case Face.Left: sprite_index = sprPlayerIdleL; break;
			case Face.Up: sprite_index = sprPlayerIdleU; break;
			case Face.Down: sprite_index = sprPlayerIdleD; break;
		}
		image_speed = idleImageSpeed;
	}
	else if (myState == PlayerState.Move) {
		switch(myFace) {
			case Face.Right: sprite_index = sprPlayerIdleR; break;
			case Face.Left: sprite_index = sprPlayerIdleL; break;
			case Face.Up: sprite_index = sprPlayerIdleU; break;
			case Face.Down: sprite_index = sprPlayerIdleD; break;
		}
		image_speed = walkImageSpeed;
	}
}