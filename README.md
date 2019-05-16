# musicTest
Made in Gamemaker: Studio 1.4.99

Quick and dirty test of something akin to a melody changer.

Can be checked out compiled for Chrome here: 
http://game-chuck.com/alex/musicTest/

There is one room which is 900x675 in size.
It has only one object in the folder OBJECTS, "obj_musicTest".

This object has 3 events:
1. The create event initialises some variables and loads the musicTest.json (using the script from the folder SCRIPTS called scr_getFile)
2. The step event handles switching music tracks (automatically or by the user).
The user uses the keyboard LEFT and RIGHT to switch themes. (Just press right to go to theme "ONE" and start the music).
Also useful are SPACE (pausing), ENTER (jumping to a different point in music), R (restarting), and UP/DOWN (moving along the track).
The themes don't switch automatically (that would be too easy).
They also don't use fade in / fade out tricks.
They wait for the appropriate moment in the music to switch to the next theme.
Also, each theme has a bridge (meant to carry the theme from A to B) and a loop (which loops forever until a new theme is in queue).
3. The draw event which draws the black-and-white interface using a few simple draw calls.

The step event uses 2 functions found in the folder SCRIPTS (scr_loadTrack and scr_loadMovementByType)
It is meant to be used on PC but it also works on Chrome (after a bit of tweaking). Music positioning functions don't work on Firefox for some reason.

Next steps?
1) Making the JSON have real milisecond data on when it's good to switch themes.
2) Adding more themes and trying it out with more than 2 themes (probably a better GUI interface is needed).
3) Adding more features like loading movements by name or by certain other criteria (measure, tonality...)

The JSON file that explains the music logic to the program is found in the folder DATAFILES.

There is also an example.ogg in DATAFILES (used in PC version because it can read others from disk so you can write many more in the JSON).

The HTML5 versions can't read datafiles from the disk for obvious reasons, so there is a packed streamed music ogg and mp3 called snd_example which is used for HTML5.

