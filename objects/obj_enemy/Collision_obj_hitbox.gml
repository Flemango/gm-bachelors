if (hit==false)
{
	state=states.damage;
	dir=sign(obj_char.x-x);
	dir=-dir;
	spd=dir*knockback_spd*irandom_range(0.9, 1.1);
	hit=true;
	score+=10;
}

//instance_destroy(other);
