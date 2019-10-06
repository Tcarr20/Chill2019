///@description 
event_inherited();
myKnockback = 0.2;
myPar = ct_argument[0];
myFace = ct_argument[1];
image_speed = ct_argument[2];
audio_play_sound(Jack_Attack, 0.5, false);
//Set sprite
switch(myFace) {
	case Face.Down: sprite_index = sprAttackSlashD; break;
	case Face.Right: sprite_index = sprAttackSlashR; break;
	case Face.Up: sprite_index = sprAttackSlashU; break;
	case Face.Left: sprite_index = sprAttackSlashL; break;
}