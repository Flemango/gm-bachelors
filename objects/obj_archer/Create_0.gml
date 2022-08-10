/// @description 
// You can write your code in this editor

// Inherit the parent event
event_inherited();

states = {
	idle: new State(spr_archer_idle),
	chase: new State(spr_archer_run),
	prepare: new State(spr_archer_prepare),
	attack: new State(spr_archer_atk),
	damage: new State(spr_archer_dmg),
	die: new State(spr_archer_death)
}

state=states.idle;

atk_dmg=30;
hp=100;
attack_cd=2.4;

archer=true;
atk_range=128;
