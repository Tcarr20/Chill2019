///@description Draw self
//Draw shadow
if (myState != PlayerState.Fall) { draw_sprite_ext(mask_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5); }
//Draw body
image_alpha = (hitStun > 0)? 0.5 : 1;
draw_self();
//Draw head
	 if (headIdleSprites[myFace] != -1 && myState == PlayerState.Idle) { draw_sprite_ext(headIdleSprites[myFace], image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }
else if (headMoveSprites[myFace] != -1 && myState == PlayerState.Move) { draw_sprite_ext(headMoveSprites[myFace], image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }
else if (headAttackSprites[myFace] != -1 && (myState == PlayerState.Attack1 || myState == PlayerState.Attack2)) { draw_sprite_ext(headAttackSprites[myFace], image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }
else if (headHurtSprites[myFace] != -1 && (myState == PlayerState.Hurt || myState == PlayerState.Fall)) { draw_sprite_ext(headHurtSprites[myFace], image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }