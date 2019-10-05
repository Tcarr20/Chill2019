///@function ctl_stall(index)
///@description Move the given timeline back one step, so it increments to the same value next step
///@param index
// Custom timeline system by YellowAfterlife
var ind = argument0;
if (ind < 0 || ind >= NUM_TIMELINES) { return false; }
else 
{ 
	ctl_time[ind]--; 
	ctl_last_time[ind]--;
}
return true;