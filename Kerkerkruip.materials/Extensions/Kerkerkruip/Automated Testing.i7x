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
	say  "[current test set], [scheduled event] turn [the turn count], ";
	if there is an achieved outcome:
		say "achieved [the list of achieved outcomes] | ";
	if there is a failed outcome:
		say "failed [the list of failed outcomes] | ";
	repeat with event running through possible outcomes:
		say "'[event]' [success count of event]/[attempt count of event] times | ";
	say "([test assertion count] assertions)";
	
To update the/-- event description/--:
	update the event description because "transcribe and stop capturing";
	
To update the/-- event description because (reason - a text):
	if text capturing is active: [is this necessary to check? Is it a good idea?]
		stop capturing text;
		if "[the captured text]" matches the regular expression ".":
			transcribe "[reason] [current test description]";
			now the event description is the substituted form of "[the event description][the captured text]";
			append "[the captured text]" to file of test transcript;
		start capturing text; [and clear the captured text]
	
To transcribe and stop capturing text/--:
	transcribe and stop capturing because "transcribe and stop capturing";
	
To transcribe and stop capturing text/-- because (reason - a text):
	update the event description because reason;
	stop capturing text;
	
To clear the/-- event description:
	clear the event description because "clearing the event description";
	
To clear the/-- event description because (reason - a text):
	if text capturing is active, update the event description because reason;
	now the event description is "";
			
The file of test results is called "testresults".

Table of Test Results
Test Set (test set)	Total (number)	Failures (number)	Failure Messages (indexed text)
with 100 blank rows

The file of test set queue is called "testqueue"

Table of Test Set Queue
Test Set (test set)	Random-Seed (number)	Unresolved Count (number)
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

To record a/-- failure report of/-- (msg - a text):
	choose row with test set of current test set in Table of Test Results;	
	increment the assertion failures count;
	increment the failures entry;
	let new message be "Failure for test: [the current test set], step: [the scheduled event], assertion [the test assertion count]: [msg][paragraph break]";
	now the failure messages entry is the substituted form of "[failure messages entry][new message]";
	log the new message;
	
To say grand test summary:
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
	say "[grand test total] test[s] in [number of filled rows in Table of Test Results] set[s], [grand test failures] failure[s]";
	if there is a possible outcome:
		say "; [number of possible outcomes] outcome[s] still being tested" ;
	
To display test results:
	If the number of filled rows in Table of Test Results is 0, stop;
	log "Test results:[line break]";
	Repeat through Table of Test Results:
		if failures entry is 0:
			transcribe "[test set entry]: [total entry] tests, all passed";
		otherwise:	
			log "[test set entry]: [total entry] tests, [failures entry] failures";
	log "Total: [grand test summary].";
	Repeat through Table of Test Results:
		if failures entry is at least 1:
			log "";
			log "Failures for [test set entry]:";
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
	Repeat with the event running through possible outcomes:
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
	update event description because "scheduling [the event described] for";
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
		transcribe "rescheduling [the event described]";
		follow the rescheduling rules for the event described;
	now the event described is not generated;
	
Before taking a player action when the scheduled event is generated (this is the test event effects rule):
	[Let repeat be whether or not (the scheduled event is repeatable) and (the repeated moves > 0);]
	now the scheduled event is not generated;
	update the event description because "testing effects of";
	follow the testing effects rules for the scheduled event;
	clear event description because "done testing effects of";
	if we reset every possible outcome:
		schedule the next move of the scheduled event;
	otherwise:
		[repeats are needed]
		schedule the scheduled event;

Chapter - Test Sets

A test set is a kind of value. null-test is a test set.

Definition: A test set (called the procedure) is enabled: yes.
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
	choose row 1 in Table of Test Set Queue;
	if there is an unresolved count entry and the unresolved count entry is at least 1:
		load test outcomes;
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
		now the xorshift seed is the random-seed entry;
	now the current test set is the test set entry;	
	Now the current unit test name is "[the current test set]";
	log "Completed so far: [grand test summary], with [number of filled rows in Table of Test Set Queue] set[s] left to test";
	Repeat through Table of Test Results:
		if failures entry > 0:
			log "  [failures entry] failures in [test set entry]";
	log "Now testing [the current test set].";
	[TODO: handle interaction between test config file and scenario]
	start capturing text;
	follow the scenario rules;

