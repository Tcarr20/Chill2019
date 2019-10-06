///@description 
event_inherited();
myPar = ct_argument[0];
myFace = ct_argument[1];
image_speed = ct_argument[2];
audio_play_sound(Wolf_Attack2, 0.5, false);

//Set sprite
switch(myFace) {
	case Face.Down: sprite_index = sprAttackSwipe3D; break;
	case Face.Right: sprite_index = sprAttackSwipe3R; break;
	case Face.Up: sprite_index = sprAttackSwipe3U; break;
	case Face.Left: sprite_index = sprAttackSwipe3L; break;
}