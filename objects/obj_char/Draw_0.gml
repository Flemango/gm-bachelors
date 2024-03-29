if (state!=states.death)
{
	draw_set_color(c_black);
	draw_set_alpha(.75);
	if (image_xscale>0) draw_ellipse(x-12,y+40,x+8,y+45,false);
	else draw_ellipse(x-10,y+40,x+10,y+45,false);
}

draw_self();
draw_set_alpha(1);

if (room==room_game)
{
	draw_sprite(spr_healthbar_bg, 0, hp_x, hp_y);
	draw_sprite_stretched(spr_healthbar, 0, hp_x, hp_y, (display_hp/max_hp)*hp_width, hp_height);
	draw_sprite(spr_healthbar_border, 0, hp_x-2, hp_y);

	draw_sprite_ext(spr_healthbar_bg, 0, hp_x-32+base_w-hp_width, hp_y,1,1,0,c_aqua,1);
	draw_sprite_stretched(spr_chargebar, 0, hp_x-32+base_w-hp_width, hp_y, (charge_score/max_hp)*hp_width, hp_height);
	draw_sprite(spr_healthbar_border, 0, hp_x-32+base_w-(hp_width+2), hp_y);
	
	draw_set_color(c_white);
	draw_set_font(f_small);
	draw_sprite(spr_infobox, 0, hp_x-16+base_w/2+1, 0);
	draw_set_halign(fa_center);
	draw_text(hp_x-16+base_w/2+1, 8, "Wave "+string(global.wave));
	draw_text(hp_x-16+base_w/2+1, 24, "Points: "+string(score));

	draw_set_color(c_white);
	draw_set_alpha(1);
}
