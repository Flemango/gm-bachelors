if (hit==false)
{
	state=states.damage;
	dir=sign(obj_char.x-x);
	dir=-dir;
	spd=dir*knockback_spd*irandom_range(0.8, 1.2);
	hit=true;
	score+=10;
	charge_score+=2.5;
}

//instance_destroy(other);
