scr_collision_init();
scr_input_update();
statemap = ds_map_create();
grav = 0.5;
movespeed = 0;
punchcooldown = 0;
scr_stateadd("normal", scr_player_normal);
scr_stateadd("jump", scr_player_jump);
state = "normal";
wait = 0;
anims = {
land : 0,	
}