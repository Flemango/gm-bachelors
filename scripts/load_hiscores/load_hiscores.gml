function load_hiscores(_fname, _grid_len)
{
	var file = file_text_open_read(working_directory+_fname);
	
	if (file == -1)
	{
		show_error("Error reading from a file.", false);
		exit;
	}
	
	var grid = ds_grid_create(2, _grid_len);
	
	var val1, val2;
	var i=0;
	while (!file_text_eof(file))
	{
		val1 = file_text_read_string(file);
		ds_grid_add(grid, 0, i, val1);
		file_text_readln(file);
		
		val2 = file_text_read_real(file);
		ds_grid_add(grid, 1, i, val2);
		file_text_readln(file);
		
		i++;
	}
	file_text_close(file);
	
	return grid;
}