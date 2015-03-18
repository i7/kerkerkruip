Kerkerkruip Start and Finish by Victor Gijsbers begins here.

Use authorial modesty.

[ Start and finish takes care of:
	showing the title screen and help menu
	handling difficultly levels
	winning and losing
]


To say Kerkerkruip:
	say "[italic type]Kerkerkruip[roman type]".


Chapter - The title screen activity

Showing the title screen is an activity.

[ Show the title screen in the place of the when play begins rules ]

The show the title screen rule is listed instead of the when play begins stage rule in the startup rules.
This is the show the title screen rule:
	carry out the showing the title screen activity;

Last after showing the title screen:
	follow the when play begins rules;



Section - Detecting whether or not the Gargoyle config file has been applied

[ We can detect whether or not the Gargoyle config file has been applied by checking whether one of the text colours has been changed. Warning, user style 2 will be pretty ugly if it has! ]

GarGlk is an IO implementation.

To decide whether the gargoyle config file was used:
	(- DetectGargoyleConfigFile() -).

Include (-
[ DetectGargoyleConfigFile res;
	! Don't test the style in CocoaGlk because it will crash
	if ( ~~(+ CocoaGlk detection flag +) )
	{
		res = glk_style_measure( gg_mainwin, style_User2, stylehint_TextColor, gg_arguments );
	}
	return res && gg_arguments-->0 == $F400A1;
];
-).

An IO implementation detection rule (this is the test for GarGlk rule):
	if the Gargoyle config file was used:
		rule succeeds with result GarGlk;



Section - Screen reader mode

[ Take care of screen reader mode, graphics and hyperlinks ]
Before showing the title screen (this is the check screen reader rule):
	if screen reader mode is unset:
		if the current IO implementation is GarGlk:
			if main menu graphics flag are unset:
				enable main menu graphics flag, table only;
			if menu hyperlinks are unset:
				enable menu hyperlinks, table only;
			disable screen reader mode;
			continue the activity;
		say "[Kerkerkruip] has a mode optimised for those using a screen reader.[paragraph break][bold type]Enable[roman type] the screen reader mode? Please enter:  [bold type]Y[roman type]es or [bold type]N[roman type]o[paragraph break]This option, as well as other interface options, can be changed later from the Options menu.[paragraph break][paragraph break]";
		while 1 is 1:
			let key be the chosen letter;
			if key is 89 or key is 121: [Y]
				if menu hyperlinks are unset:
					enable menu hyperlinks, table only;
				disable main menu graphics flag, table only;
				disable window panels flag, table only;
				enable screen reader mode;
				break;
			if key is 78 or key is 110: [N]
				if main menu graphics flag are unset:
					enable main menu graphics flag, table only;
				if menu hyperlinks are unset:
					disable menu hyperlinks, table only;
				disable screen reader mode;
				break;
		clear the main window;



Section - Sounds

Sound of Music is the file "Kerkerkruip Main Theme.ogg".


Section - The difficulty level

The difficulty is a number that varies.

Before showing the title screen (this is the set difficulty rule):
	now difficulty is setting of current difficulty;

To set difficulty to (x - number):
	now difficulty is x;
	set current difficulty to difficulty;


Section - Player stats

[ Must be done before showing the title screen as some difficulty labels are gendered! But we do it again after so that it will use the xorshift generator. ]
Before showing the title screen (this is the set gender rule):
	if a random chance of 1 in 2 succeeds:
		now the player is male;
	otherwise:
		now the player is female;

The set gender rule is listed in the after showing the title screen rules.

After showing the title screen (this is the set up initial scores for the player rule):
	now permanent health of the player is 13;
	now melee of the player is 1;
	now defence of the player is 7;
	now body score of the player is 5;
	now mind score of the player is 5;
	now spirit score of the player is 5;
	give the player a stat bonus;
	give the player a stat bonus;
	give the player a stat penalty;
	restore the health of the player;

To give the player a stat bonus:
	let i be a random number between 1 and 4;
	if i is 1:
		increase permanent health of the player by 1;
	if i is 2:
		increase body score of the player by 1;
	if i is 3:
		increase mind score of the player by 1;
	if i is 4:
		increase spirit score of the player by 1.

To give the player a stat penalty:
	let i be a random number between 1 and 4;
	if i is 1:
		decrease permanent health of the player by 1;
	if i is 2:
		decrease body score of the player by 1;
	if i is 3:
		decrease mind score of the player by 1;
	if i is 4:
		decrease spirit score of the player by 1.



Section - Applying the difficulty

