camera_set_view_pos(view_camera[0], room_width/2-320, camera_get_view_y(view_camera[0]));

if (!layer_exists("transition")) var lay = layer_create(-999, "transition");
var seq = layer_sequence_create(lay,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),transition_in);	
layer_sequence_xscale(seq, 2);
layer_sequence_yscale(seq, 2);
