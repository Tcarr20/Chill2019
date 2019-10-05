///@description Animate & damage
if (image_speed != 0)
{
	if (image_index == (image_number-1) || image_index == 0) {
		image_speed = 0;
	}
}

//Determine damage
if (image_index >= 5 && image_index <= 7 ) { myDamage = 1; }
else { myDamage = 0; }

//TEST
if (keyboard_check_pressed(ord("S"))) { event_perform(ev_other, ev_user0); }