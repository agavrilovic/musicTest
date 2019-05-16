/// scr_loadMovementByType(str_type);

// argument0 - movement type to play (if there are more of the same type, plays first one)
var str_movementType = argument0;

// Load movement start
for(i = 0; i < int_movements; i++) {
    map_movement = list_movements[| i];
    if (map_movement[? "type"] == argument0) {
        int_nextPos = map_movement[? "timeStart"];
    }
}

audio_sound_set_track_position(int_audio, int_nextPos);
int_trackPos = int_nextPos
bool_needsToJump = false;
