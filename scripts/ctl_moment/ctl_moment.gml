///@function ctl_moment(index, position)
///@description Return if the personal timeline is at the given position
///@param index
///@param position
// Custom timeline system by YellowAfterlife
var ind = argument0, pos= argument1;
if (ind < 0 || ind >= NUM_TIMELINES) { return false; }
else { return ctl_last_time[ind] <= pos && ctl_time[ind] > pos; }