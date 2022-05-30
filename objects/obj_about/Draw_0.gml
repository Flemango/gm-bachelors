draw_set_font(f_main);
draw_set_color(c_white);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_text(base_w/2, 16, "Defeat all the enemies and survive as many waves as you can!\nCan you beat the record?");

draw_set_halign(fa_left);
draw_sprite_ext(spr_wsad, 1, base_w/2-228, 86, 1, 1, 0, c_white, 1);
draw_text(base_w/2-196, 86, " - to move");

draw_sprite_ext(spr_wsad, 2, base_w/2-228, 160, 1, 1, 0, c_white, 1);
draw_text(base_w/2-196, 160, " - to slide");

draw_sprite_ext(spr_mb, 0, base_w/2+64, 86, 2, 2, 0, c_white, 1);
draw_text(base_w/2+128, 86, " - to attack");

draw_sprite_ext(spr_mb, 1, base_w/2+64, 160, 2, 2, 0, c_white, 1);
draw_text(base_w/2+128, 160, " - to charge");

draw_sprite_ext(spr_space, 0, base_w/2-228, 230, 2, 2, 0, c_white, 1);
draw_text(base_w/2-196, 234, " - to release power");

draw_sprite_ext(spr_esc, escape, base_w/2+64, 230, 2, 2, 0, c_white, 1);
draw_text(base_w/2+128, 234, " - to pause/go back");
