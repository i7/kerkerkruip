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
	consider the when play begins rules;



Section - Detecting whether or not the Gargoyle config file has been applied

[ We can detect whether or not the Gargoyle config file has been applied by checking whether one of the text colours has been changed. Warning, user style 2 will be pretty ugly if it has! ]

The Gargoyle config file was used is a truth state variable.

First before showing the title screen (this is the detect whether the config file has been applied rule):
	unless the current IO implementation is CocoaGlk:
		detect the gargoyle config file;

To detect the gargoyle config file:
	(- DetectGargoyleConfigFile(); -).

Include (-
[ DetectGargoyleConfigFile	res;
	res = glk_style_measure( gg_mainwin, style_User2, stylehint_TextColor, gg_arguments );
	if ( res && gg_arguments-->0 == $F400A1 )
	{
		(+ the Gargoyle config file was used +) = 1;
	}
];
-).



Section - Sounds

Sound of Music is the file "Kerkerkruip Main Theme.ogg".


Section - The difficulty level

The difficulty is a number that varies.

Before showing the title screen:
	now difficulty is setting of current difficulty;

To set difficulty to (x - number):
	now difficulty is x;
	set current difficulty to difficulty;


Section - Player stats

[ Must be done before showing the title screen as some difficulty labels are gendered! ]
Before showing the title screen (this is the set gender rule):
	if a random chance of 1 in 2 succeeds:
		now the player is male;
	otherwise:
		now the player is female;

First after showing the title screen (this is the set up initial scores for the player rule):
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
	let k be 7 + difficulty;
	repeat with guy running through monsters:
		now health of guy is (k times health of guy) / 10;
	if difficulty is greater than 2:
		let n be difficulty - 2;
		repeat with guy running through monsters:
			repeat with i running from 1 to n:
				buff guy.
			
