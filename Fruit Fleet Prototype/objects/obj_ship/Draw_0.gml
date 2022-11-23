/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button(mb_left))
{
	draw_sprite_ext(spr_fire, fire_frame, x - lengthdir_x(5, false_angle), y, speed/4, speed/4, false_angle, c_white, 1);	
}

//use false_angle to avoid chaning hitbox w/ image_angle
draw_sprite_ext(sprite_index, image_index, x, y, false_xscale, false_yscale, false_angle, c_white, image_alpha);

if (grapple_launch_length > 0)
{
	draw_line(x, y, grapple_point_x, grapple_point_y);
	
	draw_sprite_ext(spr_grapple, 0, grapple_point_x, grapple_point_y, 2, 2, grapple_direction, c_white, 1);
}
