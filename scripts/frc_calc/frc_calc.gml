/*
_time - czas w ktorym postac sie zatrzymuje
_speed - predkosc ktora oddzialuje na postac
*/
function frc_calc(_time, _speed) 
{
	var game_speed=game_get_speed(gamespeed_fps);
	var frames_slowdown=_time*game_speed; //ilosc klatek w ktorych postac sie zatrzymuje
	
	var nval=_speed/frames_slowdown;
	return nval;
}