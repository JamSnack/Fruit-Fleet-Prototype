/// @description ITEM DEPOSITED - RESET items_grappled_array

for (var i = items_grappled_count_max-1; i > 0; i++)
{
	if (!instance_exists(items_grappled_array[i-1]) && items_grappled_array[i-1] != 0)
	{
		items_grappled_array[i-1] = 0;
		items_grappled_count--;
	}
}