After showing the title screen (this is the apply the difficulty rule):
[	if difficulty is 0:
		increase health of the player by 5;
		increase permanent health of the player by 5;
		increase melee of the player by 1;
		increase defence of the player by 2;]
	if difficulty is 0:
		increase health of the player by 3;
		increase permanent health of the player by 3;
		increase melee of the player by 1;		
		increase defence of the player by 1;
	if difficulty is 1:
		increase health of the player by 1;
		increase permanent health of the player by 1;
		increase defence of the player by 1;
	[ This code should be moved to rogue equiping rules ]
	let k be 14 + difficulty;
	repeat with guy running through monsters:
		now health of guy is (k times health of guy) / 20;
	if difficulty is greater than 2:
		let n be difficulty - 2;
		while temporarily disabling the xorshift generator:
			repeat with guy running through monsters:
				repeat with i running from 1 to n:
					buff guy;
			
To buff (guy - a person):
	let m be a random number between 1 and 8;
	if m is 1:
		increase melee of guy by 1;
	if m is 2:
		increase defence of guy by 1;
	if m is 3:
		increase body score of guy by 1;
	if m is 4:	
		increase mind score of guy by 1;
	if m is 5:	
		increase spirit score of guy by 1.





Chapter - Introduction Menu

[Much of this code has been stolen from Jon Ingold's Title Page.]

Figure opening figure is the file "smallercover.jpg".

Showing the text title screen is a truth state variable.

Rule for showing the title screen (this is the text title screen rule):
	shut down the status window; [in case we've come to the menu with it open]
	display the text menu;
	play the theme music;
	while 1 is 1:
		now showing the text title screen is true;
		let key be the chosen letter;
		cancel character input in the main window;
		now showing the text title screen is false;
		follow the menu command rules for key;
		if the outcome of the rulebook is the start the game outcome:
			fade out the theme music;
			close the text menu;
			make no decision;
		otherwise if the outcome of the rulebook is the quit outcome:
			stop the background channel;
			stop the game abruptly;
		otherwise if the outcome of the rulebook is the redraw the menu outcome:
			display the text menu;

To display the text menu:
	cancel character input in the main window;
	clear the screen;
	[redraw status line;
	say paragraph break;]	
	if glulx text-buffer graphics is supported:
		display figure opening figure[ centered];
	otherwise:
		say "[bold type]Kerkerkruip[roman type] -- by Victor Gijsbers";
	say paragraph break;			
	say fixed letter spacing;		
	[say "'[story title]' by [story author]";
	say paragraph break;]
	say " SCORES:[line break]";
	say "   Current level                :  [difficulty level difficulty] ([difficulty])[paragraph break]";
	let best-level be setting of highest achieved difficulty;
	say "   Highest level achieved       :  [difficulty level best-level] ([best-level])[line break][paragraph break]";
	say "   Your total victories         :  [number of total victories][line break]";		
[		say "   Your current winning streak  :    [unless winning-streak is greater than 9] [end if][unless winning-streak is greater than 99] [end if] [winning-streak][line break]";
	say "   Your best winning streak     :  [unless best-winning-streak is greater than 9] [end if][unless best-winning-streak is greater than 99] [end if]   [best-winning-streak][paragraph break]";]
	say paragraph break;
	say " ACTIONS:[line break]";
	[if menu hyperlinks are enabled:
		set menu hyperlink for 32;
		say "   [if the file of save data exists]Continue the game[otherwise]New game         [end if]            :    (SPACE)[line break]";
		end menu hyperlink;
		if the file of save data exists:
			set menu hyperlink for 78;
			say "   New game                     :       N   [line break]";
		set menu hyperlink for 83;
		say "   Load a specific dungeon seed :       S   [line break]";
		set menu hyperlink for 77;
		say "   Display menu                 :       M   [line break]";
		set menu hyperlink for 79;
		say "   Options                      :       O   [line break]";
		set menu hyperlink for 81;
		say "   Quit                         :       Q   [line break]";
		end menu hyperlink;
	otherwise:]
	say "   [if the file of save data exists]Continue the game[otherwise]New game         [end if]            :    (SPACE)[line break]";
	if the file of save data exists:
		say "   New game                     :       N[line break]";
	say "   Load a specific dungeon seed :       S[line break]";
	say "   Display menu                 :       M[line break]";
	say "   Options                      :       O[line break]";
	say "   Quit                         :       Q[line break]";
	say variable letter spacing;

[A glulx input handling rule for a hyperlink-event while showing the text title screen is true (this is the intercept the main menu hyperlinks rule):
	if menu hyperlinks are enabled:
		convert the hyperlink code to the character code;
		request hyperlink input again;
		replace player input;]

To close the text menu:
	say "closed the text menu";
	clear the screen; 
	say "cleared the screen";

To say difficulty level (m - a number):
	if m is 0:
		say "NOVICE[run paragraph on]";
	if m is 1:
		say "APPRENTICE[run paragraph on]";
	if m is 2:
		say "ADEPT[run paragraph on]";
	if m is 3:
		say "EXPERT[run paragraph on]";
	if m is 4:
		say "MASTER[run paragraph on]";		
	if m is 5:
		say "GRANDMASTER[run paragraph on]";
	if m is 6:
		say "[if player is not female]PRINCE[otherwise]PRINCESS[end if][run paragraph on]";
	if m is 7:
		say "[if player is not female]KING[otherwise]QUEEN[end if][run paragraph on]";
	if m is 8:
		say "[if player is not female]EMPEROR[otherwise]EMPRESS[end if][run paragraph on]";
	if m is 9:
		say "DEMON[run paragraph on]";
	if m is 10:
		say "ANGEL[run paragraph on]";
	if m is greater than 10:
		say "[if player is not female]GOD[otherwise]GODDESS[end if][run paragraph on]".

Section - Menu commands

The menu command rules are a number based rulebook. The menu command rules have outcomes redraw the menu, quit and start the game.

[ N: new ]
Definition: a number is new:
	if it is 110, yes;
	if it is 78, yes;
	no.
Menu command new:
	if file of save data exists:
		delete file of save data;
		unless difficulty is less than 2:
			set difficulty to (difficulty - 1);
	start the game;

[ Space/Enter/C: continue ]
Definition: a number is continue:
	if it is 32, yes;
	if it is -6, yes;
	if it is 67, yes;
	if it is 99, yes;
	no.
Menu command continue:
	start the game;
	
[ S: play a specific dungeon seed ]
Definition: a number is seed:
	if it is 115, yes;
	if it is 83, yes;
	no.
Menu command seed:
	clear the screen;
	say "[line break][bold type]Load a specific dungeon seed[roman type][paragraph break]Please enter a dungeon seed, or press Enter to return to the menu.[paragraph break]";
	[ Note: also accepts Esc (if supported by the terp ]
	while 1 is 1:
		say "> [run paragraph on]";
		request a seed;
		let T be "[the player's command]";
		if T is "":
			redraw the menu;
		if number of characters in T is 8 or number of characters in T is 12:
			if T exactly matches the regular expression "<0-9a-fA-F>+":
				process the seed for T;
				if number of characters in T is 12:
					process the seed check for T;
				break;
		say "That is not a valid dungeon seed. Please try again, or press Enter to return to the menu.[paragraph break]";
	say "[paragraph break]Please enter a difficulty level, or press Enter to use your current level.[paragraph break]";
	while 1 is 1:
		say "> [run paragraph on]";
		request a seed;
		let T be "[the player's command]";
		if T is "":
			break;
		if T exactly matches the regular expression "<0-9>+":
			process the level for T;
			break;
		say "Please enter a number, or press Enter to use your current level.[paragraph break]";
	[ Should we decrease the difficulty here like we do when starting a new random game? ]
	delete file of save data;
	start the game;

To request a seed: (- seed_request(); -).
To process the seed for (T - a text): (- seed_process( {T} ); -).
To process the seed check for (T - a text): (- seed_process_check( {T} ); -).
To process the level for (T - a text): (- level_process( {T} ); -).

Include (-

Array seed_esc_terminator -> 1;
[ seed_request res;
	seed_esc_terminator-->0 = keycode_Escape;
	res = glk_gestalt( gestalt_LineTerminators, 0 );
	if ( res )
	{
		glk_set_terminators_line_event( gg_mainwin, seed_esc_terminator, 1);
	}
	KeyboardPrimitive( buffer, parse );
	players_command = 100 + WordCount();
	if ( res )
	{
		glk_set_terminators_line_event( gg_mainwin, NULL, 0 );
	}
];

[ seed_process txt p1 cp1 i ch progress;
	! Transmute the text
	cp1 = txt-->0;
	p1 = TEXT_TY_Temporarily_Transmute( txt );
	for ( i = 0 : i < 8 : i++ )
	{
		! Decode the hex characters
		ch = BlkValueRead( txt, i );
		if ( ch >= '0' && ch <= '9' )
		{
			progress = progress * 16 + ch - '0';
		}
		else if ( ch >= 'A' && ch <= 'F' )
		{
			progress = progress * 16 + ch - 55;
		}
		else if ( ch >= 'a' && ch <= 'f' )
		{
			progress = progress * 16 + ch - 87;
		}
	}
	(+ the dungeon generation seed +) = progress;
	! Clean up
	TEXT_TY_Untransmute( txt, p1, cp1 );
];

[ seed_process_check txt p1 cp1 i ch progress;
	! Transmute the text
	cp1 = txt-->0;
	p1 = TEXT_TY_Temporarily_Transmute( txt );
	for ( i = 8 : i < 12 : i++ )
	{
		! Decode the hex characters
		ch = BlkValueRead( txt, i );
		if ( ch >= '0' && ch <= '9' )
		{
			progress = progress * 16 + ch - '0';
		}
		else if ( ch >= 'A' && ch <= 'F' )
		{
			progress = progress * 16 + ch - 55;
		}
		else if ( ch >= 'a' && ch <= 'f' )
		{
			progress = progress * 16 + ch - 87;
		}
	}
	(+ the dungeon generation check +) = progress;
	! Clean up
	TEXT_TY_Untransmute( txt, p1, cp1 );
];

[ level_process txt p1 cp1 dsize i progress;
	! Transmute the text
	cp1 = txt-->0;
	p1 = TEXT_TY_Temporarily_Transmute( txt );
	dsize = TEXT_TY_CharacterLength( txt );
	for ( i = 0 : i < dsize : i++ )
	{
		progress = progress * 10 + BlkValueRead( txt, i ) - '0';
	}
	(+ difficulty +) = progress;
	! Clean up
	TEXT_TY_Untransmute( txt, p1, cp1 );
];

-);

[ Q: quit ]
Definition: a number is quit:
	if it is 113, yes;
	if it is 81, yes;
	no.
Menu command quit:
	quit;

[ O: options menu / can't call it options as it conflicts with the table name ]
Definition: a number is settings:
	if it is 111, yes;
	if it is 79, yes;
	no.
Menu command settings:
	display the (Table of Options Menu) menu with title "Options";
	redraw the menu;

[ H/M: menu ]
Definition: a number is showmenu:
	if it is 104, yes;
	if it is 72, yes;
	if it is 109, yes;
	if it is 77, yes;
	no.
Menu command showmenu:
	display the Table of Kerkerkruip Help menu with title "Kerkerkruip";
	redraw the menu;



Chapter - Options Menu

Table of Options Menu
title	order	rule	hidden-row
"[bold type]Interface options"	1	--	--

To hide option (N - a number):
	now the hidden-row corresponding to order of N in Table of Options Menu is true;

To show option (N - a number):
	[blank out the hidden-row corresponding to order of N in Table of Options Menu;] [Inform has a bug which means it can't do this :(]
	repeat through Table of Options Menu:
		if the order entry is N:
			blank out the hidden-row entry;
			stop;

[Section - Screen reader mode

Before showing the title screen (this is the screen reader mode rule):
	if screen reader mode is enabled:
		now disable the popover menu window is true;
	otherwise:
		now disable the popover menu window is false;

Table of Options Menu (continued)
title	order	rule
"Screen reader mode: [bold type][if screen reader mode is disabled]Off[otherwise]On[end if]"	10	the toggle screen reader mode rule	

This is the toggle screen reader mode rule:
	toggle screen reader mode;
	if screen reader mode is enabled:
		hide option 30;
		show option 31;
	otherwise:
		show option 30;
		hide option 31;
	update graphical menu rows;

To update graphical menu rows:
	do nothing;

The update the disable the popover menu window setting rule is listed after the switch back to the main-window rule in the after displaying rules.
Last after displaying rule (this is the update the disable the popover menu window setting rule):
	if screen reader mode is enabled:
		now disable the popover menu window is true;
	otherwise:
		now disable the popover menu window is false;]

[Section - Menu graphics (for use with Kerkerkruip Glimmr Additions by Erik Temple)

Changed graphics option is a truth state variable.

Table of Options Menu (continued)
title	order	rule
"Graphical menu: [bold type][if main menu graphics flag are enabled]On[otherwise]Off[end if][roman type]"	20	the toggle menu graphics rule
"Graphical menu: [italic type]Disabled in screen reader mode"	21	--
"Graphical menu: [italic type]Not possible in this interpreter"	22	--

An entering a menu rule for the Table of Options Menu (this is the show graphics rows rule):
	update graphical menu rows;

To update graphical menu rows:
	hide option 20;
	hide option 21;
	hide option 22;
	if screen reader mode is enabled:
		show option 21;
	otherwise:
		if full graphics support is true:
			show option 20;
		otherwise:
			show option 22;

This is the toggle menu graphics rule:
	toggle main menu graphics flag;
	now changed graphics option is true;

A last exiting a menu rule (this is the restart if graphics were changed rule):
	if changed graphics option is true and the showing the title screen activity is going on and menu depth is 1:
		enable session flag;
		restart immediately;

To restart immediately: 
	(- @restart; -).]

[Section - Info panels

Table of Options Menu (continued)
title	order	rule
"Information panels: [bold type][if window panels flag are disabled]Off[otherwise]On[end if]"	30	the toggle info panels rule
"Information panels: [italic type]Disabled in screen reader mode"	31	--

An entering a menu rule for the Table of Options Menu (this is the show panels rows rule):
	if screen reader mode is enabled:
		hide option 30;
		show option 31;
	otherwise:
		show option 30;
		hide option 31;

This is the toggle info panels rule:
	toggle window panels flag;]

[Section - Menu hyperlinks

[ Menu hyperlinks are automatically enabled or disable above in the screen reader rule, but the user can also change the option if they want ]
Before showing the title screen (this is the enable menu hyperlinks rule):
	if glulx hyperlinks are supported and menu hyperlinks are enabled:
		now enable menu hyperlinks is true;
	otherwise:
		now enable menu hyperlinks is false;

Table of Options Menu (continued)
title	order	rule	
"[hyperlinks options]"	40	the toggle menu hyperlinks rule

To say hyperlinks options:
	say "Clickable menus: [bold type][if menu hyperlinks are enabled]On[otherwise]Off[end if][italic type][unless glulx hyperlinks are supported] (note: not supported in this interpreter)[otherwise if menu hyperlinks are disabled and enable menu hyperlinks is true] (note: will take affect once you leave this menu)[end if]";

[ If we turn on hyperlinks, turn them on immediately. If turning them off, wait until we leave the menu, which the next rule handles ]
This is the toggle menu hyperlinks rule:
	if menu hyperlinks are enabled:
		disable menu hyperlinks;
	otherwise:
		enable menu hyperlinks;
		if glulx hyperlinks are supported:
			now enable menu hyperlinks is true;

An exiting a menu rule for the Table of Options Menu (this is the disable hyperlinks rule):
	if menu hyperlinks are disabled:
		now enable menu hyperlinks is false;]

Section - Sound

Table of Options Menu (continued)
title	order	rule
"Sound: [bold type][if sound is enabled]On[otherwise]Off[end if]"	50	the toggle theme music rule

This is the toggle theme music rule:
	toggle sound;
	toggle the theme music.

To toggle the theme music:
	if the showing the title screen activity is going on:
		if sound is disabled:
			pause background channel;
		otherwise:
			if new glulx sound features are supported:
				unpause the background channel;
			otherwise:
				play sound of music in background channel, looping.

Section - Victories

[ Reset victories with the option to undo. If playing a game the option to undo is available until the player ends their game. ]

Reset the victories is a truth state variable.

Table of Options Menu (continued)
title	order	rule
""	60	--
"[bold type]Game records"	61	--
"Total victories: [if reset the victories is false][number of total victories][otherwise]0[end if]"	62	--
"Reset your victory records"	63	the resetting rule
[""	64	--]
"Your victories records have been reset"	65	--
"Undo"	66	the resetting rule

An entering a menu rule for the Table of Options Menu (this is the show victories reset rows rule):
	if reset the victories is false:
		if the number of total victories > 0:
			show option 63;
			[show option 64;]
		otherwise:
			hide option 63;
			[hide option 64;]
		hide option 65;
		hide option 66;

This is the resetting rule:
	if reset the victories is false:
		now reset the victories is true;
		hide option 63;
		[hide option 64;]
		show option 65;
		show option 66;
	otherwise:
		now reset the victories is false;
		show option 63;
		[show option 64;]
		hide option 65;
		hide option 66;
	show the level rows;

An exiting a menu rule for the Table of Options Menu (this is the reset victories immediately if not in a game rule):
	if the showing the title screen activity is going on:
		if reset the victories is true or number of total victories is 0:
			now reset the victories is false;
			set total victories to 0, table only;
			set highest achieved difficulty to 0, table only;
			if difficulty is not novice option:
				set difficulty to novice option;
				delete file of save data;

First after printing the player's obituary (this is the reset victories rule):
	if reset the victories is true or number of total victories is 0:
		set total victories to 0, table only;
		set highest achieved difficulty to 0, table only;
		unless the player is victorious:
			set difficulty to novice option;

This is the other reset victories rule:
	follow the reset victories rule.
The other reset victories rule is listed before the lower difficulty on restart rule in the carry out restarting the game rules.

Section - Difficulty level

Novice option is a number variable. Novice option is 0. [ 0 = novice, 1 = apprentice ]

Last before showing the title screen (this is the set novice option rule):
	if the number of total victories is 0 and difficulty > 0:
		now novice option is 1;

Table of Options Menu (continued)
title	order	rule
""	70	--
"[difficulty level intro]"	71	--
"If you like you can"	72	--
"Skip ahead to Apprentice level"	73	the skip ahead to apprentice level rule
"Return to Novice level"	74	the skip ahead to apprentice level rule
"Unlock advanced content while staying at Novice level: [bold type][if advanced content is enabled]On[otherwise]Off"	75	the unlock everything rule

To say difficulty level intro:
	say "[if the showing the title screen activity is going on]Your difficulty level is: [otherwise]In your next game (unless you win) your difficulty level will be reset to: [end if][bold type][if novice option is 0]Novice[otherwise]Apprentice";

To show the level rows:
	if the number of total victories > 0 and reset the victories is false:
		repeat with N running from 70 to 75:
			hide option N;
	otherwise:
		show option 70;
		show option 71;
		show option 72;
		if novice option is 0:
			show option 73;
			hide option 74;
			show option 75;
		otherwise:
			hide option 73;
			show option 74;
			hide option 75;

An entering a menu rule for the Table of Options Menu (this is the show level rows rule):
	show the level rows

This is the skip ahead to apprentice level rule:
	if novice option is 0:
		now novice option is 1;
	otherwise:
		now novice option is 0;
	show the level rows;

This is the unlock everything rule:
	toggle advanced content;
				
Section - Achievements

Reset the achievements is a truth state variable.

Table of Options Menu (continued)
title	order	rule
""	80	--
"Reset achievements"	81	the achievement resetting rule
"Achievements have been reset"	82	--
"Undo"	83	the achievement resetting rule

An entering a menu rule for the Table of Options Menu (this is the show achievements rows rule):
	if Table of Held Achievements is empty:
		hide option 80;
		hide option 81;
	hide option 82;
	hide option 83;
	now reset the achievements is false;

This is the achievement resetting rule:
	if reset the achievements is false:
		now reset the achievements is true;
		hide option 81;
		show option 82;
		show option 83;
	otherwise:
		now reset the achievements is false;
		show option 81;
		hide option 82;
		hide option 83;

An exiting a menu rule for the Table of Options Menu (this is the reset achievements rule):
	if reset the achievements is true:
		blank out the whole of the Table of Held Achievements;
		write File of Achievements from Table of Held Achievements;
				
Section - Rogue stats

Reset the rogue stats is a truth state variable.

Table of Options Menu (continued)
title	order	rule
""	90	--
"Reset rogue statistics"	91	the rogue statistics resetting rule
"Rogue statistics have been reset"	92	--
"Undo"	93	the rogue statistics resetting rule

An entering a menu rule for the Table of Options Menu (this is the show rogue statistics rows rule):
	if the number of encountered npc people is 0:
		hide option 90;
		hide option 91;
	hide option 92;
	hide option 93;
	now reset the rogue stats is false;

This is the rogue statistics resetting rule:
	if reset the rogue stats is false:
		now reset the rogue stats is true;
		hide option 91;
		show option 92;
		show option 93;
	otherwise:
		now reset the rogue stats is false;
		show option 91;
		hide option 92;
		hide option 93;

An exiting a menu rule for the Table of Options Menu (this is the reset rogue stats rule):
	if reset the rogue stats is true:
		repeat with X running through npc people:
			if the ID of X is not 0:
				now X is not encountered;
				now the died count of X is 0;
				now the kill count of X is 0;
		update the monster statistics;



Chapter - Start

Started boolean is a truth state that varies. Started boolean is false.

Last when play begins (this is the introduction rule):
	say "[paragraph break]When you claimed that you were tough enough to take on Malygris single-handedly, everyone knew you had been drinking much more than was good for you. And the prince is not one to let an opportunity pass. Before you could so much as protest, his court mage opened a portal and you were shoved through. Predictably, the portal immediately disappeared. You doubt they're going to open it up again -- but at least you can try to make good on your boast and kill Malygris, the Wizard of Kerkerkruip!";
	now started boolean is true. [See section Victory message below.]

Section - Starting kits

[ We used to generate all random numbers in advance so that the number of random numbers generated doesn't depend on the difficulty... if that's a problem, we can probably just do starting kits later on after all dungeon generation is finished]

A starting kit can be rapier-based.

Last starting kit setup for the player (this is the player starting kit rule):
	if the selected kit of the player is rapier-based:
		equip the player with the gilded rapier;
	repeat with item running through things enclosed by the player:
		if item is a weapon or item is clothing:
			now item is not cursed;
			if the difficulty is less than 2:
				[should we always do this?]
				now the size of item is the size of the player;

buckler-kit is a rapier-based starting kit. [The only basic kit, so novice players without advanced content always have the same starting kit.]

Starting kit setup when selecting buckler-kit:
	equip the player with the buckler.
	
shadows-kit is an advanced starting kit. shadows-kit contains a scroll of shadows.

Starting kit setup when selecting shadows-kit:
	equip the player with the gorgeous dagger.

blade-kit is an advanced starting kit. blade-kit contains a scroll of protection and a scroll of the blade.

[blade-kit needs no special rules]

evil-kit is an advanced starting kit. evil-kit contains a scroll of death.

Starting kit setup when selecting evil-kit:
	equip the player with the evil dagger.
	
grenade-kit is an advanced starting kit. grenade-kit contains two fragmentation grenades and a Morphean grenade.

Starting kit setup when selecting grenade-kit:
	equip the player with Metastasio's hat.
	
pickaxe-kit is an advanced starting kit. pickaxe-kit contains a scroll of mapping.

Starting kit setup when selecting pickaxe-kit:
	equip the player with the pickaxe;		
	
teleport-kit is an advanced rapier-based starting kit. teleport-kit contains a scroll of teleportation.

[no special rules needed for teleport-kit]

addict-kit is an advanced rapier-based starting kit. The rarity is 2. [should we also require that the difficulty is at least 1? We may need to implement placement possible rules for starting kits if so]
	
Last starting kit setup when selecting addict-kit (this is the cursed amulet stays cursed rule):
	equip the player with the addict's amulet;
	have the ment kick in.
	
The cursed amulet stays cursed rule is listed after the player starting kit rule in the starting kit setup rules.

Chapter - The end

Section - Death message

Every turn (this is the player death rule):
	if the player is dead:
		unless the global attacker is the player:
			end the story saying "You were killed by [the name of the global attacker]";
		otherwise:
			end the story saying "You committed suicide. How unseemly!".


Section - Victory message

The victory message rules are a rulebook.

To decide whether the player is victorious:
	if started boolean is false:
		decide no;
	let counter be 0;
	repeat with guy running through alive not off-stage monsters:
		if the level of guy is 5:
			unless guy is player-enslaved:
				now counter is 1;
	if counter is 0:
		decide yes;
	if Malygris-lover is true:
		decide yes;
	if Drakul-victory is true:
		decide yes;
	if Montenoir-escape is true:
		decide yes;
	decide no.

Every turn (this is the victory rule):
	if the player is victorious:
		follow the victory message rules.

	
Last victory message rule (this is the normal victory message rule):		
	end the story saying "You have defeated Malygris! With his immense magical powers now at your disposal, it is time to teleport back to Montenoir and pay a little visit to the prince.";
	rule succeeds.

Victory message rule (this is the Nameless Horror message rule):
	if the Nameless Horror is follower:		
		end the story saying "You have won... technically. The Nameless Horror will find you soon, and your end will not be pretty.";
		rule succeeds.

Victory message rule (this is the enslaved Malygris message rule):
	if Malygris is player-enslaved:		
		end the story saying "You have turned Malygris into your slave!";
		rule succeeds.

To do the level 10 victory with (guy - a person):
	say "In slaying [the guy], you have done the impossible. You absorb its soul, and though this process leaves little of your own personality intact, your powers increase a thousandfold. Even the gods bow to you.";
	end the story saying "You reign eternally!".


Section - What happens after the obituary

First after printing the player's obituary (this is the reset prompt for death or victory rule):
	now the command prompt is the peaceful prompt.

After printing the player's obituary (this is the update the difficulty rule):
	if the player is victorious:
		increase the total victories by 1, table only;
		increase difficulty by 1; [We want to go from easy to normal difficulty.]
		if difficulty is 1:
			say "[paragraph break][bold type]You have defeated Malygris on easy mode, proving that you understand the basics of the game! Next time, Kerkerkruip will start in normal mode. From now on new items, rogues and places will be available. Have fun![roman type][paragraph break]";
		if difficulty is greater than setting of highest achieved difficulty:
			set highest achieved difficulty to difficulty, table only;
	otherwise:
		unless difficulty is less than 2:
			decrease difficulty by 1;
	set current difficulty to difficulty;



Section - The final question

[First stuff to get around an Inform 7 bug.]
Table of Literal Topics
text	topic
"new"	"new"

When play begins: 
	choose row with a final response rule of immediately restore saved game rule in the Table of Final Question Options; 
	blank out the whole row;
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options; 
	blank out the whole row;
	choose a row with a text of "new" in the Table of Literal Topics;
	let new be the topic entry;	
	choose row with a final response rule of immediately restart the VM rule in the Table of Final Question Options;
	now topic entry is new;
	now final question wording entry is "start a NEW game";


Section - Quitting
[I7's quitting the game action is a bit odd in that there is no hook for when the player actually quits the game. Any interventions in the carry out quitting the game rule happen before the player confirms quitting. So we create a new hook.]

Include (-

[ QUIT_THE_GAME_R;
	if (actor ~= player) rfalse;
	if ((actor == player) && (untouchable_silence == false))
		QUIT_THE_GAME_RM('A');
	if (YesOrNo()~=0) FollowRulebook( (+finally quitting the game rules+) );
];
-) instead of "Quit The Game Rule" in "Glulx.i6t".

Finally quitting the game is a rulebook.

The last finally quitting the game rule:
	follow the immediately quit rule.

To stop the/-- game abruptly:
	[overrides the same phrase defined in Basic Screen Effects]
	follow the finally quitting the game rules.


Section - Lower the difficulty when restarting

First carry out restarting the game (this is the lower difficulty on restart rule):
	unless player is victorious:
		unless difficulty is less than 2:
			set difficulty to (difficulty - 1);


Chapter - Sound

Before showing the title screen (this is the setting up sound rule):
	if glulx sound is supported:
		if sound is unset:
			enable sound.

To play the theme music:
	set up sound channels;
	now the volume of the background is the initial volume of the background;
	set simple volume for background channel to initial volume of background;
	play sound of music in background channel, looping;
	if sound is disabled:
		pause background channel;[the music is always "playing", but if we've disabled it, it plays on a paused channel--if the interpreter supports it]

Finally quitting the game (this is the stop sounds on quit rule):
	[Gargoyle's handling of sounds is buggy; if you quit the game and close the terp window, sounds may continue playing. It can't hurt to stop all sounds when the game is quit, so we do that here]
	repeat with selected running through sound-channels:
		stop selected channel.


Section - Fading out the theme music A (for use with Kerkerkruip Glimmr Additions by Erik Temple)

To fade out the theme music:
	animate the music-fading track as a custom animation at 8 fps with a duration of (initial volume of the background) frames;
	delay input until all animations are complete.



Section - Fading out the theme music B (for use without Kerkerkruip Glimmr Additions by Erik Temple)

[This is used only for the text menu--the graphics menu uses an animation track.]

Fading music is a truth state variable. Fading music is false.

To fade out the theme music:
	now fading music is true;
	start a 130 millisecond timer.

A glulx timed activity rule when fading music is true (this is the fade theme music rule):
	decrement the volume of the background;
	set simple volume for background channel to volume of background;
	if volume of the background is 0:
		now fading music is false;
		stop the timer.

To start a/-- (T - a number) millisecond timer:
	(- if (glk_gestalt(gestalt_Timer, 0)) glk_request_timer_events({T});  -)
	
To stop the/-- timer:
	(- if (glk_gestalt(gestalt_Timer, 0)) glk_request_timer_events(0); -)


Section - Basic sound support
[Adds support for looping, the background sound channel, pausing, and volume control.]

The maximum sound volume is a number variable. The maximum sound volume is 10.

A sound-channel is a kind of thing.
A sound-channel has a number called the ref-number. [Ref-number is linked to an I6 property by code in Flexible Windows]
A sound-channel has a number called the volume. The volume of a sound-channel is usually 10.
A sound-channel has a number called the initial volume. The initial volume of a sound-channel is usually 10.

Foreground and background are sound-channels.

To say resource number of (S - a sound name):
	(- print ResourceIDsOfSounds-->{S} ; -).

To set up sound channels:
	repeat with item running through sound-channels:
		now the ref-number of item is the internal number of item;

To decide what number is internal number of (C - foreground):
	(- gg_foregroundchan -)

To decide what number is internal number of (C - background):
	(- gg_backgroundchan -)

To play (sound - a sound-name) in (channel - a sound-channel) channel, looping, with notification:
	(- SoundPlay(ResourceIDsOfSounds-->{sound},{channel},{phrase options}); -)

To set simple volume for (channel - a sound-channel) channel to (volume - a number):
	(- SetVolume({channel},{volume}); -)

To stop (channel - a sound-channel) channel:
	(- SoundCease({channel}); -)

To decide whether new glulx sound features are supported:
	(- ( glk_gestalt(gestalt_Sound2, 0) ) -)

To pause (channel - a sound-channel) channel:
	(- SoundPause({channel}); -)

To unpause (channel - a sound-channel) channel:
	(- SoundUnpause({channel}); -)


Include (- 

[ SoundPlay sound chan options;
	if (glk_gestalt(gestalt_Sound,0)) {
		glk_schannel_play_ext(chan.(+ ref-number +), sound, -(options & 1), options & 2); 
	}
];

[ SetVolume chan vol;
	if (glk_gestalt(gestalt_SoundVolume,0)) {
		if ((vol <= (+ maximum sound volume +)) && (vol > 0)) {
			glk_schannel_set_volume(chan.(+ ref-number +), (vol * (65535 / (+ maximum sound volume +)))+1);
		}
		else {
			glk_schannel_set_volume(chan.(+ ref-number +), 0);
		}
	}
];

[ SoundCease chan;
	if ( glk_gestalt(gestalt_Sound,0) && chan.(+ ref-number +) ) {
		glk_schannel_stop(chan.(+ ref-number +));
	}
];

[ SoundPause chan;
	if (glk_gestalt(gestalt_Sound2,0)) {
		glk_schannel_pause(chan.(+ ref-number +));
	}
	else {
		SoundCease(chan);
	}
];

[ SoundUnpause chan;
	if (glk_gestalt(gestalt_Sound2,0)) {
		glk_schannel_unpause(chan.(+ ref-number +));
	}
];

-) after "Figures.i6t".

Kerkerkruip Start and Finish ends here.
