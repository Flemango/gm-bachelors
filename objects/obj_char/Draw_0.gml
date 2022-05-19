/*draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
draw_set_color(c_white);*/
//

draw_sprite(spr_healthbar_bg, 0, hp_x, hp_y);
draw_sprite_stretched(spr_healthbar, 0, hp_x, hp_y, (display_hp/max_hp)*hp_width, hp_height);
draw_sprite(spr_healthbar_border, 0, hp_x-2, hp_y);

draw_set_color(c_black);
draw_set_alpha(.75);
if (image_xscale>0) draw_ellipse(x-12,y+40,x+8,y+45,false);
else draw_ellipse(x-10,y+40,x+10,y+45,false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_self();
