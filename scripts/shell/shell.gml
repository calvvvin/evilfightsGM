function meta_gamespeed ()
{
	return
	{
		arguments: ["speed"],
		description: "sets game speed",
	}
}

function sh_gamespeed (args)
{
	var val = real(args[1])
	if !is_string(val)
	{
		game_set_speed(val, gamespeed_fps)
	}
}