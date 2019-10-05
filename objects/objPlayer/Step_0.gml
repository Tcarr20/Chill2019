///@description Movement & Collision
/// @description Handle state
if (myState != PlayerState.Hold) {
	//Poll input
	if (get_in(in_left, in_check_hold, myID)) {
		myFace = Face.Left;
		myState = PlayerState.Move;
	}
	else if (get_in(in_down_left, in_check_hold, myID)) {
		myFace = Face.DownLeft;
		myState = PlayerState.Move;
	}
	else if (get_in(in_down, in_check_hold, myID)) {
		myFace = Face.Down;
		myState = PlayerState.Move;
	}
	else if (get_in(in_down_right, in_check_hold, myID)) {
		myFace = Face.DownRight;
		myState = PlayerState.Move;
	}
	else if (get_in(in_right, in_check_hold, myID)) {
		myFace = Face.Right;
		myState = PlayerState.Move;
	}
	else if (get_in(in_up_right, in_check_hold, myID)) {
		myFace = Face.UpRight;
		myState = PlayerState.Move;
	}
	else if (get_in(in_up, in_check_hold, myID)) {
		myFace = Face.Up;
		myState = PlayerState.Move;
	}
	else if (get_in(in_up_left, in_check_hold, myID)) {
		myFace = Face.UpLeft;
		myState = PlayerState.Move;
	}
	else { myState = PlayerState.Idle; }
	
	//Handle motion based on direction & state
	if (myState == PlayerState.Move) {
		vx = faceOffsetX[myFace]*walkSpeed;
		vy = faceOffsetY[myFace]*walkSpeed;
	}
	else if (myState == PlayerState.Idle) {
		vx = 0;
		vy = 0;
	}
	
	//Handle animation based on direction & state
	if (myState == PlayerState.Idle) {
		sprite_index = spritesIdle[myFace];
		image_speed = idleImageSpeed;
	}
	else if (myState == PlayerState.Move) {
		sprite_index = spritesWalk[myFace];
		image_speed = walkImageSpeed;
	}
	
	//Update camera
	set_camera_x(x);
	set_camera_y(y);
}