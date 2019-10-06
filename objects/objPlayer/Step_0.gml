///@description Movement & Collision
event_inherited();
if (attackDelay > 0) { attackDelay--; }
if (hitStun > 0) { hitStun--; }
if (myState == ActorState.Hurt) {
	if (hitStun < hitStunFreeze) { myState = ActorState.Idle; }
}
else if (myState == ActorState.Fall) {
	image_xscale -= 0.025;
	image_yscale -= 0.025;
	if (image_xscale <= 0) {
		//Respawn & take damage
		image_xscale = 1;
		image_yscale = 1;
		x = respawnPos[X];
		y = respawnPos[Y];
		myHealth -= 1;
		if (myHealth <= 0) { event_perform(ev_other, ev_user1); }
		else {
			myState = ActorState.Idle;
			hitStun = hitStunTime; 
		}
	}
}
else if (myState != ActorState.Hold) {
	//Poll attack input
	if (get_in(in_x, in_check_press, myID) && attackDelay == 0) {
		//Scythe Slash
		if (myClass == PlayerClass.Jack) {
			//Execute attack if you're not attacking
			if (attackComboLevel == 0) {
				attackComboLevel = 1;
				myState = ActorState.Attack;
				sprite_index = slashSprites[myFace];
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
		//Blood ball
		else if (myClass == PlayerClass.Vamp) {
			//Execute attack if you're not attacking
			if (attackComboLevel == 0 && !instance_exists(attackInstance)) {
				attackComboLevel = 1;
				myState = ActorState.Attack;
				sprite_index = attackSprites[myFace];
				image_speed = attackImageSpeed;
				image_index = 0;
				attackInstance = instance_create_v(x, y, layer, objAttackBloodBall, self, myFace, attackImageSpeed);
			}
		}
		//Swipe
		else if (myClass == PlayerClass.Wolf) {
			//Execute attack if you're not attacking
			if (attackComboLevel == 0) {
				attackComboLevel = 1;
				myState = ActorState.Attack;
				sprite_index = attackSprites[myFace];
				image_speed = attackImageSpeed;
				image_index = 0;
				attackInstance = instance_create_v(x, y, layer, objAttackSwipe, self, myFace, attackImageSpeed);
				vx += faceOffsetX[myFace]*moveSpeed*0.75;
				vy += faceOffsetY[myFace]*moveSpeed*0.75;
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
			myState = ActorState.Move;
		}
		else if (get_in(in_down_left, in_check_hold, myID)) {
			myMove = Face.DownLeft;
			if (myFace == Face.Up || myFace == Face.Right) { myFace = Face.Down; }
			myState = ActorState.Move;
		}
		else if (get_in(in_down, in_check_hold, myID)) {
			myMove = Face.Down;
			myFace = Face.Down;
			myState = ActorState.Move;
		}
		else if (get_in(in_down_right, in_check_hold, myID)) {
			myMove = Face.DownRight;
			if (myFace == Face.Up || myFace == Face.Left) { myFace = Face.Down; }
			myState = ActorState.Move;
		}
		else if (get_in(in_right, in_check_hold, myID)) {
			myMove = Face.Right;
			myFace = Face.Right;
			myState = ActorState.Move;
		}
		else if (get_in(in_up_right, in_check_hold, myID)) {
			myMove = Face.UpRight;
			if (myFace == Face.Down || myFace == Face.Left) { myFace = Face.Up; }
			myState = ActorState.Move;
		}
		else if (get_in(in_up, in_check_hold, myID)) {
			myMove = Face.Up;
			myFace = Face.Up;
			myState = ActorState.Move;
		}
		else if (get_in(in_up_left, in_check_hold, myID)) {
			myMove = Face.UpLeft;
			if (myFace == Face.Down || myFace == Face.Right) { myFace = Face.Up; }
			myState = ActorState.Move;
		}
		else { myState = ActorState.Idle; }
	}
	
	//Handle motion based on direction & state
	if (myState == ActorState.Move) {
		vx = approach(vx, faceOffsetX[myMove]*moveSpeed, moveAcc);
		vy = approach(vy, faceOffsetY[myMove]*moveSpeed, moveAcc);
	}
	else {
		vx = approach(vx, 0, moveFric);
		vy = approach(vy, 0, moveFric);
	}
	
	//Handle animation based on direction & state
	if (myState == ActorState.Idle) {
		sprite_index = idleSprites[myFace];
		image_speed = idleImageSpeed;
	}
	else if (myState == ActorState.Move) {
		sprite_index = moveSprites[myFace];
		image_speed = walkImageSpeed;
	}
}