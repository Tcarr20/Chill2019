/// @description Insert description here
// You can write your code in this editor*if (get_in(in_a, in_check_press, 0))
if(get_in(in_a, in_check_press, 0) && (room == Title))
{
	room_goto_effect(rmSlideFourDir, rm_trans_fade);
	audio_stop_sound(Operatte_del_Corn);
}