if (global.only_check)
{
	instance_create_depth(x, y, depth, obj_hiscore);
	instance_destroy();
}

name=" ";
limit=10;
pressed=false;
cursor="|";
switch_time=room_speed;
keyboard_string = "";


audio_stop_all();
gameover_snd=audio_play_sound(s_gameover, 1, false);
audio_sound_gain(gameover_snd, global.m_volume/10, 0);

back_layer = layer_get_id("Background");
layer_hspeed(back_layer, fps_dependant(-0.5));
