if (room==room_game)
{
	#region //cam movement

	

	#endregion
	
	if (keyboard_check_pressed(vk_escape))
		global.pause=!global.pause;
		
	var up=(keyboard_check_pressed(vk_up));
	var down=(keyboard_check_pressed(vk_down));
	var vmove = down - up;
	
	if (vmove!=0) 
		pause_pos+=vmove;
		
	pause_pos=clamp(pause_pos, 0, 1);
	
	if (keyboard_check_pressed(vk_enter) && global.pause)
	{
		if(pause_pos)
		{
			global.pause=false;
			global.enemy_count=0;
			global.wave=1;
			score=0;

			room_goto(room_menu);
		}
		else
			global.pause=false;
	}
	
	if (global.pause) depth=-100;
	else depth=-98
	
	
}

