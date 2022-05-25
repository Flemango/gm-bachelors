function save_hiscores(_grid, _grid_len, _fname)
{
	var file = file_text_open_write(working_directory+_fname);
	
	if (file == -1)
	{
		show_error("Error writing a file.", false);
		exit;
	}
	
	var val1, val2;
	for (var i=0; i<_grid_len; i++)
	{
		val1 = ds_grid_get(_grid, 0, i);
		val2 = ds_grid_get(_grid, 1, i);
		
		file_text_write_string(file, val1);
		file_text_writeln(file);
		
		file_text_write_real(file, val2);
		file_text_writeln(file);
	}
	file_text_close(file);
}