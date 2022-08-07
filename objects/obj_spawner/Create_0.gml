/* y
bat - 174
skeleton - 204
baby skeleton - 208
*/

switch (global.wave)
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
