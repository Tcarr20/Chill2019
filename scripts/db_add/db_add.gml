///@function db_add(index, id, db[], final, [goto])
///@description Add a new entry to the given Dialogue Chain
///@param index
///@param id
///@param db[]
///@param final
///@param [goto]
var index = argument[0], dbId = argument[1], dbArgs = undefined, final = argument[3];
var goto = (argument_count>4)? argument[4] : (dbId + 1);
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return false;
}

//Get db parameters
if (argument[2] != undefined) 
{
	dbArgs = array_create(12, undefined);
	array_copy(dbArgs, 0, argument[2], 0, array_length_1d(argument[2]));
}

//Allocate a map if one doesn't exist
if (dbChainEntries[index] == -1) { dbChainEntries[index] = ds_map_create(); }

//Make sure goto is in the right format
if (dbArgs[0] == tb_select && !is_array(goto))
{
	debug_log("[WARNING] Dialogue Chain entry is a tb_select, but goto values are not an array at");
	return false;
}
else if (dbArgs[0] != tb_select && is_array(goto))
{
	debug_log("[WARNING] Dialogue Chain entry is not tb_select, but goto values are an array at");
	return false;
}

//Pack the values together & add to the map
var _vals = [dbArgs, final, goto];
ds_map_add(dbChainEntries[index], dbId, _vals);
return true;