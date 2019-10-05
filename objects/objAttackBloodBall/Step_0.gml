///@description 
if (lifetime > 0) {
	lifetime--;
	if (lifetime < 12) { 
		hspeed = approach(hspeed, 0, moveFric);
		vspeed = approach(vspeed, 0, moveFric);
	}
}
else { instance_destroy(); }