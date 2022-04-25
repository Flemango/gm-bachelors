if (keyboard_check_pressed(vk_left) && pos>0) pos--;
if (keyboard_check_pressed(vk_right) && pos<op_length-1) pos++;

arrow_space=60;
if (keyboard_check(vk_left) || keyboard_check(vk_right)) arrow_space=64;

if (keyboard_check_pressed(vk_enter))
{
	switch (pos)
	{
	case 0:
		room_goto(room_game);
		break;
	case 1:
		room_goto(room_options);
		break;
	case 2:
		game_end();
		break;
	}
}

if (keyboard_check_pressed(vk_escape))
{
	if (pos!=2) pos=2;
	else game_end();
}
	
	

