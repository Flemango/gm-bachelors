if (global.pause) {
	image_speed=0;
	exit;
}
image_speed=1;

x+=spd;

//friction
if (spd!=0)
{
	spd+=frc*-dir;
	
	if (spd%frc!=0)
	{
		if ((dir>0 && spd<0) || (dir<0 && spd>0))
		spd=0;
	}
}

if (image_index>=(image_number-1))
{
	image_speed=0;
	if (alarm[0]==-1) alarm[0]=game_get_speed(gamespeed_fps)*2;
}

if (x<=mask_w/2) x=mask_w/2;
if (x>=room_width-mask_w/2) x=room_width-mask_w/2;
