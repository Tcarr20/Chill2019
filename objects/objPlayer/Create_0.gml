///@description Set initial values
//Identify
myID = 0;
myMove = Face.Down;
myFace = Face.Down;
myState = PlayerState.Idle;
myClass = PlayerClass.Jack;

//Health & Damage
myHealth = 6;
attackComboLevel = 0;
attackBuffer = ds_queue_create();
attackBufferSize = 3;
attackBufferCycle = 45;
attackInstance = noone;
hitStun = 0;
hitStunTime = 35;
hitStunFreeze = 15;
alarm[0] = attackBufferCycle;

//Motion control
moveSpeed = 4;
moveAcc = 0.5;
moveFric = 0.8;
vx = 0;
vy = 0;
cx = 0;
cy = 0;
set_camera_x(x);
set_camera_y(y);

//Sprite & animation control
faceOffsetX = [1, INV_RT2, 0, -INV_RT2, -1, -INV_RT2, 0, INV_RT2];
faceOffsetY = [0, -INV_RT2, -1, -INV_RT2, 0, INV_RT2, 1, INV_RT2];
idleImageSpeed = 0.2;
walkImageSpeed = 0.3;
attackImageSpeed = 1.0;
image_speed = idleImageSpeed;