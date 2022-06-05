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

function state_attack(_state, _mask, _obj) : state_set(_state) constructor
{	
	if (!instance_exists(obj_hitbox))
	{
		var _hitbox;
		if (_obj==self)
		{
			_hitbox = _obj;
			_hitbox.mask_index=_mask;
		}
		else
		{
			_hitbox = instance_create_depth(x,y, obj_char.depth-1, obj_hitbox);
			_hitbox.sprite_index=_mask;
		}
		
		_hitbox.image_xscale=image_xscale;
		_hitbox.image_yscale=image_yscale;
	}
}
