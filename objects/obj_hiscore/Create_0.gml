hiscore_len=5;

if (instance_exists(obj_nickname)) name=obj_nickname.name;
else name="test";
enter=false;
fname="hiscores.dat";

if (file_exists(fname))
{
	hiscore_list = load_hiscores(fname, hiscore_len);
}
else
{
	hiscore_list = ds_grid_create(2, hiscore_len);
	
	for (var i=0; i<hiscore_len; i++)
	{
		ds_grid_add(hiscore_list, 0, i, "Empty");
		ds_grid_add(hiscore_list, 1, i, 0);
	}
}

var val = ds_grid_get(hiscore_list, 1, hiscore_len-1);
if (score>val)
{
	ds_grid_set(hiscore_list, 0, hiscore_len-1, name);
	ds_grid_set(hiscore_list, 1, hiscore_len-1, score);
	
	ds_grid_sort(hiscore_list, 1, false);
}

