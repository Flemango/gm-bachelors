/// @description 
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (state!=states.die)
{
	draw_set_color(c_black);
	draw_set_alpha(.75);
	if (image_xscale>0) draw_ellipse(x-12,y+13,x+8,y+18,false);
	else draw_ellipse(x-10,y+13,x+10,y+18,false);

	draw_set_color(c_white);
	draw_set_alpha(1);
}
draw_self();

