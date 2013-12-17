"Kerkerkruip Automated Tests" by Mike Ciul

The story headline is "Testing suite".
The story genre is "dungeon crawl".
The release number is 9.

Section - 3rd Party Inclusions

Include Numbered Disambiguation Choices by Aaron Reed.
Include version 7/130712 of Dynamic Objects by Jesse McGrew.
Include Fixed Point Maths by Michael Callaghan.
Include Questions by Michael Callaghan.
Include Glulx Entry Points by Emily Short.


Section - Include ATTACK

Include version 5/131204 of Inform ATTACK by Victor Gijsbers.

Section - Include all the Kerkerkruip extensions

[Include Kerkerkruip Permadeath by Victor Gijsbers.]
[Include Kerkerkruip Persistent Data by Victor Gijsbers.]
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
[Include Kerkerkruip Tests by Victor Gijsbers.]
Include Kerkerkruip Final Declarations by Victor Gijsbers.
Include Kerkerkruip Help and Hints by Victor Gijsbers.

Section - Testing extensions

Include Autoundo for Object Response Tests by Mike Ciul.

Section - Increase memory settings

Use MAX_PROP_TABLE_SIZE of 800000.
Use MAX_OBJ_PROP_COUNT of 256.
Use MAX_STATIC_DATA of 500000.
Use MAX_OBJECTS of 1000.
Use MAX_SYMBOLS of 30000.
Use MAX_ACTIONS of 250.



Section - Score

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.

Section - Generation info

Generation info is a truth state that varies. Generation info is [true]false.



Section - Testing - Not for release

[Last when play begins:
	move Fafhrd to Entrance Hall;
	now Fafhrd is asleep.]

[Last when play begins:
	Now every medium banquet-dining person is seen;

Every turn:
	if Banquet is dreamable:
		Now Banquet is current-test-dream;
	otherwise:
		now Banquet is not current-test-dream;]

[Dream of Tungausy Shaman is current-test-dream.]

Section - Defining perform syntax (not for use with Glimmr Canvas Animation by Erik Temple)

To say perform/@ (ph - phrase): (- if (0==0) {ph} -).



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

Chapter - No Credits Menu (in place of Chapter - Credits menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Options Menu (in place of Chapter - Options menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Achievements Menu (in place of Chapter - Achievements Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Enemies and Powers Menu (in place of Chapter - Enemies and Powers Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - No Help Menu (in place of Chapter - Help Menu in Kerkerkruip Actions and UI by Victor Gijsbers)

Chapter - Achievements (for use without Kerkerkruip Persistent Data by Victor Gijsbers)

An achievement is a kind of value. Some achievements are defined by the Table of Achievements.

Table of Achievements
achievement
Assistant dungeoneer
Adventurer
Hunter
Destroyer
Mageslayer
Deathblow
I return to serve
From the shadows I come
Stunning performance
Detox
Injury to insult
Unmoved
Nature's fragile vessel
Durin's bane
Make love not war
Twice fallen
Give them blood
Royal fruit
Sixth heaven

Table of Held Achievements
held achievement	held difficulty
(an achievement)	(number)
with 20 blank rows [ Include some buffer rows in case the player goes back to an old version ]

To award achievement (current achievement - an achievement):
	if there is a held achievement of current achievement in the Table of Held Achievements:
		choose row with a held achievement of current achievement in the Table of Held Achievements;
	otherwise:
		choose a blank row in the Table of Held Achievements;
		now the held achievement entry is current achievement;
	if there is no held difficulty entry or the held difficulty entry is less than the difficulty:
		now held difficulty entry is difficulty;
		say "[line break]You have been awarded the [bold type][current achievement][roman type] achievement!";

Chapter - General Data Storage (for use without Kerkerkruip Persistent Data by Victor Gijsbers)

Table of Data Storage
key (number)	value (number)
--	--
with 14 blank rows

Table of Victories
Victories	Level	Best-Level
0	0	0

To decide which number is data value (X - a number):
	if there is a key of X in the Table of Data Storage:
		choose row with a key of X in the Table of Data Storage;
		decide on the value entry;
	otherwise:
		decide on 0;

To set data value (X - a number) to (Y - a number), table only (this is data-value setting):
	if there is a key of X in the Table of Data Storage:
		choose row with a key of X in the Table of Data Storage;
	otherwise:
		choose a blank row in the Table of Data Storage;
		now the key entry is X;
	now the value entry is Y;

To decide which number is the number of victories: decide on data value 1.

To decide which number is the best level: decide on data value 3.

To decide which number is the number of victories for the purpose of unlocking: decide on data value 4;

Chapter - Missing Windows Phrases (for use without Kerkerkruip Windows by Erik Temple)

Attribute printed is a truth state variable. Attribute printed is false.

To check initial position of attribute:
	if attribute printed is false:
		say "You are [run paragraph on]";
		now attribute printed is true;
	otherwise:
		say ", [run paragraph on]".
			
Chapter - Miscellaneous Patches to Kerkerkruip Extensions

Section - No Died and Kill Counts (in place of Section - Died and Kill counts in Kerkerkruip Monsters by Victor Gijsbers)

Section - Limited Help (In place of Section - Help in Kerkerkruip Help and Hints by Victor Gijsbers)

Section - No Achievements (in place of Section - Achievements in Kerkerkruip Help and Hints by Victor Gijsbers)

Volume - The Tests

Chapter - Testing the tests

A test set is a kind of value. Red set and blue set are test sets.

The current test set is a test set that varies.

Done testing is a truth state that varies.

To decide whether testing (T - a test set):
	if done testing is true, no;
	decide on whether or not the current test set is T;

First when play begins (this is the run all tests rule):
	Repeat with T running through test sets:
		now the current test set is T;
		say "Now testing [T].";
		wait for any key;
		if current save-restore status is failure to save, now current save-restore status is the result of saving undo state;
		If current save-restore status is successful save, stop;
	say "done testing.";
	wait for any key;
	now done testing is true;

Before reading a command:
	restore undo state.
	
Last when play begins when testing red set:
	say "red.";
	
Last when play begins when testing blue set:
	say "blue.";
