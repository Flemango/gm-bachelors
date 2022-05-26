xspeed=0;
//y=room_height/2-(sprite_height/2);

max_x=fps_dependant(1.6); //2
x_frac=max_x % 1;
charge_spd=fps_dependant(10); //10
slide_spd=fps_dependant(5.6); //7
knockback=fps_dependant(2);
cam_speed=fps_dependant(0.05);

frc=frc_calc(.07,max_x); //friciton 0.083 //.07

scale=1;
image_xscale=scale;
image_yscale=scale;

combo=0;
hit=false; //check if already damaged to avoid double dmg

max_hp=100;
hp=max_hp;
display_hp=hp;

hp_width=128;
hp_height=16;
hp_x=camera_get_view_x(view_camera[0])+16;
hp_y=base_h-(16+hp_height);

states = {
	idle: new State(spr_idle),
	run: new State(spr_run),
	slide: new State(spr_slide),
	charge: new State(spr_charge),
	release: new State(spr_release),
	explosion: new State(spr_explosion),
	
	basic1: new State(spr_attack1),
	basic2: new State(spr_attack2),
	basic3: new State(spr_attack3),
	
	damage: new State(spr_dmg)
	//explosion: new State(),
}

states.release.StateOnEnd(states.idle);
states.explosion.StateOnEnd(states.idle);
states.slide.StateOnEnd(states.idle);

states.basic1.StateOnEnd(states.idle);
states.basic2.StateOnEnd(states.idle);
states.basic3.StateOnEnd(states.idle);

states.damage.StateOnEnd(states.idle);

state = states.idle;

#region //keys

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("S"), vk_down);

#endregion

show_debug_message("frc: "+string(frc));
show_debug_message("max_x: "+string(max_x));

//view_camera[0] = camera_create_view(0,0,1366,1024);
