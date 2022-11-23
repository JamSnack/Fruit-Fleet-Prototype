// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GRAPPLE_SPEED 0.35


function handle_collisions(collide_with = OBSTA, bounce = -1)
{
	var _r = 10;

	//h collision
	if (collision_rectangle(bbox_left + hspeed, bbox_top, bbox_right + hspeed, bbox_bottom, collide_with, true, true) != noone)
	{
		var hd = sign(hspeed);
	
		x -= hspeed;
	
		while (collision_rectangle(bbox_left + hd, bbox_top, bbox_right + hd, bbox_bottom, collide_with, true, true) == noone)
		{
			x += hd;
			
			_r -= 1;
			
			if (_r <= 0)
				break;
		}
	
		if (bounce = -1)
			hspeed = -sign(round(hspeed));
		else hspeed = -hspeed*bounce;
	}

	//v collision
	_r = 10;
	
	if (collision_rectangle(bbox_left, bbox_top + vspeed, bbox_right, bbox_bottom + vspeed, collide_with, true, true) != noone)
	{
		var vd = sign(vspeed);
	
		y -= vspeed;
	
		while (collision_rectangle(bbox_left, bbox_top + vd, bbox_right, bbox_bottom + vd, collide_with, true, true) == noone)
		{
			y += vd;
			
			_r -= 1;
			
			if (_r <= 0)
				break;
		}
	
		if (bounce = -1)
			vspeed = -sign(round(vspeed));
		else vspeed = -vspeed*bounce;
	}

}


function array_contains(array, value) 
{
    var i = 0;
	var size = array_length(array);
	
    repeat(size) 
	{
        if (array[i] == value) return i;
        i++;
    }
	
    return -1;
}