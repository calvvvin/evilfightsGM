function scr_player_normal(){

	// can you tell i mod pizza tower yet
	var move = key_right + -key_left
	image_speed = anims.punch ? 0.15 : 0.2

	if (move != 0)
	{
		image_xscale = move;
		movespeed = 6;
		if (sprite_index == spr_player_idle && !anims.punch)
			sprite_index = spr_player_walk;
	}
	else if (movespeed > 0)
	{
		movespeed -= 0.5;
	}
	
	if (movespeed == 0 && sprite_index == spr_player_walk && !anims.punch)
		sprite_index = spr_player_idle;
		
	if (key_jump && !wait)
	{
		wait = scratch_wait(0.07);
		if (!anims.punch)
			sprite_index = spr_player_jumpstart;
		anims.land = false;
	}
	else if (wait)
	{
		wait--;
		if (!wait)
		{
			if (anims.land)
			{
				var spr = sprite_index;
				if (!anims.punch)
				{
					if (key_jump)
						spr = spr_player_jumpstart;
					else if (movespeed != 0)
						spr = spr_player_walk;
					else
						spr = spr_player_idle;
				}
				
				sprite_index = spr;
				anims.land = false;
			}
			else
			{
				state = "jump";
				if (!anims.punch)
					sprite_index = spr_player_jump;
				vsp = -17;
			}
		}
	}
		
	hsp = movespeed * image_xscale;
}