spd=0;
dir=0;
hit=false;
game_spd=game_get_speed(gamespeed_fps);

run_spd=fps_dependant(1);
knockback_spd=fps_dependant(10);
frc=frc_calc(.066, run_spd);

see_range=128;

aggro_range=256;
aggro_check=false;
aggro_check_dur=fps_dependant(5);
attack_cd=1.5;
atk_dmg=1;
hp=1000;

states = {
	idle: new State(spr_enemy_idle),
	chase: new State(spr_enemy_chase),
	prepare: new State(spr_enemy_prep),
	attack: new State(spr_enemy_atk),
	damage: new State(spr_enemy_dmg),
	die: new State(spr_enemy_idle)
}

states.chase.StateOnEnd(states.idle);
states.attack.StateOnEnd(states.prepare);
states.damage.StateOnEnd(states.idle);

state=states.idle;

child_arr = [
	obj_bat,
	obj_skeleton
]

mask_w=bbox_right+1-bbox_left;

child_len = array_length(child_arr);
