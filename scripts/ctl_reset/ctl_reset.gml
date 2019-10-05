///@function ctl_reset(index, [duration])
///@description Start the given timeline again, with an optional new duration
///@param index
///@param [duration]
// Custom timeline system by YellowAfterlife
var ind = argument[0];
var dur = (argument_count > 1)? argument[1] : ctl_end_time[ind];
ctl_time[ind] = 0;
ctl_end_time[ind] = dur;