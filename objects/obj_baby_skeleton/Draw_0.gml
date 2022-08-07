event_inherited();

if (state!=states.die)
{
	draw_set_color(c_black);
	draw_set_alpha(.75);
	if (image_xscale>0) draw_ellipse(x-11,y+9,x+7,y+14,false);
	else draw_ellipse(x-11,y+9,x+7,y+14,false);

	draw_set_color(c_white);
	draw_set_alpha(1);
}
draw_self();

