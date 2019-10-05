///@description Set initial values
//Identify
myID = 0;
myFace = Face.Down;
myState = PlayerState.Idle;

//Motion control
walkSpeed = 4;
vx = 0;
vy = 0;
cx = 0;
cy = 0;
set_camera_x(x);
set_camera_y(y);

//Sprite & animation control
spritesIdle = [sprPlayerIdleR, sprPlayerIdleUR, sprPlayerIdleU, sprPlayerIdleUL,
			   sprPlayerIdleL, sprPlayerIdleDL, sprPlayerIdleD, sprPlayerIdleDR];
spritesWalk = [sprPlayerIdleR, sprPlayerIdleUR, sprPlayerIdleU, sprPlayerIdleUL,
			   sprPlayerIdleL, sprPlayerIdleDL, sprPlayerIdleD, sprPlayerIdleDR];
faceOffsetX = [1, 1/2, 0, -1/2, -1, -1/2, 0, 1/2];
faceOffsetY = [0, -1/2, -1, -1/2, 0, 1/2, 1, 1/2];
idleImageSpeed = 0.2;
walkImageSpeed = 0.3;
sprite_index = spritesIdle[myFace];
image_speed = idleImageSpeed;