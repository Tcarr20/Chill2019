///@function depth_set()
///@description Set proper depth ordering of object
// Depth ordering design by @MirthCastle
if (ds_exists(global.depthGrid, ds_type_grid)) { layer = global.depthGrid[# 0, y]; }
else { debug_log("[WARNING] Depth: Attempting to modify depth grid in a room where it doesn't exist at"); }