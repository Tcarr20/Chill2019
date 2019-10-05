/// @description Check timeline position (example)
if (ctl_running(myTl))
{
	if (ctl_moment(myTl, 30)) { show_message("Halfway there"); }
	if (ctl_last_moment(myTl)) { show_message("Done"); }
}