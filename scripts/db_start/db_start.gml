///@function db_start(index)
///@description Initiate the given Dialogue Chain at its current id
///@param index
var index = argument0;
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return false;
}

dbActive[index] = true;
dbStart[index] = true;
return true;