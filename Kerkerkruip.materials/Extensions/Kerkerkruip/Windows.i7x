Windows by Kerkerkruip begins here.

Use authorial modesty.



Chapter - Parser error fix

[This error is redirected to another error type, meaning that the activity is run twice. For this reason we only print a line break for other errors.]
After printing a parser error when the latest parser error is not the noun did not make sense in that context error:
	say line break.



Chapter - UI Colors

White is always "#FFFFFF".
The window color is always "#EEEEEE".
The header color is always "#DDDDDD".
The status color is always "#BCBCBC".
Humanist crimson is always "#9C1F00".



Chapter - Window definitions

Section - Windows with content

The stats window is a text buffer g-window spawned by the main window.
The measurement is 25.
The position is g-placeright.
The background color is window color.

The stats window header is a text buffer g-window spawned by the stats window.
The measurement is 1.
The position is g-placeabove.
The scale method is g-fixed-size.
The background color is header color.

The powers window is a text buffer g-window spawned by the stats window.
The measurement is 13.
The position is g-placebelow.
The scale method is g-fixed-size.
The background color is window color.

The powers window header is a text buffer g-window spawned by the powers window.
The measurement is 1.
The position is g-placeabove.
The scale method is g-fixed-size.
The background color is header color.

[ We need the dash because of bug 0001507 ]
The inventory-window is a text buffer g-window spawned by the main window.
The measurement is 30.
The position is g-placeleft.
The background color is window color.

The inventory-window header is a text buffer g-window spawned by the inventory-window.
The measurement is 1.
The position is g-placeabove.
The scale method is g-fixed-size.
The background color is header color.



Section - Border windows

[ These windows will only be visible in interpreters that support graphics, and are not essential to the interface. ]

A border is a kind of graphics g-window.
The scale method of a border is usually g-fixed-size.
The background color of a border is usually white.

To place border (win - a graphics g-window):
	if glulx graphics is supported:
		open up win.

[ The stats window ]

The border-1-window is a border spawned by the main window.
The measurement is 6.
The position is g-placeright.

The border-3-window is a border spawned by the stats window.
The measurement is 2.
The position is g-placeright.

The border-5-window is a border spawned by the stats window.
The measurement is 1.
The position is g-placeabove.
The background color is humanist crimson.

