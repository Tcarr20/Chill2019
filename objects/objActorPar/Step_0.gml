///@description Pause
if (scrStop()) {
	//Pause alarms
	for(var i=0; i<15; i++) { alarm_set(i, alarm_get(i) + 1); }
	//Store values
	if (!pauseLatch) {
		pauseLatch = true;
		
		storeImageSpeed = image_speed;
		image_speed = 0;
		storeHspeed = hspeed;
		hspeed = 0;
		storeVspeed = vspeed;
		vspeed = 0;
	}
	
	exit;
}
//Restore stored values
else if (pauseLatch) {
	pauseLatch = false;
	
	image_speed = storeImageSpeed;
	hspeed = storeHspeed;
	vspeed = storeVspeed;
}