function scr_red_wave(){
	image_speed = 0.04
	image_alpha += 0.005
	if (image_alpha >= 1)
	{
		sprite_index = spr_red_normal
		state = "chase"
	}
}