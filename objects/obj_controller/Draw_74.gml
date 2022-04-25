shader_set(sdr_alphafix);
if (!window_get_fullscreen()) draw_surface_stretched(application_surface, 0, 0, view_w, view_h);
else draw_surface_stretched(application_surface, display_get_width()/2-(view_w/2), display_get_height()/2-(view_h/2), view_w, view_h);
shader_reset();


