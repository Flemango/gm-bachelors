function set_cam_res() 
{
	var scaling=0;
	while (global.res_w >= base_w*(scaling+1))
		scaling++;

	view_w = base_w*scaling;
	view_h = view_w / aspect;

	window_set_size(global.res_w, global.res_h);
	camera_set_view_size(view_camera[0], base_w, base_h);

	display_set_gui_maximize();//room size musi byc odpowiedni
	
	show_debug_message(display_get_height()/2-(view_h/2));
}