option[0][0]=res[res_pos][0];
option[0][1]=fps_arr[fps_pos][0];

var up=(keyboard_check_pressed(vk_up));
var down=(keyboard_check_pressed(vk_down));
var left=(keyboard_check_pressed(vk_left));
var right=(keyboard_check_pressed(vk_right));

escape=(keyboard_check(vk_escape));
enter=(keyboard_check(vk_enter));

arrow_space=64;

if ((keyboard_check(vk_left) || keyboard_check(vk_right)) && pos<2) arrow_space=68;

var vmove = down - up;
var hmove = right - left;

if (col_select)
{
	if (vmove!=0) 
	pos+=vmove;
	
	if (column==0)
	{
		if (hmove!=0)
		{
			if (pos==0) res_pos+=hmove;
			if (pos==1) fps_pos+=hmove;
		}

		if (keyboard_check_pressed(vk_enter))
		{
			switch (pos)
			{
			case 2:
				global.show_fps=!global.show_fps;
			break;
			case 3:
				checked=!checked;
			break;
			case 4:
				global.res_w=res[res_pos][1];
				global.res_h=res[res_pos][2];

				game_set_speed(fps_arr[fps_pos][1], gamespeed_fps);
				show_debug_message(string(game_get_speed(gamespeed_fps)));
				window_set_fullscreen(checked);
				set_cam_res();
				
				//test
				show_debug_message("Camera Initialised " + room_get_name(room) + " !!!");
				show_debug_message("Camera ID = " + string(view_camera[0]));
				show_debug_message("Camera Enabled = " + string(view_enabled));
				show_debug_message("Camera Visible = " + string(view_visible[0]));
				show_debug_message("Camera Width = " + string(camera_get_view_width(view_camera[0])));
				show_debug_message("Camera Height = " + string(camera_get_view_height(view_camera[0])));
				show_debug_message("Port Width = " + string(view_wport[0]));
				show_debug_message("Port Height = " + string(view_hport[0]));
				show_debug_message(" ");
				
			break;
			}
		}
	}
	
	if (column==1)
	{
		if (hmove!=0)
		{
			if (pos==0) global.m_volume+=hmove;
			if (pos==1) global.s_volume+=hmove;
			
			global.m_volume=clamp(global.m_volume, 0, 10);
			global.s_volume=clamp(global.s_volume, 0, 10);
			option[1][0]="Music: "+string(global.m_volume*10)+"%";
			option[1][1]="Sound: "+string(global.s_volume*10)+"%";
		}
	}
}
else 
{
	if (hmove!=0) 
	{
		column+=hmove;
		column=clamp(column, 0, 1);
		
		var temp;
		temp=col2;
		col2=col1;
		col1=temp;
	}
		
	op_length = array_length(option[column]);
		
	if (keyboard_check_pressed(vk_enter))
		col_select=true;
}

if (keyboard_check_released(vk_escape))
{
	if (col_select) col_select=false;
	else room_goto(room_menu);
}
	

//musi byc na koncu
pos = clamp(pos, 0, op_length-1);

res_pos = clamp(res_pos, 0, res_length-1);
fps_pos = clamp(fps_pos, 0, fps_length-1);
