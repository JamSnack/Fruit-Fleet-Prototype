/// @description Insert description here
// You can write your code in this editor
if (follow_this != noone)
{
	if (grab_timer <= 0)
		motion_add(point_direction(x, y, follow_this.x, follow_this.y), GRAPPLE_SPEED);
	else grab_timer--;
}
else grab_timer = 60;

//Collision
if (speed != 0)
{
	handle_collisions(, 0.4);
	handle_collisions(obj_ship);
}