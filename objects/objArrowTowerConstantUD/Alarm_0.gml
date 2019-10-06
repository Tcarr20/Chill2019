///@description Shoot arrows
instance_create_v(x, y - 16, layer, objTrapArrow, Face.Up);
instance_create_v(x, y - 16, layer, objTrapArrow, Face.Down);
audio_play_sound(Arrow_Shoot, 0.5, false);
alarm[0] = 120;