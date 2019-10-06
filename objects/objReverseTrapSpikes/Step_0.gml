/// @description Animate and damage
event_inherited();
if (image_speed != 0)
{
	if (image_index == (image_number-1) || image_index == 0) {
		image_speed = 0;
	}
}