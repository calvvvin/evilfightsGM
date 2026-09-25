scr_collision();
scr_input_update();
scr_state(state);

if (state == "normal" || state == "jump")
{
	if (key_punch && sprite_index != spr_player_punch && !punchcooldown)
	{
		sprite_index = spr_player_punch;
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
	}
}

if (punchcooldown > 0)
	punchcooldown--