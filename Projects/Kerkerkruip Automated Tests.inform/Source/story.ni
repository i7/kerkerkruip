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
Include Kerkerkruip Tests by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.
Include Kerkerkruip Help and Hints by Victor Gijsbers.

Section - Testing extensions

Include Autoundo for Object Response Tests by Mike Ciul.
Include Simple Unit Tests by Dannii Willis.

Use maximum capture buffer length of at least 5280.

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

Section - No Menu Command Console (in place of Section - The test object console in Kerkerkruip Tests by Victor Gijsbers)

Volume - The Tests

Chapter - Persistent data

The file of test transcript is called "testtranscript".

To log (T - an indexed text):
	transcribe and stop capturing text;
	append "**** [T][line break]" to file of test transcript;
	start capturing text;
	
To transcribe and stop capturing text/--:
	stop capturing text;
	append "[the captured text]" to file of test transcript;
	 
To transcribe and restart capturing text/--:
	transcribe and stop capturing text;
	start capturing text;
	
The file of test results is called "testresults".

Table of Test Results
Test Set (number)	Total (number)	Failures (number)	Failure Messages (indexed text)
with 100 blank rows

To record a test attempt:
	increment the test assertion count;
	increment the total assertion count;
	Let testnum be current test set as a number;
	if there is a test set of testnum in Table of Test Results:
		choose row with test set of testnum in Table of Test Results;
	otherwise:
		choose a blank row in Table of Test Results;
		now test set entry is testnum;
		now total entry is 0;
		now failures entry is 0;
		now failure messages entry is "";
	increment the total entry;
	
To record a/-- failure of/-- (msg - an indexed text):
	Let testnum be current test set as a number;
	choose row with test set of testnum in Table of Test Results;	
	increment the assertion failures count;
	increment the failures entry;
	now the failure messages entry is "[failure messages entry]Failure for test: [the current test set], assertion [the test assertion count]: [msg][paragraph break]";
	log msg;
	
To display test results:
	say "Test results:[paragraph break]";
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
		say "[test set entry as a test set]: [total entry] tests, [failures entry] failures[line break]";
	say line break;
	say "Total: [grand test total] tests, [grand test failures] failures.";
	Repeat through Table of Test Results:
		if failures entry is at least 1:
			say "[line break]Failures for [test set entry as a test set]:[paragraph break]";
			say failure messages entry;	
	say "To view a full transcript of all tests, see the file 'testtranscript.glkdata' in the project directory.";
	wait for any key;
	
Chapter - Test Sets

A test set is a kind of value. Aite champions vs bat is a test set.

The current test set is a test set that varies.

To decide what number is (T - a test set) as a number: (- {T} -);
To decide what test set is (T - a number) as a test set: (- {T} -);

Done testing is a truth state that varies.

To decide whether testing (T - a test set):
	if done testing is true, no;
	decide on whether or not the current test set is T;

First when play begins:
	write "Test transcript for Kerkerkruip.[line break]" to file of test transcript;
	start the next test;
	if done testing is false, consider the scenario rules.
	
Last when play begins:
	if done testing is false, consider the test play rules.
	
The scenario rules are a rulebook.

The test play rules are a rulebook.

Chapter - Randomized Events

The maximum number of random event iterations is a number that varies. The maximum number of random event iterations is 100.

A randomized event is a kind of value. boring lack of events is a randomized event.

A random outcome is a kind of value. boring lack of results is a random outcome.

A random outcome can be achieved.

Event resolution relates various random outcomes to one randomized event. The verb to result from (he results from, they result from, it is required, it is resulting from) implies the event resolution relation.

The event being tested is a randomized event that varies.

The outcome being tested is a random outcome that varies.

Definition: a random outcome is possible if it results from the event being tested;

To decide whether (O - a random outcome) became the/-- possibility:
	if O is not achieved and O is possible:
		now the outcome being tested is O;
		yes;
	no.
	
To mark the/-- outcome as/-- achieved:
	[say "achieved outcome [the outcome being tested].";]
	now the outcome being tested is achieved;
	
