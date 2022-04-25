draw_set_font(f_main);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

for (var i=0; i<op_length; i++)
{
	draw_set_color(c_white);
	
	if (i==pos) draw_set_color(c_teal);
	draw_text(x+i*op_space-pos*op_space, y, option[i]);
}

//strzalki
draw_sprite_ext(spr_arrow,0,x-arrow_space,y, -1, 1, 0, c_white, 1);
draw_sprite_ext(spr_arrow,0,x+arrow_space,y , 1, 1, 0, c_white, 1);