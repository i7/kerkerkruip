Kerkerkruip Automated Testing by Mike Ciul begins here.

Use authorial modesty.

Volume - Test Framework (not for release)

Include Simple Unit Tests by Dannii Willis.
Include Text Capture by Eric Eve. [Actually, this must be included before Basic Screen Effects]

Use maximum capture buffer length of at least 16384.
Use maximum text length of at least 16384.

Chapter - Persistent data

The file of test transcript is called "testtranscript".

The event description is a text that varies.

To log (msg - a text):
	Let T be the substituted form of msg;
	let currently capturing be whether or not text capturing is active;
	if currently capturing is true, transcribe and stop capturing text because "logging message for";
	say "[line break][T]";
	append "**** [T][line break]" to file of test transcript;
	if currently capturing is true, start capturing text;
	
To transcribe (T - a text):
	let message be the substituted form of "[bracket][T][close bracket][command clarification break]";
	if text capturing is active:
		say message;
	otherwise:
		append "[message]" to file of test transcript;

To say current test description:
	say  "[current test set], [scheduled event] turn [the turn count], assertion count=[test assertion count]";
	
To transcribe and stop capturing text/--:
	transcribe and stop capturing because "transcribe and stop capturing";
	
To transcribe and stop capturing text/-- because (reason - a text):
	stop capturing text;
	if "[the captured text]" matches the regular expression ".":
		transcribe "[reason] [current test description]";
		append "[the captured text]" to file of test transcript;
	 
To transcribe and restart capturing text/--:
	transcribe and stop capturing because "transcribe and restart capturing";
	
To transcribe and restart capturing text/-- because (reason - a text):
	if text capturing is active, transcribe and stop capturing text because reason;
	start capturing text;
	
To stop and save event description:
	stop and save event description because "stop and save";
	
To stop and save event description because (reason - a text):
	transcribe and stop capturing text because reason;
	now the event description is the substituted form of "[the captured text]";
	
The file of test results is called "testresults".

Table of Test Results
Test Set (test set)	Total (number)	Failures (number)	Failure Messages (indexed text)
with 100 blank rows

The file of test set queue is called "testqueue"

Table of Test Set Queue
Test Set (test set)	Random-Seed (number)
with 100 blank rows

To queue (T - a test set):
	choose a blank row in Table of Test Set Queue;
	Now test set entry is T;
	Now the random-seed entry is 26. [TODO: set this manually if desired]
	
To queue all test sets:
	Repeat with T running through enabled test sets:
		queue T.
		
To record a test attempt:
	increment the test assertion count;
	increment the total assertion count;
	if there is a test set of the current test set in Table of Test Results:
		choose row with test set of current test set in Table of Test Results;
	otherwise:
		choose a blank row in Table of Test Results;
		now test set entry is the current test set;
		now total entry is 0;
		now failures entry is 0;
		now failure messages entry is "";
	increment the total entry;
	transcribe and stop capturing because "recording test attempt for";
	start capturing text;

To record a/-- failure report of/-- (msg - a text):
	choose row with test set of current test set in Table of Test Results;	
	increment the assertion failures count;
	increment the failures entry;
	now the failure messages entry is the substituted form of "[failure messages entry]Failure for test: [the current test set], step: [the scheduled event], assertion [the test assertion count]: [msg][paragraph break]";
	log msg;


To display test results:
	If the number of filled rows in Table of Test Results is 0, stop;
	log "Test results:[line break]";
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
		log "[test set entry]: [total entry] tests, [failures entry] failures[line break]";
	log "Total: [grand test total] tests, [grand test failures] failures.";
	Repeat through Table of Test Results:
		if failures entry is at least 1:
			log "[line break]Failures for [test set entry]:[paragraph break]";
			log "[failure messages entry]";	
	say "To view a full transcript of all tests, see the file 'testtranscript.glkdata' in the project directory.";
	Blank out the whole of Table of Test Results;
	write file of test results from Table of Test Results; 
	if the file of noninteractive tests exists:
		stop the game abruptly;
	otherwise:
		pause the game;
	
Chapter - test steps

Section - Properties

A test step is a kind of value. Some test steps are defined by the Table of test steps.
A test step has a test step called the next move. The next move of a test step is usually normal keyboard input.

A test step can be repeatable. A test step has a number called the maximum repeats. The maximum repeats of a test step is usually 100. A test step can be uneventful.

