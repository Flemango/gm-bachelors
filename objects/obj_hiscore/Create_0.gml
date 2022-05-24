hiscore_len=5;

name=obj_nickname.name;
enter=false;
fname="hiscore.csv";

if (file_exists(fname))//(ds_exists(hiscore_list, ds_type_grid))
{
	hiscore_list = load_csv(fname);
}
else
{
	hiscore_list = ds_grid_create(hiscore_len,2);
	
	for (var i=0; i<hiscore_len; i++)
	{
		ds_grid_add(hiscore_list, i, 0, "Empty");
		ds_grid_add(hiscore_list, i, 1, 0);
	}
}

var val;
for (var i=0; i<hiscore_len; i++)
{
	val = ds_grid_get(hiscore_list, i, 1);
	if (score>=val)
	{
		ds_grid_set(hiscore_list, i, 0, name);
		ds_grid_set(hiscore_list, i, 1, score);
		break;
	}
}
