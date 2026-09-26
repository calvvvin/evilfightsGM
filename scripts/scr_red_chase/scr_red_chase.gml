function scr_red_chase() {
	
	if (sign(obj_player.x - x) != 0)
		image_xscale = sign(obj_player.x - x)
	movespeed = 1 + (distance_to_object(obj_player) / 70)
	
	var point = point_direction(x, y, obj_player.x, obj_player.y)
	x += lengthdir_x(movespeed, point)
	y += lengthdir_y(movespeed, point)
}