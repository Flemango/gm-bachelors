function fps_dependant(_val) 
{
	var game_speed=game_get_speed(gamespeed_fps);
	var delta = 60 / game_speed; //var delta = (144 / 1000000) * delta_time;
	
	var nval = _val * delta;
	return nval;
}