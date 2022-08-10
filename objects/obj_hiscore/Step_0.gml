enter=(keyboard_check(vk_enter));

if (keyboard_check_pressed(vk_enter))
{
	save_hiscores(hiscore_list, hiscore_len, fname); //ds_map_secure_save(hiscore_list, fname);
	ds_grid_destroy(hiscore_list);
    hiscore_list = -1;
	score=0;
	global.only_check=false;
    room_goto(room_menu);
}
