///@description 
event_inherited();
myPar = ct_argument[0];
myFace = ct_argument[1];
image_speed = ct_argument[2];

//Set sprite
switch(myFace) {
	case Face.Down: sprite_index = sprAttackSlash2D; break;
	case Face.Right: sprite_index = sprAttackSlash2R; break;
	case Face.Up: sprite_index = sprAttackSlash2U; break;
	case Face.Left: sprite_index = sprAttackSlash2L; break;
}