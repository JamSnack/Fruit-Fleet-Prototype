/// @description Insert description here
// You can write your code in this editor
false_angle = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button(mb_left))
{
	//accelerate
	motion_add(false_angle, 0.25);
}

if (grappling)
{
	motion_add(point_direction(x, y, grapple_point_x, grapple_point_y), GRAPPLE_SPEED);
	grapple_launch_length = point_distance(x, y, grapple_point_x, grapple_point_y);
}

if (mouse_check_button_pressed(mb_right))
{
	if (!grapple_is_launching && !grappling && grapple_launch_length <= 4)
	{
		grapple_is_launching = true;
		grapple_direction = false_angle;
		grapple_target_point_x = mouse_x;
		grapple_target_point_y = mouse_y;
	}
	else
	{
		grappling = false;
		grapple_is_launching = false;
	}
}

if (grapple_is_launching)
{
	var grapple_speed = 30;
	var _c = collision_line(grapple_point_x, grapple_point_y, grapple_point_x + lengthdir_x(grapple_speed, grapple_direction), grapple_point_y + lengthdir_y(grapple_speed, grapple_direction), OBSTA, true, true);
	
	if (_c != noone)
	{
		var _r = 0;
		while (collision_line(grapple_point_x, grapple_point_y, grapple_point_x + lengthdir_x(1, grapple_direction), grapple_point_y + lengthdir_y(1, grapple_direction), OBSTA, true, true) == noone)
		{
			grapple_point_x += lengthdir_x(1, grapple_direction);
			grapple_point_y += lengthdir_y(1, grapple_direction);
			_r += 1;
			
			if (_r > grapple_speed)
				break;
		}
		
		grappling = true;
		grapple_is_launching = false;
	}
	else
	{
		grapple_point_x += lengthdir_x(grapple_speed, grapple_direction);
		grapple_point_y += lengthdir_y(grapple_speed, grapple_direction);		
	}
	
	//Grapple an item
	if (items_grappled_count < items_grappled_count_max-1)
	{
		var _f = collision_line(grapple_point_x, grapple_point_y, grapple_point_x + lengthdir_x(grapple_speed, grapple_direction), grapple_point_y + lengthdir_y(grapple_speed, grapple_direction), GRAPPLEABLE_ITEM, true, true);
		if (_f != noone && array_contains(items_grappled_array, _f) == -1)
		{	
			_f.follow_this = id;
			grappling = false;
			grapple_is_launching = false;
		
			items_grappled_array[items_grappled_count] = _f;
			items_grappled_count++;
		}
	}
}
else if (!grappling)
{
	grapple_point_x = x;
	grapple_point_y = y;
}

if (grapple_launch_length > 600)
	grapple_is_launching = false;


grapple_launch_length = point_distance(x, y, grapple_point_x, grapple_point_y);

//collision
handle_collisions();

//update view
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0])/2, y - camera_get_view_height(view_camera[0])/2);

//animation
fire_frame += speed*0.1;

if (fire_frame > 3)
	fire_frame -= 3;
	
if (abs(speed > 1) && mouse_check_button(mb_left))
{
	false_xscale = lerp(false_xscale, max(1+abs(speed)/60, 0.7), 0.5);
	false_yscale = lerp(false_yscale, max(1-abs(speed)/60, 0.7), 0.5);
}
else
{
	false_xscale = lerp(false_xscale, 1, 0.5);
	false_yscale = lerp(false_yscale, 1, 0.5);
}

//Remove a grappled item
if (items_grappled_count > 0 && mouse_check_button_released(mb_middle))
{
	items_grappled_array[items_grappled_count-1].follow_this = noone;
	items_grappled_array[items_grappled_count-1] = 0;
	items_grappled_count--;
}