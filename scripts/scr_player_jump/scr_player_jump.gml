function scr_player_jump(){
	var move = key_right + -key_left
	image_speed = 0.15

	if (move != 0)
	{
		image_xscale = move;
		movespeed = 6;
	}
	else if (movespeed > 0)
	{
		movespeed -= 0.5;
	}
	
	if (vsp > 0 && !anims.punch)
		sprite_index = spr_player_fall;
	
	if (grounded)
	{
		wait = 5;
		if (!anims.punch)
			sprite_index = spr_player_jumpstart;
		anims.land = true;
		state = "normal";
	}
	
	hsp = movespeed * image_xscale
}