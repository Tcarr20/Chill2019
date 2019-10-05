///@description Toggle state
if (place_meeting(x, y, objActorPar)) { 
	//Trigger objects
	if (!myLatch) {
		for(var i=0; i<instance_count; i++) {
			var _o = instance_find(all, i);
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
		for(var i=0; i<instance_count; i++) {
			var _o = instance_find(all, i);
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