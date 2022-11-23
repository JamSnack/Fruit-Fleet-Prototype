/// @description Insert description here
// You can write your code in this editor
friction = 0.01;
grapple_point_x = 0;
grapple_point_y = 0;
grapple_target_point_x = 0;
grapple_target_point_y = 0;
grappling = false;
grapple_is_launching = false;
grapple_launch_length = 0;
false_angle = image_angle;
grapple_direction = 0;
fire_frame = 0;

false_xscale = 1;
false_yscale = 1;

items_grappled_count_max = 3;
items_grappled_array = array_create(items_grappled_count_max);
items_grappled_count = 0;

//TEMPORARY INIT
//surface_resize(application_surface, 1366/2, 768/2);