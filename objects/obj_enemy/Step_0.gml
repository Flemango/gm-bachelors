if (global.pause) {
	image_speed=0;
	exit;
}

image_speed=1;

var target=obj_char;
//var char_w=target.bbox_right-target.bbox_left;

var self_w=bbox_right-bbox_left;

x+=spd;

if (((state!=states.prepare || state!=states.attack) && archer) || (state!=states.attack && !archer))
{
	if (state!=states.die && target.x!=x) image_xscale=sign(target.x-x);
}

switch (state)
{
	case states.idle:
		hit=false;
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
		
		var index_holder=object_index;
		if (object_index==obj_dark_skeleton) index_holder=obj_skeleton; //quick fix for dark skeleton not to pass thru regular skeletons (delete if theyre not gonna be both in the game at the same time)
		for (i=0; i<child_len; i++)
		{
			if (index_holder==child_arr[i])
			{
				if (!place_meeting(x+self_w/4*dir, y, child_arr[i]))
					spd=dir*run_spd;
				else 
				{
					if collision_line(x+(self_w/2*dir), y, target.x, target.y, child_arr[i], false, true)
						spd=0;
					else spd=dir*run_spd;
				}
			}
		}
		
		if (distance_to_object(target) > aggro_range)
			state_set(states.idle);
		
		if (archer)
		{
			if (distance_to_object(target) < atk_range)
				state_set(states.prepare);
		}
		else
		{
			if (place_meeting(x, y, target))
				state_set(states.prepare);
		}
	break;
	
	case states.prepare:
		spd=0;
		mask_index=sprite_index;
		snd_played=false;
		
		if (alarm[0]==-1)
		{
			if (archer)
			{
				if (distance_to_object(target) < atk_range+16)
				{
					alarm[0]=game_spd*attack_cd;
					show_debug_message(alarm[0]);
					
					shoot_snd=audio_play_sound(s_bowshot, 2, false);
					audio_sound_gain(shoot_snd, global.s_volume/10, 0);
				}
				else
					state_set(states.chase);
			}
			else 
			{
				if (place_meeting(x,y, target))
				{
					alarm[0]=game_spd*attack_cd;
					show_debug_message(alarm[0]);
				}
				else
					state_set(states.chase);
			}
			
		}
	break;
	
	case states.attack:
		if (archer)
		{
			if (!shot)
			{
				instance_create_depth(x,y-14,depth+1, obj_arrow);
				shot=true;
			}
		} 
		else 
		{
			if (object_index==obj_skeleton || object_index==obj_dark_skeleton || object_index==obj_baby_skeleton)
			{
				if (alarm[3]==-1 && !snd_played) 
				{
					alarm[3]=game_spd*.3;
				}
				//played=true;
			}
		}
	break;
	
	case states.damage:
	//var reset=false;
		if (alarm[0]!=-1) image_index=0;
		alarm[0]=-1;
		
		if (archer) audio_stop_sound(shoot_snd);
		else {
			audio_stop_sound(atk_snd);
			snd_played=false;
		}
		if (object_index!=obj_bat && !is_playing)
		{
			var dmg_snd=audio_play_sound(s_bones, 2, false);
			audio_sound_gain(dmg_snd, global.s_volume/10, 0);
			is_playing=true;
		}
		
		for (i=0; i<child_len; i++)
		{
			if (object_index==child_arr[i])
			{
				sprite_index=object_index.state.sprite; //fixing not displaying dmg animation probably cus of looping
				var other_obj=instance_place(x+self_w/4*dir, y, child_arr[i]); //fixing stacking up against the level border
				if (other_obj && (other_obj.id.x==mask_w/2 || other_obj.id.x==room_width-mask_w/2))
					spd=0;
			}
		}
		//show_debug_message("aaaaagfdgfdgfd");
		
		if (spd==0) 
		{
			state_set(states.idle);
			is_playing=false;
		}
			
	break;
	
	case states.die:
		hit=true;
		depth=98;
		
		if (alarm[1]==-1) alarm[1]=1;
	break;
}


//friction
if (spd!=0 && (state==states.damage || state==states.die))
{
	spd+=frc*-dir;
	
	if (spd%frc!=0)
	{
		if ((dir>0 && spd<0) || (dir<0 && spd>0))
		spd=0;
	}
}

if (hp<=0)
{
	//hit=true;
	//hp=0;

	state_set(states.die);
}

if (state==states.damage)
{
	if (!hit)
	{
		score+=10;
		charge_score+=obj_char.charge_val;
		hp-=obj_char.dmg;
	}
	hit=true;
}

if (x<=mask_w/2) x=mask_w/2;
if (x>=room_width-mask_w/2) x=room_width-mask_w/2;
