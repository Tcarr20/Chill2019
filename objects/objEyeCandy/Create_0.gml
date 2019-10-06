///@description Initialize
myHealth = 2;
myState = ActorState.Idle;
myDamage = 1;
myKnockback = 0.2;
hitStun = 0;
takeDamage = 0;
takeKnockback = 0;
knockbackDirection = 0;
hitStunTime = 30;
scareTimer = 0;

wander = false;
myFace = Face.Down
myTarget = noone;
myTargetPos = [x, y];
moveSpeed = 2;
alarm[0] = irandom_range(15, 60);
alarm[1] = 1;
alarm[2] = irandom_range(10, 30);
alarm[3] = irandom_range(45, 85);
xLast = x;
yLast = y;
moveDir = 0;
idleImageSpeed = 0.2;
moveImageSpeed = 0.4;
attackImageSpeed = 0.6;

//Set motion planning
mp_potential_settings(45, 5, 5, true);