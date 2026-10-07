scr_collision();
scr_input_update();

//general movement code. it pains me not to use a state system

var move = key_right + -key_left;
image_speed = 0.15;

if (move != 0)
{
	image_xscale = move;
	movespeed = 6;
}
else if (movespeed > 0)
	movespeed -= 0.5;

if (grounded)
{
	if (anims.jump)
	{
		//land
		
		wait = 5;
		if (!anims.punch)
			sprite_index = spr_player_jumpstart;
		anims.jump = false;
		anims.land = true;
	}
	
	if (move != 0)
	{
		if (anims.idle && !anims.punch)
		{
			sprite_index = spr_player_walk;
			anims.idle = false;
		}
	}
	
	if (movespeed == 0 && grounded && sprite_index == spr_player_walk && !anims.punch)
	{
		anims.idle = true;
		idlewait = scratch_wait(0.07);
	}
	else if (movespeed != 0 || !grounded)
		anims.idle = false;
	
	if (anims.idle && key_down_pressed)
	{
		idlewait = scratch_wait(0.167);
	}
	
	if (anims.idle)
	{
		if (key_down)
		{
			if (idlewait-- > 0)
			{
				sprite_index = spr_player_intocrouch;
			}
			else
			{
				sprite_index = spr_player_idle;
				//show_debug_message("liar")
				idlewait = 0;
			}
		}
		else
		{
			if (idlewait-- > 0)
			{
				sprite_index = spr_player_intoidle;
			}
			else
			{
				sprite_index = spr_player_idle;
				//show_debug_message("liar")
				idlewait = 0;
			}
		}
	}
	
	if (key_jump && !wait)
	{
		// jump prep
		
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
				//landing animation
				
				var spr = sprite_index;
				if (!anims.punch)
				{
					if (key_jump)
						spr = spr_player_jumpstart;
					else if (movespeed != 0)
						spr = spr_player_walk;
					else
						anims.land = true;
				}
				
				sprite_index = spr;
				anims.land = false;
			}
			else
			{
				//jumping after jump prep
				
				if (!anims.punch)
					sprite_index = spr_player_jump;
				anims.jump = true;
				vsp = -17;
			}
		}
	}
}
else
{
	// son
	
	if (vsp > 0 && !anims.punch)
		sprite_index = spr_player_fall;
}

hsp = movespeed * image_xscale

// punching

if (true) // left true for later code
{
	if (key_punch && sprite_index != spr_player_punch && !punchcooldown)
	{
		sprite_index = spr_player_punch;
		image_index = 0;
		anims.punch = true;
		anims.idle = false;
		alarm[0] = 8;
		
		if (!grounded && move != 0)
		{
			dashpunchduration = scratch_wait(0.5);
			dashpunchdir = move;
		}
	}
}

if (sprite_index == spr_player_punch)
{
	var punchmovespeed = 0
	
	image_speed = 0.2;
	anims.punch = true;
	
	dashpunchduration--;
	
	if (dashpunchduration)
	{
		punchmovespeed = 8;
		vsp = 0;
	}
	
	if (animation_end)
	{
		punchcooldown = scratch_wait(0.4);
		anims.punch = false;
		anims.idle = true;
	}
	
	hsp = (movespeed * image_xscale) + (punchmovespeed * dashpunchdir);
}

if (punchcooldown > 0)
	punchcooldown--;