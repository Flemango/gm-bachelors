draw_set_font(f_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);

draw_sprite_stretched(winieta, 0, 0, 0, room_width, room_height);

draw_text(room_width/2, room_height/2-48, "Game Over!");
draw_set_color(c_white);
draw_text(room_width/2, room_height/2-24, "Enter your name:");

draw_text(room_width/2, room_height/2+8, name+cursor);
draw_sprite(spr_confirm, pressed, room_width/2, room_height/2+48);

if (pressed) draw_set_color($191919);
else draw_set_color(c_white);
draw_text(room_width/2, room_height/2+48, "Confirm");

draw_set_color(c_white);

draw_sprite_ext(spr_enter, enter, base_w-40, base_h-40, 2, 2, 0, c_white, 1);
