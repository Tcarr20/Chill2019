/// @description Draw fullscreen effect
if (type==rm_trans_mosaic) {
	shader_set(shdMosaic);
	shader_set_uniform_f(u_mosaic_size, mosaicSize);
	shader_set_uniform_f(u_texture_w, surface_get_width(application_surface));
	shader_set_uniform_f(u_texture_h, surface_get_height(application_surface));
	draw_surface_ext(application_surface, 0, 0, surfaceScale, surfaceScale, 0, c_white, 1);
	shader_reset();
}