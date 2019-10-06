///@description Enemy damage
if (scrStop()) { exit; }
if (other.myPar != self && hitStun == 0) {
	takeDamage = 0;
	takeKnockback = other.myKnockback;
	knockbackDirection = point_direction(other.x, other.y, x, y);
	event_perform(ev_other, ev_user0);
}