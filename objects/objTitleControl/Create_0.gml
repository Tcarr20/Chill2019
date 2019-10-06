/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(Operatte_del_Corn))
{
	audio_stop_all();
	audio_play_sound(Operatte_del_Corn, 1, true);
}