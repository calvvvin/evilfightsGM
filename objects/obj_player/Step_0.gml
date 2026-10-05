scr_collision();
scr_input_update();

var statefunc = asset_get_index($"scr_player_{string_lower(state)}");
statefunc();

var move = key_right + -key_left;

if (state == "normal" || state == "jump")
{
	if (key_punch && sprite_index != spr_player_punch && !punchcooldown)
	{
		sprite_index = spr_player_punch;
		image_index = 0;
		anims.punch = true;
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
		sprite_index = spr_player_idle;
		punchcooldown = scratch_wait(0.4);
		anims.punch = false;
	}
	
	hsp = (movespeed * image_xscale) + (punchmovespeed * dashpunchdir);
}

if (punchcooldown > 0)
	punchcooldown--;