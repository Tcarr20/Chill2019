///@description Control effect
if (!room_start)
{
	//Mosaic
	if (type==rm_trans_fade) { mosaicSize = clamp(mosaicSize + 1, 0, 32); }
	
	//Fade
    if (image_alpha<1) {image_alpha += fade_timer;}
    else {room_goto(rm);}
}
else
{
	//Mosaic
	if (type==rm_trans_fade) { mosaicSize = clamp(mosaicSize - 1, 1, 32); }
	
    //Fade
	if (image_alpha>0) {image_alpha -= fade_timer;}
    else {
        global.stopFlagTrans = false;
        instance_destroy();
    }
}

