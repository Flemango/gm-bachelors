cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);

if (room==room_game)
{
	#region //cam movement

	var target = obj_char;
	var target_x = target.x-camera_get_view_width(view_camera[0])*.6;
	
	var camx = lerp(cam_x, target_x, .2);
	camx = clamp(camx, 0, room_width-camera_get_view_width(view_camera[0]));
	show_debug_message(camx);
	camera_set_view_pos(view_camera[0], camx, cam_y);

	#endregion
	
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

