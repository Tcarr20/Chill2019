///@description Create room structures
//Initialize shadow text buffers
shadow_text_init();

//Create depth grid
global.depthGridH = room_height;
global.depthGrid = 0;
depth_init();

//Initialize camera
center_camera();
camera = camera_create();
var vm = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(ideal_w, ideal_h, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;


//audio
if (room = rmTest) {
if(!audio_is_playing(Kneels_Boar))
{
	audio_play_sound(Kneels_Boar, 1, true);
}
}

//Create players
switch(room) {
	case rmSlideTopRight:
		instance_create_v(747, 289, "InstanceDepthStart", objPlayer, 0, PlayerClass.Wolf);
			instance_create_v(747, 289+32, "InstanceDepthStart", objPlayer, 1, PlayerClass.Jack);
			instance_create_v(747, 289-32, "InstanceDepthStart", objPlayer, 2, PlayerClass.Vamp);
	break;
	default:
		if (layer_exists("InstanceDepthStart")) {
			instance_create_v((room_width/2), (room_height/2), "InstanceDepthStart", objPlayer, 0, PlayerClass.Vamp);
			instance_create_v((room_width/2), (room_height/2)+32, "InstanceDepthStart", objPlayer, 1, PlayerClass.Jack);
		}
	break;
}