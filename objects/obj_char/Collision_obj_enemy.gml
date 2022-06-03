if (other.state==other.states.attack && !hit) {
	state_set(states.damage);
	xspeed=knockback*sign(x-other.x);
	hp-=other.atk_dmg;
} 

