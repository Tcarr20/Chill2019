///@description Spike damage
if (other.myDamage > 0 && hitStun == 0) {
	takeDamage = other.myDamage;
	takeKnockback = other.myKnockback;
	knockbackDirection = point_direction(other.x, other.y, x, y);
	event_perform(ev_other, ev_user0);
}