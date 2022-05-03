if (hit==false)
{
	state=states.damage;
	dir=-dir;
	spd=dir*knockback_spd;
	hit=true;
}

//instance_destroy(other);
