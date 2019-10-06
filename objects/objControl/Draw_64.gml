///@description Draw health
//Get players
if (!audio_group_is_loaded(audiogroup_default))
{
	audio_group_load(audiogroup_default);
}

if ((!audio_is_playing(Kneels_Boar)) && (room != Title) && (room != rmBoss))
{
	audio_play_sound(Kneels_Boar, 1, true);
}
else if((room == rmBoss) && !audio_is_playing(Nailsorgarde))
{
	audio_stop_all();
	audio_play_sound(Nailsorgarde, 1, true);
}

var player_one, player_two, player_three;
for(var i=0; i<NUM_PLAYERS; i++) {
	var _o = instance_find(objPlayer, i);
	if (_o != noone) {
			 if (_o.myID == 0) { player_one = _o; }
		else if (_o.myID == 1) { player_two = _o; }
		else if (_o.myID == 2) { player_three = _o; }
	}
}
var _spr_w = sprite_get_width(sprHealthG);
var _spr_h = sprite_get_height(sprHealthG);
var _buffer = 16;

/*
for(i=0; i&lt;global.maxhp; i++) {
    w = i*sprite_get_width(sprHUDHeartEmpty)%(sprite_get_width(sprHUDHeartEmpty)*global.rowhp);
    h = sprite_get_height(sprHUDHeartEmpty)*floor(i/global.rowhp);
    draw_sprite(sprHUDHeartEmpty, 0, hx+104+w, hy+h);
}
m = sprite_get_number(sprHUDHeart);
for(i=0; i&lt;(global.curhp*m); i++) {
    w = (floor(i/m))*sprite_get_width(sprHUDHeart)%(sprite_get_width(sprHUDHeart)*global.rowhp);
    h = sprite_get_height(sprHUDHeart)*floor(floor(i/m)/global.rowhp);
    draw_sprite(sprHUDHeart, i%m, hx+104+w, hy+h);
}
*/

if(room != Title)
{
//Draw player one health
	for(var i=0; i<player_one.maxHealth; i++) {
		draw_sprite(sprHealthG, median(0, 1, i+1 - player_one.myHealth), _buffer + (_spr_w * floor(i/2)), _buffer);
	}
 
//Draw player two health
	for(var i=0; i<player_two.maxHealth; i++) {
		draw_sprite(sprHealthO, median(0, 1, i+1 - player_two.myHealth), window_get_width() - _buffer - (_spr_w*3) + (_spr_w * floor(i/2)), _buffer);
	}

//Draw player three health
	for(var i=0; i<player_three.maxHealth; i++) {
		draw_sprite(sprHealthR, median(0, 1, i+1 - player_three.myHealth), _buffer + (_spr_w * floor(i/2)), window_get_height() - _spr_h - _buffer);
	}
}