Table of test steps
test step
normal keyboard input

A test step has a text called the maxed out report. The maxed out report of a test step is usually "[The scheduled event] repeated [repeated moves] times without resolution."

A test step can be generated.

Allowing screen effects is a truth state that varies.

Section - Capture-aware Screen Clearing (in place of Section - Clearing the screen in Basic Screen Effects by Emily Short)

To clear the/-- screen:
	(- AwareClearScreen(); -)

To clear only the/-- main screen:
	(- AwareClearMainScreen(); -)

To clear only the/-- status line:
	(- AwareClearStatus(); -).

Section - Capture-aware waiting for key-presses (in place of Section - Waiting for key-presses, quitting suddenly in Basic Screen Effects by Emily Short)

Include (-

! Wait for a safe non navigating key. The user might press Down/PgDn or use the mouse scroll wheel to scroll a page of text, so we will stop those key codes from continuing.
[ KeyPause key; 
	if (capture_active) {
		rfalse;
	}
	while ( 1 )
	{
		key = VM_KeyChar();
		#Ifdef TARGET_ZCODE;
		if ( key == 63 or 129 or 130 or 132 )
		{
			continue;
		}
		#Ifnot; ! TARGET_GLULX
		if ( key == -4 or -5 or -10 or -11 or -12 or -13 )
		{
			continue;
		}
		#Endif; ! TARGET_
		rfalse;
	}
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

! No longer used but included just in case
[ GetKey;
	return VM_KeyChar(); 
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

[ Note that this no longer waits for *any* key, but only safe keys. The user might press Down/PgDn or use the mouse scroll wheel to scroll a page of text, so we will stop those key codes from continuing. ]
To wait for any key:
	(- KeyPause(); -)

To wait for the/-- SPACE key:
	(- SPACEPause(); -)

Pausing the game is an activity.

To pause the/-- game:
	carry out the pausing the game activity.

For pausing the game (this is the standard pausing the game rule):
	say "[paragraph break]Please press SPACE to continue." (A);
	wait for the SPACE key;
	clear the screen.

To decide what number is the chosen letter:
	(- GetKey() -)
		
To stop the/-- game abruptly:
	(- quit; -)

Section - Enabling screen effects when testing is done

Initial scheduling of normal keyboard input:
	now allowing screen effects is true.

Section - Scheduling

To decide whether testing (T - a test step):
	decide on whether or not the scheduled event is T;

To decide whether testing (D - a description of test steps):
	Repeat with T running through D:
		if testing T, yes;
	no.

The repeated moves is a number that varies;

The scheduled event is a test step that varies. The scheduled event is the normal keyboard input.

Initial scheduling rules are a test step based rulebook.

Initial scheduling for a test step (this is the reset act counts rule):
	repeat with guy running through people:
		now the act count of guy is 0;
			
To schedule (the event described - a test step):
	transcribe and restart capturing because "scheduling [the event described] for";
	if the event described is not the scheduled event:
		now the scheduled event is the event described;
		if the event described is normal keyboard input:
			transcribe and stop capturing because "normal keyboard input was the new event of";
			say line break;
			start capturing text;
		otherwise:
			log "  next step:  [the event described]";
		follow the initial scheduling rules for the event described;
		now the repeated moves is 0;
	otherwise:
		transcribe and stop capturing because "repeating";
		start capturing text;
		increment the repeated moves;
	now the event described is not generated;
	transcribe and restart capturing because "done scheduling";
	
Before taking a player action when the scheduled event is generated:
	stop and save event description because "testing effects of";
	Let repeat be whether or not (the scheduled event is repeatable) and (the repeated moves > 0);
	now the scheduled event is not generated;
	say " .[run paragraph on]";
	start capturing text;
	follow the testing effects rules for the scheduled event;
	transcribe and stop capturing because "done testing effects of";
	Let repeat be whether or not the scheduled event is [still] repeatable;
	if repeat is true and the repeated moves is not less than the maximum repeats of the scheduled event:
		now repeat is false;
		if the scheduled event is uneventful:
			record success of the scheduled event;
		otherwise:
			assert "[the maxed out report of the scheduled event]" based on false;
			Repeat with the attempt running through not achieved possible randomized outcomes:
				assert "After [the scheduled event], [the attempt] was still not tested" based on false;
	if repeat is true:
		schedule the scheduled event;
	otherwise:
		schedule the next move of the scheduled event;
	
Section - Generating Actions

For taking a player action when the scheduled event is not the normal keyboard input (this is the test step player action rule):
	if the player is at-React:
		follow the choosing a player reaction rules;
	otherwise:
		follow the choosing a player action rules;
		now the scheduled event is generated;
		
The test step player action rule is listed first in the for taking a player action rulebook.
		
A test step has an object called the location-target.

To decide which room is the action-destination of (current move - a test step):
	Let the current destination be the location-target of the current move;
	if the current destination is nothing, decide on Null-room;
	if the current destination is a room, decide on the current destination;
	decide on the location of the current destination.

The delayed action is a stored action that varies. The delayed action is the action of waiting.

A test step can be extracting.

For taking a player action (this is the move to the destination of a test step rule):
	if the player is at-React:
		make no decision;
	Let the place be the action-destination of the scheduled event;
	if the place is the location:
		transcribe and restart capturing because "arrived at destination [the place] for";
	if the place is Null-room or the place is the location:
		make no decision;
	if the scheduled event is extracting:
		extract the player to the place;
		generate the action of waiting;
		rule succeeds;
	Let the way be the best route from the location to the place;
	if the way is not a direction:
		record failure of the scheduled event with message "No available route from [the location] to [the location-target of the scheduled event] (in [the place])";
		make no decision;
	generate the action of going the way;
		
The move to the destination of a test step rule is listed before the test step player action rule in the for taking a player action rulebook.

Choosing a player action is a rulebook. The choosing a player action rules have default success.

Last choosing a player action rule (this is the wait by default rule):
	generate the action of waiting.

Choosing a player reaction is a rulebook. The choosing a player reaction rules have default success.

[I7 names borrowed from Ron Newcomb's Original Parser]
The action in progress is an action name that varies. 
The person requesting is a person that varies. 
The action in progress variable translates into I6 as "action".
The person requesting variable translates into I6 as "act_requester".

To begin the current action: (- BeginAction(action, noun, second); -)

To generate (the desired action - a stored action):
	transcribe "Player action: [the desired action]";
	now the action in progress is the action name part of the desired action;
	now the person asked is the actor part of the desired action;
	[now the person requesting is nothing;] [not allowed in I7?]
	if the person asked is not the player, now the person requesting is the player;
	now the noun is the noun part of the desired action;
	now the second noun is the second noun part of the desired action;
	begin the current action;
	
The compelled action is a stored action that varies. The compelled action is the action of waiting.

To compel (the desired action - a stored action):
	Let the guy be the actor part of the desired action;
	transcribe "compelling [the desired action][if the guy is asleep] and waking up [the guy]";
	now the guy is not asleep;
	Now the compelled action is the desired action.
	
The automated menu question answer is a number that varies.

First for reading a command when the automated menu question answer is greater than 0:
	change the text of the player's command to "[the automated menu question answer]".

To select menu question answer (N - a number):
	transcribe "Selecting answer [N]";
	now the automated menu question answer is N;
	carry out the reading a command activity;
	now the automated menu question answer is 0;

A Standard AI rule for a person (called P) (this is the compel an action rule):
	if P is at-Act and the actor part of the compelled action is P:
		try the compelled action;
		now the compelled action is the action of waiting;
		rule succeeds.
	
The compel an action rule is listed before the insane people attack themselves rule in the standard AI rulebook.

Last choosing a player reaction:
	generate the action of waiting.

testing effects rules are a test step based rulebook.

Chapter - Test Sets

A test set is a kind of value. null-test is a test set.

A test set can be isolated.

Definition: A test set (called the procedure) is enabled:
	If no test set is isolated, yes;
	decide on whether or not the procedure is isolated.

Definition: the null-test is enabled: no.

A test set has a test step called the first move. The first move of a test set is usually normal keyboard input.

The current test set is a test set that varies.

To decide what number is (T - a test set) as a number: (- {T} -);
To decide what test set is (T - a number) as a test set: (- {T} -);

Done testing is a truth state that varies.

To decide whether testing (T - a test set):
	if done testing is true, no;
	decide on whether or not the current test set is T;

[The random seed rule is listed before the reaper carries a random scythe rule in the when play begins rules.]

The file of noninteractive tests is called "noninteractivetests".

The run the unit tests rule is listed before the load achievements rule in the before showing the title screen rules.

Before showing the title screen (this is the run the unit tests rule):
	now allowing screen effects is true;
	if the file of test set queue exists:
		read file of test set queue into Table of Test Set Queue;
	if the file of test results exists:
		read file of test results into Table of Test Results;
	if the file of noninteractive tests exists:
		if screen reader mode is unset:
			enable screen reader mode;
		if the number of filled rows in Table of Test Set Queue is 0 and the number of filled rows in Table of Test Results is 0:
			try all-test queuing;
	if the number of filled rows in Table of Test Set Queue is 0:
		display test results;
		now done testing is true;

First for showing the title screen when done testing is false:
	do nothing.
	
First after showing the title screen (this is the run all tests rule):
	transcribe and stop capturing because "starting test set with";
	if done testing is true, make no decision;
	now allowing screen effects is false;
	initialize test steps;
	Choose row 1 in Table of Test Set Queue;
	if the random-seed entry is not 0:
		log "Seeding random number generator with [random-seed entry]";
		seed the random-number generator with the random-seed entry;
	now the current test set is the test set entry;	
	blank out the whole row;
	Now the current unit test name is "[the current test set]";
	log "Now testing [the current test set].";
	follow the scenario rules;
	transcribe and restart capturing text because "done setting scenario for";

To decide which test set is the initiator of (the event -  a test step):
	Repeat with the candidate running through test sets:
		if the event is the first move of the candidate, decide on the candidate;
	Decide on the null-test.
	
To initialize test steps:
	Let the current set be the null-test;
	Let the last event be normal keyboard input;
	Repeat with the next event running through test steps:
		Let the new test set be the initiator of the next event;
		if the new test set is not the null-test:
			now the current set is the new test set;
		otherwise if the last event is not normal keyboard input:
			now the next move of the last event is the next event;
		now the last event is the next event;
	
Last when play begins (this is the start the next test rule):
	if done testing is false:
		follow the test play rules;
		schedule the first move of the current test set;
	
The scenario rules are a rulebook.

The test play rules are a rulebook.

Chapter - Commands to Start Tests

Test queueing is an action out of world applying to one test set. Understand "queue test [test set]" as test queueing.

Carry out test queueing a test set:
	queue the test set understood;
	say "[The test set understood] will run now.";
	start test transcript with "[the test set understood]".
	
All-test queuing is an action out of world applying to nothing. Understand "queue test all" as all-test queuing.

Carry out all-test queuing:
	queue all test sets;
	say "All test sets will run now.";
	start test transcript with "all test sets".
		
To start test transcript with (T - a text):
	unless the file of noninteractive tests exists:
		pause the game;
	write "Test transcript for Kerkerkruip: [T].[line break]" to file of test transcript;
	start the next test;
	
	
Understand "queue test/tests" and "queue test [text]" as a mistake ("You can 'queue test all' or test one of the following sets: [list test sets]").

To say list test sets:
	repeat with T running through enabled test sets:
		say "[line break][T]";
	say paragraph break.

Chapter - Resetting the Game After Each Test Set (in place of Chapter - The Unit test rules unindexed in Simple Unit Tests by Dannii Willis)

The current unit test name is an indexed text variable.

To start the/-- next test:
	write file of test set queue from Table of Test Set Queue;
	if file of save data exists:
		delete file of save data;
	restart immediately.

For reading a command when done testing is false (this is the finish current test set rule):
	transcribe and stop capturing text because "finished all tests for set of";
	write file of test results from Table of Test Results;
	start the next test;
	
Chapter - Randomized Events

A randomized outcome is a kind of value. boring lack of results is a randomized outcome.

A randomized outcome can be achieved.

Event resolution relates various randomized outcomes to one test step. The verb to result from (he results from, they result from, it is required, it is resulting from) implies the event resolution relation.

The outcome being tested is a randomized outcome that varies.

Definition: a randomized outcome is possible if it results from the scheduled event;

To decide whether (O - a randomized outcome) became the/-- possibility:
	if O is not achieved and O is possible:
		now the outcome being tested is O;
		yes;
	no.
	
To mark the/-- outcome as/-- achieved:
	[say "achieved outcome [the outcome being tested].";]
	now the outcome being tested is achieved;
	
testing effects:
	unless a randomized outcome is possible, make no decision;
  	follow the randomized outcome testing rules;
	if every possible randomized outcome is achieved:
		record success of the scheduled event;
	otherwise:
		now the scheduled event is repeatable;

randomized outcome testing is a rulebook.


Chapter - The assert phrase (in place of Chapter - The assert phrase in Simple Unit Tests by Dannii Willis)

The test assertion count is a number variable.
The total assertion count is a number variable.
The assertion failures count is a number variable.

[ Assert that two values are the same ]
To assert that/-- (A - a value) is (B - a value):
	assert that A is B with label "value";
	
To assert that/-- (A - a value) is (B - a value) with label (T - an indexed text):
	record a test attempt;
	unless A is B:
		Let error_msg be an indexed text;
		now error_msg is "Expected [T]: [B], Got: [A][line break]";
		record a failure report of error_msg;

To assert truth of/-- (C - a truth state) with message (T - an indexed text):
	record a test attempt;
	unless C is true:
		record a failure report of T;
	
To assert (T - an indexed text) based on (C - a truth state):
	assert truth of C with message T;
	
To record a/-- success of (E - a test step):
	now E is not repeatable;
	assert truth of true with message "success."

To record a/-- failure of/-- (E - a test step) with message (M - an indexed text):
	now E is not repeatable;
	assert truth of false with message M;
	
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
		print (TEXT_TY_Say) (+ the current unit test name +);
		print ", assertion: ", (+ the test assertion count +), ". (Asserted condition is false)^";
	}
	StartCapture();
];
-).


	
Chapter - Helpful phrases

To extract (guy - a person) to (place - a room):
	transcribe "moving [guy] to [place]";
	extract guy from combat;
	move guy to place;
	update the combat status;
	
To have (guy - a person) defeat (loser - a person):
	transcribe "having [guy] defeat [loser]";
	Now the health of loser is -1;
	Have an event of guy killing loser;	
	
To have the player sacrifice (stuff - a power):
	Let the power-level be the power level of stuff;
	assert truth of whether or not power-level > 0 with message "power level of sacrificed ability should be positive";
	Let divinity be a random god who infuses the location;
	transcribe "Sacrificing [stuff] to [divinity]";
	now the current question is "Which power do you want to sacrifice?";
	now sacrifice-lijst-2 is {};
	add stuff to sacrifice-lijst-2;
	now sacrifice-lijst is {"sacrifice", "don't sacrifice"};
	now the number understood is 1;
	let the previous favour be the favour of the player with divinity;
	follow the sacrifice rule;
	assert that the favour of the player with divinity is the previous favour + the power-level;

To assert that (message - an indexed text) includes (pattern - an indexed text):
	record a test attempt;
	unless message matches the regular expression pattern:
		Let error_msg be an indexed text;
		now error_msg is "Regular expression '[pattern]' was not found in the text:[paragraph break]'[message]'[line break]";
		record a failure report of error_msg;
		
To assert that (message - an indexed text) does not include (pattern - an indexed text):
	record a test attempt;
	if message matches the regular expression pattern:
		Let error_msg be an indexed text;
		now error_msg is "Regular expression '[pattern]' should not have been found in the text:[paragraph break]'[message]'[line break]";
		record a failure report of error_msg;

To assert that (N - a number) is between (A - a number) and (B - a number):
	assert truth of whether or not N is at least A and N is at most B with message "[N] is not between [A] and [B]";
	
To assert that (item - a thing) is in (place - an object):
	Let msg be indexed text;
	Now msg is "Expected location of [the item]: [place]. Got: [location of the item].";
	assert truth of whether or not the location of item is place with message msg;
	
To pause and assert that the event description includes (pattern - an indexed text):
	stop and save event description because "checking output of";
	assert that the event description includes pattern;
	transcribe and restart capturing because "done output of";
	
To pause and assert that the event description does not include (pattern - an indexed text):
	stop and save event description because "checking output of";
	assert that the event description does not include pattern;
	transcribe and restart capturing because "done checking output of".

Section - hiding-check, hidden-traveling and hiding-reveal

Traveling sneakily is a truth state that varies.

A detection rule when traveling sneakily is true:
	say "+ 100 (traveling sneakily for testing purposes)[run paragraph on]";
	increase hiding roll by 100;

The way-to-get-back is a direction that varies.
The way-to-get-there is a direction that varies.

To force the fuligin cloak to work:
	transcribe "hiding immediately";
	if the player does not enclose the fuligin cloak, now the player carries the fuligin cloak;
	if the fuligin cloak is not worn, try wearing the fuligin cloak;
	now the player is hidden;
		
Carry out taking off:
	if the noun is the fuligin cloak, now traveling sneakily is false;
	
To travel sneakily to (place - a room):
	transcribe "traveling sneakily to [place]";
	force the fuligin cloak to work;
	While the location is not the place:
		now the way-to-get-there is the best route from the location to the place;
		record a test attempt;
		if the way-to-get-there is a direction:
			let already sneaking be traveling sneakily;
			now traveling sneakily is true;
			try going the way-to-get-there;
			now traveling sneakily is already sneaking;
		otherwise:
			record failure report "Can't find a route to [place].";
			stop;
	now the way-to-get-back is the best route from the location to the retreat location;
			
previously-fast is a truth state that varies.

A test step can be hiding-check.

A test step can be hidden-traveling. A hiding-check test step is usually hidden-traveling.

initial scheduling for a test step (called the current move):
	now traveling sneakily is whether or not the current move is hidden-traveling;
	if traveling sneakily is true, force the fuligin cloak to work;
	
After taking a player action (this is the assume all actions are fast until every turn runs rule):
	now previously-fast is true;
	
First every turn (this is the remember if the last turn took time rule):
	now previously-fast is false;

[start-of-turn combat is a truth state that varies.

After taking a player action when the scheduled event is a hiding-check test step: 
	now opposition test subject is the player;
	Now start-of-turn combat is whether or not the location encloses an opposer person;]
	
testing effects for a hiding-check test step (called the current move):
	[a move can be hiding-check and hiding-reveal if it involves sneaking to a location and then revealing yourself]
	if the current move is hiding-reveal, make no decision;
	assert "the player should be hidden" based on whether or not the player is hidden;
	[ These tests are too slow, and they run way too often.
	if start-of-turn combat is false, make no decision;
	if previously-fast is true, make no decision;
	Now opposition test subject is the player;
	if the location encloses a not asleep opposer person:
		assert that the event description includes ", which must be positive\. You remain hidden\.|([doesn't see you pattern])";
	repeat with guy running through asleep opposer persons in the location:
		if the act count of guy is at least 1:
			assert that the event description includes "[The guy] sleeps peacefully";]

A test step can be hiding-reveal.


Choosing a player action when testing a hiding-reveal test step (this is the hiding-reveal action rule):
	generate the action of taking off the fuligin cloak.

Testing effects of a hiding-reveal test step:
	assert "The player should not be hidden" based on whether or not the player is not hidden.

Section - Counting Actions

A person has a number called the act count;

A person has a number called the reaction count.

Initial scheduling of a test step:
	Repeat with guy running through people:
		now the reaction count of guy is 0;
		
A combat round rule (this is the count combat actions rule):
	increment the act count of the main actor;

Before an at-react person doing something (this is the count reactions rule):
	increment the reaction count of the actor;
	
The count combat actions rule is listed before the dreadful presence effect rule in the combat round rules.
	
Section - The reusable item

The reusable item is an object that varies.

Before taking a player action:
	if the reusable item is a thing and the reusable item is not carried:
		now the player carries the reusable item;
	
A test step can be item-reading.

Choosing a player action when testing an item-reading test step:
	generate the action of reading the reusable item.

A test step can be item-throwing.

Choosing a player action when testing an item-throwing test step:
	generate the action of throwing the reusable item.

Kerkerkruip Automated Testing ends here.

---- DOCUMENTATION ----

Chapter: Basics

Section: Introduction

Kerkerkruip Automated Testing provides a framework for creating detailed playthroughs and testing that they behave as expected. Each playthrough, called a "test set" starts before dungeon generation and goes turn by turn until we run out of tests. When running the "Kerkerkruip Automated Tests" project, all test sets will execute when the game begins, and normal play won't start until they're finished. A summary of tests will be output in the game console, but a detailed transcript will also be written to a file called "testtranscript."

Kerkerkrup Automated Testing is built on the foundation of Simple Unit Tests by Dannii Willis, and makes heavy use of Text Capture by Eric Eve and Autoundo for Object Response Tests by Mike Ciul. Special credit should go to Jesse McGrew for the Hypothetical Questions extension.

Section: Assertions

To perform the tests, we have a wide variety of assertion phrases.

First, there's a simple "X is Y" assertion, but we can give it a label so the output will be clear about what we're comparing:

	assert that the body score of the player is 5 with label "body score of the player";

If we aren't looking for exact equality, we can use this phrase to test any truth state:

	assert "the body score of the player should be at least 5, but it is [body score of the player]" based on whether or not the body score of the player is at least 5;

During the normal turn sequence, all the text that was output during the turn is saved in the indexed text, "event description." It has several phrases associated with it. Here are a couple:

	assert that the event description includes "You deal .*, killing [the global defender]";
	assert that the event description does not include "You lose concentration";

Section: Test Sets

To make a test, we create a "test set:"

	bug-xyz is a test set.

Each test set will start a fresh game with a new dungeon. We can use the phrase "when testing bug-xyz" in our rules.

There is a rulebook that runs before dungeon generation called the scenario rules. We can use this to set things as testobject. We can also set them as bannedobject, to prevent them from appearing in the dungeon.

	Scenario when testing bug-xyz:
		now the swarm of daggers is testobject;
		now the Hall of Mirrors is bannedobject.

We can set the "isolated" property for exactly one test set. This will cause the test set to run by itself, skipping every other test set. This is useful when we want to fix just one thing at a time - running all the tests can take 20 minutes or more!

Section: Test Steps

To have things happen during play, create a "test step," or more than one. A test step is a kind of value, and they run in the order that they were declared in the source. We must specify which test step is the first one of the test set, and the rest will follow automatically:

	starting-out is a test step. The first move of bug-xyz is starting-out.

	second-move is a test step.

A test step corresponds to a turn, or multiple turns. It has a few rulebooks. The main ones are "initial scheduling" and "testing effects." These are test-step based rulebooks. There are also "choosing a player action" and "choosing a player reaction," which we will need if we want to actually do anything during a turn. Since these rulebooks are NOT test-step based, we will need to use the "testing (move - a test step)" phrase to invoke these at the proper time.

A test step can be "repeatable," which means it will still be current on the next turn - but the initial scheduling will not run again. The maximum repeats property says how many times it can repeat before it fails. If we make it "uneventful" it will succeed instead when the maximum repeats are reached. To make a test step stop repeating, we can:

	record success of starting-out;
or
	record failure of starting-out with message "we never got the frobulator";

Section: Initial scheduling

	initial scheduling of starting-out:
    		now the defence of the player is 100.

Initial scheduling runs as soon as the test step first becomes active, and it doesn't run again even if the step repeats.

Section: Testing effects

Testing effects runs at the very end of each turn, right before the next test step is scheduled - even if the same test step repeats.

	Testing effects of starting-out:
		assert that the location is Bridge of Doom with label "the player's location";
		assert that the event description includes "dodging would be suicidal";

Section: Player and NPC actions

There are two rulebooks for making the player take an action: "Choosing a player action" and "Choosing a player reaction." These rulebooks, which have default success, have a default rule at the end that makes the player wait. Both should make use of the "generate (action - a stored action)" phrase.

	Choosing a player action when testing starting-out:
		generate the action of going the best route from the location to the location of the swarm of daggers.

	Choosing a player reaction when testing dagger-strike:
		generate the action of dodging.

To make other people do things, we can use the "compel (action - a stored action)" phrase.

	Initial scheduling of dagger-strike:
		compel the action of the swarm of daggers attacking the player.

Kerkerkruip occasionally asks the player questions. If we want the player to answer a menu question instead of taking an action, we can use the "select menu question answer (N - a number)" phrase:

	Choosing a player action when testing entree-selection:
		Let m be 0;
		repeat with entree running through banquet-items:
			increment m;
			if the entree is the overmind:
				break;
		select menu question answer m;

Section: Other properties of test steps

TODO. (There are lots more properties of test steps - look through the code to see what they do. Location-target and hiding-check are useful for getting around the dungeon, for example.)

Chapter: Advanced usage

Section: Controlling text capture

Usually the event description contains all the text that was generated during the previous turn. But we can manipulate what is saved.

This phrase stops text capturing:

	stop and save event description

And this restarts it:

	Transcribe and start capturing;

It's important to use the "transcribe" version of this phrase so that our transcript output will contain everything.
