if (show)
{
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, index, round(shake) * flip, 0, 1, 1, 0, c_white, flash_alpha)
	gpu_set_fog(false, c_white, 0, 0);
	draw_sprite_ext(sprite_index, index, round(shake) * flip, 0, 1, 1, 0, c_white, image_alpha)
}