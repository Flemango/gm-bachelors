if (global.pause) {
	image_speed=0;
	exit;
}

image_speed=1;

hp_x=camera_get_view_x(view_camera[0])+16;
var gamespd=game_get_speed(gamespeed_fps);

var left=keyboard_check(vk_left);
var right=keyboard_check(vk_right);
var slide=keyboard_check_pressed(vk_down);

var attack=mouse_check_button_pressed(mb_left);
var explosion=keyboard_check_pressed(vk_space);

var charge=mouse_check_button(mb_right);
var release=mouse_check_button_released(mb_right);

#region //state machine

h_input=abs(right-left);

x+=xspeed;

if (state==states.idle || state==states.run)
{
	hit=false;
	
	if (left && xspeed>-max_x)
	{
		xspeed=-max_x;
		image_xscale=-scale;
		state_set(states.run);
	}
	
	if (right && xspeed<max_x)
	{
		xspeed=max_x;
		image_xscale=scale;
		state_set(states.run);
	}
	
	if(left && right) xspeed=0;
	
	if (!h_input)
		state_set(states.idle);
		
	if (charge)
		state_set(states.charge);
		
	if (slide && can_slide)
	{
		if (image_xscale>0) xspeed=slide_spd;
		else xspeed=-slide_spd;
		
		frc=frc_calc(1.16, slide_spd);
		state_set(states.slide);
		can_slide=false;
		alarm[2]=gamespd*slide_cd;
	}
	
	if (attack)
	{
		xspeed=0;
		
		switch(combo)
		{
		case 0:
			hitbox_id=state_attack(states.basic1, mask_attack1, obj_hitbox);
			
			var atk_snd=audio_play_sound(s_swing1, 2, false);
			audio_sound_gain(atk_snd, global.s_volume/10, 0);
			
			combo++;
			alarm[0]=gamespd*1.2;
			break;
		case 1:
			hitbox_id=state_attack(states.basic2, mask_attack2, obj_hitbox);
			
			var atk_snd=audio_play_sound(s_swing2, 2, false);
			audio_sound_gain(atk_snd, global.s_volume/10, 0);
			
			combo++;
			alarm[0]=gamespd*1.2;
			break;
		case 2:
			hitbox_id=state_attack(states.basic3, mask_attack3, obj_hitbox);
			
			var atk_snd=audio_play_sound(s_swing_hit, 2, false);
			audio_sound_gain(atk_snd, global.s_volume/10, 0);
			
			combo=0;
			break;
		}
	}
	
	if (explosion && charge_score==max_hp)
	{
		hitbox_id=state_attack(states.explosion, mask_explosion, obj_hitbox);
		
		var explode_snd=audio_play_sound(s_explosion, 2, false);
		audio_sound_gain(explode_snd, global.s_volume/10, 0);
		
		xspeed=0;
		charge_score=0;
	}
}

if (state==states.charge)
{
	xspeed=0;

	if (image_index>=(image_number-1))
		image_speed=0;
		
	if (release)
	{
		if (image_speed==0)
		{
			if (image_xscale>0) xspeed=charge_spd;
			else xspeed=-charge_spd;
			
			var atk_snd=audio_play_sound(s_swing2, 2, false);
			audio_sound_gain(atk_snd, global.s_volume/10, 0);
			
			hitbox_id=state_attack(states.release, mask_release, obj_hitbox);
		} 
		else 
			state_set(states.idle);
	}
}

if (display_hp!=hp)
	display_hp--;
	
if (display_hp<=0)
{
	hit=true;
	state_set(states.death);
	xspeed=0;
	//depth=-1;
	if (alarm[1]==-1) alarm[1]=gamespd*1.5;
	
	if (image_index>=(image_number-1))
	{
		image_speed=0;
	}
}

if (state==states.damage)
{
	if (!hit)
	{
		var dmg_snd=audio_play_sound(s_ouch, 2, false);
		audio_sound_gain(dmg_snd, global.s_volume/10, 0);
	}
	hit=true;
	instance_destroy(hitbox_id);
	show_debug_message("hp: "+string(hp));
}

if (xspeed<0 && (state==states.idle  || xspeed<-max_x))
{
	xspeed+=frc;
	
	if (xspeed%frc!=0 && xspeed>0)
		xspeed=0;
}
	
if (xspeed>0 && (state==states.idle || xspeed>max_x))
{
	xspeed-=frc;
	
	if (xspeed%frc!=0 && xspeed<0)
		xspeed=0;
}

var mask_w=bbox_right+1-bbox_left;
if (x<=mask_w/2) x=mask_w/2;
if (x>=room_width-mask_w/2) x=room_width-mask_w/2;

hp=clamp(hp, 0, max_hp);
charge_score=clamp(charge_score, 0, max_hp);

if (!arrow_shown && room==room_game && global.enemy_count==0)
{
	instance_create_depth(x, base_h/3, depth, obj_helping_arrow);
	arrow_shown=true;
}

#endregion


