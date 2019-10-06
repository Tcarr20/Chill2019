///@description Initialize
//Set state
myState = 0;
cursorPos = 0;
playerOneReady = 0;
playerTwoReady = 0;
playerThreeReady = 0;

//Play music
if(!audio_is_playing(Operatte_del_Corn))
{
	audio_stop_all();
	audio_play_sound(Operatte_del_Corn, 1, true);
}