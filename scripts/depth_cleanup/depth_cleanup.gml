///@function depth_cleanup()
///@description Destroys depth grid in rooms where depth-ordering is enabled
// Depth ordering design by @MirthCastle
if (ds_exists(global.depthGrid, ds_type_grid))
{
	//debug_log("[SETUP] Destroying depth grid in room "+room_get_name(room));
	ds_grid_destroy(global.depthGrid);
	//debug_log("[SETUP] Depth grid destroyed successfully");
}