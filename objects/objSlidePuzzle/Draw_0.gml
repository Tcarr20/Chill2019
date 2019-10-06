///@description Draw tiles
//Background
draw_sprite(sprMapBack, 0, get_camera_l(), get_camera_t());
//Draw tiles
for(var i=0; i<global.roomGridW; i++) {
	for(var j=0; j<global.roomGridH; j++) {
		if (global.roomGrid[i, j] != -1) {
			//Draw the moving piece
			var _map = global.roomGrid[i, j];
			var _spr = _map[? "sprite"];
			if (_spr == -1) { _spr = sprMapTile; }
			var _img = (_map[? "locked"])? 1 : 0;
			if (movingPiece) { draw_sprite(_spr, _img, myPos[X], myPos[Y]); }
			draw_sprite(_spr, 0, tileColX[i], tileRowY[j]);
		}
	}
}