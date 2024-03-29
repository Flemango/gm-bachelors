/* y
bat - 174
skeleton - 204
baby skeleton - 208
*/
var spawn_radius, spread, i, j;

i=0;
j=0;
spawn_radius=128;
spread=(room_width/2-spawn_radius)/global.wave;
show_debug_message("init_spread: "+string(spread));

repeat(global.wave)
{
	switch (i)
	{
		case 0:
			instance_create_layer(room_width/2-(spawn_radius+spread*j), 174, "Instances", obj_bat);
			instance_create_layer(room_width/2+(spawn_radius+spread*j), 174, "Instances", obj_bat);
		break;
		
		case 1:
		case 3:
			if (global.wave<8)
			{
				if (global.wave>3) instance_create_layer(room_width/2-(spawn_radius+spread*j), 204, "Instances", obj_skeleton);
				instance_create_layer(room_width/2+(spawn_radius+spread*j), 204, "Instances", obj_skeleton);
			} 
			else
			{
				instance_create_layer(room_width/2-(spawn_radius+spread*j), 204, "Instances", obj_dark_skeleton);
				instance_create_layer(room_width/2+(spawn_radius+spread*j), 204, "Instances", obj_dark_skeleton);
			}
		break;
		
		case 2:
			instance_create_layer(room_width/2-(spawn_radius+spread*j), 204, "Instances", obj_archer);
			if (global.wave>4) instance_create_layer(room_width/2+(spawn_radius+spread*j), 204, "Instances", obj_archer);
		break;

		case 4:
			if (global.wave>5)instance_create_layer(room_width/2-(spawn_radius+spread*j), 208, "Instances", obj_baby_skeleton);
			instance_create_layer(room_width/2+(spawn_radius+spread*j), 208, "Instances", obj_baby_skeleton);
		break;
	}
	
	i++;
	if (i>4) i=0;
	j++;
}

