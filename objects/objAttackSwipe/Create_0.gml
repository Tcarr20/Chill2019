///@description 
event_inherited();
myPar = ct_argument[0];
myFace = ct_argument[1];
image_speed = ct_argument[2];

//Set sprite
switch(myFace) {
	case Face.Down: sprite_index = sprAttackSwipeD; break;
	case Face.Right: sprite_index = sprAttackSwipeR; break;
	case Face.Up: sprite_index = sprAttackSwipeU; break;
	case Face.Left: sprite_index = sprAttackSwipeL; break;
}