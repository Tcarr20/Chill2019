///@description Fade away
if (lifetime > 0) {
	lifetime--;
	if (lifetime < 60) { image_alpha -= (1/60); }
}
else { instance_destroy(); }