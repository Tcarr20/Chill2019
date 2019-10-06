/// @description Stop attacking
if (myState == ActorState.Attack)
{
	if (myClass == PlayerClass.Jack) {
		if (attackComboLevel == 1) { 
			//Check for buffered attacks
			if (!ds_queue_empty(attackBuffer)) {
				var _in = ds_queue_dequeue(attackBuffer);
				//If the main attack button was buffered,
				if (_in == in_x) {
					//Do a level 2 attack
					attackComboLevel = 2;
					myState = ActorState.Attack;
					image_speed = attackImageSpeed;
					attackDelay = 10;
					attackInstance = instance_create_v(x, y, layer, objAttackSlash2, self, myFace, attackImageSpeed);
				}
			}
			else { 
				myState = ActorState.Idle; 
				attackComboLevel = 0;
				attackDelay = 20;
				attackInstance = noone;
			}
		}
		else { 
			myState = ActorState.Idle;
			attackDelay = 20;
			attackComboLevel = 0;
			attackInstance = noone;
		}
	}
	else if (myClass == PlayerClass.Vamp) {
		myState = ActorState.Idle; 
		attackComboLevel = 0;
		attackInstance = noone;
	}
	else if (myClass == PlayerClass.Wolf) {
		if (attackComboLevel == 1) { 
			//Check for buffered attacks
			if (!ds_queue_empty(attackBuffer)) {
				var _in = ds_queue_dequeue(attackBuffer);
				//If the main attack button was buffered,
				if (_in == in_x) {
					//Do a level 2 attack
					attackComboLevel = 2;
					myState = ActorState.Attack;
					image_speed = attackImageSpeed;
					attackInstance = instance_create_v(x, y, layer, objAttackSwipe2, self, myFace, attackImageSpeed);
					vx += faceOffsetX[myFace]*moveSpeed*0.75;
					vy += faceOffsetY[myFace]*moveSpeed*0.75;
				}
			}
			else { 
				myState = ActorState.Idle; 
				attackComboLevel = 0;
				attackInstance = noone;
			}
		}
		else if (attackComboLevel == 2) { 
			//Check for buffered attacks
			if (!ds_queue_empty(attackBuffer)) {
				var _in = ds_queue_dequeue(attackBuffer);
				//If the main attack button was buffered,
				if (_in == in_x) {
					//Do a level 2 attack
					attackComboLevel = 3;
					myState = ActorState.Attack;
					image_speed = attackImageSpeed;
					attackInstance = instance_create_v(x, y, layer, objAttackSwipe3, self, myFace, attackImageSpeed);
					vx += faceOffsetX[myFace]*moveSpeed*1.25;
					vy += faceOffsetY[myFace]*moveSpeed*1.25;
				}
			}
			else { 
				myState = ActorState.Idle; 
				attackComboLevel = 0;
				attackDelay = 10;
				attackInstance = noone;
			}
		}
		else { 
			myState = ActorState.Idle; 
			attackComboLevel = 0;
			attackDelay = 10;
			attackInstance = noone;
		}
	}
}