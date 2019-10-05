///@function string_longest(array[])
///@description Return the pixel width of the widest member of the array
///@param array[]
var _len = 0;
for(var i=0; i<array_length_1d(argument0); i++) { _len = max(_len, string_width_formatted(argument0[i])); }
return _len;