///@function db_set_id(index, id)
///@description Set the current id of the given Dialogue Chain
///@param index
///@param id
var index = argument0, dbId = argument1;
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return false;
}

dbCurrentId[index] = dbId;
return true;