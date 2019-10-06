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

//Create players
switch(room) {
	case rmSlideFourDir:
		if(global.roomEnterFrom == Face.Down)
		{
			instance_create_v(352, 736, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Up);
			instance_create_v(384, 736, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Up);
			instance_create_v(416, 736, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Up);			
		}
		else if(global.roomEnterFrom == Face.Up)
		{
			instance_create_v(352, 32, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Down);
			instance_create_v(384, 32, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Down);
			instance_create_v(416, 32, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Down);
		}
		else if(global.roomEnterFrom == Face.Left)
		{
			instance_create_v(32, 351, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
			instance_create_v(32, 383, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
			instance_create_v(32, 415, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
		}
		else if(global.roomEnterFrom == Face.Right)
		{
			instance_create_v(735, 351, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Left);
			instance_create_v(735, 383, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Left);
			instance_create_v(735, 415, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Left);
		}
	break;
	case rmTopLeftRight:
		if(global.roomEnterFrom == Face.Up)
		{
			instance_create_v(320, 128, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Down);
			instance_create_v(352, 128, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Down);
			instance_create_v(384, 128, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Down);
		}
		else if(global.roomEnterFrom == Face.Left)
		{
			instance_create_v(64, 416, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
			instance_create_v(64, 448, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
			instance_create_v(64, 480, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
		}
		else if(global.roomEnterFrom == Face.Right)
		{
			instance_create_v(704, 416, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Left);
			instance_create_v(704, 448, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Left);
			instance_create_v(704, 480, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Left);
		}
	break;
	case rmSlideTopBotLeft:
		if(global.roomEnterFrom == Face.Down)
		{
			instance_create_v(320, 688, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Up);
			instance_create_v(352, 688, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Up);
			instance_create_v(384, 688, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Up);
		}
		else if(global.roomEnterFrom == Face.Up)
		{
			instance_create_v(256+32, 64+32, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Down);
			instance_create_v(192+32, 64+32, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Down);
			instance_create_v(256+32, 128+32, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Down);
		}
		else if(global.roomEnterFrom == Face.Left)
		{
			instance_create_v(96, 384, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
			instance_create_v(96, 416, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
			instance_create_v(96, 448, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
		}
	break;
	case rmSlideTopRight:
		if(global.roomEnterFrom == Face.Up)
		{
			instance_create_v(384, 32, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Down);
			instance_create_v(416, 32, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Down);
			instance_create_v(448, 32, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Down);
		}
		else if(global.roomEnterFrom == Face.Right)
		{
			instance_create_v(672, 416, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Left);
			instance_create_v(704, 416, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Left);
			instance_create_v(640, 416, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Left);
		}
	break;
	case rmSlideBotRight:
		if(global.roomEnterFrom == Face.Down)
		{
			instance_create_v(352, 704, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Up);
			instance_create_v(384, 704, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Up);
			instance_create_v(416, 704, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Up);
		}
		else if(global.roomEnterFrom == Face.Right)
		{
			instance_create_v(704, 448, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Left);
			instance_create_v(704, 416, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Left);
			instance_create_v(704, 384, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Left);
		}
	break;
	case rmSlideBotLeftRight:
		if(global.roomEnterFrom == Face.Down)
		{
			instance_create_v(352, 704, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Up);
			instance_create_v(384, 704, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Up);
			instance_create_v(416, 704, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Up);
		}
		else if(global.roomEnterFrom == Face.Left)
		{
			instance_create_v(64, 320, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
			instance_create_v(64, 352, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
			instance_create_v(64, 384, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
		}
		else if(global.roomEnterFrom == Face.Right)
		{
			instance_create_v(704, 320, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Left);
			instance_create_v(704, 352, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Left);
			instance_create_v(704, 384, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Left);
		}
	break;
	case rmSlideBotLeft:
		if(global.roomEnterFrom == Face.Down)
		{
			instance_create_v(352, 704, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Up);
			instance_create_v(384,704, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Up);
			instance_create_v(416, 704, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Up);
		}
		else if(global.roomEnterFrom == Face.Left)
		{
			instance_create_v(64, 384, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
			instance_create_v(64, 416, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
			instance_create_v(64, 448, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
		}
	break;
	case rmBoss:
		instance_create_v(64, 384, "InstanceDepthStart", objPlayer, 0, global.playerOneClass, global.playerOneHealth, Face.Right);
		instance_create_v(64, 416, "InstanceDepthStart", objPlayer, 1, global.playerTwoClass, global.playerTwoHealth, Face.Right);
		instance_create_v(64, 448, "InstanceDepthStart", objPlayer, 2, global.playerThreeClass, global.playerThreeHealth, Face.Right);
	break;
	default:
		if (layer_exists("InstanceDepthStart")) {
			instance_create_v((room_width/2), (room_height/2), "InstanceDepthStart", objPlayer, 0, PlayerClass.Vamp, global.playerOneHealth);
			instance_create_v((room_width/2), (room_height/2)+32, "InstanceDepthStart", objPlayer, 1, PlayerClass.Jack, global.playerTwoHealth);
			instance_create_v((room_width/2), (room_height/2)+32, "InstanceDepthStart", objPlayer, 2, PlayerClass.Wolf, global.playerThreeHealth);
		}
	break;
}