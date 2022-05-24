if (hit==false)
{
	state=states.damage;
	dir=-dir;
	spd=dir*knockback_spd;
	hit=true;
	score+=10;
}

//instance_destroy(other);
