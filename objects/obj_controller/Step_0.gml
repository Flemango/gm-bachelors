

if (room==room_game)
{
	var target = obj_char;
	var target_x = target.x-camera_get_view_width(view_camera[0])*.6;
	
	var camx = lerp(camera_get_view_x(view_camera[0]), target_x, .1);
	camx = clamp(camx, 0, room_width-camera_get_view_width(view_camera[0]));
	camera_set_view_pos(view_camera[0], camx, cam_y);
	
	if (keyboard_check_pressed(vk_escape))
		global.pause=!global.pause;
		
	var up=(keyboard_check_pressed(vk_up));
	var down=(keyboard_check_pressed(vk_down));
	var vmove = down - up;
	
	if (vmove!=0) 
		pause_pos+=vmove;
		
	pause_pos=clamp(pause_pos, 0, 1);
	
	if (keyboard_check_pressed(vk_enter))
	{
		if(pause_pos)
		{
			global.pause=false;
			room_goto(room_menu);
		}
		else
			global.pause=false;
	}
}

