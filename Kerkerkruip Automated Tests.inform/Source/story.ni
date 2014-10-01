"Kerkerkruip Automated Tests" by Mike Ciul

The story headline is "Testing suite".
The story genre is "dungeon crawl".
The release number is 9.

[ This belongs in Actions, but it has to be defined before the Glimmr and Windows extensions. We should move this somewhere sensible later, and maybe use it for all the options? ]
An option is a kind of value. The null option is an option.

Section - 3rd Party Inclusions

Include Numbered Disambiguation Choices by Aaron Reed.
Include version 7/130712 of Dynamic Objects by Jesse McGrew.
Include Fixed Point Maths by Michael Callaghan.
Include Questions by Michael Callaghan.
Include version 1/140209 of Interpreter Sniffing by Friends of I7.
Include Glulx Entry Points by Emily Short.


Section - Include ATTACK

Include version 5/140131  of Inform ATTACK by Victor Gijsbers.

Section - Include all the Kerkerkruip extensions

[Include Kerkerkruip Permadeath by Victor Gijsbers.]
Include Kerkerkruip Persistent Data by Victor Gijsbers.
Include Kerkerkruip Dungeon Generation by Victor Gijsbers.
Include Kerkerkruip Events by Victor Gijsbers.
Include Kerkerkruip ATTACK Additions by Victor Gijsbers.
Include Kerkerkruip Monster Abilities by Victor Gijsbers.
Include Kerkerkruip Systems by Victor Gijsbers.
Include Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers.
Include Kerkerkruip Actions and UI by Victor Gijsbers.
Include Kerkerkruip Items by Victor Gijsbers.
Include Kerkerkruip Religion by Victor Gijsbers.
Include Kerkerkruip Locations by Victor Gijsbers.
Include Kerkerkruip Scenery by Victor Gijsbers.
Include Kerkerkruip Monsters by Victor Gijsbers.
Include Kerkerkruip Events and Specials by Victor Gijsbers.
Include Kerkerkruip Dreams by Victor Gijsbers.
Include Kerkerkruip Ugly Special Cases by Victor Gijsbers.
Include Kerkerkruip Start and Finish by Victor Gijsbers.
Include Kerkerkruip Tests by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.
Include Kerkerkruip Help and Hints by Victor Gijsbers.

Section - Increase memory settings

Use MAX_PROP_TABLE_SIZE of 800000.
Use MAX_OBJ_PROP_COUNT of 256.
Use MAX_STATIC_DATA of 1000000.
Use MAX_OBJECTS of 1000.
Use MAX_SYMBOLS of 30000.
Use MAX_ACTIONS of 250.
Use ALLOC_CHUNK_SIZE of 32768.
Use MAX_LABELS of 20000.

Section - Score

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.

Section - Generation info

Generation info is a truth state that varies. Generation info is [true]false.

Volume - Testing extensions

Include Autoundo for Object Response Tests by Mike Ciul.
Include Simple Unit Tests by Dannii Willis.
Include Kerkerkruip Automated Testing by Mike Ciul.

Use maximum capture buffer length of at least 16384.
Use maximum indexed text length of at least 16384. 

First when play begins (this is the random seed rule):
	Let the seed be 26;
	log "Seeding random number generator with [seed]";
	seed the random-number generator with the seed.

The random seed rule is listed before the reaper carries a random scythe rule in the when play begins rules.

Volume - Changes to Other Kerkerkruip Extensions


Section - Plurality fix

