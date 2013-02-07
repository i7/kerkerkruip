Kerkerkruip Windows by Erik Temple begins here.

Use authorial modesty.


Chapter - UI Colors

Table of Common Color Values (continued)
glulx color value	assigned number
g-window-color	15658734
g-header-color	14540253
g-humanist-crimson	10231552


Chapter - Window definitions


Section - Windows with content

The stats-window is a text-buffer g-window spawned by the main-window. The back-colour is g-window-color. The measurement is 30. The position is g-placeright.

The stat-header-window is a text-buffer g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size. The back-colour is g-header-color.

The powers-window is a text-buffer g-window spawned by the stats-window. The back-colour is g-window-color. The measurement is 55. The position is g-placebelow.

The powers-header-window is a text-buffer g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-header-color.


Section - Border windows
[These windows will only be visible in interpreters that support graphics, and are not essential to the interface.]

To place border (win - a graphics g-window):
	if glulx graphics is supported:
		open up win.

The border-1-window is a graphics g-window spawned by the main-window. The measurement is 6. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-2-window is a graphics g-window spawned by the stats-window. The measurement is 6. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-3-window is a graphics g-window spawned by the stats-window. The measurement is 2. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-4-window is a graphics g-window spawned by the powers-window. The measurement is 2. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-5-window is a graphics g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-6-window is a graphics g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-7-window is a graphics g-window spawned by the main-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.


Section - Window styling

The back-colour of the main-window is g-white.[For CocoaGlk]

To set styles for the status window:
	set the background of the status window to colored;
	set the background color of the status window to g-header-color;
	set the text color of the status window to g-black;[just for completeness, will be the default in most Glk implementations]
	[apply bold-weight boldness to bold-style;]
	apply color (assigned number of g-humanist-crimson) to bold-style for grid windows.

To decide which special-style is normal-style:
	(- 0 -).

To open the/-- status window:
	shut down border-7-window;[just in case it's already open]
	if the status window is already open, rule fails;
	set styles for the status window;
	initialize the status window;
	place border border-7-window.

To apply color (N - a number) to (chosen style - a special-style) for grid windows:
	(- glk_stylehint_set(wintype_TextGrid, {chosen style}, stylehint_TextColor, {N}); -)

To set up styles for side windows:
	apply assigned number of g-humanist-crimson color to special-style-1;
	apply bold-weight boldness to special-style-1.


Chapter - Window-drawing rules
[There are two primary places where we need to redraw the windows. First, before reading a command should handle all in-game situations. But we also need the stats to reflect the last turn of the game when we've won, since this will most often be a combat turn that we have lost. For that, we hook into the activity for printing the player's "obituary".]

Before reading a command (this is the refresh side windows rule):
	follow the window-drawing rules for the stats-window;
	follow the window-drawing rules for the powers-window.
	
Before printing the player's obituary (this is the final refresh side windows rule):
	follow the window-drawing rules for the stats-window;
	follow the window-drawing rules for the powers-window.


Section - Statistics window

Window-drawing rule for the stats-window (this is the construct stats window rule):
	move focus to stats-window, clearing the window;	
	consider the status rules;[show point distribution message]
	say "[line break][run paragraph on]";
	consider the show basic stats rule;[show statistics]
	say run paragraph on;
	return to main screen.
	
[This is the side-window stats rule:[adapted from the show basic stats rule, to use fixed width type.]
	say "[second custom style]Health:  [fixed letter spacing][health of the player] of [permanent health of the player][line break][run paragraph on]";
	say "[second custom style]Attack:  [fixed letter spacing][melee of the player][line break][run paragraph on]";
	say "[second custom style]Defence: [fixed letter spacing][defence of the player][line break][run paragraph on]";
	let fb be final body of the player;
	let bb be fb - body score of the player;
	let fm be final mind of the player;
	let mb be fm - mind score of the player;
	let fs be final spirit of the player;
	let sb be fs - spirit score of the player;	
	say "[second custom style]Body:    [fixed letter spacing][run paragraph on][fb][if fb is greater than body score of the player] ([body score of the player] inherent + [bb] bonus)[end if][if fb is less than body score of the player] ([body score of the player] inherent - [bb * -1] penalty)[end if][line break][run paragraph on]";
	say "[second custom style]Mind:    [fixed letter spacing][run paragraph on][fm][if fm is greater than mind score of the player] ([mind score of the player] inherent + [mb] bonus)[end if][if fm is less than mind score of the player] ([mind score of the player] inherent - [mb * -1] penalty)[end if][line break][run paragraph on]";
	say "[second custom style]Spirit:  [fixed letter spacing][run paragraph on][fs][if fs is greater than spirit score of the player] ([spirit score of the player] inherent + [sb] bonus)[end if][if fs is less than spirit score of the player] ([spirit score of the player] inherent - [sb * -1] penalty)[end if][line break][run paragraph on]";
	say roman type.]
	
Window-drawing rule for the stat-header-window (this is the construct stat header window rule):
	move focus to stat-header-window, clearing the window;
	say "[first custom style]Statistics[roman type]";
	say run paragraph on;
	return to main screen.


Section - Powers window
	
Window-drawing rule for the powers-window (this is the construct power window rule):
	move focus to powers-window, clearing the window;
	let pow be the number of granted powers;
	if pow is 0:
		say "[bold type]You have not yet acquired any special powers[roman type].";
	otherwise:
		consider the status skill rules;
	if pow < 3:
		say "[line break][italic type]Tip:[roman type] [one of]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5[or]When you absorb an enemy's soul, it fully heals you, increases your statistics, and grants you a special power[or]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it[or]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body[or]Level 0 monsters never grant you health or powers[or]Some monsters form groups, and you will have to kill the entire group before power transferal happens[or]Maximising the number of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys of success in [italic type]Kerkerkruip[roman type][at random]."; 
	say run paragraph on;
	return to main screen.

Window-drawing rule for the powers-header-window (this is the construct powers header window rule):
	move focus to powers-header-window, clearing the window;
	say "[first custom style]Powers[roman type]";
	say run paragraph on;
	return to main screen.


Chapter - Opening and closing windows
	
To open side windows:
	set up styles for side windows;
	open up the stats-window;
	place border border-3-window;
	place border border-1-window;
	[apply justification of center-justified to bold-style;][doesn't work in Gargoyle]
	open up the stat-header-window;
	place border border-5-window;
	open up the powers-window;
	place border border-2-window;
	place border border-4-window;
	[apply justification of center-justified to bold-style;][doesn't work in Gargoyle]
	open up the powers-header-window;
	place border border-6-window.
	
To close side windows:
	shut down the stats-window;
	shut down the border-1-window.
	

Section - Events

Last when play begins (this is the open up game windows rule):
	open side windows;
	open the status window;

[We need to close and open the side windows when we visit the in-game help menus. "In-game menu checking" is a kind of action that identifies the way we get to the menus while playing the game.]
Before displaying when in-game menu-checking:
	close side windows.
	
After displaying when in-game menu-checking:
	close the status window;
	consider the open up game windows rule.

[We also need to reset the windows when a game is restored.]
After restoring from a saved game:
	close the status window;
	close side windows;
	consider the open up game windows rule.


Kerkerkruip Windows ends here.
