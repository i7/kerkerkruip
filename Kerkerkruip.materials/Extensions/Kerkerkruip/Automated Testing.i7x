Automated Testing by Kerkerkruip begins here.

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
	transcribe and restart capturing because "transcribe and restart capturing";
	
To transcribe and restart capturing text/-- because (reason - a text):
	if text capturing is active, transcribe and stop capturing text because reason;
	start capturing text;
	
To stop and save event description:
	stop and save event description because "stop and save";
	
To stop and save event description because (reason - a text):
	transcribe and stop capturing text because reason;
	now the event description is the substituted form of "[the captured text]";
	start capturing text; [clear the captured text]
	stop capturing text;
	
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
	log the failure messages entry;
	
To say grand test summary:
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
	say "[grand test total] test[s] in [number of filled rows in Table of Test Results] set[s], [grand test failures] failure[s]";
	
To display test results:
	If the number of filled rows in Table of Test Results is 0, stop;
	log "Test results:[line break]";
	Repeat through Table of Test Results:	
		log "[test set entry]: [total entry] tests, [failures entry] failures[line break]";
	log "Total: [grand test summary].";
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

Table of test steps
test step
normal keyboard input

[Warning: this returns 0 after the final outcome is resolved... is this undesirable? We could run through all not untested outcomes, but the number would still freeze after the last one resolved. That might be ok, though]

To decide what number is the repeated moves:
	Let the moves be 0;
	Repeat with the event running through possible randomized outcomes:
		if the attempt count of the event > the moves:
			now the moves is the attempt count of the event;
	decide on the moves.

A test step can be generated.

Allowing screen effects is a truth state that varies.

testing effects rules are a test step based rulebook.

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

The scheduled event is a test step that varies. The scheduled event is the normal keyboard input.

Initial scheduling rules are a test step based rulebook.

Initial scheduling for a test step (this is the reset act counts rule):
	repeat with guy running through people:
		now the act count of guy is 0;
			
rescheduling rules are a test step based rulebook.

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
	otherwise:
		transcribe and stop capturing because "repeating";
		start capturing text;
		follow the rescheduling rules for the event described;
	now the event described is not generated;
	transcribe and restart capturing because "done scheduling";
	
Before taking a player action when the scheduled event is generated (this is the test event effects rule):
	stop and save event description because "testing effects of";
	[Let repeat be whether or not (the scheduled event is repeatable) and (the repeated moves > 0);]
	now the scheduled event is not generated;
	say " .[run paragraph on]";
	start capturing text;
	follow the testing effects rules for the scheduled event;
	transcribe and stop capturing because "done testing effects of";
	if there is a possible randomized outcome [repeat is true]:
		schedule the scheduled event;
	otherwise:
		schedule the next move of the scheduled event;

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
			try all-test queueing;
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
	log "Completed so far: [grand test summary], with [number of filled rows in Table of Test Set Queue] set[s] left to test";
	Repeat through Table of Test Results:
		if failures entry > 0:
			log "  [failures entry] failures in [test set entry]";
	log "Now testing [the current test set].";
	[TODO: handle interaction between test config file and scenario]
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
	
All-test queueing is an action out of world applying to nothing. Understand "queue test all" as all-test queueing.

Carry out all-test queueing:
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
	
Before printing the player's obituary when done testing is false (this is the abort the current test set if game over rule):
	record failure report "the player died";
	transcribe and stop capturing because "game over at";
	write file of test results from Table of Test Results;
	start the next test.
		
Chapter - Randomized Events

[TODO: put all randomized outcomes in a table and save it to a file. Then we can restart the game repeatedly and use randomized outcomes to generate statistics about dungeon generation]
A randomized outcome is a kind of value. Some randomized outcomes are defined by the Table of Randomized Outcomes.

A randomized outcome has a text called the description.

To say (result - a randomized outcome):
	if the description of the result is not empty:
		say "[description of the result]";
	otherwise:
		say "[the result]";
		
A randomized outcome can be untested, possible, failed, or achieved. A randomized outcome is usually untested.
Definition: a randomized outcome is resolved if it is failed or it is achieved.

The last successful outcome is a randomized outcome that varies. The last successful outcome is boring lack of results.

To decide whether (event - a randomized outcome) just succeeded:
	if the event is untested, no;
	decide on whether or not the event is the last successful outcome;

A randomized outcome has a number called the likelihood. A randomized outcome has a number called the minimum attempts. [The expected probability of success is likelihood/minimum attempts]

A randomized outcome has a number called the attempt count. A randomized outcome has a number called the success count.

A randomized outcome has a number called the maximum attempts.

