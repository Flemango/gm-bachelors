function save_hiscores(_grid, _grid_len, _fname)
{
	var file = file_text_open_write(working_directory+"\\"+_fname);
	
	var val1, val2;
	for (var i=0; i<_grid_len; i++)
	{
		val1 = ds_grid_get(_grid, i, 0);
		val2 = ds_grid_get(_grid, i, 1);
		file_text_write_string(file, val1+","+string(val2));
		file_text_writeln(file);
	}
}