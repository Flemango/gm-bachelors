global.pause=false;
global.wave=1;
global.only_check=false;

global.show_fps=false;

global.m_volume=3;
global.s_volume=5;

globalvar base_w, base_h, aspect, view_w, view_h;

base_w=640; //480x270
base_h=360;
aspect=base_w/base_h;

global.res_w=1280;
global.res_h=720;

cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
pause_pos=0;

depth=-98;
//dark=.3;

light_surf = surface_create(room_width, room_height);

global.music=audio_play_sound(s_music, 1, true);
audio_sound_gain(global.music, global.m_volume/10, 0);

global.enemy_count=0;