Table of Randomized Outcomes
outcome	description	attempt count	success count	likelihood (number)	minimum attempts (number)	maximum attempts (number)
boring lack of results	""	0	0	0	1	1
generic reusable event	""	0	0	1	1	100

To decide whether we make (event - a randomized outcome) possible:
	if event is untested:
		now event is possible;
		if the maximum attempts of event is 0:
			if minimum attempts of event is 1:
				now maximum attempts of event is 1;
			otherwise:
				now maximum attempts of event is 100;
		now success count of event is 0;
		now attempt count of event is 0;
	if the last successful outcome is the event, now the last successful outcome is boring lack of results; [so this event will not be "just succeeded"]
	decide on whether or not event is possible;
	
To make (event - a randomized outcome) possible:
	Let throwaway result be whether or not we make the event possible.
	
To decide whether waiting for resolution:
	decide on whether or not there is a possible randomized outcome;
	
[This phrase tells us whether we need to keep looping. It also resets everything as a side effect when we're done looping.

To be used when deciding whether to repeat test steps]
To decide whether we reset every possible outcome:
	if waiting for resolution, no;
	now every randomized outcome is untested;
	yes.
	
[TODO: Normalize regex matches against event description so we can use a brief consistent phrase. Also, do we really need event description, or can we just use the captured text?]

