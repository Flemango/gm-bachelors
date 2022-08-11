if (string_length(keyboard_string) > limit)
    keyboard_string = string_delete(keyboard_string, limit+1, 1);
name=keyboard_string;

enter=(keyboard_check(vk_enter));

if (keyboard_check_pressed(vk_anykey)) 
{
	var effect=audio_play_sound(s_effect, 1, false);
	audio_sound_gain(effect, global.s_volume/10, 0);
}

if (keyboard_check(vk_enter)) pressed=true;
else pressed=false;

if (keyboard_check_released(vk_enter))
{
	instance_create_depth(x, y, depth, obj_hiscore);
	instance_destroy(self);
}

if (alarm[0]==-1) alarm[0]=switch_time;
