x=room_width/2;
y=room_height/2-room_height/8;

arrow_space=64;

pos=0;
column=0;
col_select=false;

res_pos=1;
fps_pos=1;
checked=false;

col1=c_teal;
col2=c_white;

//resolution options
res = [
	["640 x 360", 640, 360, 4/3],
	["1280 x 720", 1280, 720, 16/9],
	["1920 x 1080", 1920, 1080, 16/9],
	["2560 x 1440", 2560, 1440, 16/9],
	["3840 x 2160", 3840, 2160, 16/9],
]

//fps options
fps_arr = [
	["30 FPS", 30],
	["60 FPS", 60],
	["85 FPS", 85],
	["120 FPS", 120],
	["144 FPS", 144]
]

option[0][0]=res[2];
option[0][1]=fps_arr[1];
option[0][2]="Show FPS";
option[0][3]="Fullscreen";
option[0][4]="Apply";

option[1][0]="Music: "+string(global.m_volume*10)+"%";
option[1][1]="Sound: "+string(global.s_volume*10)+"%";

op_length = array_length(option[column]);
res_length = array_length(res);
fps_length = array_length(fps_arr);

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

