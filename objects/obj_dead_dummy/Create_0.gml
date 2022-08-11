spd=0;
dir=0;

knockback_spd=fps_dependant(10);
run_spd=fps_dependant(1);
frc=frc_calc(.066, run_spd);

dir=sign(obj_char.x-x);
dir=-dir;
spd=dir*knockback_spd*irandom_range(0.5, 1.5);

mask_w=bbox_right+1-bbox_left;
