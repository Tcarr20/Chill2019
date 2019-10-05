///@function ctl_start(duration)
///@description Start a custom timeline running duration steps, returning the index of the timeline
///@param duration
// Custom timeline system by YellowAfterlife
for(var i=0; i<NUM_TIMELINES; i++)
{
	if (ctl_time[i] < 0)
	{
		ctl_time[i] = 0;
		ctl_end_time[i] = argument0;
		return i;
	}
}

//If no more timelines are available, return error
debug_popup("[WARNING] No more timeline slots available at");
return -1;