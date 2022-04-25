var op_space=32;
var xscale=1;
var color=c_grey;

draw_set_font(f_main);
draw_set_valign(fa_center);

draw_set_color(col1);
draw_set_halign(fa_right);
draw_text(x-op_space, op_space, "Screen"); //0

draw_set_color(col2);
draw_set_halign(fa_left);
draw_text(x+op_space, op_space, "Sound"); //1

draw_sprite_ext(spr_esc, escape, 8, base_h-40, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_enter, enter, base_w-40, base_h-40, 2, 2, 0, c_white, 1);

if (col_select)
{
	color=c_white;
	
	if (pos<2)
	{
		xscale=-xscale;
		draw_sprite_ext(spr_arrow,0,x+arrow_space, y+(op_space*pos), -xscale, 1, 0, c_white, 1);
	}
		
	//strzalka
	draw_sprite_ext(spr_arrow,0,x-arrow_space, y+(op_space*pos), xscale, 1, 0, c_white, 1);
	
	if (column==0)
	{
		draw_sprite_ext(spr_checkbox,global.show_fps,x-op_space*2, y+op_space*2, 1, 1, 0, color, 1);
		draw_sprite_ext(spr_checkbox,checked,x-op_space*2, y+op_space*3, 1, 1, 0, color, 1);
	}
}
else
{
	draw_sprite_ext(spr_arrow, 0, x-48-arrow_space, op_space, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_arrow, 0, x+40+arrow_space, op_space, 1, 1, 0, c_white, 1);
}

//displaying options
for (var i=0; i<op_length; i++)
{
	draw_set_color(color);
	
	if (i==pos && col_select) draw_set_color(c_teal);
	draw_text(x-48, y+i*op_space, option[column][i]);
}
