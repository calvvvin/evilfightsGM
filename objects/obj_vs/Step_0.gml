if (show)
{
	if (shake > 1)
		shake -= 0.05
	
	flash_alpha -= 0.01

	if (disappear)
		image_alpha -= 0.05;
	
	if (image_alpha <= 0)
		instance_destroy()
}