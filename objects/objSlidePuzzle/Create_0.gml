///@description Initialize values
cpt_init();
myPath = -1;
myPos = [0, 0];
movingPiece = false;
pieceValue = -1;
moveDir = Face.Down;
gridW = 3;
gridH = 3;
gridSpace = [0, 0];
for(var i=0; i<gridW; i++) {
	for(var j=0; j<gridH; j++) {
		roomGrid[i, j] = -1;
		tileColX[i] = 0;
		tileRowY[j] = 0;
	}
}
tileColX[0] = 88; tileColX[1] = 288; tileColX[2] = 488; 
tileRowY[0] = 88; tileRowY[1] = 288; tileRowY[2] = 488; 

//Initial layout
roomGrid[0, 0] = 1; roomGrid[1, 0] = 1; roomGrid[2, 0] = 1; 
roomGrid[0, 1] = 1; roomGrid[1, 1] = 1; roomGrid[2, 1] = 1; 
roomGrid[0, 2] = -1; roomGrid[1, 2] = 1; roomGrid[2, 2] = 1;
gridSpace = [0, 2];