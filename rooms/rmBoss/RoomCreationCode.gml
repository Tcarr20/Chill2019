if (!audio_group_is_loaded(audiogroup_default))
{
	audio_group_load(audiogroup_default);
}

if (audio_is_playing(Kneels_Boar))
{
	audio_stop_sound(Kneels_Boar);
}

if(!audio_is_playing(Nailsorgarde))
{
	audio_play_sound(Nailsorgarde, 1, true);
}