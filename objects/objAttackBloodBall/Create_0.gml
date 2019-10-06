///@description Initial values
event_inherited();
lifetime = 45;
moveFric = 0.3;
myPar = ct_argument[0];
myFace = ct_argument[1];
switch(myFace) {
	case Face.Left: hspeed = -7; break;
	case Face.Right: hspeed = 7; break;
	case Face.Up: vspeed = -7; break;
	case Face.Down: vspeed = 7; break;
}