///@function ctl_update()
///@description Advance any currently running custom timelines
// Custom timeline system by YellowAfterlife
for(var i=0; i<NUM_TIMELINES; i++)
{
	if (ctl_time[i] > -1)
	{
		if (ctl_time[i] >= ctl_end_time[i]) { ctl_time[i] = -1; }
		else
		{
			ctl_last_time[i] = ctl_time[i];
			ctl_time[i]++;
		}
	}
}