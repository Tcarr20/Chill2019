///@description 
event_inherited();
myDamage = 2;
myKnockback = 1.0;
myPar = ct_argument[0];
myFace = ct_argument[1];
image_speed = ct_argument[2];
audio_play_sound(Jack_Attack, 0.5, false);
//Set sprite
switch(myFace) {
	case Face.Down: sprite_index = sprAttackBashD; break;
	case Face.Right: sprite_index = sprAttackBashR; break;
	case Face.Up: sprite_index = sprAttackBashU; break;
	case Face.Left: sprite_index = sprAttackBashL; break;
}