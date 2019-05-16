/// scr_getFile(str_filename);
/// Open file for reading, put contents in string, return string

// argument0 - string - file name
// return - string - file contents

// Local variables
var str_file = "", int_file, str_directory = working_directory;

if (file_exists(str_directory + argument0)) {
    int_file = file_text_open_read(str_directory + argument0);
}
else if (file_exists(argument0)) {
    int_file = file_text_open_read(argument0);
}
else {
    return "";
}

// Remove comments
while (!file_text_eof(int_file)) {
    var str_line = file_text_readln(int_file);
    var int_comment = string_pos("//", str_line);
    if (int_comment != 0) {
        str_line = string_copy(str_line, 1, int_comment - 1);
    }
    str_file += str_line;
}

file_text_close(int_file);

return str_file;
