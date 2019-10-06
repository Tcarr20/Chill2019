///@description Become Wolf
instance_destroy(other);
myClass = PlayerClass.Wolf;
switch(myID) {
	case 0: global.playerOneHealth = myClass; break;
	case 1: global.playerTwoHealth = myClass; break;
	case 2: global.playerThreeHealth = myClass; break;
}
maxHealth = 4;
myHealth = 4;