[Let's see whether this works.]

To decide whether (item - an object) acts plural: 
	if the item is plural-named:
		yes;
	no.
	
Section - Questions fix (in place of Section 4 - Processing menu questions in Questions by Michael Callaghan)

[We need to end the turn after a menu, otherwise no rules run.]

After reading a command when menu question mode is true:
	follow the menu question rules;
	if the outcome of the rulebook is the exit outcome:
		deactivate menu question mode;
		follow the every turn rules;
		follow the advance time rule;
		change the text of the player's command to "dontparse";
	if the outcome of the rulebook is the retry outcome:
		reject the player's command;
	if the outcome of the rulebook is the parse outcome:
		deactivate menu question mode.

Dontparsing is an action applying to nothing. Understand "dontparse" as dontparsing.

Carry out dontparsing:
	do nothing instead.

Chapter - No Introduction Menu (in place of Chapter - Introduction Menu in Kerkerkruip Start and Finish by Victor Gijsbers)

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

Chapter - No Sound (in place of Chapter - Sound in Kerkerkruip Start and Finish by Victor Gijsbers)

Chapter - No title screen activity (in place of Chapter - The title screen activity in Kerkerkruip Start and Finish by Victor Gijsbers)

Section - The difficulty level

The difficulty is a number that varies.

To set difficulty to (x - number):
	now difficulty is x;
	set current difficulty to difficulty;
	
Chapter - No Credits Menu (in place of Chapter - Credits menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Options Menu (in place of Chapter - Options menu in Kerkerkruip Start and Finish by Victor Gijsbers)
			
Chapter - No Options Menu Command (in place of Chapter - Options menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Achievements Menu (in place of Chapter - Achievements Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Enemies and Powers Menu (in place of Chapter - Enemies and Powers Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Help Menu (in place of Chapter - Help Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - Missing Windows Phrases (for use without Kerkerkruip Windows by Erik Temple)

Attribute printed is a truth state variable. Attribute printed is false.

To check initial position of attribute:
	if attribute printed is false:
		say "You are [run paragraph on]";
		now attribute printed is true;
	otherwise:
		say ", [run paragraph on]".
			
Chapter - Miscellaneous Patches to Kerkerkruip Extensions

Section - Not Loading Data Values (in place of Section - Loading Data Values in Kerkerkruip Persistent Data by Victor Gijsbers)

To save data storage:
	do nothing;

Section - No File of Monster Statistics (in place of Section - File of Monster Statistics in Kerkerkruip Monsters by Victor Gijsbers)

To update the monster statistics:
	do nothing;
	
Section - Limited Help (In place of Section - Help in Kerkerkruip Help and Hints by Victor Gijsbers)

Section - No File of Acheivements (in place of Section - File of Achievements in Kerkerkruip Persistent Data by Victor Gijsbers)

To save achievements:
	do nothing.
	
Section - No Achievements (in place of Section - Achievements in Kerkerkruip Help and Hints by Victor Gijsbers)

Section - No Test Object File (in place of Section - The test object file in Kerkerkruip Tests by Victor Gijsbers)

Section - No Menu Console (in place of Section - The test object console in Kerkerkruip Tests by Victor Gijsbers)

Section - Not Detecting whether or not the Gargoyle config file has been applied (in place of Section - Detecting whether or not the Gargoyle config file has been applied in Kerkerkruip Start and Finish by Victor Gijsbers)

Section - No Question Prompts (in place of Section - Using question prompts in Kerkerkruip ATTACK Additions by Victor Gijsbers)

Section 1 - Capture-aware Spacing and Pausing (in place of Section 1 - Spacing and Pausing in Basic Screen Effects by Emily Short)

Allowing screen effects is a truth state that varies. Allowing screen effects is false.

Include (-

[ KeyPause i; 
	if (capture_active) {
		rfalse;
	}
	i = VM_KeyChar(); 
	rfalse;
];

[ SPACEPause i;
	if (capture_active) {
		rfalse;
	}
	while (i ~= 13 or 31 or 32)
	{
		i = VM_KeyChar();	
	}
];

[ GetKey i;
	i = VM_KeyChar(); 
	return i;
];

[ AwareClearScreen;
	 if (~capture_active && (+ allowing screen effects +)) {VM_ClearScreen(0);}
];


[ AwareClearMainScreen;
	 if (~capture_active && (+ allowing screen effects +)) {VM_ClearScreen(2);}
];


[ AwareClearStatus;
	 if (~capture_active && (+ allowing screen effects +)) {VM_ClearScreen(1);}
];
-)

To clear the/-- screen:
	(- AwareClearScreen(); -)

To clear only the/-- main screen:
	(- AwareClearMainScreen(); -)

To clear only the/-- status line:
	(- AwareClearStatus(); -).

To wait for any key:
	(- KeyPause(); -)

To wait for the/-- SPACE key:
	(- SPACEPause(); -)

To decide what number is the chosen letter:
	(- GetKey() -)

To pause the/-- game: 
	say "[paragraph break]Please press SPACE to continue.";
	wait for the SPACE key;
	clear the screen.
	
To center (quote - text):
	(- CenterPrintComplex({quote}); -);

To center (quote - text) at the/-- row (depth - a number):
	(- CenterPrint({quote}, {depth}); -);
	
To stop the/-- game abruptly:
	(- quit; -)
	
To show the/-- current quotation:
	(- ClearBoxedText(); -);


Include (-

#ifndef printed_text;
Array printed_text --> 64;
#endif;

[ CenterPrint str depth i j;
	font off;
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	j = j-1;
	VM_MoveCursorInStatusLine(depth, j);
	print (I7_string) str; 
	font on;
];

[ CenterPrintComplex str i j;
	font off;
	print "^"; 
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	spaces j-1;
	print (I7_string) str; 
	font on;
];

-)

To decide what number is screen width:
	(- VM_ScreenWidth() -);

To decide what number is screen height:
	(- I7ScreenHeight() -);

Include (-

[ I7ScreenHeight i screen_height;
	i = 0->32;
		  if (screen_height == 0 or 255) screen_height = 18;
		  screen_height = screen_height - 7;
	return screen_height;
];

-)

To deepen the/-- status line to (depth - a number) rows:
	(- DeepStatus({depth}); -);

To move the/-- cursor to (depth - a number):
	(- I7VM_MoveCursorInStatusLine({depth}); -)

To right align the/-- cursor to (depth - a number):
	(- RightAlign({depth}); -)

Include (- 

[ DeepStatus depth i screen_width;
    VM_StatusLineHeight(depth);
    screen_width = VM_ScreenWidth();
    #ifdef TARGET_GLULX;
        VM_ClearScreen(1);
    #ifnot;
        style reverse;
        for (i=1:i<depth+1:i++)
        {
             @set_cursor i 1;
             spaces(screen_width);
        } 
    #endif;
]; 

[ I7VM_MoveCursorInStatusLine depth;
	VM_MoveCursorInStatusLine(depth, 1);
];

[ RightAlign depth screen_width o n;
	screen_width = VM_ScreenWidth(); 
	n = (+ right alignment depth +);
	o = screen_width - n;
	VM_MoveCursorInStatusLine(depth, o);
];

-)

Table of Ordinary Status
left	central	right
"[location]"	""	"[score]/[turn count]" 

Status bar table is a table-name that varies. Status bar table is the Table of Ordinary Status.

To fill the/-- status bar/line with (selected table - a table-name):
	let __n be the number of rows in the selected table;
	deepen status line to __n rows;
	let __index be 1;
	repeat through selected table
	begin;
		move cursor to __index; 
		say "[left entry]";
		center central entry at row __index;
		right align cursor to __index;
		say "[right entry]";
		increase __index by 1;
	end repeat.

Right alignment depth is a number that varies. Right alignment depth is 14.



Chapter - test plays

	
Section - Remembering Text

remembering-text is a test set.

Scenario when testing remembering-text:
	now Bodmall is testobject;
	now the minotaur is testobject;
	now the angel of compassion is testobject;
	now the demon of rage is testobject;
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the cloak of shadows is testobject;
	now the teleportation beacon is bannedobject;
	now the dimensional anchor is bannedobject;
	now bridge of doom is testobject;
	now hall of vapours is bannedobject;
	now a random scroll of mapping is testobject;
	now the rod of the master builder is testobject;
	now generation info is true;
	Now the reusable item is a random scroll of psycholocation;
	now the reusable item is testobject;
	
[in case the first map is rejected, Arcane Vault must be switched back from testobject to bannedobject every time]
first creating the map rule when testing remembering-text:
	now every secretly placeable room is bannedobject; [prevent normal placement of Arcane Vault to simulate conditions for bug 244]
	now Eternal Prison is testobject;

last creating the map rule when testing remembering-text (this is the force Arcane Vault to be secretly placed rule):
	assert "Arcane Vault should not yet be placed" based on whether or not Arcane Vault is not placed;
	now Arcane Vault is testobject;
	now the rarity of Arcane Vault is 0;
	
The place all secret testobject rooms rule is listed after the force Arcane Vault to be secretly placed rule in the creating the map rules;
	
Test play when testing remembering-text:
	Now every room is not rust-spored;
	Let the item be a random not off-stage scroll of mapping;
	Now the player carries the item;
	Now the player carries the rod of the master builder;
	assert "Eternal Prison should be secretly placed" based on whether or not the eternal prison is secretly placed;
	assert "Lake of Lava should be placed" based on whether or not the lake of lava is placed;
	assert "Lake of Lava should not be denizen" based on whether or not the lake of lava is not denizen;
	assert "Lake of Lava should not be teleportable" based on whether or not the lake of lava is not teleportable;
	assert "Lake of Lava should be nogo" based on whether or not the lake of lava is nogo;
	assert "Lake of Lava should not be secretly placed" based on whether or not lake of lava is not secretly placed;
	assert "Lake of Lava should not be placeable" based on whether or not lake of lava is not placeable;
	
nothing-to-remember is a test step. The first move of remembering-text is nothing-to-remember.   

Choosing a player action when testing nothing-to-remember:
	Generate the action of remembering. 

testing effects of nothing-to-remember:
	assert that the event description includes "You have not yet explored:\n( - the <a-w>+ exit of the entrance hall \(where you currently are\)\n)+\nYou have visited the following rooms: the entrance hall \(here\)\.\n\nTip:"
	
dumb-sensing is a test step.   

Choosing a player action when testing dumb-sensing:
	Generate the action of sensing;

testing effects of dumb-sensing:
	assert "Powerless sensing should not take time" based on previously-fast;
	
A test step can be psy-scroll-reading;

early-psycholocation is a psy-scroll-reading test step.

choosing a player action when testing a psy-scroll-reading test step:
	generate the action of reading the reusable item;
	
testing effects of psy-scroll-reading test step:
	[TODO: text that sensing takes no time]
	assert "The player should be psycholocating now" based on the psycholocation boolean;
	assert that the event description includes "When you are psycholocating, sensing does not take time"

unexplored-sensing is a test step.   

Choosing a player action when testing unexplored-sensing:
	Generate the action of sensing.

testing effects of unexplored-sensing:
	Repeat with the enemy running through {swarm of daggers, blood ape, demon of rage, angel of compassion, minotaur, bodmall, malygris}:
		assert that the event description includes "[soul description of the enemy], (from the )?[best route from the location to the location of the enemy][line break]";
	assert that the event description includes "- a turning in on itself of space and time, on which you cannot bear to focus your attention, somewhere [general direction from the location to the Eternal Prison][line break]"

[ - a bolt of black shot through with a blaze of hot white, from the south
 - an aura like sharpened steel, from the east
 - a zone of tautened, reddened air, from the west
 - a squall of fury, all blacks and reds, from the south
 - a luminous arc of sorrow, from the south
 - a skein of twisting passages, from the south
 - spreading thorns dripping with dew--or blood, from the wes]
	
remembering-daggers is a hidden-traveling test step.  The location-target of remembering-daggers is the swarm of daggers.

Choosing a player action when testing remembering-daggers:
	Generate the action of remembering.
		
testing effects of remembering-daggers:
	assert that the event description includes "You have visited the following rooms:.*You have seen the following creatures in these locations:.*- the swarm of daggers \(level 1\) in [the location] \(where you currently are\)"

[before we can get the partway-path psycholocating message, we have to put a visited room between us and an unseen creature. Find one that's at least two moves away and then go 1 move towards it.]

The sensing-place is a room that varies.
The on-the-way place is a room that varies.
The faraway enemy is an object that varies.

partway-visiting is a hidden-traveling psy-scroll-reading test step.
	
To decide which object is the next stop from (origin - a room) to (destination - a room):
	let the way be the best route from origin to destination;
	if the way is not a direction:
		decide on nothing;
	decide on the room way from origin;
	
Initial scheduling of partway-visiting:
	now the sensing-place is the location;
	now the faraway enemy is nothing;
	Repeat with guy running through denizen persons:
		If the number of moves from the location to the location of guy is at least 2 and the location of guy is not visited:
			now the faraway enemy is guy;
			break;
	assert "there should be an enemy in an unvisited room at least 2 moves away" based on whether or not the faraway enemy is a person;
	let the target be the location of the faraway enemy;
	now the on-the-way place is the next stop from the location to the target;
	if the on-the-way place is not visited:
		now the location-target of partway-visiting is the on-the-way place;
	while the next stop from the on-the-way place to the target is a visited room:
		now the on-the-way place is the next stop from the on-the-way place to the target.

middle-psycholocating is a extracting psy-scroll-reading test step. 

Initial scheduling of middle-psycholocating:
	now the location-target of middle-psycholocating is the sensing-place.

partial-explored-sensing is a hidden-traveling test step.   

Choosing a player action when testing partial-explored-sensing:
	Generate the action of sensing.

testing effects of partial-explored-sensing:
	assert that the event description includes "the soul of the swarm of daggers here with you, like an aura like sharpened steel[line break]";
	assert that the event description includes "[soul description of the faraway enemy], [best route from on-the-way place to location of the faraway enemy] from [the on-the-way place] \(which lies [best route from the location to on-the-way place] from here\)[line break]"

meeting-malygris is a repeatable hidden-traveling test step. The location-target of meeting-malygris is Malygris.

To say doesn't see you pattern:
	say "(does not (detect|notice)|remains unaware of) you(r presence)?[run paragraph on]";
	
testing effects of meeting-malygris:
	if the act count of Malygris is at least 1:
		assert that the event description includes "Malygris [doesn't see you pattern]";
		now meeting-malygris is not repeatable;
	
psycholocation-expiring is a repeatable hidden-traveling test step.

testing effects of psycholocation-expiring:
	if psycholocation is inactive:
		record success of psycholocation-expiring;
		
moving-malygris is a repeatable hiding-reveal test step. The maximum repeats of moving-malygris is 20.

Initial scheduling for moving-malygris:
	Compel the action of Malygris teleporting.
	
testing effects of moving-malygris:
	if the location of Malygris is the location:
		make no decision;
	assert that the event description includes "Malygris suddenly teleports away";
	now moving-malygris is not repeatable.
	
First choosing a player action when testing moving-malygris:
	if the location of Malygris is not the location:
		make no decision;
	if the cloak of shadows is worn:
		make no decision;
	generate the action of waiting;
	
remembering-malygris is a test step.   

Choosing a player action when testing remembering-malygris:
	Generate the action of remembering.

testing effects of remembering-malygris:
	assert that the event description includes "You have seen the following creatures in these locations:.*You have also seen Malygris, but you don't know where he is now"
	
remembering-lost-plural is a test step.   

Choosing a player action when testing remembering-lost-plural:
	Generate the action of remembering.

Initial scheduling of remembering-lost-plural:
	now the last-seen-location of the swarm of daggers is null-room.
	
testing effects of remembering-lost-plural:
	assert that the event description includes "You have also seen (Malygris|the swarm of daggers) and (Malygris|the swarm of daggers), but you don't know where they are now"
	 
dungeon-clearing is a test step.

Initial scheduling for dungeon-clearing:
	now the health of the demonic assassin is -1;
	Repeat with guy running through denizen persons:
		if guy is the player or the level of guy is at least 5, next;
		now the health of guy is -1;
		
testing effects of dungeon-clearing:
	assert that the number of reachable persons is 2;
	assert "Malygris (in [the location of Malygris]) should be reachable from [the location]" based on whether or not Malygris is reachable;
	assert "The player (in [the location of the player]) should be reachable" based on whether or not the player is reachable.
	
Malygris-only-remembering is a test step.   

Choosing a player action when testing malygris-only-remembering:
	generate the action of remembering.

testing effects of Malygris-only-remembering:
	assert that the event description does not include "You have seen the following creatures in these locations";
	assert that the event description includes "You have also seen Malygris, but you don't know where he is now"
	
slow-sensing is a test step.   

Choosing a player action when testing slow-sensing:
	generate the action of sensing.

Initial scheduling of slow-sensing:
	assert "psycholocation should be inactive" based on whether or not psycholocation is inactive;
	
testing effects of slow-sensing:
	assert "sensing without psycholocation should take time" based on whether or not previously-fast is false;
	
exploring-everywhere is a repeatable extracting hidden-traveling test step. 

Definition: A room (called place) is reachable:
	if the place is the location, yes;
	if the place is nogo, no;
	decide on whether or not the best route from the location to the place is a direction.

Definition: A thing is reachable if the location of it is a reachable room.

Initial scheduling for exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room.
	
testing effects of exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room;
	if the location-target of exploring-everywhere is nothing:
		assert that the number of unvisited reachable rooms is 0;
		assert "Arcane Vault should be secretly placed" based on whether or not the arcane vault is secretly placed;
		assert "Arcane Vault should be denizen" based on whether or not the arcane vault is denizen;
		assert "Arcane Vault should not be reachable" based on whether or not the arcane vault is not reachable;
		assert "There should be at least 1 unvisited secret room" based on whether or not the number of unvisited denizen rooms is at least 1;
		now exploring-everywhere is not repeatable;
	
remembering-everything-reachable is a test step.   

Choosing a player action when testing remembering-everything-reachable:
	generate the action of remembering.

testing effects of remembering-everything-reachable:
	assert that the event description includes "All locations have been explored";
	assert that the event description does not include "You have not yet explored";
	 
explored-psycholocating is a hidden-traveling extracting psy-scroll-reading test step.

Definition: a room is unoccupied if it does not enclose a person;

Initial scheduling for explored-psycholocating:
	if the location is the location of Malygris:
		now the location-target of explored-psycholocating is a random unoccupied reachable room;
		if location-target of explored-psycholocating is a room:
			assert "location-target ([location-target of explored-psycholocating]) is not reachable" based on whether or not location-target of explored-psycholocating is a reachable room;
			assert "location-target ([location-target of explored-psycholocating]) should not be where Malygris is" based on whether or not location-target of explored-psycholocating is not the location of Malygris;
		otherwise:
			assert "location-target ([location-target of explored-psycholocating]) is not a room" based on false;


malygris-sensing is a test step.   

Choosing a player action when testing malygris-sensing:
	generate the action of sensing.

Initial scheduling of malygris-sensing:
	[make sure psycholocating works even when remembering doesn't]
	Now the last-seen-location of Malygris is null-room;

testing effects of malygris-sensing:
	assert that the event description includes "[soul description of malygris], in [the location of Malygris]";
	assert "psycholocation sensing should not take time" based on previously-fast;

map-reading is a test step.

choosing a player action when testing map-reading:
	Let M be a random scroll of mapping carried by the player;
	generate the action of reading M;
	
testing effects of map-reading:
	assert that the event description includes "a complete floor plan of the dungeon of Kerkerkruip imprints itself on your mind"
	
map-remembering is a test step.   

Choosing a player action when testing map-remembering:
	generate the action of remembering.

testing effects of map-remembering:
	Assert that the number of secretly placed rooms is 2;
	assert that the event description includes "Based on the map you found.*secret rooms in the dungeon, one <^[line break]>+, one <^[line break]>+.";
	assert that the event description includes "You have also seen Malygris, but you don't know where he is. With your powers of psycholocation, you might be able to SENSE it";
	
getting-close-to-vault is a hidden-traveling extracting test step.

Initial scheduling of getting-close-to-vault:
	Let the closest place be Null-room;
	Let the shortest distance be 1000;
	Repeat with the place running through connectable reachable rooms:
		Let the candidate distance be the absolute distance between the place and the Arcane Vault;
		if the candidate distance is less than the shortest distance:
			now the shortest distance is the candidate distance;
			now the closest place is the place;
	now the location-target of getting-close-to-vault is the closest place.
			
digging-to-vault is a repeatable hidden-traveling test step. The maximum repeats of digging-to-vault is 20.

Choosing a player action when testing digging-to-vault:
	Generate the action of digging a single general direction from the location to Arcane Vault.
		
testing effects of digging-to-vault:
	if the location is a secretly placed room:
		[it doesn't actually have to be the vault - if we hit another secret room on the way we should stop]
		record success of digging-to-vault;
	
secret-room-remembering is a test step.   

Choosing a player action when testing secret-room-remembering:
	generate the action of remembering.

testing effects of secret-room-remembering:
	assert that the event description includes "Based on the map you found.*a secret room in the dungeon, <a-z>";
	assert that the event description does not include "secret room in the dungeon, one";
	
[make sure tunnels don't show up when they shouldn't, make sure they do show up in unexplored list]

[psycholocation + sense]

Section - Blessed Grenade - bug #261

blessed-grenade-test is a test set.

Scenario when testing blessed-grenade-test:
	now Drakul is testobject;
	now the Alchemical Laboratory is testobject;
	
Test play when testing blessed-grenade-test:
	now the defence of the player is 100;
	now the player carries the reusable item;
	Now the reusable item is the staff of insanity;
	Now every room is not rust-spored;
	Now every thing is not rusted;

A test step can be grenade-producing.

blessed-grenade-alchemy is a repeatable hidden-traveling extracting grenade-producing test step. The first move of blessed-grenade-test is blessed-grenade-alchemy. The location-target of blessed-grenade-alchemy is the Alchemical Laboratory. The maximum repeats of blessed-grenade-alchemy is 300.

testing effects of blessed-grenade-alchemy:
	unless the event description matches the regular expression "Blessed Grenade":
		make no decision;
	now blessed-grenade-alchemy is not repeatable;
	Repeat with the item running through grenades:
		Let name be indexed text;
		Now name is the printed name of the item;
		if the name is "Blessed Grenade":
			assert "[The item] in [holder of the item] looks like a blessed grenade, but it isn't" based on whether or not the item is the blessed grenade;
			if the item is in the location:
				record success of blessed-grenade-alchemy;
		
Choosing a player action when testing a grenade-producing test step:
	generate the action of inserting the reusable item into the curious machine.

First every turn when the scheduled event is a grenade-producing test step (called the current move):
	Now the health of the player is 100;
	Now the player is not asleep;
	If the current move is hidden-traveling, now the player is hidden;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	
Last testing effects of a grenade-producing test step:
	Repeat with item running through grenades in the location:
		remove item from play;

no-extra-blessed-grenade is an uneventful repeatable hidden-traveling grenade-producing test step. The maximum repeats of no-extra-blessed-grenade is 100. [This number could be higher, but it's a slow test]

testing effects of no-extra-blessed-grenade:
	if the event description matches the regular expression "Blessed Grenade":
		record failure of no-extra-blessed-grenade with message "The machine produced an extra blessed grenade, impossibly".
	
throwing-blessed is a test step.

Initial scheduling of throwing-blessed:
	now the player carries the blessed grenade;
	extract the player to the location of Drakul;
	
Choosing a player action when testing throwing-blessed:
	generate the action of throwing the blessed grenade;
	
testing effects of throwing-blessed:
	assert that Drakul is dead;
	assert that the event description includes "As the grenade explodes you hear the singing of angels, several of whom swoop down from the heavens with huge swords and eviscerate <^[line break]>*Drakul";
	
no-new-blessed-grenade is an uneventful repeatable hidden-traveling grenade-producing test step. The maximum repeats of no-new-blessed-grenade is 100.

testing effects of no-new-blessed-grenade:
	if the blessed grenade is not off-stage:
		record failure of no-new-blessed-grenade with message "The blessed grenade should be off-stage".
		
Section - At-react after getting mazed - bug 210

maze-resetting is a test set.

Scenario when testing maze-resetting:
	now the minotaur is testobject;
	now the overmind is testobject;
	now the hall of mirrors is bannedobject;
	
Test play when testing maze-resetting:
	extract the player to the location of the minotaur;
	try smiting the minotaur;
	try taking the minotaur's axe;
	assert "the minotaur's axe should be carried" based on whether or not the minotaur's axe is carried;
	try readying the minotaur's axe;
	assert "the minotaur's axe should be readied" based on whether or not the minotaur's axe is readied;
	now the defence of the player is 100;
	now the melee of the player is 100;

overmind-meeting is a extracting hiding-reveal test step. The first move of maze-resetting is overmind-meeting. The location-target of overmind-meeting is the overmind.

overmind-mazing is a test step.   

Choosing a player action when testing overmind-mazing:
	generate the action of attacking the overmind.
	
testing effects of overmind-mazing:
	assert that the combat state of the overmind is at-inactive.
	
Section - bug 262

[this bug will not happen with normal testobject placement, so this is a bit of a gamble]

bug-262 is a test set.

Scenario when testing bug-262:
	now generation info is true;
	now every secretly placeable room is bannedobject;
	
First creating the map rule when testing bug-262:
	now every secretly placeable room is testobject;
	
First dungeon finish rule:
	repeat with pack running through not non-treasure things:
		repeat with item running through things enclosed by pack:
			now the valuation of item is the valuation of pack;
	
Definition: a room is secret-treasure-stash if it is Mausoleum or it is Hidden Treasury or it is Elemental Plane of Smoke Storage.

Test play when testing bug-262:
	if portal of smoke is not placed and hidden treasury is not placed and mausoleum is not placed:
		log "no treasure-containing secret rooms to test for bug 262, but testing anyway!";
	let something to test be false;
	repeat with place running through secret-treasure-stash rooms:
		if place encloses a not non-treasure thing:
			now something to test is true;
			break;
	unless something to test is true:
		log "no treasure in any secretly placed rooms, but testing anyway";
	Repeat with item running through treasure packs:
		assert "[The item] should be off-stage, but it is in [the holder of the item][if holder of the item is not a room] (in [location of the item])" based on whether or not item is off-stage;

Section - bug 245

bug-245 is a test set.

Scenario when testing bug-245:
	now the blood ape is testobject;
	now bodmall is testobject;
	now the hall of mirrors is bannedobject;
	
Initial scheduling of ape-growing:
	now the defence of the player is 0;
	now the health of the player is 1000;
	now the melee of the player is 100;
	
ape-growing is a extracting hidden-traveling hiding-reveal repeatable test step. The first move of bug-245 is ape-growing. The location-target of ape-growing is the blood ape. 

testing effects of ape-growing:
	if the size of the blood ape is greater than medium:
		record success of ape-growing;
		make no decision;
	compel the action of the blood ape attacking the player;
	
Choosing a player reaction when testing ape-growing:
	generate the action of exposing;
	rule succeeds.

ape-smiting is a test step.   

Choosing a player action when testing ape-smiting:
	generate the action of smiting the blood ape;

testing effects of ape-smiting:
	assert "the power of the ape should be granted" based on whether or not the power of the ape is granted;

bodmall-meeting is a hidden-traveling extracting hiding-reveal test step. The location-target of bodmall-meeting is bodmall.

Initial scheduling of bodmall-meeting:
	now the health of bodmall is 1000;
	now bodmall is not asleep;
	
bodmall-bleeding is a test step.   

Choosing a player action when testing bodmall-bleeding:
	generate the action of attacking bodmall.

Initial scheduling of bodmall-bleeding:
	now the initiative of Bodmall is -2;
	
last initiative update rule when testing bodmall-bleeding:
	now the initiative of Bodmall is -2;
	
testing effects of bodmall-bleeding:
	assert "the player should now be bigger than medium, but [it-they of the player] is [size of the player]" based on whether or not the size of the player is greater than medium;
	assert "bodmall should have reacted exactly once, but she reacted [reaction count of bodmall] times" based on whether or not the reaction count of Bodmall is 1;
	assert "bodmall should be at-inactive, but she is [combat state of bodmall]" based on whether or not bodmall is at-inactive;
	
Section - Maze Moving

[Moving around in the maze - check that all people have 0 concentration and are at-inactive. Check that the right thing happens when retreating or running from an opponent in the maze. Maybe check grenade-throwing effects in the maze]

To assert that (item - a thing) is located in (place - a room):
	assert "[The item] should be in [place], but [it-they of item] is in [location of item]" based on whether or not the location of item is place.
	
To assert that (guy - a person) has (N - a number) levels of concentration:
	assert "[The guy] has [concentration of guy] levels of concentration, but [it-they of guy] should have [N] levels" based on whether or not concentration of guy is N.
	
maze-moving is a test set.

Scenario when testing maze-moving:
	now the minotaur is testobject;
	now the hall of mirrors is bannedobject;
	now the reusable item is a random flash grenade;
	
minotaur-meeting is a hidden-traveling extracting hiding-reveal test step. The first move of maze-moving is minotaur-meeting. The location-target of minotaur-meeting is the minotaur.

Initial scheduling of minotaur-meeting:
	now the health of the player is 1000;
	now the defence of the player is 0;
	
getting-mazed is a repeatable test step.

Initial scheduling of getting-mazed:
	compel the action of the minotaur attacking the player.

Testing effects of getting-mazed:
	if the event description matches the regular expression "minotaur deals":
		now getting-mazed is not repeatable;
	otherwise:
		make no decision;
	assert that the location is Maze;
	assert "the player should be at-inactive, but [it-they of player] [is-are] [combat state of the player]" based on whether or not the player is at-inactive;
	assert "the minotaur should be at-inactive, but he is [combat state of the minotaur]" based on whether or not the minotaur is at-inactive;
	assert that the minotaur is located in maze-waiting-room;
	assert that maze-sound is northwest;
	
directionless-throwing is a test step.

Choosing a player action when testing directionless-throwing:
	generate the action of throwing the reusable item to north;

Testing effects of directionless-throwing:
	assert that the event description includes "There is no point throwing grenades into twisty little passages";
	assert "Trying to throw things in the maze should not take time" based on whether or not the take no time boolean is true;
	assert that the reusable item is carried.
	
sound-finding is a repeatable test step.   

Choosing a player action when testing sound-finding:
	generate the action of going north.

Testing effects of sound-finding:
	if maze-sound is a cardinal direction:
		record success of sound-finding.
		
maze-summoning is an item-reading test step.

Initial scheduling of maze-summoning:
	now the the reusable item is a random scroll of summoning;
	now the player carries the reusable item;
	
Testing effects of maze-summoning:
	assert that the event description includes "[a monster summoned] appears before you"
	
A test step can be sound-following.

summoned-fleeing is a sound-following test step.

Initial scheduling of summoned-fleeing:
	now the concentration of the player is 3;
	now the concentration of the monster summoned is 3;
	
Choosing a player action when testing a sound-following test step:
	generate the action of going maze-sound;

Definition: a person is not-yet-active if the act count of it is 0.

First combat round rule when testing summoned-fleeing:
	stop and save event description;
	if every person who is not the player is not-yet-active:
		assert that the event description includes "You flee through the tunnels, quickly losing all sense of direction.[line break][line break][The monster summoned] follows you towards the sound.";
		if the monster summoned is non-attacker:
			assert 0 hits by the monster summoned;
		otherwise:
			assert 1 hit by the monster summoned;
	if the act count of the main actor is 0:
		[this assertion can interrupt the event description]
		assert that the main actor has 0 levels of concentration;
	start capturing text;

testing effects of summoned-fleeing:
	assert that the monster summoned is located in the maze;
	assert that the minotaur is located in the maze;
	if the act count of the monster summoned is 0:
		assert that the monster summoned has 0 levels of concentration;
	if the act count of the minotaur is 0:
		assert that the minotaur has 0 levels of concentration;

multiple-fleeing is a test step.   

Choosing a player action when testing multiple-fleeing:
	generate the action of going north.

Initial scheduling of multiple-fleeing:
	now the concentration of the minotaur is 3;
	now the concentration of the monster summoned is 3;
	
Testing effects of multiple-fleeing:
	assert that the minotaur has 0 levels of concentration;
	assert that the monster summoned has 0 levels of concentration;
	assert that the minotaur is located in maze-waiting-room;
	assert that the monster summoned is located in maze-waiting-room;
	assert 1 hit by the minotaur;
	
multiple-sound-seeking is a repeatable test step.   

Choosing a player action when testing multiple-sound-seeking:
	generate the action of going north.

Testing effects of multiple-sound-seeking:
	if the maze-sound is a cardinal direction:
		assert that the number of people in maze-waiting-room is 2;
		record success of multiple-sound-seeking.
		
first-rejoining is a sound-following test step.

Testing effects of first-rejoining:
	assert that the number of people in maze-waiting-room is 1;
	assert that the number of people in maze [including the player] is 2;
	
first-maze-smiting is a test step.

Choosing a player action when testing first-maze-smiting:
	now opposition test subject is the player;
	Let the enemy be a random opposer person enclosed by the location;
	generate the action of smiting the enemy.
	
Testing effects of first-maze-smiting:
	assert that the player is located in the maze;
	assert that the combat status is peace.
	
Section - Hiding Penalites

hiding-penalties is a test set.

scenario when testing hiding-penalties:
	now bodmall is testobject;
	
bodmall-sneaking is a hidden-traveling extracting test step. the first move of hiding-penalties is bodmall-sneaking. The location-target of bodmall-sneaking is bodmall.

Initial scheduling of bodmall-sneaking:
	now the teleportation beacon is in the location of Malygris;
	now the dimensional anchor is in the location of Malygris;
	now teleportation-beacon-on is true;
	
Choosing a player action when testing bodmall-sneaking:
	Let G be a random teleportation grenade;
	now G is in the location of Bodmall;
	generate the action of throwing G;
	
Testing effects of bodmall-sneaking:
	assert that the event description includes "first taking the teleportation grenade";
	assert that the event description includes "Malygris, perhaps the greatest of all living sorcerers, is standing here";
	assert that the event description does not include "picking stuff up";
	
malygris-robbing is a hidden-traveling test step.

Initial scheduling of malygris-robbing:
	repeat with guy running through people in the location:
		assert "teleportation should be impossible for [guy]" based on whether or not teleportation is impossible for guy;

Choosing a player action when testing malygris-robbing:
	Let G be a random teleportation grenade;
	now G is in the location;
	generate the action of throwing G;
	
[if the player teleports away but reappears in the same room, their hiding penalty will be wiped out. This could be considered a bug, but I don't think it's worth fixing. Anyway, we can avoid it for testing purposes by using the dimensional anchor.]

Testing effects of malygris-robbing:
	assert that the teleportation beacon is located in the location;
	assert that malygris is located in the location;
	assert that bodmall is located in the location;
	assert that the event description includes "Something has stopped you from teleporting";
	assert that the event description includes "picking stuff up";

Section - Imp Teleporting Into Dreams

bug-280 is a test set.

Scenario when testing bug-280:
	now the reaper is testobject;
	now the lair of the imp is testobject;
	now the dimensional anchor is bannedobject;
	now the teleportation beacon is bannedobject; [test with the imp?]
	now the dream of briar roses is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the vast staircase is bannedobject.
	
reaper-seeking is a hidden-traveling extracting hiding-reveal test step. The  first move of bug-280 is reaper-seeking. The location-target of reaper-seeking is the reaper.

Initial scheduling of reaper-seeking:
	assert "Lair of the imp should be placed" based on whether or not lair of the imp is placed;
	assert "Imp should be denizen" based on whether or not the imp is denizen;
	assert "Dimensional anchor is in [location of the dimensional anchor]" based on whether or not the dimensional anchor is off-stage;
	now the health of the player is 1000.
	
Testing effects of reaper-seeking:
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;

imp-dreaming is a repeatable uneventful item-throwing test step. The maximum repeats of imp-dreaming is 20.

Testing effects of imp-dreaming:
	assert that the location is garden of thorns;
	if the location of the imp is the location:
		record failure of imp-dreaming with message "The imp teleported into the dream (act count=[act count of the imp])";
	wake the player up;
	update the combat status; [risky?]
	assert "we should be with the reaper in [location of the reaper] but we are in [the location]" based on whether or not the location is the location of the reaper;
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;
	
imp-appearing is a repeatable test step.

Testing effects of imp-appearing:
	if the location of the imp is the location:
		record success of imp-appearing;
		
imp-thieving is a repeatable test step.

Testing effects of imp-thieving:
	if the event description matches the regular expression "The imp grabs the package of ment with its thieving little claws":
		record success of imp-thieving;
		
imp-vanishing is a repeatable test step.   

Choosing a player action when testing imp-vanishing:
	generate the action of attacking the imp;

Testing effects of imp-vanishing:
	if the location of the imp is lair of the imp:
		record success of imp-vanishing;
		
imp-stashing is a repeatable test step. The maximum repeats of imp-stashing is 2.

Testing effects of imp-stashing:
	if a package of ment is in the lair of the imp:
		record success of imp-stashing;

[TODO: test armadillo and reaper following]

Section - Armadillo wandering

armadillo-wandering is a test set.

Scenario when testing armadillo-wandering:
	now the ravenous armadillo is testobject;

waiting-for-armadillo-move is a repeatable test step. The first move of armadillo-wandering is waiting-for-armadillo-move.

armadillo-start is a room that varies.

Initial scheduling of waiting-for-armadillo-move:
	now armadillo-start is the location of the ravenous armadillo.
	
Testing effects of waiting-for-armadillo-move:
	if the location of the armadillo is not armadillo-start:
		record success of waiting-for-armadillo-move.
		
Section - Heal power of Malygris

malygris-heal-power is an test set.

the generation minimum is a number that varies.

the generation count is a number that varies.

The generation test rules is a rulebook.

Last map approval rule:
	increment generation count;
	follow the generation test rules;
	if generation count < generation minimum:
		say "* [generation minimum - generation count] more dungeons to generate for [the current test set]";
		rule fails;
		
Scenario when testing malygris-heal-power:
	now generation info is true;
	now the generation minimum is 20.
	
malygris-heal-max is a number that varies.

Generation test when testing malygris-heal-power:
	now the heal power of Malygris is 0;
	make the dungeon interesting [usually done after approval];
	let max healing be (heal power of Malygris) * 60 / (heal cooldown of Malygris);
	if max healing is greater than malygris-heal-max:
		now malygris-heal-max is max healing;
	if max healing is at least 1:
		say "* Malygris can heal [max healing divided by 60] and [remainder after dividing max healing by 60] 60ths per turn[line break]";
	if (max healing) is greater than (60 times 3):
		assert "[max healing divided by 60] and [remainder after dividing max healing by 60] 60ths is too much healing for Malygris" based on false;
		now generation minimum is 0;
	if generation count is generation minimum:
		assert "Malygris should be able to heal sometimes" based on whether or not the malygris-heal-max is at least 1.
			
Section - Unlocking - issue 243

unlocking-behavior is a test set.

to assert that placement possibility is (allowable - a truth state) when (conditions - indexed text):
	now the rarity of Space-Time Discontinuum is 0;
	now the considered room is Space-Time Discontinuum;
	consider the placement possible rules;
	assert "Space-Time Discontinuum should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	now global monster level is 1;
	now the considered monster is the ravenous armadillo;
	consider the monster placement possible rules;
	assert "The armadillo should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	assert "The smoky blade should [if allowable is false]not [end if]be not-too-difficult" based on whether or not allowable is (whether or not the smoky blade is not-too-difficult);
	
	
Scenario when testing unlocking-behavior:
	assert that setting of current difficulty is 0 with label "current difficulty setting";
	assert that difficulty is 0 with label "difficulty";
	assert "advanced content should be disabled" based on whether or not advanced content is disabled;
	now the considered room is Space-Time Discontinuum;
	assert that placement possibility is false when "in novice level";
	enable advanced content;
	assert that placement possibility is true when "in novice level with advanced content enabled";
	set the current difficulty to 1;
	now difficulty is 1;
	disable advanced content;
	assert that placement possibility is true when "in apprentice level";
	enable advanced content;
	assert that placement possibility is true when "in apprentice level when advanced content is enabled";
	
Section - Bloodlust - issue 279

bloodlust-279 is a test set.

to assert that bloodlusting is (active - a truth state) when (condition - indexed text):
	assert "the player should [if active is false]not [end if]be bloodlusting [condition], but you are [person condition of the player]" based on whether or not active is (whether or not the player is bloodlusting).
	
Scenario when testing bloodlust-279:
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the mindslug is testobject;
	now the hall of mirrors is bannedobject;
	
meeting-daggers is an extracting test step. The first move of bloodlust-279 is meeting-daggers. The location-target of meeting-daggers is the swarm of daggers.

Initial scheduling of meeting-daggers:
	now the melee of the player is 100;
	now the defence of the player is 100;
	now the health of the swarm of daggers is 50;
	
hitting-daggers is a test step. 

choosing a player action when testing hitting-daggers:
	generate the action of attacking the swarm of daggers.
	
Testing effects of hitting-daggers:
	assert that bloodlusting is true when "after hitting";
	
smiting-daggers is a test step.

choosing a player action when testing smiting-daggers:
	generate the action of smiting the swarm of daggers.
	
Testing effects of smiting-daggers:
	assert that the combat status is peace with label "combat status";
	assert that bloodlusting is false when "after killing the daggers".
	
[If we can think of any tricky cases where the combat status changes during the every turn stage, we should test those]
		
meeting-ape is an extracting test step. The location-target of meeting-ape is the blood ape.

Initial scheduling of meeting-ape:
	have the player defeat the mindslug;
	extract fafhrd to the location of the blood ape;
	now the health of the blood ape is 100;
	
hitting-ape is a test step.

choosing a player action when testing hitting-ape:
	generate the action of attacking the blood ape;
	
testing effects of hitting-ape:
	assert that bloodlusting is true when "after hitting the ape the first time";
	
fafhrd-killing-ape is a repeatable test step.

initial scheduling of fafhrd-killing-ape:
	now the melee of fafhrd is 100;

choosing a player action when testing fafhrd-killing-ape:
	compel the action of fafhrd attacking the blood ape;
	generate the action of attacking the blood ape;

before fafhrd hitting the blood ape when testing fafhrd-killing-ape:
	transcribe "reducing the ape's health to 1";
	now the health of the blood ape is 1;
	
testing effects of fafhrd-killing-ape:
	if the blood ape is alive:
		make no decision;
	assert that bloodlusting is false when "after Fafhrd kills the ape";
	now fafhrd-killing-ape is not repeatable.
	
Section - bug 291

bug-291 is a test set.

Scenario when testing bug-291:
	now the healer of aite is testobject;
	now the dream of tungausy shaman is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject;

sleepy-throwing is an extracting item-throwing test step. The first move of bug-291 is sleepy-throwing. The location-target of sleepy-throwing is the healer of aite.

Initial scheduling of sleepy-throwing:
	now the player is just-woken.
	
Testing effects of sleepy-throwing:
	assert that the player is tungausy warrior with label "identity of the player";
	assert that the event description does not include "fog of sleep";
	
hut-entering is a test step.

Choosing a player action when testing hut-entering:
	generate the action of going inside.
	
shaman-choosing is a test step.

Choosing a player action when testing shaman-choosing:
	select menu question answer 1;
	
To assert that (guy - a person) is fully alert:
	assert "[The guy] should not be just-woken" based on whether or not the guy is not just-woken.
	
To assert that (guy - a person) is just-woken:
	assert "[The guy] should be just-woken" based on whether or not the guy is just-woken.
	
Testing effects of shaman-choosing:
	Now opposition test subject is the player;
	Repeat with guy running through opposer people in the location:
		assert that guy is asleep;
	assert that the player is the true body of the player with label "true body of the player";
	assert that the player is awake;
	assert that the player is fully alert;
	assert that the event description does not include "fog of sleep";
	
teleport-waking is a repeatable test step. The maximum repeats of teleport-waking is 3.

initial scheduling of teleport-waking:
	now the reusable item is a random scroll of teleportation;
	now the healer of aite is not asleep;
	compel the action of the healer of aite attacking the player;
	now the teleportation beacon is in a random unoccupied placed room;
	now teleportation-beacon-on is true;	
	
Choosing a player reaction when testing teleport-waking:
	now the player is just-woken;
	generate the action of reading the reusable item.
	
Testing effects of teleport-waking:
	unless the act count of the healer of aite is at least 1, make no decision;
	if the player is at-react, make no decision;
	assert that the player is fully alert;
	assert that the event description includes "fog of sleep";
	record success of teleport-waking;
	
sleepy-teleport is a hidden-traveling item-reading test step.

Initial scheduling of sleepy-teleport:
	now the teleportation beacon is in the location of the swarm of daggers;
	now the player is just-woken;
	
Testing effects of sleepy-teleport:
	assert that the player is just-woken;
	assert that the event description does not include "fog of sleep";
	
sleepy-status is a test step.

Choosing a player action when testing sleepy-status:
	generate the action of asking status.
	
Testing effects of sleepy-status:
	assert that the event description includes "You are just-woken: The next attack against you gets a \+3 bonus and \+2 damage\.";
	
sleepy-slaying is a hidden-traveling test step.

choosing a player action when testing sleepy-slaying:
	generate the action of smiting the swarm of daggers;
	
testing effects of sleepy-slaying:
	assert that the event description includes "fog of sleep";
	assert that the player is fully alert.
	
Section - bug 293 - Sensing Isra and Fell

bug-293 is a test set

scenario when testing bug-293:
	now the reusable item is a random teleportation grenade;
	now israfel is testobject;
	
israfel-meeting-293 is an extracting test step. The first move of bug-293 is israfel-meeting-293. The location-target of israfel-meeting-293 is israfel.

israfel-splitting-293 is a repeatable test step. 

initial scheduling of israfel-splitting-293:
	assert "isra should be off-stage" based on whether or not isra is off-stage;
	assert "fell should be off-stage" based on whether or not fell is off-stage;
	compel the action of israfel israfel-splitting.
	
Testing effects of israfel-splitting-293:
	if isra is off-stage, make no decision;
	record success of the scheduled event.
	
isra-and-fell-scattering is a hidden-traveling item-throwing test step.

Testing effects of isra-and-fell-scattering:
	assert "isra should be onstage" based on whether or not isra is not off-stage;
	if the location of Isra is the location:
		extract Isra to a random unoccupied room;
	assert "fell should be onstage" based on whether or not fell is not off-stage;
	if the location of Fell is the location:
		extract Fell to the location of Isra;
	repeat with guy running through people in the location of isra:
		if guy is not isra and guy is not Fell:
			extract guy to the location;
	repeat with guy running through people in the location of fell:
		if guy is not fell and guy is not Isra:
			extract guy to the location;
	
psycholocating-293 is a hidden-traveling item-reading test step.

initial scheduling of psycholocating-293:
	now the reusable item is a random scroll of psycholocation.
	
sensing-293 is a hidden-traveling test step.

Choosing a player action when testing sensing-293:
	generate the action of sensing.
	
Testing effects of sensing-293:
	assert that the event description includes "frozen lightning";
	assert that the event description includes "molten thunder";
	
isra-defeating-293 is a test step.

initial scheduling of isra-defeating-293:
	have the player defeat isra;
	
Testing effects of isra-defeating-293:
	assert "power of israfel should not be granted" based on whether or not the power of israfel is not granted;
	
fell-defeating-293 is a test step.

initial scheduling of fell-defeating-293:
	have the player defeat fell;
	
Testing effects of fell-defeating-293:
	assert "isra should be dead" based on whether or not isra is dead;
	assert "fell should be dead" based on whether or not fell is dead;
	assert "israfel should be off-stage" based on whether or not israfel is off-stage;
	[assert that the event description includes "Israfel's dying cry shakes the foundations of the world";]
	assert "power of israfel should be granted" based on whether or not the power of israfel is granted.
		
Section - bug 244

[This test is not catching the bug I saw. I have no idea how to reproduce it.]

bug-244 is an test set.

Scenario when testing bug-244:
	now generation info is true;
	now the generation minimum is 100;
	now the rarity of the mausoleum is 0;

Map approval rule when testing bug-244 (this is the only approve secret mausoleum maps rule):
	if the mausoleum is not placed:
		rule fails;
	let the path be the best route from Entrance Hall to the mausoleum;
	if the path is a direction:
		rule fails;
	
Generation test when testing bug-244:
	assert "The mausoleum should be placed" based on whether or not the mausoleum is placed;
	assert "The mausoleum should be marked secretly placeable" based on whether or not the mausoleum is secretly placeable;
	
final-generation-test is a test step. The first move of bug-244 is final-generation-test.

Testing effects of final-generation-test:
	assert "The mausoleum should be marked secretly placeable" based on whether or not the mausoleum is secretly placeable;

Section - Bug 301 Redux

bug-301-aite is a test set.

scenario when testing bug-301-aite:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the reusable item is a random fragmentation grenade;
	
First intervention possible when testing bug-301-aite:
	rule fails;
	
bug-301-setup is a test step. The first move of bug-301-aite is bug-301-setup.
	
Initial scheduling of bug-301-setup:
	Now every room is not rust-spored;
	Now every thing is not rusted;
	now the defence of the player is 100;
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Sul;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Sul is 4;
	extract the player to Hall of Gods;
	have the player and healer of Aite fight in Arena of the Gods;
	
healer-first-killing is a test step. 

Initial scheduling of healer-first-killing:
	now the health of the player is the permanent health of the player - 1; 

Choosing a player action when testing healer-first-killing:
	generate the action of smiting the healer of aite.
	
Testing effects of healer-first-killing:
	assert truth of whether or not the healer of Aite is dead with message "The healer should be dead";
	assert truth of whether or not the tormentor of Aite is alive with message "The tormentor of Aite should be alive";
	assert truth of whether or not the defender of Aite is alive with message "The defender should be alive";
	assert truth of whether or not the health of the player is less than the permanent health of the player with message "The player should not be healed";
	assert that the event description does not include "Sul receives .* and fully heals you";
	
other-fanatics-killing is an item-throwing test step.

Initial scheduling of other-fanatics-killing:
	now the health of the tormentor of Aite is 1;
	now the health of the defender of Aite is 1;

testing effects of other-fanatics-killing:
	assert truth of whether or not the tormentor of Aite is dead with message "The tormentor should be dead";
	assert truth of whether or not the defender of Aite is dead with message "The defender should be dead";
	assert that the location is Hall of Gods;
	assert that the event description includes "receives the soul";
	assert that the event description does not include "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player;

Section - Summoning too many monsters

