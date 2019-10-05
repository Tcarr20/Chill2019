///@function ctl_stop(index)
///@description Stops the given custom timeline
///@param index
// Custom timeline system by YellowAfterlife
var ind = argument0;
if (ind >= 0 && ind < NUM_TIMELINES)
{
	ctl_time[ind] = -1;
	ctl_last_time[ind] = -1;
	ctl_end_time[ind] = -1;
}