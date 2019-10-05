///@function opmenu_destroy(menu)
///@description Free the menu from memory & return a null handle
///@param menu
if (ds_exists(argument0, ds_type_list)) { ds_list_destroy(argument0); }
return undefined;