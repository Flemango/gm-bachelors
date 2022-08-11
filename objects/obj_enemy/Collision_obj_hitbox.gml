if (!hit)
{
	state_set(states.damage);//state=states.damage;
	
	image_index=0;
	dir=sign(obj_char.x-x);
	dir=-dir;
	spd=dir*knockback_spd*irandom_range(0.5, 1.5);
	
	show_debug_message("HP: "+string(hp));
	show_debug_message("Score: "+string(score));
	show_debug_message("hit: "+string(hit));
}

//instance_destroy(other);
