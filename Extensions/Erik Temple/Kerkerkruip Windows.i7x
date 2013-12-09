Kerkerkruip Windows by Erik Temple begins here.

Use authorial modesty.


Chapter - Parser error fix

[This error is redirected to another error type, meaning that the activity is run twice. For this reason we only print a line break for other errors.]
After printing a parser error when the latest parser error is not the noun did not make sense in that context error:
	say line break.



Chapter - UI Colors

Table of Common Color Values (continued)
glulx color value	assigned number
g-window-color	15658734[#EEEEEE]
g-header-color	14540253[#DDDDDD]
g-status-color	12369084[#BCBCBC]
g-humanist-crimson	10231552[#9C1F00]


Chapter - Window definitions


Section - Windows with content

The stats-window is a text-buffer g-window spawned by the main-window. The back-colour is g-window-color. The measurement is 25. The position is g-placeright.

The stat-header-window is a text-buffer g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size. The back-colour is g-header-color.

The powers-window is a text-buffer g-window spawned by the stats-window. The back-colour is g-window-color. The measurement is 13. The scale method is g-fixed-size. The position is g-placebelow.

The powers-header-window is a text-buffer g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-header-color.

The inventory-window is a text-buffer g-window spawned by the main-window. The back-colour is g-window-color. The measurement is 30. The position is g-placeleft.

The inventory-header-window is a text-buffer g-window spawned by the inventory-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size. The back-colour is g-header-color.


Section - Border windows
[These windows will only be visible in interpreters that support graphics, and are not essential to the interface.]

To place border (win - a graphics g-window):
	[do nothing.]
	if glulx graphics is supported:
		open up win.

The border-1-window is a graphics g-window spawned by the main-window. The measurement is 6. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-2-window is a graphics g-window spawned by the stats-window. The measurement is 6. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-3-window is a graphics g-window spawned by the stats-window. The measurement is 2. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-4-window is a graphics g-window spawned by the powers-window. The measurement is 2. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-5-window is a graphics g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-6-window is a graphics g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-7-window is a graphics g-window spawned by the main-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-8-window is a graphics g-window spawned by the inventory-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-9-window is a graphics g-window spawned by the inventory-window. The measurement is 2. The position is g-placeleft. The scale method is g-fixed-size.  The back-colour is g-white.

The border-10-window is a graphics g-window spawned by the inventory-window. The measurement is 6. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-11-window is a graphics g-window spawned by the inventory-window. The measurement is 2. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.


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

To close the/-- status window:
	shut status win;
	shut down border-7-window.

To shut status win:
	(- if (gg_statuswin) glk_window_close(gg_statuswin, 0); gg_statuswin = 0; -)

To apply color (N - a number) to (chosen style - a special-style) for grid windows:
	(- glk_stylehint_set(wintype_TextGrid, {chosen style}, stylehint_TextColor, {N}); -)

To set up styles for side windows:
	apply assigned number of g-humanist-crimson color to special-style-1;
	apply bold-weight boldness to special-style-1.


Section - Setting standard text colors

To set basic text color to (col - a glulx color value):
	(- SetBasicTextColor({col}); -)

Include (-

	[ SetBasicTextColor col i;
		if (col == (+g-placenullcol+)) rfalse;
		col = ColVal(col);
		for (i = 0: i < style_NUMSTYLES : i++)
 	 		glk_stylehint_set(wintype_Textbuffer, i, stylehint_TextColor, 0);
	];

-)

Before starting the virtual machine:
	set basic text color to g-black.


Chapter - Window-drawing rules
[There are two primary places where we need to redraw the windows. First, before reading a command should handle all in-game situations. But we also need the stats to reflect the last turn of the game when we've won, since this will most often be a combat turn that we have lost. For that, we hook into the activity for printing the player's "obituary".]

To redraw subsidiary content windows:
	if data value 7 is 0:
		follow the window-drawing rules for the stats-window;
		follow the window-drawing rules for the powers-window;
		follow the window-drawing rules for the inventory-window.

Before reading a command (this is the refresh side windows rule):
	redraw subsidiary content windows.
	
Before printing the player's obituary (this is the final refresh side windows rule):
	redraw subsidiary content windows.


Section - Statistics window	

Window-drawing rule for the stats-window when the stats-window is g-present (this is the construct stats window rule):
	move focus to stats-window, clearing the window;
	now long status is false;
	now attribute printed is false;
	consider the status combat stats rules;
	consider the short player form status rule;[the player's form]
	consider the status attribute rules;
	say "[if attribute printed is true]. [end if][bracket][link 1]detailed status report[end link][close bracket][line break][run paragraph on]";
	consider the unallocated faculty short status rule;[shortened message for any unassigned faculty points]
	say "[line break][run paragraph on]";
	consider the show basic stats rule;[show statistics]
	say run paragraph on;
	now long status is true;
	return to main screen.


Attribute printed is a truth state variable. Attribute printed is false.

To check initial position of attribute:
	if attribute printed is false:
		say "You are [run paragraph on]";
		now attribute printed is true;
	otherwise:
		say ", [run paragraph on]".

This is the unallocated faculty short status rule:
	if long status is false:
		if unallocated faculty is greater than 0:
			say "[italic type]Increase one of your faculties by typing 'body', 'mind', or 'spirit' ([unallocated faculty] point[if unallocated faculty is greater than 1]s[end if]).[roman type][line break][run paragraph on]".
	
Window-drawing rule for the stat-header-window when the stat-header-window is g-present (this is the construct stat header window rule):
	move focus to stat-header-window, clearing the window;
	say "[first custom style]Statistics[roman type]";
	say run paragraph on;
	return to main screen.


Section - Statistics window hyperlinks

Hyperlink processing rule when the current hyperlink window is the stats-window and the current hyperlink ID is 1:
	move focus to stats-window, clearing the window;
	say "[link 2]< back[end link][line break][line break][run paragraph on]";
	consider the show basic stats rule;
	consider the status combat stats rules;
	consider the status attribute rules;
	consider the status skill rules;
	say run paragraph on;
	return to main screen;
	rule succeeds.

Hyperlink processing rule when the current hyperlink window is the stats-window and the current hyperlink ID is 2[i.e., we've hit the back button while reading the full status information.]:
	follow the window-drawing rules for the stats-window;
	rule succeeds.	


Section - Powers window

Power-tip-text is a text variable.
	
Window-drawing rule for the powers-window when the powers-window is g-present (this is the construct power window rule):
	move focus to powers-window, clearing the window;
	let pow be the number of granted powers;
	if pow is 0:
		say "[bold type]You have not yet acquired any special powers[roman type].";
	otherwise:
		[consider the status skill rules;]
		repeat with ability running through granted powers:
			if ability is the power of the ape:
				say "[if maximum ape power is not tiny and maximum ape power is not small and maximum ape power is not medium][link (the ability typecast to a number)][command text of the ability in sentence case][end link]: level [power level of the ability] (max [maximum ape power])[otherwise][link (the ability typecast to a number)]ape power[end link]: level [power level of the ability] (no special ability)[end if][run paragraph on]";
			otherwise:
				say "[link (the ability typecast to a number)][command text of the ability in sentence case][end link]: level [power level of the ability][run paragraph on]";
			if there is a power of ability in the Table of Enemy Powers:
				choose row with power of ability from the Table of Enemy Powers;
				say " ([faculty1 entry][if there is a faculty2 entry] & [faculty2 entry][end if])[run paragraph on]";
			say "[line break]";
	if pow < 3 and (turn count is 1 or the remainder after dividing turn count by 30 is 0):
		now power-tip-text is the next tip text;
	say "[line break][italic type]Tip:[roman type] [power-tip-text]";
	say "[line break][run paragraph on]";
	return to main screen.

Window-drawing rule for the powers-header-window when the powers-header-window is g-present (this is the construct powers header window rule):
	move focus to powers-header-window, clearing the window;
	say "[first custom style]Powers[roman type]";
	say run paragraph on;
	return to main screen.


To decide what number is (O - an object) typecast to a number:
	(- {O} -).

To decide what object is (N - a number) typecast to an object:
	(- {N} -).


Section - Powers window hyperlinks

Hyperlink processing rule when the current hyperlink window is the powers-window:
	let ability be the current hyperlink ID typecast to an object;
	if ability is a power:
		let T be an indexed text;
		let T be "[ability]" in title case;
		move focus to powers-window, clearing the window;
		say "[bold type][T].[roman type][line break][description of the ability] [link 2]< back[end link][run paragraph on]";
		return to main screen;
		rule succeeds.

Hyperlink processing rule when the current hyperlink window is the powers-window and the current hyperlink ID is 2[i.e., we've hit the back button while reading the description of some power.]:
	follow the window-drawing rules for the powers-window;
	rule succeeds.


Section - Inventory window
	
Window-drawing rule for the inventory-window when the inventory-window is g-present (this is the construct inventory window rule):
	move focus to inventory-window, clearing the window;
	consider the full inventory rule; 
	say run paragraph on;
	return to main screen.

Window-drawing rule for the inventory-header-window when the inventory-header-window is g-present (this is the construct inventory header window rule):
	move focus to inventory-header-window, clearing the window;
	say "[first custom style]Inventory[roman type]";
	say run paragraph on;
	return to main screen.


Chapter - Opening and closing windows

Toggling window panels is an action out of world. Understand "toggle info panels" or "info panels" or "toggle information panels" or "information panels" or "panels" as toggling window panels.

Understand "disable panels" or "disable info panels" or "disable information panels" as toggling window panels when data value 7 is 0.

Understand "enable panels" or "enable info panels" or "enable information panels" as toggling window panels when data value 7 is 1.

Understand "disable panels" or "disable info panels" or "disable information panels" as a mistake ("The information panels are already disabled.") when data value 7 is 1.

Understand "enable panels" or "enable info panels" or "enable information panels" as a mistake ("The information panels are already enabled.") when data value 7 is 0.

Carry out toggling window panels:
	close the status window;
	if data value 7 is 1:
		set data value 7 to 0;
		open side windows;
		open the status window;
		say "The information panels have been enabled. Type PANELS to disable them again.";
	otherwise:
		set data value 7 to 1;
		close side windows;
		open the status window;
		say "The information panels have been disabled. Type PANELS to re-enable them."

	
To open side windows:
	if data value 7 is 1, rule fails;	
	set the Gargoyle background color to the color g-white;
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
	place border border-6-window;
	open up the inventory-window;
	place border border-9-window;
	place border border-10-window;
	place border border-11-window;
	open up the inventory-header-window;
	place border border-8-window.
	
To close side windows:
	shut down the stats-window;
	shut down the inventory-window;
	shut down the border-1-window.
	

Section - Events

Last when play begins (this is the check info panel capacity rule):
	if data value 7 is 1:
		say "[bracket]Information panels are disabled. Type PANELS to enable them.[close bracket][line break][run paragraph on]";
	if data value 7 is 0:
		if width of the main-window is less than 102 or height of the main-window is less than 34:
			say "[bracket]Your game window is too small for you to use the information panels comfortably. Maximize your window, then type PANELS to enable them.[close bracket][line break][run paragraph on]";
			set data value 7 to 1;
	follow the open up game windows rule.

This is the open up game windows rule:
	open side windows;
	open the status window.



Section - Menus & windows

[We need to close and open the side windows when we visit the in-game help menus. "In-game menu checking" is a kind of action that identifies the way we get to the menus while playing the game.]

First before displaying (this is the fix our windows rule before displaying rule):
	close side windows;
	open the status window;

Last after displaying:
	close the status window;
	if in-game menu-checking:
		open side windows;
		open the status window;



[We also need to reset the windows when a game is restored.]
After restoring from a saved game:
	close the status window;
	close side windows;
	consider the check info panel capacity rule.


Kerkerkruip Windows ends here.