To test (E - a randomized event):
	now the event being tested is E;
	Repeat with i running from 1 to the maximum number of random event iterations:
		if every possible random outcome is achieved, stop;
		follow the randomized event testing rules for E;
		follow the random outcome testing rules;
	Repeat with the attempt running through not achieved possible random outcomes:
		record a test attempt;
		let msg be indexed text;
		now msg is "After [the maximum number of random event iterations] iterations of [the event being tested], [the attempt] was still not tested.";
		record a failure of msg;

Randomized event testing is a randomized event based rulebook.

Random outcome testing is a rulebook.

The event description is an indexed text that varies.

Chapter - Turn-based Events

A turn-based event is a kind of value. normal keyboard input is a turn-based event.
A turn-based event has a stored action called the scheduled action. The scheduled action of a turn-based event is usually the action of waiting.
A turn-based event can be generated.

The scheduled event is a turn-based event that varies. The scheduled event is the normal keyboard input.

Choosing a player reaction is a rulebook.

The action in progress is an action name that varies. 
The action in progress variable translates into I6 as "action".

Before taking a player action when the scheduled event is generated:
	log "testing effects of [the scheduled event]";
	now the scheduled event is not generated;
	Let the completed event be the scheduled event;
	now the scheduled event is the normal keyboard input;
	transcribe and stop capturing;
	now the event description is "[the captured text]";
	start capturing text;
	follow the testing a turn-based event rules for the completed event;
	
For taking a player action when the scheduled event is not the normal keyboard input (this is the turn-based event player action rule):
	if the player is at-React:
		follow the choosing a player reaction rules;
	otherwise:
		generate a player action of the scheduled action of the scheduled event;
		now the scheduled event is generated.
		
The turn-based event player action rule is listed before the parse command rule in the for taking a player action rulebook.
		
To generate a player action of (the desired action - a stored action):
	log "generating [the desired action]";
	now the person asked is the player;
	now the action in progress is the action name part of the desired action;
	now the noun is the noun part of the desired action;
	now the second noun is the second noun part of the desired action;
		
Last choosing a player reaction:
	generate a player action of the action of waiting.
	
testing a turn-based event rules are a turn-based event based rulebook.

To schedule (the event described - a turn-based event):
	transcribe and restart capturing text;
	now the event described is not generated;
	now the scheduled event is the event described;
	
Chapter - The assert phrase (in place of Chapter - The assert phrase in Simple Unit Tests by Dannii Willis)

The test assertion count is a number variable.
The total assertion count is a number variable.
The assertion failures count is a number variable.

[ Assert that two values are the same ]
To assert that/-- (A - a value) is (B - a value):
	stop capturing text;
	record a test attempt;
	unless A is B:
		Let error_msg be an indexed text;
		now error_msg is "Expected: [B], Got: [A][line break]";
		record a failure of error_msg;
	start capturing text;

[ Assert that any condition is true, but with less information on failure ]
To assert that/-- (C - a condition):
	(- Assert_Condition({C}); -).

Include (-
[ Assert_Condition C;
	EndCapture();
	(+ the test assertion count +)++;
	(+ the total assertion count +)++;
	if (~~(C))
	{
		(+ the assertion failures count +)++;
		print "Failure for test: ";
		print (INDEXED_TEXT_TY_Say) (+ the current unit test name +);
		print ", assertion: ", (+ the test assertion count +), ". (Asserted condition is false)^";
	}
	StartCapture();
];
-).

Chapter - Resetting the Game After Each Test Set (in place of Chapter - The Unit test rules unindexed in Simple Unit Tests by Dannii Willis)

The current unit test name is an indexed text variable.

To start the/-- next test:
	Repeat with T running through test sets:
		now the current test set is T;
		if the result of saving undo state is successful save, stop;
		read file of test results into Table of Test Results;
	stop capturing text;
	now done testing is true;
	display test results;

For reading a command when done testing is false:
	transcribe and stop capturing text;
	write file of test results from Table of Test Results;
	restore undo state.
	
Chapter - Helpful phrases

To extract (guy - a person) to (place - a room):
	extract guy from combat;
	move guy to place;
	
