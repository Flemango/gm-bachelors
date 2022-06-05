event_inherited();

states = {
	idle: new State(spr_melee_idle),
	chase: new State(spr_melee_run),
	prepare: new State(spr_melee_idle),
	attack: new State(spr_melee_atk),
	damage: new State(spr_melee_idle),
	die: new State(spr_melee_death)
}

state=states.idle;

atk_dmg=30;
hp=100;
