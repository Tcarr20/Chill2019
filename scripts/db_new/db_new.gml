///@function db_new([start_id])
///@description Create a new Dialogue Chain & return its index
///@param [start_id]
for(var i=0; i<MAX_CHAINS; i++)
{
	if (dbChainEntries[i] == -1)
	{
		dbCurrentId = (argument_count > 0)? argument[0] : 0;
		return i;
	}
}

//If no more chain slots are available, return error
debug_popup("[WARNING] No more Dialogue Chain slots available at");
return -1;