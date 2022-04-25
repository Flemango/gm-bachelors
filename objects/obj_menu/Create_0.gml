x=room_width/2;
y=room_height/2;

show_debug_message("pos: "+string(x)+" "+string(y));

op_space=128;

pos=0;

option[0]="Start Game";
option[1]="Options";
option[2]="Quit";

op_length = array_length(option);

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
