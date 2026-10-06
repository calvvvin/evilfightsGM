scr_collision_init();
scr_input_update();
show_debug_overlay(true);
show_debug_log(true);
grav = 0.5;
movespeed = 0;
punchcooldown = 0;
dashpunchduration = 0;
dashpunchdir = 0;
state = "normal";
wait = 0;
idlewait = 0;
anims = {
land : 0,
punch : 0,
jump : 1,
idle : 0,
}