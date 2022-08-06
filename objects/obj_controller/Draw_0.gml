var size_w, size_h;
size_w=180;
size_h=120;

cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);

#region //lighting

/*if (room=room_game)
{
	if (surface_exists(light_surf))
	{
		surface_set_target(light_surf);
		draw_clear(c_black);
		
		with (obj_char)
		{
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_s_light, 0, x, y, 3, 3, 0, c_white, 1);
			
			//gpu_set_blendmode(bm_normal);
			//draw_sprite_ext(spr_s_light, 0, x, y, 1, 1, 0, c_white, 0.7);
		}
		
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
		draw_surface_ext(light_surf, 0, 0, 1, 1, 0, c_white, dark);
	}
	else light_surf = surface_create(room_width, room_height);
}*/

#endregion

if (global.pause)
{
	draw_set_font(f_main);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_set_alpha(0.75);
	draw_sprite(spr_pausebox, 0, cam_x+base_w/2, cam_y+base_h/2);
	//draw_roundrect_ext(cam_x+base_w/2-size_w/2, cam_y+base_h/2-size_h/2, cam_x+base_w/2+size_w/2, cam_y+base_h/2+size_h/2, 48, 48, 0);
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	draw_text(cam_x+base_w/2-48, cam_y+base_h/2-24, "Resume");
	draw_text(cam_x+base_w/2-48, cam_y+base_h/2+24, "Quit to Menu");
	
	draw_sprite(spr_arrow, 0, cam_x+base_w/2-64, cam_y+base_h/2-24+(48*pause_pos));
	
	if (keyboard_check_pressed(vk_anykey)) 
	{
		var effect=audio_play_sound(s_effect, 1, false);
		audio_sound_gain(effect, global.s_volume/10, 0);
	}
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
