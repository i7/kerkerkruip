Kerkerkruip Windows by Erik Temple begins here.

Use authorial modesty.


Chapter - UI Colors

Table of Common Color Values (continued)
glulx color value	assigned number
g-window-color	15658734
g-header-color	14540253
g-humanist-crimson	10231552


Chapter - Parser error fix
[When we print to multiple windows, the Inform default library's automatic spacing routines are fooled. So we need to readjust spacing. Also, Kerkerkruip seems to call the printing a parser error activity twice for each parser error (once w/an empty message, followed by a second time in which the message is printed), hence the odd cycling here, to avoid printing spaces both before and after the error message.]

After printing a parser error:
	say "[one of][run paragraph on][or][line break][run paragraph on][cycling]"


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
	consider the short status rules;[show point distribution messages and player attributes]
	say "[line break][run paragraph on]";
	consider the show basic stats rule;[show statistics]
	say run paragraph on;
	return to main screen.

The short status rules are a rulebook.

Short status rule (this is the combat basics short status rule):
	if concentration of the player is not 0:
		let n be concentration of the player;
		say "[bold type]Concentration[roman type]: [if n is 1]+2[else if n is 2]+4[else if n is 3]+8[end if] attack, [if n is 1]no[else if n is 2]+2[else if n is 3]+4[end if] damage[line break][run paragraph on]";
	if tension is greater than 1:
		say "[bold type]Tension[roman type]: +[tension divided by 2] attack, +[tension divided by 3] damage[line break][run paragraph on]";
	if ment timer is greater than 0:
		say "[bold type]Ment[roman type]: +[ment bonus] attack, +[ment bonus] damage, -[ment bonus] enemy damage, +[ment bonus] defence, +[ment bonus] abilities.[line break][run paragraph on]";
	if ment timer is 0 and ment addiction is greater than 0:
		say "[bold type]Down[roman type]: -[ment addiction] attack, -[ment addiction] abilities[line break][line break][run paragraph on]".

Short status rule (this is the attributes short status rule):[start with "human" vs undead, and use commas before each subsequent item.]
	say "You are [if current form is ghoul-form]a ghoul[else if current form is vampire-form]a vampire[else if current form is vampirebat-form]a vampire bat[else if the player is undead]undead[else]human[end if][run paragraph on]";
	if player is not base size of the player:
		say ", [size of the player] in stature[run paragraph on]";
	if player is ethereal:
		say ", ethereal[run paragraph on]";
	if player is flying:
		say ", flying[run paragraph on]";
	if player is blind or the player is eyeless:
		say ", [if player is eyeless]eyeless[else]blind[end if][run paragraph on]";
	if hit protection of the player is greater than 0:
		say ", protected from damage[run paragraph on]";
	if the player is hidden:
		say ", hidden[run paragraph on]";
	if at least one person grapples the player:
		let X be a random person grappling the player;
		say ", grappled by [the X][run paragraph on]";
	if the player is druidic and the golden fruit timer is greater than 0:
		say ", under the influence of the golden fruit[run paragraph on]";
	if player skill bonus timer is greater than 0:
		say ", skilled[run paragraph on]";
	if the player is stunned:
		say ", stunned[run paragraph on]";
	if the player is hexed:
		say ", hexed[run paragraph on]";
	if the player is tentacle-confused:
		say ", confused[run paragraph on]";
	if wisp-strength is not 0:
		say ", [if power of the wisps is granted]in pain[otherwise]pain-hardened[end if][run paragraph on]";
	if the player is at-howl:
		say ", howling[run paragraph on]";
	say ". ([link 1]detailed status report[end link])[line break][run paragraph on]"

Short status rule (this is the unallocated faculty short status rule):
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
	consider the status rules;
	consider the status skill rules;
	say run paragraph on;
	return to main screen;
	rule succeeds.

Hyperlink processing rule when the current hyperlink window is the stats-window and the current hyperlink ID is 2[i.e., we've hit the back button while reading the full status information.]:
	follow the window-drawing rules for the stats-window;
	rule succeeds.	


Section - Powers window
	
Window-drawing rule for the powers-window when the powers-window is g-present (this is the construct power window rule):
	move focus to powers-window, clearing the window;
	let pow be the number of granted powers;
	if pow is 0:
		say "[bold type]You have not yet acquired any special powers[roman type].";
	otherwise:
		[consider the status skill rules;]
		repeat with ability running through granted powers:
			say "[link (the ability typecast to a number)][command text of the ability in sentence case][end link]: level [power level of the ability][run paragraph on]";
			if there is a power of ability in the Table of Enemy Powers:
				choose row with power of ability from the Table of Enemy Powers;
				say " ([faculty1 entry][if there is a faculty2 entry] & [faculty2 entry][end if])[run paragraph on]";
			say "[line break]";
	if pow < 3:
		if data value 1 < 3:
			say "[line break][italic type]Tip:[roman type] [one of]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5[or]When you absorb an enemy's soul, it fully heals you, increases your statistics, and grants you a special power[or]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it[or]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body[or]Level 0 monsters never grant you health or powers[or]Some monsters form groups, and you will have to kill the entire group before power transferal happens[or]Maximising the number of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys to success in [italic type]Kerkerkruip[roman type][at random]."; 
		otherwise:
			say "[line break][italic type]Tip:[roman type] [one of]You can now snort ment in combat[or]Examining a monster will reveal its health[or]Balance body, mind and spirit to maximise your chance of rolling 20[or]Most scrolls won't hurt you, so experimenting can pay off[or]The goddess Sul can help you with cursed items[or]Fragmentation grenades will break people's concentration[or]The power of the bomb will automatically choose the best victim[or]If you want to see all items and monsters, use the unlock everything option in the menu[or]The [italic type]roll[roman type] action is a more risky, but potentially more rewarding, version of the [italic type]dodge[roman type] action[or]You can sacrifice your concentration for a more powerful [italic type]parry[roman type] by choosing the [italic type]block[roman type] action[at random].";
	say run paragraph on;
	return to main screen.

Window-drawing rule for the powers-header-window when the powers-header-window is g-present (this is the construct powers header window rule):
	move focus to powers-header-window, clearing the window;
	say "[first custom style]Powers[roman type]";
	say run paragraph on;
	return to main screen.

Table of Enemy Powers
power	faculty1	faculty2
power of the armadillo	body	spirit
power of the ape	body	--
power of the daggers	spirit	body
power of Miranda	mind	--
power of the wisps	spirit	--
power of the chains	spirit	--
power of the bomb	body	--
power of the Reaper	spirit	--
power of rage	mind	--
power of the hound	mind	--
power of the mindslug	mind	spirit
power of the tentacle	mind	--
power of the minotaur	body	--
power of the Fanatics of Aite	spirit	--
power of Bodmall	body	--


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
	try taking inventory; 
	say run paragraph on;
	return to main screen.

Window-drawing rule for the inventory-header-window when the inventory-header-window is g-present (this is the construct inventory header window rule):
	move focus to inventory-header-window, clearing the window;
	say "[first custom style]Inventory[roman type]";
	say run paragraph on;
	return to main screen.


Chapter - Opening and closing windows

Toggling window panels is an action out of world. Understand "toggle info panels" or "info panels" or "toggle information panels" or "information panels" as toggling window panels.

Understand "disable info panels" or "disable information panels" as toggling window panels when data value 7 is 0.

Understand "enable info panels" or "enable information panels" as toggling window panels when data value 7 is 1.

Understand "disable info panels" or "disable information panels" as a mistake ("The information panels are already disabled.") when data value 7 is 1.

Understand "enable info panels" or "enable information panels" as a mistake ("The information panels are already enabled.") when data value 7 is 0.

Carry out toggling window panels:
	close the status window;
	if data value 7 is 1:
		set data value 7 to 0;
		open side windows;
		open the status window;
		say "The information panels have been enabled. Type INFO PANELS to disable them again.";
	otherwise:
		set data value 7 to 1;
		close side windows;
		open the status window;
		say "The information panels have been disabled. Type INFO PANELS to re-enable them."

	
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
		say "[bracket]Information panels are disabled. Type INFO PANELS to enable them.[close bracket][line break][run paragraph on]";
	if data value 7 is 0:
		if width of the main-window is less than 102 or height of the main-window is less than 34:
			say "[bracket]Your game window is too small for you to use the information panels comfortably. Maximize your window, then type INFO PANELS to enable them.[close bracket][line break][run paragraph on]";
			set data value 7 to 1;
	follow the open up game windows rule.

This is the open up game windows rule:
	open side windows;
	open the status window.

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
	consider the check info panel capacity rule.


Kerkerkruip Windows ends here.
