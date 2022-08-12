if (global.pause) {
	image_speed=0;
	exit;
}

image_speed=1;

if (global.enemy_count<=0)
{
	image_index=1;
	
	if (place_meeting(x,y,obj_char)) 
	{
		collides=true;
		if (keyboard_check_pressed(vk_up)) 
		{
			var lay = layer_get_name("transition");
			//layer_depth(lay, depth);
			var seq = layer_sequence_create(lay,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),transition_out);
			layer_sequence_xscale(seq, 2);
			layer_sequence_yscale(seq, 2);
			if (alarm[0]==-1) alarm[0]=game_get_speed(gamespeed_fps);
		}
	}
	else 
		collides=false;
}
else 
{
	image_index=0;
}
