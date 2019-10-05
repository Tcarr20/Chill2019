/// @description Update custom paths
if (cpt_update(sizePath, myPos))
{
	drawW = myPos[X];
	drawH = myPos[Y];
} else { sizePath = -1; }
if (cpt_update(scrollPath, myPos))
{
	drawTextY = myPos[Y];
} else { scrollPath = -1; }