To buff (guy - a person):
	let m be a random number between 1 and 5;
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
	shut down the status-window;[in case we've come to the menu with it open]
	display the text menu;
	play the theme music;
	while 1 is 1:
		now showing the text title screen is true;
		let key be the chosen letter;
		cancel character input in the main window;
		now showing the text title screen is false;
		let action be the rule produced by the menu command rules for key;
		if the outcome of the rulebook is the start the game outcome:
			fade out the theme music;
			close the text menu;
			make no decision;
		otherwise if the outcome of the rulebook is the quit outcome:
			stop the background channel;
			stop the game abruptly;
		otherwise if rule succeeded:
			close the text menu;
			consider action;
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
	if menu hyperlinks are enabled:
		set menu hyperlink for 32;
		say "   [if the file of save data exists]Continue the game[otherwise]New game         [end if]            :    (SPACE)[line break]";
		end menu hyperlink;
		if the file of save data exists:
			set menu hyperlink for 78;
			say "   New game                     :       N   [line break]";
		if difficulty is 0:
			set menu hyperlink for 83;
			say "   Skip to Apprentice level     :       S   [line break]";
		set menu hyperlink for 77;
		say "   Display menu                 :       M   [line break]";
		set menu hyperlink for 79;
		say "   Options                      :       O   [line break]";
		set menu hyperlink for 81;
		say "   Quit                         :       Q   [line break]";
		end menu hyperlink;
	otherwise:
		say "   [if the file of save data exists]Continue the game[otherwise]New game         [end if]            :    (SPACE)[line break]";
		if the file of save data exists:
			say "   New game                     :       N[line break]";
		if difficulty is 0:
			say "   Skip to Apprentice level     :       S[line break]";
		say "   Display menu                 :       M[line break]";
		say "   Options                      :       O[line break]";
		say "   Quit                         :       Q[line break]";
	say variable letter spacing;

A glulx input handling rule for a hyperlink-event while showing the text title screen is true (this is the intercept the main menu hyperlinks rule):
	if menu hyperlinks are enabled:
		convert the hyperlink code to the character code;
		request hyperlink input again;
		replace player input;

To close the text menu:
	clear the screen; 

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

The menu command rules are a number based rulebook producing a rule. The menu command rules have outcomes quit and start the game.

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
	
[ S: skip to apprentice level ]
Definition: a number is skip:
	if it is 115, yes;
	if it is 83, yes;
	no.
Menu command skip:
	if difficulty is 0:
		set difficulty to 1;
		delete file of save data;
		start the game;

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
	rule succeeds with result the show the options menu rule;

This is the show the options menu rule:
	display the (Table of Options Menu) menu with title "Options";

[ H/M: menu ]
Definition: a number is menu:
	if it is 104, yes;
	if it is 72, yes;
	if it is 109, yes;
	if it is 77, yes;
	no.
Menu command menu:
	rule succeeds with result the show the menu rule;

This is the show the menu rule:
	display the Table of Kerkerkruip Help menu with title "Kerkerkruip";



Section - Options Menu

Table of Options Menu
title	order	rule
"[bold type]Interface options"	1	--
"Information panels: [bold type][if window panels are disabled]Off[otherwise]On[end if]"	2	the toggle info panels rule
"[hyperlinks options]"	3	the toggle menu hyperlinks rule
"Sound: [bold type][if sound is enabled]On[otherwise]Off[end if][roman type]"	12	the toggle theme music rule
""	20	--
"[bold type]Reset"	21	--
"[if difficulty is 0 and number of total victories is 0 and setting of highest achieved difficulty is 0 or number of unlocking victories is 0][italic type](Reset the number of victories)[otherwise]Reset the number of victories"	22	the resetting rule
"[if the Table of Held Achievements is empty][italic type](Reset achievements)[otherwise]Reset achievements"	23	the achievement resetting rule
"[if number of unlocking victories > 99][italic type](Unlock everything)[otherwise]Unlock everything"	24	the unlock everything rule

To say hyperlinks options:
	say "Clickable menus: [bold type][if menu hyperlinks are enabled]On[otherwise]Off[end if][italic type][unless glulx hyperlinks are supported] (note: not supported in this interpreter)[otherwise if menu hyperlinks are disabled and enable menu hyperlinks is true] (note: will take affect once you leave this menu)[end if]";

Before showing the title screen:
	sort the Table of Options Menu in (order) order;

This is the resetting rule:
	set difficulty to 0;
	set total victories to 0, table only;
	set highest achieved difficulty to 0, table only;
	set unlocking victories to 0;

This is the achievement resetting rule:
	blank out the whole of the Table of Held Achievements;
	write File of Achievements from Table of Held Achievements;

This is the unlock everything rule:
	set unlocking victories to 100;

This is the toggle info panels rule:
	toggle window panels;

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

[ Menu hyperlinks: try to detect if we can use them, but also allow the user to change the option ]
Before showing the title screen (this is the enable menu hyperlinks rule):
	if glulx hyperlinks are supported:
		if menu hyperlinks are unset:
			if the Gargoyle config file was used is true:
				enable menu hyperlinks;
			otherwise:
				disable menu hyperlinks;
		if menu hyperlinks are enabled:
			now enable menu hyperlinks is true;
		otherwise:
			now enable menu hyperlinks is false;
	otherwise:
		now enable menu hyperlinks is false;

[ If we turn on hyperlinks, turn them on immediately. If turning them off, wait until we leave the menu, which the next rule handles ]
This is the toggle menu hyperlinks rule:
	if menu hyperlinks are enabled:
		disable menu hyperlinks;
	otherwise:
		enable menu hyperlinks;
		if glulx hyperlinks are supported:
			now enable menu hyperlinks is true;

A first glulx input handling rule for a hyperlink-event while displaying (this is the update the enable menu hyperlinks option rule):
	if the chosen menu option for the link number of the selected hyperlink is -1:
		if the submenu in row menu depth of the Table of Menu history is the Table of Options Menu:
			if menu hyperlinks are disabled:
				now enable menu hyperlinks is false;
				convert the hyperlink code to the character code;
				request hyperlink input again;
				replace player input;


Section - Adding menu screen graphics to the Options menu (for use with Kerkerkruip Glimmr Additions by Erik Temple)

Table of Options Menu (continued)
title	order	rule
"Menu graphics: [bold type][if main menu graphics are enabled]On[otherwise]Off[end if][roman type]"	11	the toggle menu graphics rule


This is the toggle menu graphics rule:
	toggle main menu graphics;
	disable session flag;
	restart immediately.

To restart immediately: 
	(- @restart; -).


Chapter - Start

Started boolean is a truth state that varies. Started boolean is false.

Last when play begins (this is the introduction rule):
	say "[paragraph break]When you claimed that you were tough enough to take on Malygris single-handedly, everyone knew you had been drinking much more than was good for you. And the prince is not one to let an opportunity pass. Before you could so much as protest, his court mage opened a portal and you were shoved through. Predictably, the portal immediately disappeared. You doubt they're going to open it up again -- but at least you can try to make good on your boast and kill Malygris, the Wizard of Kerkerkruip!";
	now started boolean is true. [See section Victory message below.]

Section - Starting kits

Option-2-chest is a container. Option-2-chest contains a scroll of shadows.
Option-3-chest is a container. Option-3-chest contains a scroll of protection and a scroll of the blade.
Option-4-chest is a container. Option-4-chest contains a scroll of death.
Option-5-chest is a container. Option-5-chest contains two fragmentation grenades and a Morphean grenade.
Option-6-chest is a container. Option-6-chest contains a scroll of mapping.
Option-7-chest is a container. Option-7-chest contains a scroll of teleportation.

Last when play begins:
	let n be a random number between 1 and 7;
	if n is 1:
		move gilded rapier to the player;
		now gilded rapier is readied;
		unready fists;
		now the player wears the buckler;
	if n is 2:
		move gorgeous dagger to the player;
		now gorgeous dagger is readied;
		unready fists;		
		equip player from option-2-chest;
	if n is 3:
		equip player from option-3-chest;
	if n is 4:
		move evil dagger to the player;
		now evil dagger is readied;
		unready fists;		
		equip player from option-4-chest;
	if n is 5:
		equip player from option-5-chest;
		now the player wears Metastasio's hat;
	if n is 6:
		move pickaxe to player;
		now pickaxe is readied;
		unready fists;		
		equip player from option-6-chest;
	if n is 7:
		move gilded rapier to player;
		now gilded rapier is readied;
		unready fists;		
		equip player from option-7-chest; 
	repeat with item running through things enclosed by the player:
		if item is a weapon or item is clothing:
			now item is not cursed.

To equip player from (box - a container):
	repeat with item running through things enclosed by box:
		move item to player;
		if item is a scroll:
			identify item.

To unready fists:
	let X be a random natural weapon enclosed by the player;
	now X is not readied.



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
	decide no.

Every turn (this is the victory rule):
	if the player is victorious:
		consider the victory message rules.

	
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
		increase unlocking victories by 1, table only;
		increase difficulty by 1; [We want to go from easy to normal difficulty.]
		if difficulty is 1:
			say "[paragraph break][bold type]You have defeated Malygris on easy mode, proving that you understand the basics of the game! Next time, Kerkerkruip will start in normal mode. From now on, new items, monsters and locations will be available. Have fun![roman type][paragraph break]";
		if difficulty is greater than setting of highest achieved difficulty:
			set highest achieved difficulty to difficulty, table only;
	otherwise:
		unless difficulty is less than 2:
			decrease difficulty by 1;
	set current difficulty to difficulty;

Last after printing the player's obituary (this is the list unlocked stuff rule):
	if the player is victorious:
		let number-of-victories be number of unlocking victories;
		if number-of-victories > 99 or number-of-victories < 2:
			stop;
		let X be a list of objects; [We cannot repeat through objects, so:]
		repeat with Y running through rooms:
			if unlock level of Y is number-of-victories:
				if unlock hidden switch of Y is not true:
					add Y to X;
		repeat with Y running through persons:
			if unlock level of Y is number-of-victories:
				if unlock hidden switch of Y is not true:		
					add Y to X;
		repeat with Y running through things:
			if Y is not a person:
				if unlock level of Y is number-of-victories:
					if unlock hidden switch of Y is not true:			
						add Y to X;
		if X is not empty:
			say "[line break]You have [bold type]unlocked[roman type] new content:[line break][run paragraph on]";
			repeat with item running through X:
				say "* [the item] ([unlock text of item])[line break]";
			say "[line break]";


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
    GL__M(##Quit, 2); if (YesOrNo()~=0) FollowRulebook( (+finally quitting the game rules+) ) ;
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
		glk_schannel_play_ext(chan.ref_number, sound, -(options & 1), options & 2); 
	}
];

