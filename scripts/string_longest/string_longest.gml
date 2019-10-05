///@function string_longest(array[])
///@description Return the length of the longest member of the array
///@param array[]
var _len = -1;
for(var i=0; i<array_length_1d(argument0); i++) { _len = max(_len, string_length_formatted(argument0[i])); }
return _len;