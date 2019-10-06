///@description Shoot
instance_create_v(x, y - 16, layer, objTrapArrow, Face.Left);
instance_create_v(x, y - 16, layer, objTrapArrow, Face.Right);
audio_play_sound(Arrow_Shoot, 0.5, false);
alarm[0] = 120;