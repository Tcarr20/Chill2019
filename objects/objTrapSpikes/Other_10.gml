///@description Spikes up
image_speed = 1.0;
if(!audio_is_playing(Spikes_Extend))
{
	audio_play_sound(Spikes_Extend, 0.5, false);
}