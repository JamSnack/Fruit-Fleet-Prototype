/// @description Insert description here
// You can write your code in this editor
if (instance_exists(GRAPPLEABLE_FRUIT))
{
	var _f = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, GRAPPLEABLE_FRUIT, false, true)
	
	if (_f != noone)
	{
		with _f instance_destroy();
	}
}