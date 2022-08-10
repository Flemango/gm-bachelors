/* y
bat - 174
skeleton - 204
baby skeleton - 208
*/
var x_spread, spread;
x_spread=192;
spread=(room_width/2-x_spread)/global.wave;

repeat(global.wave)
{
	if (global.wave%2==1)
	{
		instance_create_layer(x_spread, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2+x_spread, 174, "Instances", obj_bat);
		
	}

	
}



/*switch (global.wave)
{
	case 1:
		instance_create_layer(room_width/2-256, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2+256, 174, "Instances", obj_bat);
	break;
	
	case 2:
		instance_create_layer(room_width/2-256, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2+256, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2-224, 204, "Instances", obj_skeleton);
		instance_create_layer(room_width/2+224, 204, "Instances", obj_skeleton);
	break;
	
	case 3:
		instance_create_layer(room_width/2-256, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2+256, 174, "Instances", obj_bat);
		instance_create_layer(room_width/2-224, 204, "Instances", obj_skeleton);
		instance_create_layer(room_width/2+224, 204, "Instances", obj_skeleton);
		instance_create_layer(room_width/2-240, 208, "Instances", obj_baby_skeleton);
		instance_create_layer(room_width/2+240, 208, "Instances", obj_baby_skeleton);
	break;
}
