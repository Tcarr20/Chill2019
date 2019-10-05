///@function db_get_id(index)
///@description Get the current id of the given Dialogue Chain
///@param index
var index = argument0;
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return undefined;
}

return dbCurrentId[index];