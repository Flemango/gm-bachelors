event_inherited();

states = {
	idle: new State(spr_melee_idle),
	chase: new State(spr_melee_run),
	prepare: new State(spr_melee_idle),
	attack: new State(spr_enemy_atk),
	damage: new State(spr_melee_idle),
	die: new State(spr_melee_idle)
}

state=states.idle;

atk_dmg=50;
