///@function depth_init()
///@description Initializes depth grids for hash-based depth ordering
// Depth ordering design by @MirthCastle
if (layer_exists("InstanceDepthStart") && layer_exists("InstanceDepthEnd"))
{
	global.depthGrid = ds_grid_create(1, global.depthGridH);
	for(var i=0; i<global.depthGridH; i++) { global.depthGrid[# 0, i] = layer_create(layer_get_depth("InstanceDepthStart") - i); }
}
else { debug_log("[WARNING] Depth: Trying to initialize depth grid in room without proper layer structure at"); }