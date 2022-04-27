spd=0;
dir=0;

run_spd=fps_dependant(1);
knockback_spd=fps_dependant(10);
frc=frc_calc(.066,run_spd);

see_range=128;
aggro_range=256;

game_spd=game_get_speed(gamespeed_fps);

states = {
	idle: new State(spr_bat),
	chase: new State(spr_bat_chase),
	prepare: new State(spr_bat_prep),
	attack: new State(spr_bat_atk),
	damage: new State(spr_bat_dmg),
	die: new State(spr_bat)
}

states.chase.StateOnEnd(states.idle);
states.attack.StateOnEnd(states.prepare);
states.damage.StateOnEnd(states.idle);

state=states.idle;
