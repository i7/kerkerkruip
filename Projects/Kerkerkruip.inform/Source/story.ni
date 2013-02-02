"Kerkerkruip - Release 8 - BETA" by Victor Gijsbers

The story headline is "An IF roguelike".
The story genre is "dungeon crawl".
The release number is 8.
[Release along with cover art.]

	
Include version 4/121111 of Menus by Emily Short. [Get this at https://github.com/i7/extensions]
Include Basic Screen Effects by Emily Short. 
Include Numbered Disambiguation Choices by Aaron Reed.
Include Glulx Entry Points by Emily Short.
Include Dynamic Objects by Jesse McGrew.
Include Epistemology by Eric Eve. [Doesn't work with moving people.]
Include Glulx Status Window Control by Erik Temple.
[Include Kerkerkruip Glimmr Additions by Erik Temple.]
Include Flexible Windows by Jon Ingold.

[Testing with Glimmr installed will be slower, due to compilation and graphics, so commits to story.ni would generally best be made with it commented out. Be sure to comment Flexible Windows in instead!]

Every turn (this is the mark items as seen every turn rule): 
	repeat with item running through things that are enclosed by the location:
		if the item is not enclosed by an opaque closed container, now the item is seen.
		
Include Kerkerkruip Permadeath by Victor Gijsbers.
The binary file of save data is called "KerkerkruipSaves".

Use undo prevention.

Include version 4/121110 of Inform ATTACK by Victor Gijsbers.
[You can get the latest ATTACK at https://github.com/i7/ATTACK ]

Include Kerkerkruip Persistent Data by Victor Gijsbers.
Include Kerkerkruip Dungeon Generation by Victor Gijsbers.
Include Kerkerkruip Events by Victor Gijsbers.
Include Kerkerkruip ATTACK Additions by Victor Gijsbers.
Include Kerkerkruip Systems by Victor Gijsbers.
Include Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers.
Include Kerkerkruip Actions and UI by Victor Gijsbers.
Include Kerkerkruip Items by Victor Gijsbers.
Include Kerkerkruip Locations by Victor Gijsbers.
Include Kerkerkruip Scenery by Victor Gijsbers.
Include Kerkerkruip Monsters by Victor Gijsbers.
Include Kerkerkruip Events and Specials by Victor Gijsbers.
Include Kerkerkruip Ugly Special Cases by Victor Gijsbers.
Include Kerkerkruip Start and Finish by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.


Use MAX_PROP_TABLE_SIZE of 500000.
Use MAX_OBJ_PROP_COUNT of 256.
Use MAX_STATIC_DATA of 500000.
Use MAX_OBJECTS of 650.

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.

[This is for testing.]

Generation info is a truth state that varies. Generation info is [true]false.

[Last when play begins:
	increase mind score of the player by 40.]
	
[When play begins:
	copy scroll of ghoulification to player;
	copy scroll of teleportation to player;
	copy scroll of teleportation to player.]
	

Chapter - Flexible Windows relisting
[Kerkerkruip's when play begin rules don't fire until after the menu is cleared. This means that extension such as Flexible Windows that have critical startup code in when play begins need to be adjusted. Due to weaknesses in Inform's extension interactions, this has to be in story.ni rather than the Kerkerkruip Glimmr Additions extension.]

The allocate rocks rule is not listed in the when play begins rules. The allocate rocks rule is listed before the show the title screen rule in the startup rules.
The initial hyperlink request rule is not listed in the when play begins rules. The initial hyperlink request rule is listed before the show the title screen rule in the startup rules.

Section - Relist rock validation rule (not for release)

The rock validation rule is not listed in the when play begins rules. The rock validation rule is listed before the show the title screen rule in the startup rules.


Chapter - Menu code adjustments

Before displaying:
	open the status window.


Chapter - Multiple windows test

Table of Common Color Values (continued)
glulx color value	assigned number
g-window-color	15658734
g-header-color	14540253
g-humanist-crimson	10231552



The back-colour of the main-window is g-white.[For CocoaGlk]

The stats-window is a text-buffer g-window spawned by the main-window. The back-colour is g-window-color. The measurement is 30. The position is g-placeright.

The stat-header-window is a text-buffer g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size. The back-colour is g-header-color.

The powers-window is a text-buffer g-window spawned by the stats-window. The back-colour is g-window-color. The measurement is 55. The position is g-placebelow.

The powers-header-window is a text-buffer g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-header-color.

The border-1-window is a graphics g-window spawned by the main-window. The measurement is 6. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-2-window is a graphics g-window spawned by the stats-window. The measurement is 6. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-3-window is a graphics g-window spawned by the stats-window. The measurement is 2. The position is g-placeright. The scale method is g-fixed-size.  The back-colour is g-white.

The border-4-window is a graphics g-window spawned by the powers-window. The measurement is 2. The position is g-placebelow. The scale method is g-fixed-size.  The back-colour is g-white.

The border-5-window is a graphics g-window spawned by the stats-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

The border-6-window is a graphics g-window spawned by the powers-window. The measurement is 1. The position is g-placeabove. The scale method is g-fixed-size.  The back-colour is g-humanist-crimson.

Window-drawing rule for the stats-window (this is the construct stats window rule):
	move focus to stats-window, clearing the window;
	consider the side-window stats rule;[show statistics]
	say "[line break][run paragraph on]";
	consider the status rules;[show point distribution message]
	return to main screen.
	
This is the side-window stats rule:[adapted from the show basic stats rule, to use fixed width type.]
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
	say roman type.
	
Window-drawing rule for the stat-header-window (this is the construct stat header window rule):
	move focus to stat-header-window, clearing the window;
	say "[first custom style]Statistics[roman type]";
	return to main screen.
	
Window-drawing rule for the powers-header-window (this is the construct powers header window rule):
	move focus to powers-header-window, clearing the window;
	say "[first custom style]Powers[roman type]";
	return to main screen.

Window-drawing rule for the powers-window (this is the construct power window rule):
	move focus to powers-window, clearing the window;
	let pow be the number of granted powers;
	if pow is 0:
		say "[bold type]You have not yet acquired any special powers[roman type].";
	otherwise:
		consider the status skill rules;
	if pow < 3:
		say "[line break][italic type]Tip:[roman type] [one of]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5[or]When you absorb an enemy's soul, it fully heals you, increases your statistics, and grants you a special power[or]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it[or]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body[or]Level 0 monsters never grant you health or powers[or]Some monsters form groups, and you will have to kill the entire group before power transferal happens[or]Maximising the number of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys of success in [italic type]Kerkerkruip[roman type][at random]."; 
	return to main screen.
	
Last when play begins (this is the open up game windows rule):
	open side windows;
	open the status window;
	
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
	
To set up styles for side windows:
	apply assigned number of g-humanist-crimson color to special-style-1;
	apply bold-weight boldness to special-style-1;
	apply fixed-width-ness fixed-width-font to special-style-2;
	apply bold-weight boldness to special-style-2.
	
To place border (win - a graphics g-window):
	if glulx graphics is supported:
		open up win.
		
Before reading a command (this is the refresh side windows rule):
	follow the window-drawing rules for the stats-window;
	follow the window-drawing rules for the powers-window;
	
Before displaying when in-game menu-checking:
	close side windows.
	
After displaying when in-game menu-checking:
	close the status window;
	consider the open up game windows rule.
	
After restoring from a saved game:
	close the status window;
	close side windows;
	consider the open up game windows rule.
