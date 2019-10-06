///@description Initial values
event_inherited();
isArrow = true;
myFace = ct_argument[0];
myDamage = 1;
myKnockback = 0.15;
switch(myFace) {
	case Face.Left:
		sprite_index = sprTrapArrowL;
		hspeed = -8;
	break
	case Face.Right:
		sprite_index = sprTrapArrowR;
		hspeed = 8;
	break;
	case Face.Up:
		sprite_index = sprTrapArrowU;
		vspeed = -8;
	break;
	case Face.Down:
		sprite_index = sprTrapArrowD;
		vspeed = 8;
	break;
}