[Prevent the status window from opening]	
The check info panel capacity rule does nothing when done testing is false.

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
		update event description;
		follow the generation test rules;
		follow the test play rules; [TODO: get rid of these]
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
	choose row 1 in Table of Test Set Queue;
	if waiting for resolution:
		now the unresolved count entry is the number of possible outcomes;
		if the random-seed entry is not 0:
			if the xorshift seed is the random-seed entry:
				Let throwaway result be a random number from 1 to 2;
				transcribe "advancing random seed to [the xorshift seed]";	
			if the xorshift seed is 0:
				[TODO: find out why this happens]
				increment the random-seed entry;
			otherwise:		
				now the the random-seed entry is the xorshift seed;
		transcribe "restarting with random seed [random-seed entry] to continue [current test description]";
		save test outcomes;
	otherwise:
		[this doesn't work: delete file of test outcomes;]
		if the current test set is the test set entry:
			blank out the whole row;
	write file of test set queue from Table of Test Set Queue;
	if file of save data exists:
		delete file of save data;
	transcribe and stop capturing because "starting the next test after";
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

Section - Outcomes

[TODO: put all outcomes in a table and save it to a file. Then we can restart the game repeatedly and use outcomes to generate statistics about dungeon generation]
An outcome is a kind of value. Some outcomes are defined by the Table of outcomes.

To say (result - an outcome):
	if the description of the result is not empty:
		say "[description of the result]";
	otherwise:
		say "[the result]";
		
outcome state is a kind of value. The outcome states are outcome-untested, outcome-possible, outcome-failed, and outcome-achieved.

Definition: an outcome is resolved if the state of it is at least outcome-failed.
Definition: an outcome is untested if the state of it is outcome-untested.
Definition: an outcome is possible if the state of it is outcome-possible.
Definition: an outcome is failed if the state of it is outcome-failed.
Definition: an outcome is achieved if the state of it is outcome-achieved.

An outcome can be just-succeeded;
	
[Outcome properties:

description - a 'printed name' style text
attempt count - number of times outcome has been tested
success count - number of times a test "succeeded"
likelihood -
minimum attempts -

The probability of a test "succeeding" should be likelihood / minimum attempts.

This has some special interpretations:
	
if likelihood = 0 or likelihood = minimum attempts, then success or failure of each test is considered a certainty, and the whole outcome will fail if a single test does not perform as expected
if minimum attempts = 0, then likelihood is considered a minimum number of successes, not a probability. Setting likelihood to 1 means the whole outcome will be achieved if a single test succeeds
For all other values, a tolerance range will be established that should achieve the outcome in 99% of cases with correctly randomized successes

maximum attempts - outcome will "time out" and fail if it reaches this number without being achieved first. If you don't set this, a reasonable default will be chosen for you
maximum tolerance - do not set, will be calculated
state - determines whether the outcome should be tested. do not set directly, use "make ... possible" phrases, etc
dependency - determines whether the next outcome should be tested. do not set directly, use "serial outcome dependency" phrases
]

Table of Outcomes
outcome	description	attempt count	success count	likelihood (number)	minimum attempts (number)	maximum attempts (number)	maximum tolerance (number)	state (outcome state)	antecedent (outcome)
boring lack of results	""	0	0	0	1	1	0	outcome-untested	boring lack of results
generic reusable event	""	0	0	1	1	100	0	--	--
finish-on-success	""	0	0	1	1	1	0	--	--	

Section - Outcome Persistence

The file of test outcomes is called "testoutcomes"

To save test outcomes:
	Repeat through Table of Outcomes:
		now the description entry is the description of the outcome entry;
		now the attempt count entry is the attempt count of the outcome entry;
		now the success count entry is the success count of the outcome entry;
		now the likelihood entry is the likelihood of the outcome entry;
		now the minimum attempts entry is the minimum attempts of the outcome entry;
		now the maximum attempts entry is the maximum attempts of the outcome entry;
		now the state entry is the state of the outcome entry;
		now the antecedent entry is the antecedent of the outcome entry;
		[ingore maximum tolerance, it will be recalculated]
	write file of test outcomes from table of outcomes;
	
To load test outcomes:
	unless file of test outcomes exists, stop;
	Read file of test outcomes into table of outcomes;
	Repeat through table of outcomes:
		[skip description entry]
		if there is an attempt count entry, now the attempt count of the outcome entry is the attempt count entry;
		if there is a success count entry, now the success count of the outcome entry is the success count entry;
		if there is a likelihood entry, now the likelihood of the outcome entry is the likelihood entry;
		if there is a minimum attempts entry, now the minimum attempts of the outcome entry is the minimum attempts entry;
		if there is a maximum attempts entry, now the maximum attempts of the outcome entry is the maximum attempts entry;
		[ingore maximum tolerance, it will be recalculated]
		if there is a state entry, now the state of the outcome entry is the state entry;
		if there is an antecedent entry, now the the antecedent of the outcome entry is the antecedent entry;

Section - Statistical Help

[This phrase helps us set a reasonable error tolerance of repeated tests so they will succeed most of the time. If we use a success rate of 0.99, that will set a threshold of error such that the outcome will be achieved for 99% of random seeds]

To set the maximum tolerance for (event - an outcome) with (success rate - a real number) achievement:
	if minimum attempts of event is 0 or likelihood of event is 0 or likelihood of event is minimum attempts of event:
		now maximum tolerance of event is 0;
	otherwise:
		Let success-target be (likelihood of event * maximum attempts of event) / (minimum attempts of event);
		Let P be (likelihood of event) / (minimum attempts of event * 1.0);
		Let current rate be 0.0;
		Let current threshold be 0;
		while current rate < success rate:
			increase current rate by the probability of winning (success-target + current threshold) times out of maximum attempts of event with likelihood P;
			if current threshold > 0:
				increase current rate by the probability of winning (success-target - current threshold) times out of maximum attempts of event with likelihood P;
			increment current threshold;
		now the maximum tolerance of event is current threshold - 1;
			
To decide what real number is the probability of winning (K - a number) times out of (N - a number) with likelihood (P - a real number):
	if K < 0 or K > N:
		decide on 0.0;
	let product be 1.0;
	[probability = N choose K * P(success)^N * P(failure)^(K-N)]
	[N choose K method cribbed from Wikipedia page on the binomial coefficient]
	[interspersed with multiplying by P and 1 - P to prevent the number from getting too big or too small]
	Repeat with i running from 1 to K:
		now product is product * (n + 1 - i) / (i * 1.0);
		now product is product * P;
		if i is not greater than (N - K):
			now product is product * (1 - P);
	Repeat with i running from (K + 1) to (N - K):
		now product is product * (1 - P);
	decide on product;
		
[
To decide what real number is (N - a number) choose (K - a number):
	Let the product be 1.0;
	Repeat with i running from 1 to K:
		now product is product * (n + 1 - i) / (i * 1.0);
	decide on product;
]

Section - Controlling Outcomes

The dependency test outcome is an outcome that varies. The dependency test outcome is boring lack of results.

[Returns true if another outcome depends on the event, and also sets the dependency test outcome so we can use the "dependent" adjective]

To decide whether (event - an outcome) has unresolved dependents:
	now the dependency test outcome is the event;
	decide on whether or not there is a not resolved dependent outcome.
	
Definition: an outcome (called event) is dependent:
	Let candidate be the event;
	while candidate is not boring lack of results:
		now candidate is the antecedent of the candidate;
		[We don't check for cyclical dependencies. Beware!]
		if candidate is the dependency test outcome:
			decide yes;
	decide no.
	
[this phrase has no side effects]
To decide whether (event - an outcome) is still testable:
	if event is possible:
		if the antecedent of the event is boring lack of results:
			decide yes;
		otherwise:
			decide on whether or not the antecedent of the event is just-succeeded;
	otherwise:
		decide on whether or not the event has unresolved dependents.
			
[this version has the side effect of initializing untested outcomes and resetting the just-succeeded flag. Use this first, and use "is still testable" afterwards]
To decide whether we make (event - an outcome) testable:
	if event is untested:
		now state of event is outcome-possible;
		if the maximum attempts of event is 0:
			if minimum attempts of event is 1:
				now maximum attempts of event is 1;
			otherwise:
				now maximum attempts of event is 100;
		set the maximum tolerance for event with 0.99 achievement;
	Let testability be whether or not event is still testable;
	now the event is not just-succeeded;
	decide on testability;
	
To make (event - an outcome) possible:
	Let throwaway result be whether or not we make the event testable.
	
To reset (event - an outcome):
	now success count of event is 0;
	now attempt count of event is 0;
	now state of event is outcome-untested;
	now event is not just-succeeded;
	[reset dependents?]
	
To decide whether waiting for resolution:
	decide on whether or not there is a possible outcome;
	
To report an iteration because (reason - a text):
	transcribe and stop capturing text because reason;
	say " .[run paragraph on]";
	start capturing text;
	
[This phrase tells us whether we need to keep looping. It also resets everything as a side effect when we're done looping.

To be used when deciding whether to repeat test steps]
To decide whether we reset every possible outcome:
	report an iteration because "checking possible outcomes -";
	if waiting for resolution, no;
	Repeat with event running through outcomes:
		reset event;
	[TODO: do all resetting here, instead of when we make possible?]
	yes.
	
[These phrases can be used with while loops]
To decide whether we haven't reset every possible outcome:
	decide on whether or not not (we reset every possible outcome).
	
To decide whether we haven't reset (event - an outcome):
	report an iteration because "checking one outcome -";
	if event is not resolved, yes; [different from "every possible" version - it makes sure the loop runs at least once]
	if the event has unresolved dependents:
		if event is not just-succeeded:
			yes; [keep looping until success if there are dependents]
	repeat with item running through dependent outcomes:
		reset item;
	reset event;
	no.
		
Section - Testing Outcomes

To decide whether we haven't achieved (event - an outcome) in (likelihood - a number) out of (minimum tries - a number) attempts giving up after (maximum tries - a number) attempts:
	if event is untested:
		now the likelihood of event is likelihood;
		now the minimum attempts of event is minimum tries;
		now the maximum attempts of event is maximum tries;
	decide on whether or not we haven't reset event.	

To decide whether we haven't achieved (event - an outcome) in (likelihood - a number) out of (total tries - a number) attempts:
	let maximum tries be 100;
	If total tries is 1, now maximum tries is 1;
	if likelihood is 0, now maximum tries is total tries;
	decide on whether or not we haven't achieved event in likelihood out of total tries attempts giving up after maximum tries attempts.
		
[TODO: Normalize regex matches against event description so we can use a brief consistent phrase. ]

To decide whether (event - an outcome) timed out:
	decide on whether or not the attempt count of the event is not less than the maximum attempts of the event;
	
To decide whether (event - an outcome) can fail:
	if event is not possible, decide no;
	[if chance of success is 0 or certainty, we fail as soon as we exceed tolerance, before reaching the minimum attempts]
	if likelihood of event is 0, decide yes; [impossibility - should never get a "successful" test]
	if likelihood of event is minimum attempts of the event, decide yes; [certainty - should never get an "unsuccessful" test]
	decide on whether or not the event timed out.
	
To decide whether (event - an outcome) can be achieved:
	if event is not possible, decide no;
	decide on whether or not the attempt count of the event is at least the minimum attempts of the event.
	
To resolve (event - an outcome):
	Let target be the likelihood of the event;
	if the minimum attempts of the event is not 0:
		now target is (target * attempt count of the event) / (minimum attempts of the event); [parentheses are needed, but I don't know why]
	Let the error be the absolute value of (success count of the event - target);
	Let the tolerance be (maximum tolerance of the event * attempt count of the event) / maximum attempts of the event;
	if the event can fail and error is greater than tolerance:
		now the state of event is outcome-failed;
		assert "After [attempt count of the event] attempt[s], [the event] happened [success count of the event] times (never within [tolerance] of the target number [target])" based on false;
	otherwise if the event can be achieved and error is not greater than tolerance:
		now the state of event is outcome-achieved;
		assert "success" based on true;
			
To test (event - an outcome) against (success - a truth state):
	if we make the event testable:
		increment attempt count of the event;
		if success is true:
			increment success count of the event;
		if event is resolved and event timed out and the event has unresolved dependents:
			Repeat with item running through dependent not resolved outcomes:
				assert "[item] ([success count of item]/[attempt count of item]) stalled because [state of event] [event] timed out after [attempt count of event] attempts" based on false;
				now state of item is outcome-failed;
		resolve event;
		if success is not (whether or not likelihood of the event is 0), now the event is just-succeeded;

To test (event - an outcome) against (T - a text):
	update the event description because "testing [event] against '[T]'"; [todo - roll this into a text-testing phrase?]
	[TODO: include event description in failure report]
	test event against whether or not the event description matches the regular expression T;

To fail (event - an outcome) based on (result - a truth state):
	now likelihood of event is 0;
	test event against result;
		
To fail (event - an outcome) on result (T - a text):
	[TODO: don't test regexp if we're going to ignore the test result]
	update the event description;
	fail event based on whether or not the event description matches the regular expression T;
	
To achieve (event - an outcome) based on (result - a truth state):
	now likelihood of event is 1;
	now minimum attempts of event is 0;
	test event against result;
			
To achieve (event - an outcome) on result (T - a text):
	update the event description;
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

A test step can be extracting.

Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts
moving towards the destination	"finding a route from [the location] to [the location-target of the scheduled event][if the location-target of the scheduled event is not the action-destination of the scheduled event](in [the the action-destination of the scheduled event])[end if]"	1	1
compelling an action	"[the compelled action]"	1	1
reacting to compelled action	""	1	1

For taking a player action (this is the move to the destination of a test step rule):
	if the player is at-React:
		make no decision;
	Let the place be the action-destination of the scheduled event;
	if the place is the location:
		update event description because "arrived at destination [the place] for";
	if the place is Null-room or the place is the location:
		make no decision;
	if the scheduled event is extracting:
		extract the player to the place;
		generate the action of waiting;
		rule succeeds;
	Now the way-to-get-there is the best route from the location to the place;
	Now the way-to-get-back is the opposite of the way-to-get-there;
	fail moving towards the destination based on whether or not the way-to-get-there is not a direction;
	if the way-to-get-there is a direction, generate the action of going the way-to-get-there;
		
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

A test step can be npc-suppressing or npc-enabling. A test step is usually npc-suppressing. Normal keyboard input is npc-enabling.

Suppress npc action is a truth state that varies.

First initial scheduling rule for a test step (called current move) (this is the enable npc actions rule):
	now suppress npc action is whether or not current move is npc-suppressing;
	
To make everyone wait:
	transcribe "suppressing NPC actions";
	now suppress npc action is true;
	
To let everyone act:
	transcribe "enabling NPC actions";
	now suppress npc action is false;
	
To compel (the desired action - a stored action):
	Let the guy be the actor part of the desired action;
	transcribe "compelling [the desired action][if the guy is asleep] and waking up [the guy]";
	now the guy is not asleep;
	Now the compelled action is the desired action;
	make compelling an action possible;
	
To decide whether waiting for compelled action:
	decide on whether or not compelling an action is possible;
	
To forget the/-- compelled action:
	if the compelled action is not the action of waiting:
		achieve compelling an action based on true;
		now the compelled action is the action of waiting;
	
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
		forget the compelled action;
		rule succeeds;

A Standard AI rule for a person (called P) (this is the suppress actions rule):
	if suppress npc action is true:
		if P is at-react:
			transcribe "allowing [P] to react";
		otherwise:
			transcribe "suppressed action for [P]";
			rule succeeds;
	
The suppress actions rule is listed before the insane people attack themselves rule in the standard AI rulebook.

The compel an action rule is listed before the suppress actions rule in the standard AI rulebook.

Last choosing a player reaction:
	generate the action of waiting.

Chapter - Testing Dungeon Generation

The generation test rules is a rulebook.

[Generation test rules may test outcomes - if they are left unresolved, the game will restart and they'll be tested again]

[the generation count is a number that varies.
the generation minimum is a number that varies.
		
[TODO: replace this with hard reboot]

This is the generate many test dungeons rule:
	now description of generic reusable event is "generating a dungeon";
	make generic reusable event possible;
	while we haven't reset every possible outcome:
		[aw, here we go again. We have to undo all the treasure placement... and what else?]
		Repeat with guy running through denizen npc people:
			Repeat with item running through things had by guy:
				if item is worn by guy or item is carried by guy:
					remove item from play;
			remove guy from play;
		Repeat with item running through on-stage not non-treasure things:
			remove item from play;
		follow the dungeon generation rules;
		follow the generation test rules;
		achieve generic reusable event based on true;

The generate many test dungeons rule substitutes for the create the dungeon rule when done testing is false.]

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
	
To assert (T - a text) based on (C - a truth state):
	record a test attempt;
	unless C is true:
		record a failure report of T;
	
To succeed based on (result - a truth state) within (N - a number) attempts:
	Now description of generic reusable event is "[the scheduled event]";
	Now maximum attempts of generic reusable event is N;
	achieve generic reusable event based on whether or not result is true;
	if generic reusable event is resolved, reset generic reusable event; [TODO: is this necessary?]

To fail based on (result - a truth state) within (N - a number) attempts:
	Now description of generic reusable event is "[the scheduled event] failing";
	Now minimum attempts of generic reusable event is N;
	fail generic reusable event based on whether or not result is true;
	if generic reusable event is resolved, reset generic reusable event; [TODO: is this necessary?]
	
To succeed based on (result - a truth state):
	succeed based on result within 100 attempts;
	
To succeed on result (R - a text) within (N - a number) attempts:
	update event description because "testing for [R] within [N] attempts - ";
	succeed based on whether or not the event description matches the regular expression R within N attempts;
	
To succeed on result (R - a text):
	succeed on result R within 100 attempts;
	
To fail based on (result - a truth state):
	fail based on result within 100 attempts;
	
To fail on result (R - a text) within (N - a number) attempts:
	update event description because "testing for absence of [R] within [N] attempts - ";
	fail based on whether or not the event description matches the regular expression R within N attempts;
	
To fail on result (R - a text):
	fail on result R within 100 attempts;
		
To assert result (pattern - a text):
	update event description because "testing for result '[pattern]'";
	assert that the event description includes pattern;
	
To assert absence of result (pattern - a text):
	update event description because "testing for absence of '[pattern]'";
	assert that the event description does not include pattern;
	
To assert that the (description - a text) includes (pattern - a text):
	record a test attempt;
	unless the description matches the regular expression pattern:
		Let error_msg be an indexed text;
		now error_msg is "Regular expression '[pattern]' was not found in the text:[paragraph break]'[the description]'[line break]";
		record a failure report of error_msg;
		
To assert that the (description - a text) does not include (pattern - a text):
	record a test attempt;
	if the description matches the regular expression pattern:
		Let error_msg be an indexed text;
		now error_msg is "Regular expression '[pattern]' should not have been found in the text:[paragraph break]'[the description]'[line break]";
		record a failure report of error_msg;

To assert that (N - a number) is between (A - a number) and (B - a number) with label (L - a text):
	assert "[L] [N] is not between [A] and [B]" based on whether or not N is at least A and N is at most B;
	
To assert that (N - a number) is between (A - a number) and (B - a number):
	assert that N is between A and B with label "value";
	
To assert that (item - a thing) is in (place - an object):
	Let msg be indexed text;
	Now msg is "Expected location of [the item]: [place]. Got: [location of the item].";
	assert msg based on whether or not the location of item is place;

Chapter - Helpful phrases

Section - Movement

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
	if guy is the player:
		now way-to-get-back is the best route from the place to the location;
		now way-to-get-there is the opposite of way-to-get-back;
	transcribe "moving [guy] to [place]";
	extract guy from combat;
	move guy to place;
	update the combat status;
	
Section - Religion

To have the player sacrifice (stuff - a power):
	Let the power-level be the power level of stuff;
	assert "power level of sacrificed ability should be positive" based on whether or not power-level > 0;
	Let divinity be a random god who infuses the location;
	transcribe "Sacrificing [stuff] to [divinity]";
	now the current question is "Which power do you want to sacrifice?";
	now sacrifice-lijst-2 is {};
	add stuff to sacrifice-lijst-2;
	now sacrifice-lijst is {"sacrifice", "don't sacrifice"};
	now the number understood is 1;
	let the previous favour be the favour of the player with divinity;
	follow the sacrifice rule;
	assert that the favour of the player with divinity is the previous favour + the power-level with label "favour of the player";
	
intervention-blocking is a truth state variable.

To block interventions:
	now intervention-blocking is true.
	
To allow interventions:
	now intervention-blocking is false.
	
First intervention possible when intervention-blocking is true:
	rule fails.

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

[TODO: replace these counters with outcomes?]

The testing combat round rules are an object based rulebook.

A first combat round rule (this is the test combat round of previous main actor rule):
	follow the testing combat round rules for the main actor;
	
A combat round rule (this is the count combat actions rule):
	increment the act count of the main actor;

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

[TODO: get rid of this? we can use outcomes instead]

A person has a number called the hitting count.

To assert (N - a number) hit/hits by (guy - a person):
	Let msg be indexed text;
	Now msg is "Expected hitting count for [The guy]: [N] Got: [hitting count of the guy].";
	assert msg based on whether or not N is hitting count of the guy;

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

Section - Checking Damage Reports

The expression scan position is a number that varies.

To decide what number is digit (T - a text):
	Let C be character number 1 in T;
	Repeat with value running from 0 to 9:
		if character number (value + 1) in "0123456789" is C:
			decide on value;
	decide on -1;
			
To decide what number is the number we scan in (T - a text):
	Let the value be 0;
	Let digit-encountered be false;
	while the expression scan position is not greater than the number of characters in T:
		Let C be character number expression scan position in T;
		Let the next digit be digit C;
		if the next digit is not -1:
			now value is (value * 10) + the next digit;
			now digit-encountered is true;
		otherwise:
			if digit-encountered is true:
				decide on value;
		increment the expression scan position;
	decide on value;	
	
To decide what number is approximately (P - a number) percent of (N - a number):
	Let the rounded-down value be (N * P) / 100;
	Let the rounded-up value be (N + the test-round-error) * P;
	Let the rounded-up remainder be the remainder after dividing the rounded-up value by 100;
	now the rounded-up value is the rounded-up value / 100;
	now the test-round-error is (the rounded-up value - the rounded-down value);
	if the rounded-up remainder is at least 1:
		increase the test-round-error by 1;
	decide on the rounded-down value.
	
To decide what number is the next term in (T - a text) we apply to (N - a number):
	Let the value be the number we scan in T;
	if character number expression scan position in T is "%":
		now the value is approximately (the value) percent of N;
		increment the expression scan position;
	decide on the value.
	
To decide what number is the next product in (T - a text) we apply to (N - a number):
	Let the factor be (the number we scan in T);
	if character number expression scan position in T is "%":
		increment the expression scan position;
	otherwise:
		now the factor is the factor * 100;
	decide on approximately (the factor) percent of N;
		
To skip parenthetical in (T - a text):
	while expression scan position is not greater than the number of characters in T:
		if character number expression scan position in T is ")":
			break;
		otherwise:
			increment expression scan position;
	assert "All open parentheses in [T] should be closed" based on whether or not the expression scan position is not greater than the number of characters in T;
	increment expression scan position [past the closing paren].
	
The test-round-error is a number that varies;

To decide what number is the calculated value of (T - a text):
	now the expression scan position is 0;
	now the test-round-error is 0;
	let the running total be the number we scan in T;
	let the final total be -1;
	while the expression scan position is not greater than the number of characters in T:
		Let the operator be character number expression scan position in T;
		increment expression scan position;
		if the operator is "-":
			decrease the running total by the next term in T we apply to the running total;
			if the running total is 0, now the running total is 0;
		otherwise if the operator is "+":
			increase the running total by the next term in T we apply to the running total;
		otherwise if the operator is "x":
			now the running total is the next product in T we apply to the running total;
		otherwise if the operator is "=":
			now the final total is the number we scan in T;
			assert that the final total is between running total and (running total + test-round-error) with label "final damage";
			assert that (expression scan position - 1) is the number of characters in T with label "number of scanned characters";
		otherwise if the operator is "(":
			skip parenthetical in T;
		otherwise:
			assert that the operator is " " with label "character between terms";
		if the running total < 0:
			now test-round-error is running total + test-round-error;
			if test-round-error < 0, now test-round-error is 0;
			now the running total is 0;
	if the final total is -1:
		decide on the running total;
	otherwise:
		decide on the final total.

The damage description is a text variable.

To check damage of (guy - a person) with (previous health - a number) health after (preamble - a text):
	assert result "[preamble](\s*\d*<^\n>+) damage";
	now the damage description is the text matching subexpression 1;
	Let the value be the calculated value of the damage description;
	assert that (previous health - health of guy) is value with label "damage to [guy]"; 
	[set things up for the next test]
	now the health of guy is previous health;

Section - Test Arena and Battle Phrases

Test Arena is an arena. The staging area of Test Arena is maze-waiting-room.

Test Arena is faction-imposing.

reaction-type is a kind of value. The reaction-types are no reaction, parry reaction, dodge reaction, block reaction. [TODO: use action names instead?]

A reaction-type has a text called the report. The report of a reaction-type is usually "";

The report of the parry reaction is "\(defender parrying\)".
The report of the dodge reaction is "\(defender dodging\)".
The report of the block reaction is "\(blocking\)".

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
	
Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts	antecedent
combat hit	""	1	1	--
after-combat-hit	""	1	1	combat hit

To test (guy - a person) doing a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit by (aggressor - a person) with result (outcome - a text) in (likelihood - a number) out of (total tries - a number) attempts, checking damage:
	if combat hit is untested:
		reset after-combat-hit;
		now the description of combat hit is the substituted form of "[guy] doing [reaction] to [strength] melee hit by [aggressor] with result '[outcome]'";
		now the melee of the aggressor is strength;
		now the defence of guy is 50;
		now likelihood of combat hit is likelihood;
		now minimum attempts of combat hit is total tries;
		now maximum attempts of combat hit is 0;
	now the health of guy is 1000;
	Let original-defender-weapon be a random readied weapon enclosed by guy;
	Let original-attacker-weapon be a random readied weapon enclosed by aggressor;
	clear event description because "start attempt [attempt count of combat hit] -";
	assign reaction to guy;
	try aggressor hitting guy;
	update event description because "finish attempt [attempt count of combat hit] -";
	if report of the reaction is not empty, assert that the event description includes "[report of reaction]";
	if checking damage:
		check damage of guy with 1000 health after "\n[The aggressor] [deal]";
		test combat hit against whether or not damage description matches the regular expression outcome;
	otherwise:
		test combat hit against outcome;
	test after-combat-hit against true; [this forces combat hit to end on success]
	if combat hit is still testable:
		[transcribe re-equipping?]
		equip guy with original-defender-weapon;
		equip aggressor with original-attacker-weapon;
	
To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit by (aggressor - a person) with result (outcome - a text) in/on (likelihood - a number) out of (total tries - a number) attempts, checking damage:
	while we haven't reset combat hit: 
		if checking damage:
			test guy doing reaction to a strength melee hit by aggressor with result outcome in likelihood out of total tries attempts, checking damage;
		otherwise:
			test guy doing reaction to a strength melee hit by aggressor with result outcome in likelihood out of total tries attempts.
	
To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit with result (outcome - a text), checking damage:
	if checking damage:
		have guy do a reaction to a strength melee hit by the player with result outcome, checking damage;
	otherwise:
		have guy do a reaction to a strength melee hit by the player with result outcome.
	
To have (guy - a person) do a/-- (reaction - a reaction-type) to a/-- (strength - a number) melee hit by (aggressor - a person) with result (outcome - a text), checking damage:
	if checking damage:
		have guy do a reaction to a strength melee hit by aggressor with result outcome in 1 out of 1 attempts, checking damage;
	otherwise:
		have guy do a reaction to a strength melee hit by aggressor with result outcome in 1 out of 1 attempts.
		
To assert that/-- (item - a weapon) readied after (circumstance - a text):
	assert "[The item] should be readied after [circumstance]" based on whether or not the player holds item and item is readied;
	
To assert no weapon after (circumstance - a text):
	Let the item be a random readied weapon enclosed by the player;
	assert "Nothing besides a natural weapon should be readied after [circumstance]" based on whether or not the item is nothing or the item is a natural weapon.
		
To have (guy - a person) defeat (loser - a person):
	transcribe "having [guy] defeat [loser]";
	Now the health of loser is -1;
	Have an event of guy killing loser;	
	

Automated Testing ends here.

---- DOCUMENTATION ----

Chapter: Basics

Section: Introduction

Kerkerkruip Automated Testing provides a framework for creating detailed playthroughs and testing that they behave as expected. Each playthrough, called a "test set" starts before dungeon generation and goes turn by turn until we run out of tests. A summary of tests will be output in the game console, but a detailed transcript will also be written to a file called "testtranscript."

Kerkerkrup Automated Testing is built on the foundation of Simple Unit Tests by Dannii Willis, and makes heavy use of Text Capture by Eric Eve.

Section: Invoking Tests

To run the tests, enter the command

	> QUEUE TEST ALL
	
to run all test sets, or

	> QUEUE TEST TARGET-SET
	
to run the target test set. Entering an invalid value of TARGET-SET will produce an error listing all possible test sets.

The queue test commands can also be run from the debug console (press ~ when in the opening menu), but no error messages are shown from the console at the time of this writing (2015-02-27).

Section: Assertions

To perform the tests, we have a wide variety of assertion phrases.

First, there's a simple "X is Y" assertion, but we can give it a label so the output will be clear about what we're comparing:

	assert that the body score of the player is 5 with label "body score of the player";

If we aren't looking for exact equality, we can use a range:

	assert that the body score of the player is between 4 and 6 with label "body score of the player";
	
and we can test any truth state:

	assert "the body score of the player should be at least 5, but it is [body score of the player]" based on whether or not the body score of the player is at least 5;

We can also test the text that is output by the game, using regular expressions:
	
	assert result "'Do not be afraid, for I will end your suffering!' the Reaper exclaims\.";
	
	assert absence of result "Having been in contact with the scythe of oxidation, the lion's shield rusts\.";

Under the hood, these phrases are managing a text called the "event description." This text accumulates from the captured text, and is normally cleared at the beginning of each turn. To manually clear it, we can say:
	
	clear event description

and we can also force it to update immediately with any text that has just been captured:
	
	update event description
	
These commands cause debug messages to be written to the transcript file, so to help make the file more readable, we can say what's going on when we invoke them:
	
	clear event description because "about to examine the amulet";
	try examining the amulet;
	update event description because "testing amulet description";
	
Then we can make assertions about any text, whether it's the event description or something else:
	
	assert that the event description includes "Feeding \d+ blood to the amulet will increase its power by \d+";

There are more ways to perform related sets of assertions, which we will examine later.

Section: Test Sets

To make a test, we create a "test set:"

	bug-xyz is a test set.

Each test set will start a fresh game with a new dungeon. We can use the phrase "when testing bug-xyz" in our rules.

There is a rulebook that runs before dungeon generation called the scenario rules. We can use this to set things as testobject just as if we had forced them to be included from the console. We can also set them as bannedobject, to prevent them from appearing in the dungeon.

	Scenario when testing bug-xyz:
		now the swarm of daggers is testobject;
		now the Hall of Mirrors is bannedobject;

Section: Test Steps

To have things happen during play, create a "test step," or more than one. A test step is a kind of value, and they run in the order that they were declared in the source. We must specify which test step is the first one of the test set, and the rest will follow automatically:

	starting-out is a test step. The first move of bug-xyz is starting-out.

	second-move is a test step.

A test step corresponds to a turn, or multiple turns. It has a few rulebooks. The main ones are "initial scheduling" and "testing effects." These are test-step based rulebooks. There are also "choosing a player action" and "choosing a player reaction," which we will need if we want to actually do anything during a turn.

Section: Initial scheduling

	initial scheduling of starting-out:
    		now the defence of the player is 100.

Initial scheduling runs as soon as the test step first becomes active, and it doesn't run again even if the step repeats.

Section: Rescheduling

We can use rescheduling rules if there is anything we need to do when a test step repeats (see later for how that can happen)

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

Since these rulebooks are NOT test-step based, we will need to use the "testing (move - a test step)" phrase to invoke these at the proper time.

By default, all (non-compelled) NPC actions are suppressed during tests. In the transcript, we can see when a character gets a combat round because the message "[suppressed action for X]" appears. NPCs are allowed to react, however. If we do want to allow NPCs to act freely, we can set a property of the test step:
	
	ape-cowering is an npc-enabling test step.
	
We can also enable AI actions manually with the phrase:

	Let everyone act;
	
And disable them again with:
	
	Make everone wait;
	
Here's a little example of a complete test step:
	
	Armadillo-runner is a test step.
	
	Initial scheduling of armadillo-runner:
		now the melee of the armadillo is 100;
		
	Choosing a player action when testing armadillo-runner:
		generate the action of going the way-to-get-back.
		
	Testing effects of armadillo-runner:
		assert result "The ravenous armadillo deals \d<^\n>+ damage";
		
We can see above an example of the "generate" phrase, which is normally used in the "Choosing a player action" and "Choosing a player reaction" rulebooks. If we don't invoke the "generate" phrase, the player will simply wait. But if we use it, the player will perform the specified action.


Section: Handling Questions

Kerkerkruip occasionally asks the player questions. If we want the player to answer a menu question instead of taking an action, we can use the "select menu question answer (N - a number)" phrase:

	Choosing a player action when testing entree-selection:
		Let m be 0;
		repeat with entree running through banquet-items:
			increment m;
			if the entree is the overmind:
				break;
		select menu question answer m;

Section: Outcomes

Automated Testing defines a kind of value called "outcome." Outcomes help us make repeated assertions, and assertions that must be grouped together. They must be defined in the Table of Outcomes:
	
	Table of Outcomes (continued)
	outcome	description	likelihood	minimum attempts	maximum attempts
	healer-healing-player	""	0	20	100

An outcome starts out "untested," and then when it is first tested it becomes "possible." If the test is conclusive, it will become either "achieved" or "failed." We have phrases to do this, which perform the necessary assertions for us:
	
	test Bodmall-reaction against whether or not Bodmall is at-react;
	test ape-cowering against "The blood ape cowers before your dreadful presence!";
	
	achieve bat crashing into spike based on whether or not the injury of the player is at least 1;
	achieve nested belief on result "I believe that I believe";
	
	fail healer-healing player based on whether or not the injury of the player is 3;
	fail forbidden-teleport on result "Malygris suddenly teleports away";

When an outcome is tested, its likelihood is compared with its minimum and maximum attempts. Exactly how many times it is tested depends on these three numbers:

In the general case, we use the "test ... against" phrase to test an outcome. It will be tested for the minimum number of attempts, and then the number of successes (times the condition was met) will be compared with a target frequency. The target frequency is calculated as (likelihood/minimum attempts). If the number of successes ever comes within 5% of the target, the event will be achieved, and if the maximum number of attempts is reached without ever coming in range, it will fail.

The "achieve" and "fail" phrases are for outcomes that are tested repeatedly until they happen once. In the "achieve" case, the outcome will be tested up to the maximum attempts, but in the "fail" case, testing will stop after the minimum attempts. If the given condition (either a regular expression match or a truth state) is met, the outcome will be achieved or failed depending on which phrase we invoked. We can also achieve the "fail" behavior using the "test...against" phrase by setting the likelihood of an event to 0.

In some cases the action repetition of outcomes can be handled for us. Any test step will repeat if there are outcomes currently set to "possible." There are some predefined outcomes we can use implicitly. The most common one is used this way:

	Testing effects of sound-finding:
		succeed based on whether or not maze-sound is a cardinal direction.

	Testing effects of banshee-returning:
		succeed on result "banshees suddenly break loose";
	
	Testing effects of imp-dreaming:
		fail based on whether or not the imp is in the location within 20 attempts;

	Testing effects of no-extra-blessed-grenade:
		fail on result "Blessed Grenade" within 100 attempts.

The "within X attempts" is optional for all four phrase styles, and manually sets the minimum or maximum attempts based on whether we are looking for success or failure.

We must keep in mind that an outcome does not normally become possible until it is tested. That works fine if we test it in the "testing effects" rulebook, because that is guaranteed to run for every test step. But if our outcome depends on something that doesn't necessarily happen every turn, we may need to manually make it possible:
	
Initial scheduling for ape-cower-test:
	make ape-cowering possible.
	
We can also repeat outcome tests outside of the normal test step loop. We use a special phrase as a while condition:
[TODO: fix this]	
	While we haven't reset combat hit:

	While we haven't reset combat hit after success:
		test combat hit against "Rolling";
		
The "after success" variation ensures that the loop doesn't finish unless the condition has just been met. This allows us to perform additional tests that depend on the condition still holding.

Section: Combat tests

Some of the most interesting and complex mechanics in Kerkerkruip involve combat, and many of them take place during the hitting action. We have some special phrases to help us tease these mechanics out:
	
	now the health of the player is 1000;
	now the melee of the mindslug is 100;
	clear event description;
	try the mindslug hitting the player;
	check damage of the player with 1000 health after "The mindslug deals";

The "check damage" phrase extracts all the text it finds in the event description between the prefix we supply ("The mindslug deals") and the final text " damage". Then it reads all the damage comments in this text and checks that they add up to the total, and compares the total to the health of the person specified in the phrase. We supply the value of the person's health before the damage occurred, and the phrase asserts that everything is as expected. It also resets health to the number we specified so we can perform more of the same tests. It also saves the text it extracted from the event description in a variable called "the damage description," which we can test ourselves:
	
	assert that the damage description includes "\+ 1 \(you are running\) ";
	assert that the damage description does not include "Giantbane's special";
	
We can also automate the hitting itself:
	
	have Fafhrd do no reaction to a 100 melee hit with result "You deal";

	have fafhrd do a parry reaction to a 0 melee hit with result "Having been in contact with the scythe of oxidation, the claymore rusts";
	
	have the player do a parry reaction to a 0 melee hit by Fafhrd with result "The claymore shatters the gilded rapier!";

	have mouser do a dodge reaction to a 100 melee hit by the player with result "you drop the gilded rapier" in 1 out of 6 attempts;

	have the player do a parry reaction to a 100 melee hit by mouser with result "you drop the gilded rapier" in 0 out of 20 attempts;

	have the player do no reaction to a 100 melee hit by the armadillo with result "\+ [conc-level * 25]% \(robe of the dead mage\)", checking damage;
	
	have the player do no reaction to a 100 melee hit by the armadillo with result "robe of the dead mage" in 0 out of 1 attempts, checking damage;
	
Each of these phrases performs a hit for us, setting a number of important conditions. It sets the health of the person being hit to 1000, and sets their reaction (no reaction doesn't set anything, block reaction, sets them to at-block, and similarly for the parry reaction and dodge reaction). It sets the melee of the attacker to the number we specify and it sets the defence of the defender to 50, so we can be reasonably sure whether the attack will hit or not. For the result we give a text to match with the result of the hit, which will serve as our success condition.

If we don't specify a number of attempts, it does just one. If we do, it sets that as the minimum attempts for an outcome called "combat hit" and repeats the attempt until it is achieved or failed.

Finally, we can specify whether we're checking damage. If we're not checking damage, the result text is matched against the entire event description. But if we do, not only does the phrase invoke the "check damage" test, it also compares the result text with the damage description instead of the event description.

These phrases all use the "after success" variation of the loop condition, so we can test additional circumstances afterwards. Here's an example of how this can be useful:
	
	have mouser do a dodge reaction to a 100 melee hit by the player with result "you drop the gilded rapier" in 1 out of 6 attempts;
	assert "the gilded rapier should be on the floor" based on whether or not the gilded rapier is in the location;

The "X melee hit" phrase does quite a bit of cleanup after each attack, including restoring any dropped, rusted, or shattered weapons. [TODO: hooks or rulebook for this?] Using the combination of the cleanup stage and the "after success" requirement, we can test not only the frequency with which the greasy gauntlets cause the player to drop a weapon, but also what happens afterwards.

Section: Other properties of test steps

TODO. (There are lots more properties of test steps - look through the code to see what they do. Location-target and hiding-check are useful for getting around the dungeon, for example.)

Section: Controlling text capture

Because sometimes the system needs to stop capturing and display something to the screen, the full output of the current turn is saved in a text called the "event description." This is automatically cleared at the beginning of a turn and updated when it is likely to be needed. But sometimes we might want to clear it and update it manually. Use these phrases:
	
clear the event description

This will set the event description to an empty string. As text is captured, it will be appended to the event description.

update the event description

This will force the most recently captured text to be added to the end of the event description. Versions of these two phrases take a "reason" parameter, which will be included in the transcript, e.g:
	
clear the event description because "starting an iteration of the foobar test"

update the event description because "checking for frobnitz usage"

If we want to output information to the screen, use the phrase:

log (message - a text)

And if we want to output something to the transcript only, use the phrase:

transcribe (message - a text)

