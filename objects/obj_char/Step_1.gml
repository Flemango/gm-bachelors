if (global.pause) {
	exit;
}

cam_x=camera_get_view_x(view_camera[0]);

var target = self;
var target_x = target.x-camera_get_view_width(view_camera[0])/2;
	
var camx = lerp(cam_x, target_x, cam_speed);
camx = clamp(camx, 0, room_width-camera_get_view_width(view_camera[0]));
camera_set_view_pos(view_camera[0], camx, obj_controller.cam_y);

//anti jitter fix
var x_int;
if (state==states.idle)
{
	x += x_frac;         //Add the fraction back to your position
	x_frac = x % 1;        //Get the new fraction
	x_int = x - x_frac;    // Get the rounded position
	x = x_int;            //Use that rounded position to place your object
}
