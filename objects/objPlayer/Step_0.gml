///@description Movement & Collision
if (hitStun > 0) { hitStun--; }
if (myState == PlayerState.Hurt) {
	if (hitStun < hitStunFreeze) { myState = PlayerState.Idle; }
}
else if (myState == PlayerState.Fall) {
	image_xscale -= 0.025;
	image_yscale -= 0.025;
	if (image_xscale <= 0) {
		//Respawn & take damage
		image_xscale = 1;
		image_yscale = 1;
		x = respawnPos[X];
		y = respawnPos[Y];
		myHealth -= 1;
		if (myHealth <= 0) { event_perform(ev_other, ev_user0); }
		else {
			myState = PlayerState.Idle;
			hitStun = hitStunTime; 
		}
	}
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
				image_index = 0;
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
		sprite_index = attackSprites[myFace];
		image_speed = attackImageSpeed;
	}
	else if (myState == PlayerState.Idle) {
		sprite_index = idleSprites[myFace];
		image_speed = idleImageSpeed;
	}
	else if (myState == PlayerState.Move) {
		sprite_index = moveSprites[myFace];
		image_speed = walkImageSpeed;
	}
}