var target=obj_char;
var char_w=target.bbox_right-target.bbox_left;

x+=spd;

switch (state)
{
	case states.idle:
		spd=0;
		
		if (distance_to_object(target)<see_range && distance_to_object(target)>char_w/2)
			state_set(states.chase);
	break;
	
	case states.chase:
		dir=sign(target.x-x);
		spd=dir*run_spd;
		
		if (distance_to_object(target) > aggro_range)
			state_set(states.idle);
			
		if (distance_to_object(target) < char_w/3)
			state_set(states.prepare);
	break;
	
	case states.prepare:
		spd=0;
		
		if (alarm[0]==-1 && distance_to_object(target)>char_w/3)
			state_set(states.chase);
			
		alarm[0]=game_spd/2;
	break;
	
	case states.attack:
		
		
	break;
	
	case states.damage:
		if (spd==0) 
			state_set(states.chase);
	break;
}

//friction
if (spd!=0 && state==states.damage)
{
	spd+=frc*-dir;
	
	if (spd%frc!=0)
	{
		if ((dir>0 && spd<0) || (dir<0 && spd>0))
		spd=0;
	}
}
