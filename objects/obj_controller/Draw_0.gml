var size_w, size_h;
size_w=180;
size_h=120;

if (global.pause)
{
	draw_set_font(f_main);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_set_alpha(0.75);
	draw_roundrect_ext(cam_x+base_w/2-size_w/2, cam_y+base_h/2-size_h/2, cam_x+base_w/2+size_w/2, cam_y+base_h/2+size_h/2, 48, 48, 0);
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	draw_text(cam_x+base_w/2-48, cam_y+base_h/2-24, "Resume");
	draw_text(cam_x+base_w/2-48, cam_y+base_h/2+24, "Quit to Menu");
	
	draw_sprite(spr_arrow, 0, cam_x+base_w/2-64, cam_y+base_h/2-24+(48*pause_pos));
}

draw_set_font(f_small);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (fps<room_speed/2) draw_set_color(c_red);
else draw_set_color(c_white);

if (global.show_fps)
	draw_text(cam_x+8, cam_y+8, "FPS: "+string(fps)+"/"+string(room_speed));

draw_set_color(c_white);
draw_set_font(f_main);