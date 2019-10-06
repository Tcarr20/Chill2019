///@description Initialize
rm=ct_argument[0];
type=ct_argument[1];
room_start=false;
fade_timer = 0.1;
image_alpha=0;
image_blend=c_black;
global.stopFlagTrans = true;

//Set up effects
if (type==rm_trans_fade) {
	//Disable automatic app surface drawing
	application_surface_draw_enable(false);
	mosaicSize = 1;
	u_mosaic_size = shader_get_uniform(shdMosaic, "u_fMosaicSize");
	u_texture_w = shader_get_uniform(shdMosaic, "u_fTextureWidth");
	u_texture_h = shader_get_uniform(shdMosaic, "u_fTextureHeight");
	
	//Set fade to be slower
	fade_timer = 0.03;
	
	//Get screen scaling factor
	surfaceScale = 1;
	if (window_get_fullscreen()) { surfaceScale = display_get_width() / surface_get_width(application_surface); }
}