if (!audio_group_is_loaded(audiogroup_default))
{
	audio_group_load(audiogroup_default);
}

if (!audio_is_playing(Kneels_Boar))
{
	audio_play_sound(Kneels_Boar, 1, true);
}