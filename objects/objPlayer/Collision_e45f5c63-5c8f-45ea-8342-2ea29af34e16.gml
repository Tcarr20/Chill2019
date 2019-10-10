///@description Become Vamp
if (myClass == PlayerClass.None) {
instance_destroy(other);
myClass = PlayerClass.Vamp;
switch(myID) {
	case 0: global.playerOneClass = myClass; break;
	case 1: global.playerTwoClass = myClass; break;
	case 2: global.playerThreeClass = myClass; break;
}
maxHealth = 2;
myHealth = 2;
}