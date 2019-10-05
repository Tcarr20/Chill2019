/// @description Define global values
gml_pragma("global", "macros()");
#macro X 0
#macro Y 1
#macro GAME_SPEED 60
#macro debug:GAME_SPEED game_get_speed(gamespeed_fps)
#macro DEBUG false
#macro debug:DEBUG true
#macro mask_width sprite_get_width(mask_index)
#macro mask_height sprite_get_width(mask_index)
#macro NUM_PLAYERS 1
#macro RT2 1.4142
#macro INV_RT2 0.7071

#macro NUM_TIMELINES 4
#macro NUM_PATHS 4
#macro cpt_none -1
#macro cpt_linear 0
#macro cpt_fastmid 1
#macro cpt_fastin 2
#macro cpt_fastout 3
#macro cpt_slowmid 4

#macro ct_argument global.g_ct_argument
#macro ct_count global.g_ct_count

#macro gp_axisl_l 100
#macro gp_axisl_dl 101
#macro gp_axisl_r 102
#macro gp_axisl_dr 103
#macro gp_axisl_u 104
#macro gp_axisl_ul 105
#macro gp_axisl_d 106
#macro gp_axisl_ur 107
#macro gp_any 108
#macro gp_axis_sector_angle 55
#macro gp_axis_pre_rotation 0
#macro in_check_press 300
#macro in_check_hold 301
#macro in_check_release 302
#macro in_any 400
#macro in_up 401
#macro in_up_left 402
#macro in_left 403
#macro in_down_left 404
#macro in_down 405
#macro in_down_right 406
#macro in_right 407
#macro in_up_right 408
#macro in_a 409
#macro in_b 410
#macro in_x 411
#macro in_y 412
#macro in_start 413
#macro in_select 414
#macro in_lshoulder 415
#macro in_rshoulder 416
#macro in_ltrigger 417
#macro in_rtrigger 418
global.gp_last_input = array_create(NUM_PLAYERS, undefined);
#macro gamepad_last global.gp_last_input

#macro MAX_CHAINS 4
#macro cc_red make_color_rgb(205,39,39)
#macro cc_blue make_color_rgb(65,87,170)
#macro cc_lblue make_color_rgb(85,178,255)
#macro cc_green make_color_rgb(59,120,62)
#macro cc_gray make_color_rgb(126,134,132)
#macro tb_static 501
#macro tb_select 502
#macro tb_counter 503
#macro tb_brief 504
#macro tb_border 7
#macro tb_border_spr global.textbox_9slice_array
#macro tb_cursor_spr sprBoxRight
#macro db_exists instance_exists(objDialogueBox)
#macro db_choice global.db_select_choice
#macro db_chain_args 0
#macro db_chain_final 1
#macro db_chain_goto 2

#macro font_w 6
#macro font_h 11
#macro font_sprite sprFont

#macro op_open "{"
#macro op_close "}"
#macro op_sep ","

#macro rm_trans_fade 700
#macro rm_trans_mosaic 701

#macro om_type_display 800
#macro om_type_select 801
#macro om_type_toggle 802
#macro om_type_slider 803

enum Face {
	Right, UpRight, Up, UpLeft, Left, DownLeft, Down, DownRight,
	Total
};
enum PlayerState {
	None, 
	Idle, Hold, Move, Hurt, Attack1, Attack2, Attack3,
	Total
};
enum PlayerClass {
	None,
	Jack, Vamp, Wolf,
	Total
};