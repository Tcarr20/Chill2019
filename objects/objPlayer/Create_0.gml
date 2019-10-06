///@description Set initial values
event_inherited();
//Identify
myID = ct_argument[0];
myMove = Face.Down;
myFace = Face.Down;
myState = ActorState.Idle;
myClass = ct_argument[1];

//Health & Damage
	 if (myClass == PlayerClass.None) { maxHealth = 2; }
else if (myClass == PlayerClass.Jack) { maxHealth = 6; }
else if (myClass == PlayerClass.Vamp) { maxHealth = 2; }
else if (myClass == PlayerClass.Wolf) { maxHealth = 4; }
myHealth = (ct_argument[2] < 0)? maxHealth : ct_argument[2];
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
	hurtSprites = [sprPlayerGIdleR, -1, sprPlayerGIdleU, -1, sprPlayerGIdleL, -1, sprPlayerGIdleD, -1];
	attackSprites = [sprPlayerGAttackR, -1, sprPlayerGAttackU, -1, sprPlayerGAttackL, -1, sprPlayerGAttackD, -1];
	slashSprites = [sprPlayerGSlashR, -1, sprPlayerGSlashU, -1, sprPlayerGSlashL, -1, sprPlayerGSlashD, -1];
	bashSprites = [sprPlayerGBashR, -1, sprPlayerGBashU, -1, sprPlayerGBashL, -1, sprPlayerGBashD, -1];
}
if (myID == 1) {
	idleSprites = [sprPlayerOIdleR, -1, sprPlayerOIdleU, -1, sprPlayerOIdleL, -1, sprPlayerOIdleD, -1];
	moveSprites = [sprPlayerOMoveR, -1, sprPlayerOMoveU, -1, sprPlayerOMoveL, -1, sprPlayerOMoveD, -1];
	hurtSprites = [sprPlayerOIdleR, -1, sprPlayerOIdleU, -1, sprPlayerOIdleL, -1, sprPlayerOIdleD, -1];
	attackSprites = [sprPlayerOAttackR, -1, sprPlayerOAttackU, -1, sprPlayerOAttackL, -1, sprPlayerOAttackD, -1];
	slashSprites = [sprPlayerOSlashR, -1, sprPlayerOSlashU, -1, sprPlayerOSlashL, -1, sprPlayerOSlashD, -1];
	bashSprites = [sprPlayerOBashR, -1, sprPlayerOBashU, -1, sprPlayerOBashL, -1, sprPlayerOBashD, -1];
}
if (myID == 2) {
	idleSprites = [sprPlayerRIdleR, -1, sprPlayerRIdleU, -1, sprPlayerRIdleL, -1, sprPlayerRIdleD, -1];
	moveSprites = [sprPlayerRMoveR, -1, sprPlayerRMoveU, -1, sprPlayerRMoveL, -1, sprPlayerRMoveD, -1];
	hurtSprites = [sprPlayerRIdleR, -1, sprPlayerRIdleU, -1, sprPlayerRIdleL, -1, sprPlayerRIdleD, -1];
	attackSprites = [sprPlayerRAttackR, -1, sprPlayerRAttackU, -1, sprPlayerRAttackL, -1, sprPlayerRAttackD, -1];
	slashSprites = [sprPlayerRSlashR, -1, sprPlayerRSlashU, -1, sprPlayerRSlashL, -1, sprPlayerRSlashD, -1];
	bashSprites = [sprPlayerRBashR, -1, sprPlayerRBashU, -1, sprPlayerRBashL, -1, sprPlayerRBashD, -1];
}
idleImageSpeed = 0.4;
walkImageSpeed = 0.6;
attackImageSpeed = 1.0;
image_speed = idleImageSpeed;