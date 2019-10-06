///@description Set initial values
//Identify
myID = ct_argument[0];
myMove = Face.Down;
myFace = Face.Down;
myState = ActorState.Idle;
myClass = ct_argument[1];

//Health & Damage
myHealth = 6;
attackComboLevel = 0;
attackBuffer = ds_queue_create();
attackBufferSize = 3;
attackBufferCycle = 55;
attackInstance = noone;
attackDelay = 0;
hitStun = 0;
hitStunTime = 35;
hitStunFreeze = 15;
respawnPos = [x, y];
takeDamage = 0;
takeKnockback = 0;
knockbackDirection = 0;
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
if (myID == 0) {
	idleSprites = [sprPlayerGIdleR, -1, sprPlayerGIdleU, -1, sprPlayerGIdleL, -1, sprPlayerGIdleD, -1];
	moveSprites = [sprPlayerGMoveR, -1, sprPlayerGMoveU, -1, sprPlayerGMoveL, -1, sprPlayerGMoveD, -1];
	attackSprites = [sprPlayerAttackR, -1, sprPlayerAttackU, -1, sprPlayerAttackL, -1, sprPlayerAttackD, -1];
	hurtSprites = [sprPlayerHurtR, -1, sprPlayerHurtU, -1, sprPlayerHurtL, -1, sprPlayerHurtD, -1];
}
if (myID == 1) {
	idleSprites = [sprPlayerOIdleR, -1, sprPlayerOIdleU, -1, sprPlayerOIdleL, -1, sprPlayerOIdleD, -1];
	moveSprites = [sprPlayerOMoveR, -1, sprPlayerOMoveU, -1, sprPlayerOMoveL, -1, sprPlayerOMoveD, -1];
	attackSprites = [sprPlayerAttackR, -1, sprPlayerAttackU, -1, sprPlayerAttackL, -1, sprPlayerAttackD, -1];
	hurtSprites = [sprPlayerHurtR, -1, sprPlayerHurtU, -1, sprPlayerHurtL, -1, sprPlayerHurtD, -1];
}
if (myID == 2) {
	idleSprites = [sprPlayerGIdleR, -1, sprPlayerGIdleU, -1, sprPlayerGIdleL, -1, sprPlayerGIdleD, -1];
	moveSprites = [sprPlayerGMoveR, -1, sprPlayerGMoveU, -1, sprPlayerGMoveL, -1, sprPlayerGMoveD, -1];
	attackSprites = [sprPlayerAttackR, -1, sprPlayerAttackU, -1, sprPlayerAttackL, -1, sprPlayerAttackD, -1];
	hurtSprites = [sprPlayerHurtR, -1, sprPlayerHurtU, -1, sprPlayerHurtL, -1, sprPlayerHurtD, -1];
}
headIdleSprites = array_create(8, -1);
headMoveSprites = array_create(8, -1);
headAttackSprites = array_create(8, -1);
headHurtSprites = array_create(8, -1);
if (myClass == PlayerClass.Jack) {
	headIdleSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
	headMoveSprites = [sprJackMoveR, -1, sprJackMoveU, -1, sprJackMoveL, -1, sprJackMoveD, -1];
	//headAttackSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
	//headHurtSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
}
else if (myClass == PlayerClass.Vamp) {
	headIdleSprites = [sprVampIdleR, -1, sprVampIdleU, -1, sprVampIdleL, -1, sprVampIdleD, -1];
	headMoveSprites = [sprVampMoveR, -1, sprVampMoveU, -1, sprVampMoveL, -1, sprVampMoveD, -1];
	//headAttackSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
	//headHurtSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
}
else if (myClass == PlayerClass.Wolf) {
	headIdleSprites = [sprWolfIdleR, -1, sprWolfIdleU, -1, sprWolfIdleL, -1, sprWolfIdleD, -1];
	headMoveSprites = [sprWolfMoveR, -1, sprWolfMoveU, -1, sprWolfMoveL, -1, sprWolfMoveD, -1];
	//headAttackSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
	//headHurtSprites = [sprJackIdleR, -1, sprJackIdleU, -1, sprJackIdleL, -1, sprJackIdleD, -1];
}
idleImageSpeed = 0.4;
walkImageSpeed = 0.6;
attackImageSpeed = 1.0;
image_speed = idleImageSpeed;