function scr_stateadd(_string, _function){
	return ds_map_add(statemap, _string, _function)
}

function scr_state(_string){
	var scr = ds_map_find_value(statemap, _string);
	scr();
}