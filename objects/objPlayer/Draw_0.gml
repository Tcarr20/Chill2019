///@description Draw self
//Draw shadow
if (!(myClass == PlayerClass.Vamp && myState == ActorState.Attack2) && myState != ActorState.Fall) { 
	draw_sprite_ext(mask_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5); 
}

//Draw body
/*
if (myClass == PlayerClass.Vamp && myState == ActorState.Attack2) {
	draw_set_color(c_red);
	shader_set_uniform_f(u_fPixelW, texelW);	
	shader_set_uniform_f(u_fPixelH, texelH);	
	shader_set(shdOutline);
}*/
image_alpha = (hitStun > 0)? 0.5 : 1
image_blend = (moveSlow > 0)? c_yellow : c_white;
draw_self();

//Draw head
var _spr = undefined;
if (myClass == PlayerClass.Jack) {
	if (myState == ActorState.Idle || myState == ActorState.Hurt || myState == ActorState.Fall) {
		switch(myFace) {
			case Face.Left: _spr = sprJackIdleL; break;
			case Face.Right: _spr = sprJackIdleR; break;
			case Face.Up: _spr = sprJackIdleU; break;
			case Face.Down: _spr = sprJackIdleD; break;
		}
	}
	else if (myState == ActorState.Move) {
		switch(myFace) {
			case Face.Left: _spr = sprJackMoveL; break;
			case Face.Right: _spr = sprJackMoveR; break;
			case Face.Up: _spr = sprJackMoveU; break;
			case Face.Down: _spr = sprJackMoveD; break;
		}
	}
	else if (myState == ActorState.Attack) {
		if (attackComboLevel == 1) {
			switch(myFace) {
				case Face.Left: _spr = sprJackSlashL; break;
				case Face.Right: _spr = sprJackSlashR; break;
				case Face.Up: _spr = sprJackSlashU; break;
				case Face.Down: _spr = sprJackSlashD; break;
			}
		}
		else if (attackComboLevel == 2) {
			switch(myFace) {
				case Face.Left: _spr = sprJackSlash2L; break;
				case Face.Right: _spr = sprJackSlash2R; break;
				case Face.Up: _spr = sprJackSlash2U; break;
				case Face.Down: _spr = sprJackSlash2D; break;
			}
		}
	}
	else if (myState == ActorState.Attack2) {
		switch(myFace) {
			case Face.Left: _spr = sprJackBashL; break;
			case Face.Right: _spr = sprJackBashR; break;
			case Face.Up: _spr = sprJackBashU; break;
			case Face.Down: _spr = sprJackBashD; break;
		}
	}
}
else if (myClass == PlayerClass.Vamp) {
	if (myState == ActorState.Idle || myState == ActorState.Hurt || myState == ActorState.Fall || myState == ActorState.Attack2) {
		switch(myFace) {
			case Face.Left: _spr = sprVampIdleL; break;
			case Face.Right: _spr = sprVampIdleR; break;
			case Face.Up: _spr = sprVampIdleU; break;
			case Face.Down: _spr = sprVampIdleD; break;
		}
	}
	else if (myState == ActorState.Move) {
		switch(myFace) {
			case Face.Left: _spr = sprVampMoveL; break;
			case Face.Right: _spr = sprVampMoveR; break;
			case Face.Up: _spr = sprVampMoveU; break;
			case Face.Down: _spr = sprVampMoveD; break;
		}
	}
	else if (myState == ActorState.Attack) {
		switch(myFace) {
			case Face.Left: _spr = sprVampBoltL; break;
			case Face.Right: _spr = sprVampBoltR; break;
			case Face.Up: _spr = sprVampBoltU; break;
			case Face.Down: _spr = sprVampBoltD; break;
		}
	}
}
else if (myClass == PlayerClass.Wolf) {
	if (myState == ActorState.Idle || myState == ActorState.Hurt || myState == ActorState.Fall) {
		switch(myFace) {
			case Face.Left: _spr = sprWolfIdleL; break;
			case Face.Right: _spr = sprWolfIdleR; break;
			case Face.Up: _spr = sprWolfIdleU; break;
			case Face.Down: _spr = sprWolfIdleD; break;
		}
	}
	else if (myState == ActorState.Move) {
		switch(myFace) {
			case Face.Left: _spr = sprWolfMoveL; break;
			case Face.Right: _spr = sprWolfMoveR; break;
			case Face.Up: _spr = sprWolfMoveU; break;
			case Face.Down: _spr = sprWolfMoveD; break;
		}
	}
	else if (myState == ActorState.Attack) {
		if (attackComboLevel == 1) {
			switch(myFace) {
				case Face.Left: _spr = sprWolfSwipeL; break;
				case Face.Right: _spr = sprWolfSwipeR; break;
				case Face.Up: _spr = sprWolfSwipeU; break;
				case Face.Down: _spr = sprWolfSwipeD; break;
			}
		}
		else if (attackComboLevel == 2) {
			switch(myFace) {
				case Face.Left: _spr = sprWolfSwipe2L; break;
				case Face.Right: _spr = sprWolfSwipe2R; break;
				case Face.Up: _spr = sprWolfSwipe2U; break;
				case Face.Down: _spr = sprWolfSwipe2D; break;
			}
		}
		else if (attackComboLevel == 3) {
			switch(myFace) {
				case Face.Left: _spr = sprWolfSwipe3L; break;
				case Face.Right: _spr = sprWolfSwipe3R; break;
				case Face.Up: _spr = sprWolfSwipe3U; break;
				case Face.Down: _spr = sprWolfSwipe3D; break;
			}
		}
	}
	else if (myState == ActorState.Attack2) {
		_spr = sprWolfHowl;
	}
}
if (_spr != undefined) {
	draw_sprite_ext(_spr, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
/*
if (myClass == PlayerClass.Vamp && myState == ActorState.Attack2) {
	draw_set_color(c_white);
	shader_reset();
}*/