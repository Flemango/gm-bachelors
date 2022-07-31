if (other.state==other.states.attack && !hit && !other.archer) {
	state_set(states.damage);
	xspeed=knockback*sign(x-other.x);
	hp-=other.atk_dmg;
} 

