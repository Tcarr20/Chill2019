///@description Set global values
//////Game setup
global.stopFlagText = false;
global.stopFlagMenu = false;
global.stopFlagTrans = false;

global.playerOneClass = PlayerClass.None;
global.playerTwoClass = PlayerClass.None;
global.playerThreeClass = PlayerClass.None;
global.playerOneHealth = -1;
global.playerTwoHealth = -1;
global.playerThreeHealth = -1;

global.roomGridW = 3;
global.roomGridH = 3;
global.roomGridSpace = [0, 0];
for(var i=0; i<global.roomGridW; i++) {
	for(var j=0; j<global.roomGridH; j++) { global.roomGrid[i, j] = -1; }
}
//Define rooms
SlideTopRight = scrDefineMapCell(true, rmSlideTopRight, sprMapTileSlideTopRight, [false, false, false, false]);
SlidePuzzleTest = scrDefineMapCell(true, rmSlidePuzzleTest, -1, [false, false, false, false]);
SlideBotLeftRight = scrDefineMapCell(true, rmSlideBotLeftRight, -1, [false, false, false, false]);
SlideBotRight = scrDefineMapCell(true, rmSlideBotRight, -1, [false, false, false, false]);
SlideFourDir = scrDefineMapCell(true, rmSlideBotRight, -1, [false, false, false, false]);
SlidePlaceholder1 = scrDefineMapCell(true, -1, -1, [false, false, false, false]);
SlidePlaceholder2 = scrDefineMapCell(true, -1, -1, [false, false, false, false]);
SlidePlaceholder3 = scrDefineMapCell(true, -1, -1, [false, false, false, false]);

global.roomGrid[0, 0] = SlidePuzzleTest;	global.roomGrid[1, 0] = SlideBotRight;		global.roomGrid[2, 0] = SlideTopRight;
global.roomGrid[0, 1] = SlideFourDir;		global.roomGrid[1, 1] = -1;					global.roomGrid[2, 1] = SlideBotLeftRight;
global.roomGrid[0, 2] = SlidePlaceholder1;	global.roomGrid[1, 2] = SlidePlaceholder2;	global.roomGrid[2, 2] = SlidePlaceholder3;
global.roomGridSpace = [1, 1];
global.roomEnterFrom = Face.Down;

//////Control setup
//Define controller state arrays
for(var i=0; i<NUM_PLAYERS; i++) {
	global.gp_slot[i] = -1;
	global.gp_last_input[i] = undefined;
	global.gp_axis_thresh[i] = 0.15;
	global.gp_trig_thresh[i] = 0.15;
}
//Get controller device states
var _player = 0;
for(var i=gamepad_get_device_count()-1; i>=0; i--) {
	//If a gamepad is connected in slot i...
    if (gamepad_is_supported() && gamepad_is_connected(i)) {
		global.gp_slot[_player] = i;	//Save gamepad device number
		_player++;						//Get device for the next player
    }
	//Break if we have all the gamepads we need
	if (_player >= NUM_PLAYERS) { break; }
}
//Control latches
for(var i=NUM_PLAYERS-1; i>=0; i--) {
	global.c_axisl_u[i]=false;
	global.c_axisl_d[i]=false;
	global.c_axisl_l[i]=false;
	global.c_axisl_r[i]=false;
	global.c_axisl_ur[i]=false;
	global.c_axisl_ul[i]=false;
	global.c_axisl_dr[i]=false;
	global.c_axisl_dl[i]=false;
	global.c_trig_l[i]=false;
	global.c_trig_r[i]=false;
}

//////Text formatting
global.fontDraw=font_add_sprite(font_sprite, 33, false, -2);
draw_set_font(global.fontDraw);
global.upixel_w = shader_get_uniform(shdTextShadow, "pixelW");
global.upixel_h = shader_get_uniform(shdTextShadow, "pixelH");
global.upixel_c = shader_get_uniform(shdTextShadow, "pixelC");
global.texel_w = texture_get_texel_width(sprite_get_texture(font_sprite, 0));
global.texel_h = texture_get_texel_height(sprite_get_texture(font_sprite, 0));
global.frameTimer = 0;

//////Depth grid setup
global.depthGridH = 0;
global.depthGrid = 0;

//////Camera Setup
//Resolution setup
ideal_w=0;
ideal_h=768;

screen_w=display_get_width();
screen_h=display_get_height();
//Get screen ratio
ratio=(screen_w/screen_h);
//Set proper width
ideal_w=round(ideal_h*ratio);
//Pixel Perfect Scaling
if(screen_w mod ideal_w !=0) {
    var d=round(screen_w/ideal_w);
    ideal_w=screen_w/d;
}
if(screen_h mod ideal_h !=0) {
    var d=round(screen_h/ideal_h);
    ideal_h=screen_h/d;
}
//Check for odd values
if(ideal_w & 1) {ideal_w++;}
if(ideal_h & 1) {ideal_h++;}
//Set window sizes
surface_resize(application_surface, ideal_w, ideal_h);
display_set_gui_size(ideal_w, ideal_h);
window_set_size(ideal_w, ideal_h);
window_set_fullscreen(true);
//Center window
alarm[0]=1;