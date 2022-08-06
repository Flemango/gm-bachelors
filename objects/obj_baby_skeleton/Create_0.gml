event_inherited();

states = {
	idle: new State(spr_baby_idle),
	chase: new State(spr_baby_run),
	prepare: new State(spr_baby_idle),
	attack: new State(spr_baby_atk),
	damage: new State(spr_enemy_dmg),
	die: new State(spr_enemy_dmg)
}

state=states.idle;

run_spd=fps_dependant(1.25);
attack_cd=0.1;
atk_dmg=10;
hp=50;
