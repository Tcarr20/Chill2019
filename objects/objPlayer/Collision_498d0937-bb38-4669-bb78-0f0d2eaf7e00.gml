///@description Become Wolf
if (myClass == PlayerClass.None) {
instance_destroy(other);
myClass = PlayerClass.Wolf;
switch(myID) {
	case 0: global.playerOneClass = myClass; break;
	case 1: global.playerTwoClass = myClass; break;
	case 2: global.playerThreeClass = myClass; break;
}
maxHealth = 4;
myHealth = 4;
}