///@description Get input
if (!movingPiece) {
	//Check for valid pieces & swap
	if (get_in(in_down, in_check_press, 0)) {
		if (gridSpace[Y] > 0) {
			//Create motion
			myPos = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]-1]];
			myDest = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]];
			myDest2 = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]+10];
			myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
			//Save piece value
			movingPiece = true;
			moveDir = Face.Down;
			pieceValue = roomGrid[gridSpace[X], gridSpace[Y]-1];
			roomGrid[gridSpace[X], gridSpace[Y]] = -1;
			roomGrid[gridSpace[X], gridSpace[Y]-1] = -1;
		}
	}
	if (get_in(in_up, in_check_press, 0)) {
		if (gridSpace[Y] < (gridH-1)) {
			//Create motion
			myPos = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]+1]];
			myDest = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]];
			myDest2 = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]-10];
			myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
			//Save piece value
			movingPiece = true;
			moveDir = Face.Up;
			pieceValue = roomGrid[gridSpace[X], gridSpace[Y]+1];
			roomGrid[gridSpace[X], gridSpace[Y]] = -1;
			roomGrid[gridSpace[X], gridSpace[Y]+1] = -1;
		}
	}
	if (get_in(in_left, in_check_press, 0)) {
		if (gridSpace[X] < (gridW-1)) {
			//Create motion
			myPos = [tileColX[gridSpace[X]+1], tileRowY[gridSpace[Y]]];
			myDest = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]];
			myDest2 = [tileColX[gridSpace[X]]-10, tileRowY[gridSpace[Y]]];
			myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
			//Save piece value
			movingPiece = true;
			moveDir = Face.Left;
			pieceValue = roomGrid[gridSpace[X]+1, gridSpace[Y]];
			roomGrid[gridSpace[X], gridSpace[Y]] = -1;
			roomGrid[gridSpace[X]+1, gridSpace[Y]] = -1;
		}
	}
	if (get_in(in_right, in_check_press, 0)) {
		if (gridSpace[X] > 0) {
			//Create motion
			myPos = [tileColX[gridSpace[X]-1], tileRowY[gridSpace[Y]]];
			myDest = [tileColX[gridSpace[X]], tileRowY[gridSpace[Y]]];
			myDest2 = [tileColX[gridSpace[X]]+10, tileRowY[gridSpace[Y]]];
			myPath = cpt_begin(myPos, cpt_fastout, 4, 12, myDest2, myDest);
			//Save piece value
			movingPiece = true;
			moveDir = Face.Right;
			pieceValue = roomGrid[gridSpace[X]-1, gridSpace[Y]];
			roomGrid[gridSpace[X], gridSpace[Y]] = -1;
			roomGrid[gridSpace[X]-1, gridSpace[Y]] = -1;
		}
	}
}
else {
	if (cpt_finished(myPath)) {
		movingPiece = false;
		roomGrid[gridSpace[X], gridSpace[Y]] = pieceValue;
			 if (moveDir == Face.Down) { gridSpace[Y]--; }
		else if (moveDir == Face.Up) { gridSpace[Y]++; }
		else if (moveDir == Face.Left) { gridSpace[X]++; }
		else if (moveDir == Face.Right) { gridSpace[X]--; }
		pieceValue = -1;
	}
}