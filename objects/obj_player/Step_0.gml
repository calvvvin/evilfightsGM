scr_collision();
scr_input_update();

var statefunc = asset_get_index($"scr_player_{string_lower(state)}");
statefunc();

if (state == "normal" || state == "jump")
{
	if (key_punch && sprite_index != spr_player_punch && !punchcooldown)
	{
		sprite_index = spr_player_punch;
		image_index = 0;
		anims.punch = true;
		alarm[0] = 8;
	}
}

if (sprite_index == spr_player_punch)
{
	image_speed = 0.2;
	if (animation_end)
	{
		sprite_index = spr_player_idle;
		punchcooldown = scratch_wait(0.4);
		anims.punch = false;
	}
}

if (punchcooldown > 0)
	punchcooldown--;