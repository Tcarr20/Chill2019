///@description Become Vamp
instance_destroy(other);
myClass = PlayerClass.Vamp;
switch(myID) {
	case 0: global.playerOneHealth = myClass; break;
	case 1: global.playerTwoHealth = myClass; break;
	case 2: global.playerThreeHealth = myClass; break;
}
maxHealth = 2;
myHealth = 2;