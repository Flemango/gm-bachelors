///@description death

var new_obj=instance_create_depth(x,y,depth,obj_dead_dummy);
new_obj.sprite_index=sprite_index;
new_obj.image_xscale=image_xscale;
new_obj.spd=spd;

global.enemy_count--;
instance_destroy();


