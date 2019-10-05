///@function ctl_running(index)
///@description Checks if the given timeline is active
///@param index
// Custom timeline system by YellowAfterlife
var ind = argument0;
if (ind >= 0 && ind < NUM_TIMELINES)
{
	if (ctl_time[ind] >= 0) { return true; }
}
return false;