///@description Animate & damage
if (image_speed != 0)
{
	if (image_index == (image_number-1) || image_index == 0) {
		image_speed = 0;
	}
}

//Set if the hole can be fallen down or not
myDamage = (image_index == (image_number - 1))? 1 : 0;