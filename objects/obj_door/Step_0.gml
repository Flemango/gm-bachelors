if (global.enemy_count<=0)
{
	image_index=1;
	
	if (place_meeting(x,y,obj_char)) 
	{
		collides=true;
		if (keyboard_check_pressed(vk_up)) room_restart();
	}
	else 
		collides=false;
}
else 
{
	image_index=0;
}
