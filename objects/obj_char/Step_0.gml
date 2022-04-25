
if (global.pause) {
	image_speed=0;
	exit;
}

var left=keyboard_check(vk_left);
var right=keyboard_check(vk_right);
var slide=keyboard_check_pressed(vk_down);

var attack=mouse_check_button_pressed(mb_left);

var charge=mouse_check_button(mb_right);
var release=mouse_check_button_released(mb_right);

#region //state machine

h_input=abs(right-left);

x+=xspeed;

if (state==states.idle || state==states.run)
{
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
		
	if (slide)
	{
		if (image_xscale>0) xspeed=slide_spd;
		else xspeed=-slide_spd;
		
		frc=frc_calc(1.16, slide_spd);
		show_debug_message("frc: "+string(frc));
		state_set(states.slide);
	}
	
	if (attack)
	{
		xspeed=0;
		
		switch(combo)
		{
		case 0:
			state_attack(states.basic1, mask_attack1);
			combo++;
			break;
		case 1:
			state_attack(states.basic2, mask_attack2);
			combo++;
			break;
		case 2:
			state_attack(states.basic3, mask_attack3);
			combo=0;
			break;
		}
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
			
			state_set(states.release);
		} 
		else 
			state_set(states.idle);
	}
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

#endregion
