event_inherited();

states = {
	idle: new State(spr_melee_idle),
	chase: new State(spr_melee_run),
	prepare: new State(spr_melee_idle),
	attack: new State(spr_melee_atk),
	damage: new State(spr_melee_dmg),
	die: new State(spr_melee_death)
}

state=states.idle;

atk_dmg=30;
hp=100;

attack_cd=1;
