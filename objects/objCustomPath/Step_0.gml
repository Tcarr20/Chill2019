/// @description Path tracking (example)
if (cpt_running(myPath)) { image_blend = c_red; }
else { image_blend = c_white; }

if (cpt_finished(myPath)) { show_message("Reached end"); }