x=room_width/2;
y=room_height/2;

show_debug_message("pos: "+string(x)+" "+string(y));

op_space=128;
//move_arrows=0;
carousel_x=-192;

pos=0;
op_length=4;

option = array_create(op_length);

option[0]="Start Game";
option[1]="Hiscores";
option[2]="Options";
option[3]="Help";
option[4]="Quit";

op_length = array_length(option);

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);

back_layer = layer_get_id("Background");
layer_hspeed(back_layer, fps_dependant(-0.5));
