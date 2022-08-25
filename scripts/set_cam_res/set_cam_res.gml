function set_cam_res() 
{
	view_w = global.res_w;
	view_h = global.res_h;

	window_set_size(global.res_w, global.res_h);
	camera_set_view_size(view_camera[0], base_w, base_h);

	display_set_gui_maximize();
}
