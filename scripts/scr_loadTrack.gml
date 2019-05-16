/// scr_loadTrack(int_trackNumber);

// argument0 - track to play, currently just an id
var int_trackNumber = argument0;

int_currentTrack = argument0;

// Load track from json as ds_map
map_selectedTrack = list_tracks[| int_trackNumber];

// Save information from ds_map for ease of access

str_trackName = map_selectedTrack[? "name"];

// Populate a list of maps, each defining one musical movement
list_movements = map_selectedTrack[? "movements"];
int_movements = ds_list_size(list_movements);

// Find starting movement?
int_movement = 0;
int_movMin = 999;
for(i = 0; i < int_movements; i++) {
    map_movement = list_movements[| i];
    int_movStart = map_movement[? "timeStart"];
    if (int_movMin > int_movStart) {
        int_movMin = int_movStart;
        int_movement = i;
    }
}

map_movement = list_movements[| int_movement];
int_nextPos = map_movement[? "timeStart"];
int_trackPos = int_nextPos;

// Load track audio
if (int_sound == -1) {
    str_track = map_selectedTrack[? "track"];
    if (browser_not_a_browser == os_browser) {
        int_sound = audio_create_stream(str_track);
    }
    else {
        int_sound = snd_example;
    }
}
else if (str_track != map_selectedTrack[? "track"]) {
    str_track = map_selectedTrack[? "track"];
    if (browser_not_a_browser == os_browser) {
        int_sound = audio_create_stream(str_track);
    }
    else {
        int_sound = snd_example;
    }
    audio_stop_all();
    int_audio = audio_play_sound(int_sound,1,1);
}
else {
    audio_sound_set_track_position(int_audio, int_nextPos);
}

// Track jump has just occured, no need to jump any more or change movement position
bool_needsToJump = false;

