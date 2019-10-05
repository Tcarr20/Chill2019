///@description Draw tiles
//Background
draw_sprite(sprMapBack, 0, get_camera_l(), get_camera_t());
//Draw tiles
for(var i=0; i<gridW; i++) {
	for(var j=0; j<gridH; j++) {
		if (roomGrid[i, j] != -1) {
			//Draw the moving piece
			if (movingPiece) { draw_sprite(sprMapTile, 0, myPos[X], myPos[Y]); }
			draw_sprite(sprMapTile, 0, tileColX[i], tileRowY[j]);
		}
	}
}