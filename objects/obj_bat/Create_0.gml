/*
//default values

see_range=128;
aggro_range=256;
aggro_check=false;
aggro_check_dur=5;
attack_cd=1.5;

*/

event_inherited();

states = {
	idle: new State(spr_bat),
	chase: new State(spr_bat),
	prepare: new State(spr_bat),
	attack: new State(spr_enemy_atk),
	damage: new State(spr_bat),
	die: new State(spr_bat)
}

state=states.idle;