After constructing the stats window:
	place border border-3-window;
	place border border-1-window;
	[apply justification of center-justified to bold-style;][doesn't work in Gargoyle]
	open up the stats window header;
	place border border-5-window;

After deconstructing the stats window:
	close border-1-window;

[ The powers window ]

The border-2-window is a border spawned by the stats window.
The measurement is 6.
The position is g-placebelow.

The border-4-window is a border spawned by the powers window.
The measurement is 2.
The position is g-placebelow.

The border-6-window is a border spawned by the powers window.
The measurement is 1.
The position is g-placeabove.
The background color is humanist crimson.

After constructing the powers window:
	place border border-2-window;
	place border border-4-window;
	[apply justification of center-justified to bold-style;][doesn't work in Gargoyle]
	open up the powers window header;
	place border border-6-window;

After deconstructing the powers window:
	close border-2-window;

[ The status window ]

[ Note: these must be moved when the acting main window changes. ]
A status window border is a kind of border.

The border-7-window is a status window border spawned by the main window.
The measurement is 1.
The position is g-placeabove.
The background color is humanist crimson.

The border-12-window is a status window border spawned by the main window.
The measurement is 7.
The position is g-placeabove.
The background color is header color.

The border-13-window is a status window border spawned by the main window.
The measurement is 7.
The position is g-placeabove.
The background color is header color.

Before constructing the status window:
	now all status window borders are spawned by the acting main window;
	if the current IO implementation is GarGlk:
		place border border-12-window;

After constructing the status window:
	if the current IO implementation is GarGlk:
		place border border-13-window;
	place border border-7-window;

After deconstructing the status window:
	close border-7-window;
	close border-12-window;
	close border-13-window;

[ The inventory window ]

The border-8-window is a border spawned by the inventory-window.
The measurement is 1.
The position is g-placeabove.
The background color is humanist crimson.

The border-9-window is a border spawned by the inventory-window.
The measurement is 2.
The position is g-placeleft.

The border-10-window is a border spawned by the inventory-window.
The measurement is 6.
The position is g-placeright.

The border-11-window is a border spawned by the inventory-window.
The measurement is 2.
The position is g-placebelow.

After constructing the inventory-window:
	place border border-9-window;
	place border border-10-window;
	place border border-11-window;
	open up the inventory-window header;
	place border border-8-window;



Section - Window styling

The background color of the main window is white. [ For CocoaGlk ]
The background color of the status window is header color.

[ TODO: What is this for?]
[To set up styles for side windows:
	apply assigned number of g-humanist-crimson color to special-style-1;
	apply bold-weight boldness to special-style-1.]

Table of User Styles (continued)
window	style name	color	reversed
all-windows	input-style	humanist crimson	--
all-grid-windows	all-styles	--	false



Section - Setting standard text colors

[ Note we don't set user style 2 so that it can be used to detect whether or not the Gargoyle config file has been applied - see Start and Finish ]
[ TODO: Check if we can simplify this to a table style now that we're using the new Glulx Text Effects. Or maybe we can replace GTE_SetStylehint()? ]

To set basic text color to black:
	(- SetBasicTextColorToBlack(); -).

Include (-
[ SetBasicTextColorToBlack i;
	for (i = 0: i < (style_NUMSTYLES - 1) : i++)
		glk_stylehint_set( wintype_AllTypes, i, stylehint_TextColor, 0 );
];
-).

A first glulx zeroing-reference rule:
	set basic text color to black.



Chapter - Window-drawing rules

[ There are two primary places where we need to redraw the windows. First, before reading a command should handle all in-game situations. But we also need the stats to reflect the last turn of the game when we've won, since this will most often be a combat turn that we have lost. For that, we hook into the activity for printing the player's "obituary". ]

To refresh the side panels:
	if window panels are enabled:
		refresh the stats window;
		refresh the powers window;
		refresh the inventory-window;

Before reading a command (this is the refresh side windows rule):
	refresh the side panels;
	
Before printing the player's obituary (this is the final refresh side windows rule):
	refresh the side panels;



Section - Statistics window	

Showing detailed status report is a truth state variable.
Showing detailed status report is false.

Rule for refreshing the stats window:
	if showing detailed status report is false:
		now long status is false;
		now attribute printed is false;
		follow the status combat stats rules;
		follow the short player form status rule;[the player's form]
		follow the status attribute rules;
		say "[if attribute printed is true]. [end if][bracket][link 1]detailed status report[end link][close bracket][line break][run paragraph on]";
		follow the unallocated faculty short status rule;[shortened message for any unassigned faculty points]
		say "[line break][run paragraph on]";
		follow the show basic stats rule;[show statistics]
		say run paragraph on;
		now long status is true;
	otherwise:
		say "[link 2]< back[end link][line break][line break][run paragraph on]";
		follow the show basic stats rule;
		follow the status combat stats rules;
		follow the status attribute rules;
		follow the status skill rules;
		say run paragraph on;

Rule for processing hyperlinks for the stats window:
	if the hyperlink ID is:
		-- 1:
			now showing detailed status report is true;
		-- 2:
			now showing detailed status report is false;
	refresh the stats window;

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

Rule for refreshing the stats window header:
	say "[first custom style]Statistics[roman type]";
	say run paragraph on;



Section - Powers window

Currently displayed power is a number variable.

Power-tip-text is a text variable.
	
Rule for refreshing the powers window:
	if the currently displayed power is not 0:
		let ability be the currently displayed power typecast to an object;
		let T be an indexed text;
		let T be "[ability]" in title case;
		say "[bold type][T].[roman type][line break][description of the ability] [link 2]< back[end link][run paragraph on]";
	otherwise:
		let pow be the number of granted powers;
		if pow is 0:
			say "[bold type]You have not yet acquired any special powers[roman type].";
		otherwise:
			[consider the status skill rules;]
			repeat with ability running through granted powers:
				if ability is the power of the ape:
					say "[if maximum ape power is not tiny and maximum ape power is not small and maximum ape power is not medium][link (the ability typecast to a number)][command text of the ability in sentence case][end link]: level [power level of the ability] (max [maximum ape power])[otherwise][link (the ability typecast to a number)]Ape power[end link]: level [power level of the ability] (no special ability)[end if][run paragraph on]";
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

Rule for processing hyperlinks for the powers window:
	let ability be the hyperlink ID typecast to an object;
	if ability is a power:
		now the currently displayed power is the hyperlink ID;
	otherwise:
		now the currently displayed power is 0;
	refresh the powers window;

Rule for refreshing the powers window header:
	say "[first custom style]Powers[roman type]";
	say run paragraph on;

To decide what number is (O - an object) typecast to a number:
	(- {O} -).

To decide what object is (N - a number) typecast to an object:
	(- {N} -).



Section - Inventory window

Rule for refreshing the inventory-window:
	follow the full inventory rule; 
	say run paragraph on;

Rule for refreshing the inventory-window header:
	say "[first custom style]Inventory[roman type]";
	say run paragraph on;



Chapter - Opening and closing windows

The information panels are an option. Understand "panels" and "side panels" as the information panels.
Understand "info [option]" as toggling.

Panel silence is a truth state that varies. Panel silence is false.

Check toggling the information panels:
	if window panels are enabled:
		try disabling the information panels;
	otherwise:
		try enabling the information panels;

Check enabling the information panels:
	if screen reader mode is enabled:
		if panel silence is false:
			say "Information panels are disabled in screen reader mode.";
		do nothing instead;
	if window panels are enabled:
		if panel silence is false:
			say "The information panels are already enabled.";
		do nothing instead;		

Check disabling the information panels:
	if screen reader mode is enabled:
		if panel silence is false:
			say "Information panels are disabled in screen reader mode.";
		do nothing instead;
	if window panels are disabled:
		if panel silence is false:
			say "The information panels are already disabled.";
		do nothing instead;

Carry out enabling the information panels:
	enable the window panels flag;
	close the status window;
	open side windows;
	open up the status window;
	if panel silence is false:
		say "The information panels have been enabled. Type PANELS to disable them again.";
	do nothing instead;

Carry out disabling the information panels:
	disable the window panels flag;
	close the status window;
	close side windows;
	open up the status window;
	if panel silence is false:
		say "The information panels have been disabled. Type PANELS to re-enable them.";
	do nothing instead;
	
To open side windows:
	if window panels are disabled:
		rule fails;
	[ TODO: what is this next line for? ]
	[set the Gargoyle background color to the color g-white;]
	[ TODO: what is this next line for? ]
	[set up styles for side windows;]
	open up the stats window;
	open up the powers window;
	open up the inventory-window;
	
To close side windows:
	close the stats window;
	close the inventory-window;
	

[For some reason, 'script on' turns off the information panels even though they are still supposed to be open.]

Last report switching the story transcript on:
	if window panels are enabled:
		now panel silence is true;
		try disabling the information panels;
		try enabling the information panels;
		now panel silence is false.



Section - Events

Last when play begins (this is the check info panel capacity rule):
	if screen reader mode is enabled:
		open up the status window;
		make no decision;
	if window panels are disabled:
		say "[bracket]Information panels are disabled. Type PANELS to enable them.[close bracket][line break][run paragraph on]";
	otherwise:
		if width of the main window is less than 102 or height of the main window is less than 30:
			say "[bracket]Your game window is too small for you to use the information panels comfortably. Maximize your window, then type PANELS to enable them.[close bracket][line break][run paragraph on]";
			disable window panels flag;
	follow the open up game windows rule.

This is the open up game windows rule:
	open side windows;
	open up the status window;



Section - Menus & windows

[We need to close and open the side windows when we visit the in-game help menus. "In-game menu checking" is a kind of action that identifies the way we get to the menus while playing the game.]

First before displaying (this is the fix our windows rule before displaying rule):
	close side windows;
	open up the status window;

Last after displaying:
	close the status window;
	if in-game menu-checking:
		open side windows;
		open up the status window;



[We also need to reset the windows when a game is restored.]
After restoring from a saved game:
	close the status window;
	close side windows;
	follow the check info panel capacity rule.



Windows ends here.
