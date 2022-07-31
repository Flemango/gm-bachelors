draw_set_font(f_main);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_sprite_stretched(winieta, 0, 0, 0, room_width, room_height);

for (var i=0; i<op_length; i++)
{
	draw_set_color(c_white);
	
	if (i==pos) draw_set_color(c_teal);
	draw_text(x+i*op_space-pos*op_space, y, option[i]);
}

//strzalki
draw_sprite_ext(spr_arrow,0,x-arrow_space,y, -1, 1, 0, c_white, 1);
draw_sprite_ext(spr_arrow,0,x+arrow_space,y , 1, 1, 0, c_white, 1);

draw_set_font(f_small);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_sprite(spr_kickstarter, 0, carousel_x-12, base_h-8)
draw_text(carousel_x, base_h-2, "Click F1 to check out our kickstarter!");
