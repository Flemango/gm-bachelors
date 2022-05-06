if (string_length(name)<10) name=keyboard_string;
else keyboard_string=name;

enter=(keyboard_check(vk_enter));

if (keyboard_check(vk_enter)) pressed=true;
else pressed=false;

if (keyboard_check_released(vk_enter))
	room_goto(room_menu);
	
if (alarm[0]==-1) alarm[0]=switch_time;