To have (guy - a person) defeat (loser - a person):
	Now the health of loser is -1;
	Have an event of guy killing loser;
	
To have the player sacrifice (stuff - a power):
	now the current question is "Which power do you want to sacrifice? (Please enter a number.)";
	now sacrifice-lijst-2 is {};
	add stuff to sacrifice-lijst-2;
	now sacrifice-lijst is {"sacrifice", "don't sacrifice"};
	now the number understood is 1;
	follow the sacrifice rule.

To assert that (message - an indexed text) includes (pattern - an indexed text):
	record a test attempt;
	unless message matches the regular expression pattern:
		Let error_msg be an indexed text;
		now error_msg is "Regular expression '[pattern]' was not found in the text:[paragraph break]'[message]'[line break]";
		record a failure of error_msg;

Chapter - test plays

Section - Aite Champions vs Bat

A first scenario rule:
	Now the current unit test name is "[the current test set]";
	log "Now testing [the current test set].";

A scenario rule when testing Aite champions vs bat:
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Chton is testobject;
		
[TODO: create randomized test plays
attempt rulebook does something that might make the test qualify
application rulebook check if the test applies and marks it as completed - or chooses which test to run based on attempt outcome
assertion rulebook runs the test's assertions]

A test play when testing Aite champions vs bat:
	try butterflying;
	try meatboying;
	extract the player to the location of Drakul's lifeblood;
	try taking Drakul's lifeblood;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Chton;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Chton is 4;
	extract the player to Hall of Gods;
	have the player and the healer of aite fight in Arena of the Gods;
	try drinking Drakul's lifeblood;
	try turning bat;
	test aite spike vs bat;
	
Player-targeted is a truth state that varies.
Player-damaged is a truth state that varies.

Aite spike vs bat is a randomized event.

Randomized event testing for aite spike vs bat:
	now the health of the healer of Aite is 100;
	let previous health be the health of the player;
	now player-damaged is false;
	now player-targeted is false;
	transcribe and restart capturing;
	have Aite intervene on behalf of the healer of Aite;
	transcribe and stop capturing;
	now the event description is "[the captured text]";
	start capturing text;
	if the health of the player is less than the previous health, now player-damaged is true;
	if the event description matches the regular expression "you":
		now player-targeted is true;
		assert that the event description includes "in front of";
	
bat crashing into spike is a random outcome. It results from Aite spike vs bat.
bat avoiding huge spike is a random outcome. It results from Aite spike vs bat.
bat avoiding gigantic spike is a random outcome. It results from Aite spike vs bat.

Random outcome testing when bat crashing into spike became the possibility:
	if player-damaged is false, make no decision;
	mark the outcome achieved;
	assert that the event description includes "crash into";
	
Random outcome testing when bat avoiding huge spike became the possibility:
	if player-targeted is false, make no decision;
	if player-damaged is true, make no decision;
	unless the event description matches the regular expression "huge", make no decision;
	mark the outcome achieved;
	assert that the event description includes "fly over";
	
Random outcome testing when bat avoiding gigantic spike became the possibility:
	if player-targeted is false, make no decision;
 	if player-damaged is true, make no decision;
	unless the event description matches the regular expression "gigantic", make no decision;
	mark the outcome achieved;
	assert that the event description includes "fly around";
	
Section - Parting Shots
	
parting shots is a test set.

A scenario rule when testing parting shots:
	now mindslug is testobject;
	now armadillo is testobject;
	now cloak of shadows is testobject;
	
A test play when testing parting shots:
	now the player carries the cloak of shadows;
	try wearing the cloak of shadows;
	try butterflying;
	While the location is not the location of mindslug:
		let the way be the best route from the location to the location of mindslug;
		record a test attempt;
		if the way is a direction:
			try going the way;
		otherwise:
			record failure "Can't find a route to mindslug.";
			rule fails;
	try taking off the cloak of shadows;
	schedule fanatics-retreat;
	
fanatics-retreat is a turn-based event. The scheduled action of fanatics-retreat is the action of retreating.

Testing a turn-based event for fanatics-retreat:
	assert that the event description includes "mindslug attacks";
	
[lose concentration sometimes?]