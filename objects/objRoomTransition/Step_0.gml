///@description Control effect
if (!room_start)
{
	//Mosaic
	if (type==rm_trans_mosaic) { mosaicSize = clamp(mosaicSize + 1, 0, 32); }
	
	//Fade
    if (image_alpha<1) {image_alpha += fade_timer;}
    else {room_goto(rm);}
}
else
{
	//Mosaic
	if (type==rm_trans_mosaic) { mosaicSize = clamp(mosaicSize - 1, 1, 32); }
	
    //Fade
	if (image_alpha>0) {image_alpha -= fade_timer;}
    else {
        global.stopFlagTransition = false;
        instance_destroy();
    }
}

