/// scr_loadMovementByType(str_type);

// argument0 - movement type to play (if there are more of the same type, plays first one)
var str_movementType = argument0;

// Load movement start
for(i = 0; i < int_movements; i++) {
    map_movement = list_movements[| i];
    if (map_movement[? "type"] == argument0) {
        int_nextPos = map_movement[? "timeStart"];
        show_debug_message("scr_loadMovementbyType 11: Set nextPos to new movement time = " + string(int_nextPos));
    }
}

if (abs(int_nextPos - int_trackPos) > 0.5) { 
    show_debug_message("scr_loadMovementbyType 13: Set trackPos and track position to nextPos = " + string(int_nextPos));
    audio_sound_set_track_position(int_audio, int_nextPos);
    int_trackPos = int_nextPos;
}
bool_needsToJump = false;
bool_recalculateMov = false;
