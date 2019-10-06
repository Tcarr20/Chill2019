///@description Toggle state
if (place_meeting(x, y, objActorPar)) { 
	//Trigger objects
	if (!myLatch) {
		for(var i=0; i<instance_number(objTrapParent); i++) {
			var _o = instance_find(objTrapParent, i);
			if (variable_instance_exists(_o, "myGroup")) {
				if (_o.myGroup == myToggle) {
					with(_o) { event_perform(ev_other, ev_user0); }
				}
			}
		}
	}
	myLatch = true;
	image_index = 1; 
}
else { 
	if (myLatch) {
		audio_play_sound(Press_Plate, 0.5, false);
		for(var i=0; i<instance_number(objTrapParent); i++) {
			var _o = instance_find(objTrapParent, i);
			if (variable_instance_exists(_o, "myGroup")) {
				if (_o.myGroup == myToggle) {
					with(_o) { event_perform(ev_other, ev_user1); }
				}
			}
		}
	}
	myLatch = false;
	image_index = 0; 
}

