///@description Initialize values
cpt_init();
global.stopFlagMenu = true;
myPath = -1;
myPos = [0, 0];
movingPiece = false;
pieceValue = -1;
moveDir = Face.Down;
for(var i=0; i<global.roomGridW; i++) {
	for(var j=0; j<global.roomGridH; j++) {
		tileColX[i] = 0;
		tileRowY[j] = 0;
	}
}
tileColX[0] = 88; tileColX[1] = 288; tileColX[2] = 488; 
tileRowY[0] = 88; tileRowY[1] = 288; tileRowY[2] = 488; 