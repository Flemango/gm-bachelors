draw_self();

draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
draw_set_color(c_white);
//

draw_sprite(spr_healthbar_bg, 0, hp_x, hp_y);
draw_sprite_stretched(spr_healthbar, 0, hp_x, hp_y, (hp/max_hp)*hp_width, hp_height);
draw_sprite(spr_healthbar_border, 0, hp_x-2, hp_y);
