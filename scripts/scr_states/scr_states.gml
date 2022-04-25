function State(_sprite) constructor 
{
	sprite=_sprite;
	
	endstate=undefined;
	static StateOnEnd = function(_state) {
		endstate=_state;
	}
}

function state_set(_state) constructor
{
	if (state==_state) return;
	state=_state;
	
	sprite_index=state.sprite;
	image_index=0;
	image_speed=1;
}

function state_attack(_state, _mask) : state_set(_state) constructor
{
	//state_set(_state);
	
	var _hitbox = instance_create_depth(x,y, obj_char.depth-1, obj_hitbox);
	_hitbox.sprite_index=sprite_index;
	_hitbox.mask_index=_mask;
	
	_hitbox.image_xscale=image_xscale;
	_hitbox.image_yscale=image_yscale;
}
