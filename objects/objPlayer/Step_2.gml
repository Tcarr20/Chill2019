/// @description Sub-pixel movement & collision
var vxNew, vyNew;
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;
var _coll_x = x, _coll_y = y;
if (vxNew < 0) { _coll_x = bbox_left; }
else if (vxNew > 0) { _coll_x = bbox_right; }
if (vyNew < 0) { _coll_y = bbox_top; }
else if (vyNew > 0) { _coll_y = bbox_bottom; }


//Vertical movement
for(var i=abs(vyNew); i>0; i--) {
	if (!position_meeting(_coll_x, _coll_y + sign(vyNew), objSolid))
	{
		//Move vertically
		y += sign(vyNew);
		_coll_y += sign(vyNew);
	}
	else
	{
		//Slide right
		if (!position_meeting(_coll_x + (i*2), _coll_y + sign(vyNew), objSolid)) {
			x += (i*2);
			_coll_x += (i*2);
		}
		//Slide left
		else if (!position_meeting(_coll_x - (i*2), _coll_y + sign(vyNew), objSolid)) {
			x -= (i*2);
			_coll_x -= (i*2);
		}
	}
}

//Horizontal movement
for(var i=abs(vxNew); i>0; i--) {
	if (!position_meeting(_coll_x + sign(vxNew), _coll_y, objSolid))
	{
		//Move horizontally
		x += sign(vxNew);
		_coll_x += sign(vxNew);
	}
	else
	{
		//Slide down
		if (!position_meeting(_coll_x + sign(vxNew), _coll_y + ceil(i/2), objSolid)) {
			y += ceil(i/2);
			_coll_y += ceil(i/2);
		}
		//Slide up
		else if (!position_meeting(_coll_x + sign(vxNew), _coll_y - ceil(i/2), objSolid)) {
			y -= ceil(i/2);
			_coll_y -= ceil(i/2);
		}
	}
}

//Update depth
if (y >= 0 && y < room_height) { depth_set(); }