///@description Get input
if (!movingPiece) {
	//Check for valid pieces & swap
	if (get_in(in_down, in_check_press, 0)) {
		if (global.roomGridSpace[Y] > 0) {
			//Check if the piece is unlocked
			var _map = global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]-1];
			if (!_map[? "locked"]) {
				//Create motion
				myPos = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]-1]];
				myDest = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]];
				myDest2 = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]+10];
				myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
				//Save piece value
				movingPiece = true;
				moveDir = Face.Down;
				pieceValue = global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]-1];
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]] = -1;
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]-1] = -1;
			}
		}
	}
	if (get_in(in_up, in_check_press, 0)) {
		if (global.roomGridSpace[Y] < (global.roomGridH-1)) {
			//Check if the piece is unlocked
			var _map = global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]+1];
			if (!_map[? "locked"]) {
				//Create motion
				myPos = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]+1]];
				myDest = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]];
				myDest2 = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]-10];
				myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
				//Save piece value
				movingPiece = true;
				moveDir = Face.Up;
				pieceValue = global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]+1];
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]] = -1;
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]+1] = -1;
			}
		}
	}
	if (get_in(in_left, in_check_press, 0)) {
		if (global.roomGridSpace[X] < (global.roomGridW-1)) {
			//Check if the piece is unlocked
			var _map = global.roomGrid[global.roomGridSpace[X]+1, global.roomGridSpace[Y]];
			if (!_map[? "locked"]) {
				//Create motion
				myPos = [tileColX[global.roomGridSpace[X]+1], tileRowY[global.roomGridSpace[Y]]];
				myDest = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]];
				myDest2 = [tileColX[global.roomGridSpace[X]]-10, tileRowY[global.roomGridSpace[Y]]];
				myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
				//Save piece value
				movingPiece = true;
				moveDir = Face.Left;
				pieceValue = global.roomGrid[global.roomGridSpace[X]+1, global.roomGridSpace[Y]];
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]] = -1;
				global.roomGrid[global.roomGridSpace[X]+1, global.roomGridSpace[Y]] = -1;
			}
		}
	}
	if (get_in(in_right, in_check_press, 0)) {
		if (global.roomGridSpace[X] > 0) {
			//Check if the piece is unlocked
			var _map = global.roomGrid[global.roomGridSpace[X]-1, global.roomGridSpace[Y]];
			if (!_map[? "locked"]) {
				//Create motion
				myPos = [tileColX[global.roomGridSpace[X]-1], tileRowY[global.roomGridSpace[Y]]];
				myDest = [tileColX[global.roomGridSpace[X]], tileRowY[global.roomGridSpace[Y]]];
				myDest2 = [tileColX[global.roomGridSpace[X]]+10, tileRowY[global.roomGridSpace[Y]]];
				myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
				//Save piece value
				movingPiece = true;
				moveDir = Face.Right;
				pieceValue = global.roomGrid[global.roomGridSpace[X]-1, global.roomGridSpace[Y]];
				global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]] = -1;
				global.roomGrid[global.roomGridSpace[X]-1, global.roomGridSpace[Y]] = -1;
			}
		}
	}
}
else {
	if (cpt_finished(myPath)) {
		movingPiece = false;
		global.roomGrid[global.roomGridSpace[X], global.roomGridSpace[Y]] = pieceValue;
			 if (moveDir == Face.Down) { global.roomGridSpace[Y]--; }
		else if (moveDir == Face.Up) { global.roomGridSpace[Y]++; }
		else if (moveDir == Face.Left) { global.roomGridSpace[X]++; }
		else if (moveDir == Face.Right) { global.roomGridSpace[X]--; }
		pieceValue = -1;
	}
}