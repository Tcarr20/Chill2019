///@description Initial values
event_inherited();
myDamage = 1;
myKnockback = 0.2;
lifetime = 45;
moveFric = 0.3;
myPar = ct_argument[0];
myFace = ct_argument[1];
audio_play_sound(Vamp_Shoot, 1, false);
switch(myFace) {
	case Face.Left: 
		hspeed = -7; 
		sprite_index = sprAttackBloodBallL;
	break;
	case Face.Right: 
		hspeed = 7; 
		sprite_index = sprAttackBloodBallR;
	break;
	case Face.Up: 
		vspeed = -7; 
		sprite_index = sprAttackBloodBallU;
	break;
	case Face.Down: 
		vspeed = 7; 
		sprite_index = sprAttackBloodBallD;
	break;
}