[ SetVolume chan vol;
	if (glk_gestalt(gestalt_SoundVolume,0)) {
		if ((vol <= (+ maximum sound volume +)) && (vol > 0)) {
			glk_schannel_set_volume(chan.ref_number, (vol * (65535 / (+ maximum sound volume +)))+1);
		}
		else {
			glk_schannel_set_volume(chan.ref_number, 0);
		}
	}
];

[ SoundCease chan;
	if (glk_gestalt(gestalt_Sound,0)) {
		glk_schannel_stop(chan.ref_number);
	}
];

[ SoundPause chan;
	if (glk_gestalt(gestalt_Sound2,0)) {
		glk_schannel_pause(chan.ref_number);
	}
	else {
		SoundCease(chan);
	}
];

[ SoundUnpause chan;
	if (glk_gestalt(gestalt_Sound2,0)) {
		glk_schannel_unpause(chan.ref_number);
	}
];

-) after "Figures.i6t".


Include (-

Constant gestalt_Sound2	21;

[ glk_schannel_pause _vararg_count ret;
! glk_schannel_pause(chan);
@glk 254 _vararg_count ret;
return ret;
];

[ glk_schannel_unpause _vararg_count ret;
! glk_schannel_unpause(chan);
@glk 255 _vararg_count ret;
return ret;
];

-) after "Infglk" in "Glulx.i6t".


Kerkerkruip Start and Finish ends here.
