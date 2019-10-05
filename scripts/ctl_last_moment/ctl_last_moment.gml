///@function ctl_last_moment(index)
///@description Return if the personal timeline is at its final position
///@param index
// Custom timeline system by YellowAfterlife
var ind = argument0;
if (ind < 0 || ind > NUM_TIMELINES) { return false; }
var pos = ctl_end_time[ind] - 1;
return ctl_last_time[ind] <= pos && ctl_time[ind] > pos;