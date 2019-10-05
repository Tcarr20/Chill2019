///@function db_cleanup()
///@description Clean memory allocated by Dialogue Chains
for(var i=0; i<	MAX_CHAINS; i++)
{
	if (dbChainEntries[i] != -1)
	{
		if (ds_exists(dbChainEntries[i], ds_type_map)) 
		{ 
			ds_map_destroy(dbChainEntries[i]);
			dbChainEntries[i] = -1;
		}
	}
	dbActive[i] = false;
}