gpu_set_blendenable(false);
application_surface_draw_enable(false);
gpu_set_blendenable(true);

view_enabled=true;
view_visible[0]=true;

set_cam_res();

//test
show_debug_message("Camera Initialised " + room_get_name(room) + " !!!");
show_debug_message("Camera ID = " + string(view_camera[0]));
show_debug_message("Camera Enabled = " + string(view_enabled));
show_debug_message("Camera Visible = " + string(view_visible[0]));
show_debug_message("Camera Width = " + string(camera_get_view_width(view_camera[0])));
show_debug_message("Camera Height = " + string(camera_get_view_height(view_camera[0])));
show_debug_message("GUI Width = " + string(display_get_gui_width()));
show_debug_message("GUI Height = " + string(display_get_gui_height()));
show_debug_message("Port Width = " + string(view_wport[0]));
show_debug_message("Port Height = " + string(view_hport[0]));
show_debug_message(" ");
