if (global.pause) {
	image_speed=0;
	exit;
}

image_speed=1;



var target=obj_char;
var char_w=target.bbox_right-target.bbox_left;

var self_w=bbox_right-bbox_left;

x+=spd;

image_xscale=sign(target.x-x);

switch (state)
{
	case states.idle:
		spd=0;
		
		if (++aggro_check>=aggro_check_dur)
		{
			aggro_check=0;
	
			if (distance_to_object(target)<aggro_range)
				state_set(states.chase);
		}
	break;
	
	case states.chase:
		dir=sign(target.x-x);
		
		for (i=0; i<child_len; i++)
		{
			if (object_index==child_arr[i])
			{
				if (!place_meeting(x+self_w/4*dir,y, child_arr[i]))
					spd=dir*run_spd;
				else spd=0;
			}
		}
		
		if (distance_to_object(target) > aggro_range)
			state_set(states.idle);
			
		if (place_meeting(x,y,obj_char))
			state_set(states.prepare);
	break;
	
	case states.prepare:
		spd=0;
		
		if (alarm[0]==-1)
		{
			if (place_meeting(x,y,obj_char))
				alarm[0]=game_spd*attack_cd;
			else
				state_set(states.chase);
		}
	break;
	
	case states.attack:
		//
	break;
	
	case states.damage:
		alarm[0]=-1;
		
		if (spd==0) 
		{
			hit=false;
			state_set(states.chase);
		}
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
