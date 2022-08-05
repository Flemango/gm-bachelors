draw_set_font(f_main);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_stretched(winieta, 0, 0, 0, room_width, room_height);

draw_sprite(spr_confirm, 0, base_w/2, 48);
draw_text(base_w/2, 48, "Hiscores");

var val1, val2;
for (var i=0; i<hiscore_len; i++)
{
	val1 = ds_grid_get(hiscore_list, 0, i);
	val2 = ds_grid_get(hiscore_list, 1, i);
	draw_text(base_w/2, 96+(32*i), string(val1)+" "+string(val2)); //base_w
}

draw_sprite_ext(spr_enter, enter, base_w-40, base_h-40, 2, 2, 0, c_white, 1);
