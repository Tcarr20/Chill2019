///@description Draw health
//Play music
if (!audio_group_is_loaded(audiogroup_default)) {
	audio_group_load(audiogroup_default);
}

if ((!audio_is_playing(Kneels_Boar)) && (room != Title) && (room != rmBoss) && (room != rmGameOver)) {
	audio_play_sound(Kneels_Boar, 1, true);
}
else if((room == rmBoss) && !audio_is_playing(Nailsorgarde)) {
	audio_stop_all();
	audio_play_sound(Nailsorgarde, 1, true);
}

//Get players
if (instance_exists(objPlayer)) {
	var player_one = noone, player_two = noone, player_three = noone;
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

	//Draw player one health
	if (instance_exists(player_one)) {
		for(var i=0; i<(player_one.maxHealth/2); i++) {
			//Get frame
			var _frame = 0;
			var _diff = ((i+1) - (player_one.myHealth/2));
			if (_diff == 0.5) { _frame = 1; }
			else if (_diff > 0.5) { _frame = 2; }
			draw_sprite(sprHealthG, _frame, _buffer + (_spr_w * i), _buffer);
		}
	}

	//Draw player two health
	if (instance_exists(player_two)) {
		for(var i=0; i<(player_two.maxHealth/2); i++) {
			//Get frame
			var _frame = 0;
			var _diff = ((i+1) - (player_two.myHealth/2));
			if (_diff == 0.5) { _frame = 1; }
			else if (_diff > 0.5) { _frame = 2; }
			draw_sprite(sprHealthO, _frame, window_get_width() - _buffer - (_spr_w*(player_two.maxHealth/2)) + (_spr_w*i), _buffer);
		}
	}

	//Draw player three health
	if (instance_exists(player_three)) {
		for(var i=0; i<(player_three.maxHealth/2); i++) {
			//Get frame
			var _frame = 0;
			var _diff = ((i+1) - (player_three.myHealth/2));
			if (_diff == 0.5) { _frame = 1; }
			else if (_diff > 0.5) { _frame = 2; }
			draw_sprite(sprHealthR, _frame, _buffer + (_spr_w * i), window_get_height() - _spr_h - _buffer);
		}
	}
}