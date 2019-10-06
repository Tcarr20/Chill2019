///@description Toggle state
if (place_meeting(x, y, objActorPar)) { 
	//Trigger objects
	if (!myLatch) {
		scrOpenDoors();
	}
	myLatch = true;
	image_index = 1; 
}
else { 
	if (myLatch) {
		audio_play_sound(Press_Plate, 0.5, false);
	}
	myLatch = false;
	image_index = 0; 
}

