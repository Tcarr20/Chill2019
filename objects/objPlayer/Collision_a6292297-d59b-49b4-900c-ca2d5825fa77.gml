///@description Become Jack
instance_destroy(other);
myClass = PlayerClass.Jack;
switch(myID) {
	case 0: global.playerOneHealth = myClass; break;
	case 1: global.playerTwoHealth = myClass; break;
	case 2: global.playerThreeHealth = myClass; break;
}
maxHealth = 6;
myHealth = 6;