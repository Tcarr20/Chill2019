///@function db_update(index)
///@description Spawn textboxes from index if it's active
///@param index
var index = argument0;
if (index < 0 || index >= MAX_CHAINS) 
{
	debug_log("[WARNING] Invalid Dialogue Chain index at");
	return false;
}

if (dbActive[index])
{
	//See if a textbox needs to be made
	//if (!db_exists)
	if (!global.stopFlagTextbox)
	{
		var _new_box = true;
		
		//Set the new state
		if (dbStart[index]) { dbStart[index] = false; }
		else
		{
			var _vals = ds_map_find_value(dbChainEntries[index], dbCurrentId);
			var _goto = _vals[db_chain_goto];
			if (db_choice != undefined) { dbCurrentId = _goto[db_choice]; }
			else { dbCurrentId = _goto; }
			if (_vals[db_chain_final]) { _new_box = false; }
		}
		
		//Make a new one if it wasn't final
		if (_new_box && dbCurrentId != -1)
		{
			//Get the new db arguments & create the box
			_vals = ds_map_find_value(dbChainEntries[index], dbCurrentId);
			var _args = _vals[db_chain_args];
			if (_args != undefined)
			{
				db_create(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11]);
			}
			
			//Set the latch
			dbLatch[index] = dbCurrentId;
		}
		else { dbActive[index] = false; }
	}
	else { dbLatch[index] = -1; }
	
	return true;
}
else { return false; }