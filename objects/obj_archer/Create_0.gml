/// @description 
// You can write your code in this editor

// Inherit the parent event
event_inherited();

states = {
	idle: new State(spr_enemy_idle),
	chase: new State(spr_enemy_idle),
	prepare: new State(spr_enemy_idle),
	attack: new State(spr_enemy_atk),
	damage: new State(spr_enemy_dmg),
	die: new State(spr_enemy_dmg)
}

state=states.idle;

atk_dmg=30;
hp=100;
attack_cd=3;

archer=true;
atk_range=192;
