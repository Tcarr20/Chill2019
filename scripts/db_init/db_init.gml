///@function db_init()
///@description Initialize the Dialogue Chain system
for(var i=MAX_CHAINS-1; i>=0; i--)
{
	dbCurrentId[i] = -1;
	dbChainEntries[i] = -1;
	dbActive[i] = false;
	dbStart[i] = false;
	dbLatch[i] = -1;
}