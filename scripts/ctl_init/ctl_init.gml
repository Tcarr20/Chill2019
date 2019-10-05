///@function ctl_init()
///@description Set up variables for the custom timeline system
// Custom timeline system by YellowAfterlife
for(var i=NUM_TIMELINES-1; i>=0; i--) 
{ 
	ctl_time[i] = -1;
	ctl_last_time[i] = -1;
	ctl_end_time[i] = -1;
}