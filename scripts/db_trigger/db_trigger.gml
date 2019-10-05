///@function db_get_id(index, id)
///@description Return true if this is the first step the given Dialogue Chains id equals the given value
///@param index
var index = argument0, dbId = argument1;
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return false;
}

return (dbLatch[index] == dbId);