To test (event - a randomized outcome) against (success - a truth state):
	[TODO: print a period to show progress]
	unless we make the event possible, stop;
	let percent-tolerance be 5; [a constant - do we want it to be a property?]
	increment attempt count of the event;
	if likelihood of the event is 0:
		assert "[event] happened after [attempt count of the event] attempts, but it should never happen" based on whether or not success is false;
		if success is true:
			now the event is failed;
		otherwise:
			now the last successful outcome is the event;
			if the attempt count of the event is not less than the maximum attempts of the event:
				now the event is achieved;
	otherwise:
		if success is true:
			now the last successful outcome is the event;
			increment success count of the event;
		Let target be (likelihood of the event * attempt count of the event) / (minimum attempts of the event); [parentheses are needed, but I don't know why]
		Let tolerance be percent-tolerance * attempt count of the event / 100;
		if the attempt count of event is less than the minimum attempts of event:
			[not enough attempts to determine success or failure]
			stop;
		Let the error be the absolute value of (success count of the event - target);
		if error is not greater than tolerance:
			assert "success" based on true; [record that the test is completed]
			[say "succeeded [success count of the event] times after [attempt count of the event] attempts, coming within [tolerance] of [target].";]
			now the event is achieved;
		otherwise if the attempt count of the event is not less than the maximum attempts of the event:
			assert "After [maximum attempts of the event] attempt[s], [the event] happened [success count of the event] times (never within [tolerance] of the target number [target])" based on whether or not likelihood of the event is 0;
			now the event is failed.

To test (event - a randomized outcome) against (T - a text):
	test event against whether or not the event description matches the regular expression T;

To fail (event - a randomized outcome) based on (result - a truth state):
	now likelihood of event is 0;
	test event against result;
		
To fail (event - a randomized outcome) on result (T - a text):
	fail event based on whether or not the event description matches the regular expression T;
	
To achieve (event - a randomized outcome) based on (result - a truth state):
	unless we make the event possible, stop;
	increment attempt count of event;
	if result is true:
		now event is achieved;
		now the last successful outcome is the event;
		assert "success" based on true; [record that the test is completed]
	otherwise if attempt count of event is not less than maximum attempts of event:
		assert "[the event] never happened after [attempt count of event] attempts" based on false;
		now event is failed;
		
To achieve (event - a randomized outcome) on result (T - a text):
	achieve event based on whether or not the event description matches the regular expression T;
	
[TODO: combat round tests]

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

Table of Randomized Outcomes (continued)
outcome	description	likelihood	minimum attempts
moving towards the destination	"finding a route from [the location] to [the location-target of the scheduled event][if the location-target of the scheduled event is not the action-destination of the scheduled event](in [the the action-destination of the scheduled event])[end if]"	1	1
compelling an action	"[the compelled action]"	1	1
reacting to compelled action	""	1	1

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
	fail moving towards the destination based on whether or not the way is not a direction;
	if the way is a direction, generate the action of going the way;
		
The move to the destination of a test step rule is listed before the test step player action rule in the for taking a player action rulebook.

Choosing a player action is a rulebook. The choosing a player action rules have default success.

Last choosing a player action rule (this is the wait by default rule):
	generate the action of waiting.

Choosing a player reaction is a rulebook. The choosing a player reaction rules have default success.

First choosing a player reaction (this is the track reaction to compelled action rule):
	if reacting to compelled action is possible, achieve reacting to compelled action based on true;
	make no decision;
	
To decide whether waiting for player reaction:
	if waiting for compelled action, yes;
	decide on whether or not reacting to compelled action is possible;

[I7 names borrowed from Ron Newcomb's Original Parser]
The action in progress is an action name that varies. 
The person requesting is a person that varies. 
The action in progress variable translates into I6 as "action".
The person requesting variable translates into I6 as "act_requester".

To begin the current action: (- BeginAction(action, noun, second); -)

To generate (the desired action - a stored action):
	transcribe "Player [if the player is at-react]re[end if]action: [the desired action]";
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
	Now the compelled action is the desired action;
	make compelling an action possible;
	
To decide whether waiting for compelled action:
	decide on whether or not compelling an action is possible;
	
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
		if the action name part of the compelled action is the attacking action:
			if the noun part of the compelled action is the player:
				make reacting to compelled action possible;
		achieve compelling an action based on true;
		now the compelled action is the action of waiting;
		rule succeeds.
	
The compel an action rule is listed before the insane people attack themselves rule in the standard AI rulebook.

Last choosing a player reaction:
	generate the action of waiting.

Chapter - Testing Dungeon Generation

The generation test rules is a rulebook.

the generation count is a number that varies.
the generation minimum is a number that varies.
		
This is the generate many test dungeons rule:
	while the generation count < the generation minimum:
		[aw, here we go again. We have to undo all the treasure placement... and what else?]
		Repeat with guy running through denizen npc people:
			remove guy from play;
		Repeat with item running through on-stage not non-treasure things:
			remove item from play;
		follow the dungeon generation rules;
		increment the generation count;
		follow the generation test rules;
		say "* [generation minimum - generation count] more dungeons to generate for [the current test set]";

The generate many test dungeons rule substitutes for the create the dungeon rule when the generation minimum is at least 1.

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
	
To succeed based on (result - a truth state) within (N - a number) attempts:
	Now description of generic reusable event is "[the scheduled event]";
	Now maximum attempts of generic reusable event is N;
	achieve generic reusable event based on whether or not result is true;
	if generic reusable event is resolved, now generic reusable event is untested;

To fail based on (result - a truth state) within (N - a number) attempts:
	Now description of generic reusable event is "[the scheduled event] failing";
	Now maximum attempts of generic reusable event is N;
	fail generic reusable event based on whether or not result is true;
	if generic reusable event is resolved, now generic reusable event is untested;
	
To succeed based on (result - a truth state):
	succeed based on result within 100 attempts;
	
To succeed on result (R - a text):
	succeed based on whether or not the event description matches the regular expression R;
	
To fail based on (result - a truth state):
	fail based on result within 100 attempts;
	
To fail on result (R - a text):
	fail based on whether or not the event description matches the regular expression R;
	
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

Definition: A room (called place) is reachable:
	if the place is the location, yes;
	if the place is nogo, no;
	decide on whether or not the best route from the location to the place is a direction.

Definition: A thing is reachable if the location of it is a reachable room.

To swap the occupants of (first place - a room) and (second place - a room):
	Let swap place be a random unoccupied room;
	Repeat with guy running through people in first place:
		extract guy to the swap place;
	if the second place is not the swap place:
		Repeat with guy running through people in second place:
			extract guy to first place;
		Repeat with guy running through people in swap place:
			extract guy to second place;
			
To extract (guy - a person) to (place - a room), making sure it is unoccupied:
	if making sure it is unoccupied and place is occupied:
		Let elsewhere be a random unoccupied reachable room;
		transcribe "moving occupants of [place] to [elsewhere]";
		swap the occupants of place and elsewhere;
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

[TODO: replace these counters with randomized outcomes?]

A person has a number called the reaction count.

Initial scheduling of a test step:
	Repeat with guy running through people:
		now the reaction count of guy is 0;
		
The testing combat round rules are an object based rulebook.

A first combat round rule (this is the test combat round of previous main actor rule):
	follow the testing combat round rules for the main actor;
	
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

Section - Occupied and Unoccupied

Definition: A room is occupied rather than unoccupied if it encloses a person.

Section - Counting Hits

A person has a number called the hitting count.

To assert (N - a number) hit/hits by (guy - a person):
	Let msg be indexed text;
	Now msg is "Expected hitting count for [The guy]: [N] Got: [hitting count of the guy].";
	assert truth of whether or not N is hitting count of the guy with message msg;

First before an actor hitting (this is the increment hitting count rule):
	increment the hitting count of the actor;
	[log "incremented hitting count of [the actor] to [hitting count of the actor]";]
			
To reset hitting counts:
	Repeat with guy running through people:
		Now the hitting count of guy is 0.
		
A last initial scheduling rule (this is the reset hitting counts when scheduling a test step rule):
	reset hitting counts;
	
A first sudden combat reset rule for the player (this is the reset hitting counts before extracting the player rule):
	reset hitting counts;

Section - Diggable

[maybe this could be factored into systems?]
Definition: a direction (called way) is diggable:
	if way is not cardinal, no;
	let x be the x way of location;
	let y be the y way of location;
	let z be the z way of location;
	if the space at x by y by z is free:
		decide on whether or not there is at least one not placed tunnel;
	otherwise:
		let item be the room at x by y by z;
		if item is the room way from the location: 
			no;
		otherwise:
			decide on whether or not item is connectable;

Section - Test Arena and Battle Phrases

Test Arena is an arena. The staging area of Test Arena is maze-waiting-room.

Test Arena is faction-imposing.

reaction-type is a kind of value. The reaction-types are no reaction, parry reaction, dodge reaction, block reaction. [TODO: use action names instead?]

A reaction-type has a text called the report. The report of a reaction-type is usually "";

The report of the parry reaction is "\(defender parrying\)".
The report of the dodge reaction is "\(defender dodging\)".
The report of the block reaction is "\(block (bonus|penalty)\)".

To assign (reaction - a reaction-type) to (guy - a person):
	if reaction is parry reaction:
		now guy is at parry;
	else if reaction is dodge reaction:
		now guy is at dodge;
	else if reaction is block reaction:
		now guy is at-block;
		
To prepare a test battle with (guy - a person), inviting groups:
	if inviting groups:
		now Test Arena is challenged-group-inviting;
	otherwise:
		now Test Arena is not challenged-group-inviting;
	Repeat with the old enemy running through people in Test Arena:
		if the old enemy is not the player:
			extract the old enemy from combat;
			remove the old enemy from play;
	Generate the action of challenging guy in Test Arena;
	Compel the action of guy waiting;
	
Combat hit is a randomized outcome.

To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit by (aggressor - a person) with result (outcome - a text) in/on (likelihood - a number) out of (total tries - a number) attempts:
	Let original-defender-weapon be a random readied weapon enclosed by guy;
	Let original-attacker-weapon be a random readied weapon enclosed by aggressor;
	Now the description of combat hit is "[guy] doing [reaction] to [strength] melee hit by [aggressor]";
	[don't repeat if the result should always happen (1/1)]
	If total tries is 1, now maximum attempts of combat hit is 1;
	[only repeat the specified amount if the result should never happen (0/X)]
	if likelihood is 0, now maximum attempts of combat hit is total tries;
	now minimum attempts of combat hit is total tries;
	now likelihood of combat hit is likelihood;
	make combat hit possible;
	while combat hit is not resolved: 
		transcribe and restart capturing;
		assign reaction to guy;
		now the melee of the aggressor is strength;
		now the health of guy is 1000;
		now the defence of guy is 50;
		now guy carries original-defender-weapon;
		if original-defender-weapon is not readied, try guy readying original-defender-weapon;
		now aggressor carries original-attacker-weapon;
		if original-attacker-weapon is not readied, try aggressor readying original-attacker-weapon;
		try the aggressor hitting guy;
		stop and save event description because "[combat hit] attempt [attempt count of combat hit] -";
		if report of the reaction is not empty, assert that the event description includes "[report of reaction]";
		test combat hit against "[outcome]";
	transcribe and restart capturing;
	
To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit with result (outcome - a text):
	have guy do a reaction to a strength melee hit by the player with result outcome.
	
To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit by (aggressor - a person) with result (outcome - a text):
	have guy do a reaction to a strength melee hit by aggressor with result outcome in 1 out of 1 attempts.
		
To assert that/-- (item - a weapon) readied after (circumstance - a text):
	assert "[The item] should be readied after [circumstance]" based on whether or not the player holds item and item is readied;
	
To assert no weapon after (circumstance - a text):
	Let the item be a random readied weapon enclosed by the player;
	assert "Nothing besides a natural weapon should be readied after [circumstance]" based on whether or not the item is nothing or the item is a natural weapon.
		

Automated Testing ends here.

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

A test step will repeat if any randomized events are "possible," i.e. they have been tested but not resolved. There is a generic randomized event you can use to repeat any test step. These phrases make it easy:

succeed at (text) based on (truth state)
fail because (text) based on (truth state)

You can specify number of repeats for these phrases:
	
succeed at (text) within (number) attempts based on (truth state)
fail because (text) within (number) attempts based on (truth state)

Here are some examples:
	succed at "getting the frobulator" based on whether or not the player carries the frobulator;
	
	fail because "caught by the gremlin" within 20 attempts based on whether or not the gremlin is in the location;

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
