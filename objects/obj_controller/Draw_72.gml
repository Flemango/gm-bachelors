#region //lighting

if (room==room_game)
{
	if (surface_exists(light_surf))
	{
		surface_set_target(light_surf);
		//draw_clear_alpha(c_black, 1);
		draw_sprite_ext(winieta, 0, cam_x, 0, 2, 2, 0, c_black, 0.9);
		
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(spr_b_light, 0, obj_char.x, obj_char.y, 2, 2, 0, c_white, 1);
			
			//torches
		draw_sprite_ext(spr_b_light, 0, 264, 153, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_b_light, 0, 391, 153, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_b_light, 0, 906, 153, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_b_light, 0, 1031, 153, 2, 2, 0, c_white, 1);
		
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
		draw_surface_ext(light_surf, 0, 0, 1, 1, 0, c_white, 1);
	}
	else light_surf = surface_create(room_width, room_height);
}

#endregion
