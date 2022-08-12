event_inherited();

states = {
	idle: new State(spr_dark_idle),
	chase: new State(spr_dark_run),
	prepare: new State(spr_dark_idle),
	attack: new State(spr_dark_atk),
	damage: new State(spr_dark_dmg),
	die: new State(spr_dark_death)
}

state=states.idle;

atk_dmg=40;
hp=150;

attack_cd=0.8;
