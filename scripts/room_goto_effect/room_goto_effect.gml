///@function room_goto_fade(room, [effect])
///@description Wrapper for fancy room transitions
///@param room
///@param [effect]
var rm = argument[0];
var effect = (argument_count > 1)? argument[1] : rm_trans_fade;
instance_create_v(0, 0, "InstanceControl", objRoomTransition, rm, effect);