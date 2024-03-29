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
SlideTopRight = scrDefineMapCell(true, rmSlideTopRight, sprMapTileSlideTopRight, [true, true, false, false]);
SlideBoss = scrDefineMapCell(true, rmBoss, sprMapTileBoss, [false, false, false, true]);
SlideFourDir = scrDefineMapCell(true, rmSlideFourDir, sprMapTileSlideAllDir, [true, true, true, true]);
SlideBotRight = scrDefineMapCell(true, rmSlideBotRight, sprMapTileSlideBotRight, [false, true, true, false]);
SlideBotLeftRight = scrDefineMapCell(true, rmSlideBotLeftRight, sprMapBotLeftRight, [false, true, true, true]);
SlideBotLeft = scrDefineMapCell(true, rmSlideBotLeft, sprMapTileSlideBotLeft, [false, false, true, true]);
SlideTopLeftRight = scrDefineMapCell(true, rmTopLeftRight, sprMapTileSlideTopLeftRight, [true, true, false, true]);
SlideTopBotLeft = scrDefineMapCell(true, rmSlideTopBotLeft, sprMapTileSlideTopBotLeft, [true, false, true, true]);

global.roomGrid[0, 0] = SlideTopRight;		global.roomGrid[1, 0] = SlideTopBotLeft;				global.roomGrid[2, 0] = SlideBoss;
global.roomGrid[0, 1] = SlideBotRight;		global.roomGrid[1, 1] = SlideBotLeftRight;				global.roomGrid[2, 1] = SlideBotLeft;
global.roomGrid[0, 2] = -1;					global.roomGrid[1, 2] = SlideFourDir;					global.roomGrid[2, 2] = SlideTopLeftRight;
global.roomGridSpace = [0, 2];
global.roomEnterFrom = Face.Down;

//////Control setup
//Define controller state arrays
for(var i=0; i<NUM_PLAYERS; i++) {
	global.gp_slot[i] = -1;
	global.gp_last_input[i] = undefined;
	global.gp_axis_thresh[i] = 0.20;
	global.gp_trig_thresh[i] = 0.15;
}
//Get controller device states
var _player = 0;
for(var i=0; i<gamepad_get_device_count(); i++) {
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
global.textbox_9slice_array = 
[sprBoxBorderTopLeft, sprBoxBorderTop, sprBoxBorderTopRight,
 sprBoxBorderMiddleLeft, sprBoxBorderMiddle, sprBoxBorderMiddleRight,
 sprBoxBorderBottomLeft, sprBoxBorderBottom, sprBoxBorderBottomRight];

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
