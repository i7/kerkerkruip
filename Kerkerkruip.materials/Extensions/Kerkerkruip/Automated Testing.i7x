Automated Testing by Kerkerkruip begins here.

Use authorial modesty.

Volume - Test Framework (not for release)

Include Simple Unit Tests by Dannii Willis.
Include Text Capture by Eric Eve. [Actually, this must be included before Basic Screen Effects]

Use maximum capture buffer length of at least 16384.
Use maximum text length of at least 16384.

Chapter - Randomized Events

Section - Outcomes

An outcome is a kind of value. Some outcomes are defined by the Table of outcomes.

outcome state is a kind of value. The outcome states are outcome-untested, outcome-possible, outcome-failed, and outcome-achieved.

Definition: an outcome is resolved if the state of it is at least outcome-failed.
Definition: an outcome is untested if the state of it is outcome-untested.
Definition: an outcome is possible if the state of it is outcome-possible.
Definition: an outcome is failed if the state of it is outcome-failed.
Definition: an outcome is achieved if the state of it is outcome-achieved.

An outcome can be unscheduled, scheduled for immediate testing, scheduled for later testing, just-tested, or just-succeeded.
	
[Outcome properties:

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
state - determines whether the outcome has been tested and whether more testing is needed
antecedent - the outcome that must succeed before this can be tested
]

Table of Outcomes
outcome		attempt count	success count	likelihood (number)	minimum attempts (number)	maximum attempts (number)	maximum tolerance (number)	state (outcome state)	antecedent (outcome)
boring lack of results	0	0	0	1	1	0	outcome-untested	boring lack of results
restarting for tests	0	0	1	1	1	0	--	--

Section - Outcome Persistence

The file of test outcomes is called "testoutcomes"

To save test outcomes:
	Repeat through Table of Outcomes:
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

Section - Generating Actions

For taking a player action when a person is scheduled to act freely (this is the player combat round action rule):
	if the actor part of the compelled action is not the player:
		generate the action of waiting;
	otherwise:
		generate the compelled action;
	
For taking a player action when testing compelling an action (this is the compel player action rule):
	Let the guy be the actor part of the compelled action;
	if (the player is at-act or the combat status is peace) and the guy is the player:
		generate the compelled action;
		forget the compelled action;
		test compelling an action against true;
	otherwise:
		[This code could prevent infinite loops, but it might be a little overeager. Consider it a TODO:
		unless (the location of the guy is the location and the combat status is combat) or the guy is acting independently:
			now the failure report is "[The guy] is not available to try [the compelled action]";
			test compelling an action against false;]
		transcribe "[combat state of the player] player waits until [the compelled action] can be compelled";
		generate the action of waiting;
	schedule taking a turn;

To say (event - compelling an action):
	say "compelling [the compelled action]"; 

For taking a player action when testing compelling a reaction (this is the compel player reaction rule):
	if the actor part of the compelled action is the player and the player is at-react:
		generate the compelled action;
		forget the compelled action;
		test compelling a reaction against true;
	otherwise:
		transcribe "[combat state of the player] player waits until [the compelled attacker] attacks";
		generate the action of waiting;
	schedule taking a turn.

For taking a player action when testing compelling an attack (this is the compel player attack rule):
	if the compelled attacker is the player and the player is at-act:
		generate the action of attacking (the actor part of the compelled action);
		test compelling an attack against true;
		schedule compelling a reaction;
	otherwise:
		transcribe "[combat state of the player] player waits until [the compelled attacker] can be compelled to attack";
		generate the action of waiting;
		schedule taking a turn.
	
The player combat round action rule is listed first in the for taking a player action rulebook.
The compel player action rule is listed before the player combat round action rule in the for taking a player action rulebook.
The compel player reaction rule is listed before the compel player action rule in the for taking a player action rulebook.
The compel player attack rule is listed before the compel player reaction rule in the for taking a player action rulebook.

to say (event - compelling an attack):
	say "compelling [the compelled attacker] to attack [the actor part of the compelled action]";

to say (event - compelling a reaction):
	say "compelling [the compelled action] as a reaction to [the compelled attacker]"

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
taking a turn	1	0
compelling an attack	1	0
compelling an action	1	0
compelling a reaction	1	1

Definition: an outcome is schedule-blocking if it is at least taking a turn and it is at most compelling a reaction.

Regular scheduling of a schedule-blocking outcome (called the event) (this is the regular block scheduling rule):
	now the event is scheduled for later testing.
	
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
	
The compelled attacker is an object that varies.
The compelled action is a stored action that varies. The compelled action is the action of waiting.

A person has an outcome called the act-outcome. The act-outcome of a person is usually boring lack of results.

Definition: a person is scheduled to act freely:
	Let the event be the act-outcome of it;
	if the event is boring lack of results, no;
	decide on whether or not the event is scheduled for later testing;

Suppress npc action is a truth state that varies.

To compel (the desired action - a stored action):
	Let the guy be the actor part of the desired action;
	transcribe "compelling [the desired action][if the guy is asleep] and waking up [the guy]";
	now the guy is not asleep;
	Now the compelled action is the desired action;
	schedule compelling an action; [this should automatically stop and wait for a turn]
	
To compel (the desired action - a stored action) as a reaction to (guy - a person):
	transcribe "setting the compelled attacker to [the guy][if the guy is asleep] and waking [them] up";
	now the guy is not asleep;
	Now the compelled attacker is the guy;
	Now the compelled action is the desired action;
	schedule compelling an attack; [this should automatically stop and wait for a turn]
	
To wait for (guy - a person) to act freely:
	if guy is asleep:
		transcribe "waking [the guy] up so [they] can act freely";
	now the act-outcome of the guy is the outcome described;
	now the outcome described is scheduled for later testing;
	
Initial scheduling of taking a turn:
	now suppress npc action is true;
	
To forget the/-- compelled action:
	now the compelled attacker is nothing;
	now the compelled action is the action of waiting;
	
The automated menu question answer is a number that varies.

First for reading a command when the automated menu question answer is greater than 0:
	change the text of the player's command to "[the automated menu question answer]".

To select menu question answer (N - a number):
	transcribe "Selecting answer [N]";
	now the automated menu question answer is N;
	carry out the reading a command activity;
	now the automated menu question answer is 0;

A Standard AI rule for the compelled attacker when testing compelling an attack (this is the compel an attack rule):
	if the compelled attacker is at-react:
		make no decision;
	try the compelled attacker attacking (the actor part of the compelled action);
	test compelling an attack against true;
	schedule compelling a reaction;
	rule succeeds.
		
A Standard AI rule for a person (called P) when testing compelling a reaction (this is the compel a reaction rule):
	unless the actor part of the compelled action is P and P is at-React:
		make no decision;
	try the compelled action;
	forget the compelled action;
	test compelling a reaction against true;
	rule succeeds.

A Standard AI rule for a person (called P) when testing compelling an action (this is the compel an action rule):
	unless the actor part of the compelled action is P and P is at-Act:
		make no decision;
	try the compelled action;
	forget the compelled action;
	test compelling an action against true;
	rule succeeds.
	
A Standard AI rule for a person (called P) (this is the suppress actions rule):
	if suppress npc action is true:
		if P is scheduled to act freely:
			transcribe "[act-outcome of P] allows [P] to act";
		otherwise if P is at-react:
			transcribe "allowing [P] to react";
		otherwise:
			transcribe "suppressed action for [P]";
			rule succeeds;
	
The suppress actions rule is listed before the insane people attack themselves rule in the standard AI rulebook.
The compel an action rule is listed before the suppress actions rule in the standard AI rulebook.
The compel a reaction rule is listed before the compel an action rule in the standard AI rulebook.
The compel an attack rule is listed before the compel a reaction rule in the standard AI rulebook.

Section - Testing Outcomes

To decide whether (event - an outcome) timed out:
	decide on whether or not the attempt count of the event is not less than the maximum attempts of the event;
	
To decide whether (event - restarting for tests) timed out: no.
		
To decide what number is the expected successes of (event - an outcome) after (attempts - a number):
	if the minimum attempts of the event is 0, decide on likelihood of the event;
	decide on (likelihood of the event * attempts) / minimum attempts of the event;

The failure report is a text that varies;
	
To resolve (event - an outcome):
	Let the tolerance be the maximum tolerance of the event;
	Let target be the expected successes of the event after the maximum attempts of the event;
	let the upper bound be target + tolerance;
	let the lower bound be (target - tolerance)  - maximum attempts of the event + attempt count of the event;
	if the success count of the event is less than the lower bound or the success count of the event is greater than the upper bound:
		[achievement is impossible within the maximum number of attempts]
		now the state of event is outcome-failed;
		if the failure report is empty:
			now the failure report is "After [attempt count of the event] attempt[s], [the event] happened [success count of the event] times (not between [lower bound] and [upper bound] of target [target] for maximum attempts [maximum attempts of event] with tolerance [tolerance])";
		assert failure report based on false;
	otherwise if the attempt count of the event is at least the minimum attempts of the event:
		now the tolerance is (tolerance * attempt count of the event) / maximum attempts of the event;
		now target is expected successes of the event after the attempt count of the event;
		now the upper bound is the target + tolerance;
		now the lower bound is the target - tolerance;
		if likelihood of the event is at least 1 and lower bound is less than 1:
			now lower bound is 1;
		if the success count of the event is at least lower bound and the success count of the event is at most upper bound:
			now the state of event is outcome-achieved;
			if the event is not preset, assert "success" based on true;

[
failure tolerance: no way end result will be within tolerance.

eg 1 in 15 with 200 attempts
success-target=13
tolerance=9
maximum failures=200-13-9=178
(max success=22, min success=4)

necessary success = min success - maximum attempts + attempts
at 196 attempts:
4 - 200 + 196 = 0
at 197:
4 - 200 + 197 = 1
]
	
To resolve dependents of (event - an outcome):
	if the state of the event is outcome-failed or the event timed out:
		if the event has unresolved dependents:
			Repeat with item running through outcomes:
				if item is not resolved and item depends on event:
					[if the event failed, dependents fail silently. If the event succeeded, they fail noisily]
					if state of the event is outcome-achieved, assert "[item] ([success count of item]/[attempt count of item]) stalled because [event] timed out after [attempt count of event - 1] attempt[s]" based on false;
					now state of item is outcome-failed;

To test (event - an outcome) against (success - a truth state):
	make the event testable;
	[transcribe "DEBUG: test [event] against [success]";]
	increment attempt count of the event;
	if success is true:
		increment success count of the event;
	if event is resolved:
		resolve dependents of the event;
	otherwise:
		resolve event;
	[There is a subtle conflict between "success count" and "just-succeeded". "success count" is the number of times the "success" condition was met. However, if likelihood is 0, this is not really a success - it will result in a positive "error" during resolution. On the other hand, just-succeeded is only true if we got a desirable result, even if that result is false (as it should be in the case of likelihood=0). Feel free to suggest better names for these two variables]
	if success is (whether or not likelihood of the event is greater than 0):
		now the event is just-succeeded;
	otherwise:
		now the event is just-tested;

Chapter - Persistent data

The file of test transcript is called "testtranscript".

The event description is a text that varies.
The damage description is a text that varies.
[globals to cut down on block copying, which is slow]

The capture mode is a number that varies.

To capture whole events: now the capture mode is 0.
To decide whether capturing whole events: decide on whether or not the capture mode is 0.

To capture damage text: now the capture mode is 1.
To decide whether capturing damage text: decide on whether or not the capture mode is 1.

The transcription reason is a text that varies. 
transcription reason reporting mode is a number that varies.

To give default transcription reason: Now transcription reason reporting mode is 0.
To decide whether giving default transcription reason: Decide on whether or not transcription reason reporting mode is 0.

To give custom transcription reason: Now transcription reason reporting mode is 1.
To decide whether giving custom transcription reason: Decide on whether or not transcription reason reporting mode is 1.

To give no transcription reason: Now transcription reason reporting mode is 2.
To decide whether giving no transcription reason: Decide on whether or not transcription reason reporting mode is 2.

To log (msg - a text):
	Let T be the substituted form of msg;
	let currently capturing be whether or not text capturing is active;
	give no transcription reason;
	if currently capturing is true, transcribe and stop capturing text;
	say "[line break][T]";
	append "**** [T] [bracket][current test description][close bracket][line break]" to file of test transcript;
	if currently capturing is true, start capturing text;
	
To transcribe (T - a text):
	let message be "[bracket][T][close bracket][command clarification break]";
	give no transcription reason;
	update event description;
	append "[message]" to file of test transcript;

Definition: an outcome (called event) is relevant:
	while event is not boring lack of results:
		if event is the scheduled event, yes;
		now event is the antecedent of event;
	no.

To say current test description:
	unless the scheduled event is boring lack of results:
		if the primary outcome is not boring lack of results:
			say  "[primary outcome], [scheduled event][if the outcome described is not the scheduled event], [the outcome described][end if] attempt [attempt count of the outcome described] turn [the turn count], ";
		if there is a relevant achieved outcome:
			say "achieved [the list of relevant achieved outcomes] | ";
		if there is a relevant failed outcome:
			say "failed [the list of relevant failed outcomes] | ";
		repeat with event running through possible relevant outcomes:
			say "'[event]' [success count of event]/[attempt count of event] times | ";
		say "([test assertion count] assertions)";
	
To decide whether the captured text is empty: (- (captured_text-->0 == 0) -)

To flush to transcript:
	unless the captured text is empty:
		append "[the captured text]" to file of test transcript;
		if giving default transcription reason:
			transcribe "transcribed during [current test description]";
		otherwise if giving custom transcription reason:
			transcribe "[transcription reason] [current test description]";
	give default transcription reason; [for next time]
	start capturing text; [and clear the captured text]

To update the/-- event description, anonymously:
	if text capturing is active:
		if giving default transcription reason:
			now transcription reason is "updated event description -";
			give custom transcription reason;
		stop capturing text;
		unless the captured text is empty:
			now the event description is the substituted form of "[the event description][the captured text]";
		flush to transcript;
	
To update the/-- event description because (reason - a text):
	if text capturing is active:
		give custom transcription reason;
		now transcription reason is reason;
	update event description;
	
To transcribe and stop capturing text/--:
	if text capturing is active:
		if giving default transcription reason:
			now transcription reason is "stopped capturing -";
			give custom transcription reason;
		update the event description;
		stop capturing text;
	
To transcribe and stop capturing text/-- because (reason - a text):
	if text capturing is active:
		give custom transcription reason;
		now transcription reason is reason;
		transcribe and stop capturing.
	
To clear the/-- event description:
	if text capturing is active:
		if giving default transcription reason:
			give no transcription reason; [if we want a message when clearing event description, we have to specify one]
		stop capturing text;
		flush to transcript;			
	now the event description is "";
	
To clear the/-- event description because (reason - a text):
	if text capturing is active:
		now transcription reason is reason;
		give custom transcription reason;
		clear event description;
			
The file of test results is called "testresults".

Table of Test Results
Test Set (outcome)	Total (number)	Failures (number)	Failure Messages (indexed text)
with 100 blank rows

The file of test set queue is called "testqueue"

Table of Test Set Queue
Random-Seed (number)	Unresolved Count (number)
0	0
with 1 blank row

To decide what number is the initial test random seed: decide on 68.

To queue (T - an outcome):
	make T testable;
	choose row 1 in Table of Test Set Queue;
	unless there is an unresolved count entry:
		now the unresolved count entry is 0;
	increment the unresolved count entry;
	
To queue all automated tests:
	Repeat with T running through enabled outcomes:
		queue T.
			
To record a test attempt:
	increment the test assertion count;
	increment the total assertion count;
	if there is a test set of the primary outcome in Table of Test Results:
		choose row with test set of primary outcome in Table of Test Results;
	otherwise:
		choose a blank row in Table of Test Results;
		now test set entry is the primary outcome;
		now total entry is 0;
		now failures entry is 0;
		now failure messages entry is "";
	increment the total entry;

To record a/-- failure:
	choose row with test set of primary outcome in Table of Test Results;	
	increment the assertion failures count;
	increment the failures entry;	
	let new message be "Failure for test: [the primary outcome], step: [the scheduled event], [if the outcome described is not the scheduled event][the outcome described], [end if]assertion [the test assertion count]: [the failure report][paragraph break]";
	log the new message;
	now the failure messages entry is the substituted form of "[failure messages entry][new message]";
	now the failure report is "";
	
To record a/-- failure report of/-- (msg - a text):
	now the failure report is msg;
	record a failure;
	
To say grand test summary:
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
	say "[grand test total] test[s] in [number of filled rows in Table of Test Results] set[s], [grand test failures] failure[s]";
	Let the remaining outcome tests be the maximum attempts of the primary outcome - attempt count of the primary outcome;
	if the remaining outcome tests is at least 1:
		say "; [number of not preset possible outcomes] outcome[s] to be tested up to [remaining outcome tests] more times" ;
		
[TODO: square these numbers with 'requeueable' count?]

To decide whether there are test results to display:
	decide on whether or not the number of filled rows in Table of Test Results is at least 1;
		
To display test results:
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

Chapter - Controlling Text Capture

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

regular scheduling of boring lack of results:
	now allowing screen effects is true.

Chapter - Scheduling

testing effects rules are an outcome based rulebook.

Section - Controlling Outcomes

The dependency test root is an outcome that varies. The dependency test root is boring lack of results.

[Dependency is defined differently for different outcomes. In effect, the dependency tree has two segments:
	
an set of preset outcomes, all preceding testing of the scheduled event
a branching tree of outcomes, all rooted at the scheduled event

When scheduling happens, all the presets will be manually made possible - often by phrases invoked within a "regular scheduling" rule. No other branches should be followed, even though many preset outcomes have multiple dependents. But all the branches of the scheduled event should be made possible. This phrase reflects that: preset outcomes only search for possible dependents, while non-preset outcomes follow all branches of "not resolved" dependents.
]

To decide whether (event - an outcome) has unresolved dependents:
	repeat with item running through outcomes:
		if item currently depends on event, yes;
	no.
	
To decide whether (event - an outcome) depends on (blocker - an outcome):
	Let candidate be the event;
	while candidate is not boring lack of results:
		now candidate is the antecedent of the candidate;
		[We don't check for cyclical dependencies. Beware!]
		if candidate is blocker:
			decide yes;
	decide no.
	
To decide whether (event - an outcome) currently depends on (blocker - an outcome):
	unless event depends on blocker, no;
	if the blocker is preset:
		decide on whether or not event is possible;
	otherwise:
		decide on whether or not event is not resolved;
	
To decide what number is the calculated maximum attempts of (event - an outcome):
	unless maximum attempts of event is 0:
		decide on the maximum attempts of event;
	Let max be 100;
	if minimum attempts of event is 1:
		now max is 1;
	repeat with item running through outcomes:
		if item depends on event:
			Let dependent-max be the calculated maximum attempts of item;
			if dependent-max is greater than max:
				now max is dependent-max;
	decide on max;
	
To make (event - an outcome) testable:
	if event is untested:
		now state of event is outcome-possible;
		now maximum attempts of event is the calculated maximum attempts of event;
		set the maximum tolerance for event with 0.99 achievement;

To make (event - boring lack of results) testable:
	do nothing;
		
Definition: an outcome is test set if the antecedent of it is restarting for tests.
Definition: an outcome is test step if it is not preset and the antecedent of it is boring lack of results.

Definition: An outcome is enabled if it is a test set.

The first test set is an outcome that varies. The first test set is boring lack of results.
The next test set is an outcome that varies.

To find test sets:
	[TODO: do this at start of game?]
	Let item be boring lack of results;
	while the first test set is boring lack of results:
		now item is the outcome after item;
		if item is a test set, now the first test set is item;
	while the primary outcome is boring lack of results and item is not boring lack of results:
		[increment after, because the primary outcome could be the first test set]
		if item is requeueable, now the primary outcome is item;
		now item is the outcome after item;
	while the next test set is boring lack of results and item is not boring lack of results:
		if item is a test set, now the next test set is item;
		now item is the outcome after item;
		
To decide which outcome is the test set of (event - an outcome):
	if the first test set is boring lack of results:
		find test sets;
	if event is less than the first test set:
		decide on boring lack of results;
	if event is at least the primary outcome:
		if the next test set is boring lack of results or event is less than the next test set:
			decide on the primary outcome;
	While event is not boring lack of results and event is not a test set:
		now event is the outcome before event;
	decide on event;

Definition: An outcome (called event) is preset:
	if the first test set is boring lack of results:
		find test sets;
	decide on whether or not event is less than the first test set.
	
To report an iteration because (reason - a text):
	clear event description because reason;
	stop capturing text;
	say " .[run paragraph on]";
	start capturing text;
		

Section - Scheduling

To decide whether testing (T - an outcome):
	if T is already scheduled, yes;
	if done testing is true, no;
	if T is the outcome described, yes;
	if T is the scheduled event, yes;
	if T is the primary outcome, yes;
	no;
	
To decide whether testing (D - a description of outcomes):
	Repeat with T running through D:
		if testing T, yes;
	no.

Initial scheduling rules are an outcome based rulebook.
			
regular scheduling rules are an outcome based rulebook.

rescheduling is a truth state that varies.

The scheduled event is an outcome that varies. The scheduled event is boring lack of results.

The outcome described is an outcome that varies.

[resettable means we can reset this and all its dependents and presets, and go on to the next test step]
	
Definition: boring lack of results is resettable: no;

Definition: an outcome (called event) is resettable:
	if event is not the scheduled event, no;
	if event is not resolved, no;
	repeat with item running through outcomes:
		if item currently depends on event:
			no;
		if item is not restarting for tests and item is preset:
			if item is already scheduled, no;
			if item is possible, no;
	yes;
	
[This phrase determines if an outcome should be scheduled before resetting or rescheduling the scheduled event. It may not necessarily be schedulable right now (for that we use "immediately schedulable")]

To decide whether (event - an outcome) needs scheduling:
	if event is not unscheduled, no;
	[transcribe "DEBUG: does [event] need scheduling?";]
	if event is not the scheduled event:
		if event is a test step, no;
		if event is a test set, no;
		Let blocker be the antecedent of the event;
		While blocker is not boring lack of results:
			if blocker is just-tested, no; [we need a rescheduling so the antecedent can be just-succeeded]
			now blocker is the antecedent of blocker; 
	if the test set of event is not the primary outcome, no; [this includes presets, which are scheduled manually or by antecedent]
	if event is resolved and not (event has unresolved dependents), no;
	yes.

Definition: an outcome (called event) is reschedulable:
	unless event is already tested, no;
	Repeat with item running through outcomes:
		if item depends on event:
			if item is already scheduled:
				no;
			if item is immediately schedulable:
				no;
		otherwise if item is preset:
			if item is already scheduled:
				no;
	if event has unresolved dependents, yes;
	decide on whether or not event is not resolved;

To reset (event - boring lack of results):
	do nothing.
	
To reset (event - an outcome):
	if event is the scheduled event:
		[transcribe "DEBUG: reset [event], which is the scheduled event";]
		repeat with item running through outcomes:
			if item depends on event:
				reset item;
			if item is preset and item is resolved and item is not restarting for tests: [why not reset restarting for tests here? I think it causes too many restarts]
				reset item;
		reset the antecedent of event; [resets restarting for tests if this is the primary outcome]
	[otherwise:
		transcribe "DEBUG: reset [event]: the scheduled event is [the scheduled event]";]
	now success count of event is 0;
	now attempt count of event is 0;
	now state of event is outcome-untested;
	now event is unscheduled;
	Repeat with guy running through people:
		if the act-outcome of guy is the event, now the act-outcome of guy is boring lack of results; [TODO: always do this when resetting the scheduled event?]

To prepare (event - an outcome) for rescheduling:
	report an iteration because "rescheduling [event] -";
	repeat with item running through outcomes:
		if item is preset or item depends on event, now item is unscheduled;
	now the event is unscheduled;
			
Definition: an outcome (called event) is already scheduled if it is scheduled for immediate testing or it is scheduled for later testing;
Definition: an outcome (called event) is already tested if it is just-tested or it is just-succeeded;

Definition: boring lack of results is immediately schedulable: no.

Definition: an outcome (called event) is immediately schedulable:
	unless event needs scheduling, no;
	if the antecedent of the event is not preset and antecedent of the event is not just-succeeded, no;
	Let the blocker be event;
	While the blocker is not boring lack of results:
		if blocker is already scheduled:
			no;
		otherwise if blocker is not just-succeeded:
			if blocker is the antecedent of the event and blocker is not preset, no;
		now blocker is the antecedent of blocker;
	if event is resettable, no;
	if a preset outcome is scheduled for later testing, no;
	Repeat with dependent running through already scheduled outcomes:
		if the antecedent of dependent is the event, no;
	yes;
		
Definition: an outcome (called event) is immediately testable:
	unless event is scheduled for immediate testing, no;
	if event is preset, yes;
	if a preset outcome is scheduled for later testing, no;
	yes.
	
[The scheduled event is the earliest event that can be repeated. We test it and all its dependents together. It often has major side effects,
like taking a turn. Its antecedent is always a preset - restarting for tests if it's the beginning of a set, or boring lack of results if
no antecedent has been specified.]
		
To schedule (the event - boring lack of results):
	transcribe and stop capturing because "boring lack of results was the new event of";
	say line break;
	start capturing text;
	
To schedule (the event - an outcome):
	[transcribe "DEBUG: scheduling [event]";]
	if event is a test step:
		now the scheduled event is event;
		capture whole events;
	make the event testable;
	if the antecedent of event is boring lack of results or the antecedent of event is just-succeeded:
		now the outcome described is the event;
		now rescheduling is true;
		now the event is scheduled for immediate testing;
		if attempt count of the event is 0:
			now rescheduling is false;
			if the event is the scheduled event, log "  next step:  [the scheduled event]";
			follow the initial scheduling rules for the event;
			if the event is the scheduled event, clear event description; [this also happens when rescheduling, under "report an iteration"]
		follow the regular scheduling rules for the event;
	otherwise if the antecedent of the event is preset or the antecedent of the event is immediately schedulable:
		schedule the antecedent of the event;
	otherwise:
		transcribe "WARNING: [the event] could not be scheduled, nor could its antecedent [antecedent of the event]";
	
To decide which outcome is the test step after (event - an outcome):
	Now event is the outcome after event;
	While event is not boring lack of results:
		if event is requeueable:
			decide on event;
		if event is a test step and the primary outcome is not boring lack of results:
			if the test set of event is the primary outcome:
				decide on event;
		Now event is the outcome after event;
	decide on boring lack of results;

To continue scheduling:
	Let repeat be true;
	While repeat is true:
		now repeat is false;
		[transcribe "DEBUG: continue scheduling [the list of immediately schedulable outcomes]";]
		Repeat with event running through immediately schedulable outcomes:
			schedule event;
		[transcribe "DEBUG: continue scheduling, immediately testable: [the list of immediately testable outcomes]";]
		Repeat with event running through immediately testable outcomes:
			test effects of event;
			if event is just-succeeded, now repeat is true;
		if the scheduled event is resettable:
			[transcribe "DEBUG: continue scheduling, reset [the scheduled event] and schedule [the test step after the scheduled event]";]
			reset the scheduled event;
			now the scheduled event is the test step after the scheduled event;
			if the scheduled event is not boring lack of results, now repeat is true;
		otherwise if the scheduled event is reschedulable:
			[transcribe "DEBUG: continue scheduling, reschedule [the scheduled event]";]
			prepare the scheduled event for rescheduling;
			now repeat is true;
	[transcribe "DEBUG: continue scheduling, nothing left to do - [the list of scheduled for later testing outcomes]";]

To test effects of (event - an outcome):
	Now the outcome described is event;
	give no transcription reason;
	update event description;
	follow the testing effects rules for the event;
	let success be whether or not the rule succeeded;
	let resolution be whether or not the event is resolved;
	test the event against success;
	if resolution is false or success is false, transcribe "tested effects of [if success is true][current test description] - success[otherwise][the outcome described] ([success count of the outcome described]/[attempt count of the outcome described]) - no success[end if]";

Before taking a player action when done testing is false (this is the test event effects rule):
	if taking a turn is scheduled for later testing, test taking a turn against true;
	continue scheduling;

Section - Counting Actions

The testing combat round rules are an object based rulebook.

A first combat round rule (this is the test combat round of previous main actor rule):
	if the main actor is scheduled to act freely:
		now the act-outcome of the main actor is scheduled for immediate testing;
		continue scheduling;
	if a person is scheduled to act freely:
		clear event description;
		Repeat with guy running through scheduled to act freely people:
			unless the location of guy is the location:
				assert "[act-outcome of guy] can't be tested because [guy] is not here" based on false;
				now the act-outcome of guy is unscheduled;
				now the state of act-outcome of guy is outcome-failed;

Chapter - Starting Tests

The primary outcome is an outcome that varies.

To decide what number is (T - an outcome) as a number: (- {T} -);
To decide what outcome is (T - a number) as an outcome: (- {T} -);

Done testing is a truth state that varies.
	
The file of noninteractive tests is called "noninteractivetests".

The run the unit tests rule is listed before the load achievements rule in the before showing the title screen rules.

Definition: an outcome is requeueable:
	unless it is a test set, no;
	if it is possible, yes;
	if it is untested, no;
	decide on whether or not it has unresolved dependents.
	
Before showing the title screen (this is the run the unit tests rule):
	now allowing screen effects is true;
	if the file of test set queue exists:
		read file of test set queue into Table of Test Set Queue;
	Let remaining tests be 0;
	if the number of filled rows in Table of Test Set Queue is at least 1:
		choose row 1 in Table of Test Set Queue;
		if there is an unresolved count entry, now remaining tests is the unresolved count entry;
	if remaining tests is at least 1:
		transcribe "loading [the remaining tests] unresolved outcomes";
		load test outcomes;
	if the file of test results exists:
		read file of test results into Table of Test Results;
	if the file of noninteractive tests exists:
		if screen reader mode is unset:
			enable screen reader mode;
		if the remaining tests is 0:
			unless there are test results to display, try all-test queueing;
	if remaining tests is 0:
		if there are test results to display, display test results;
		now done testing is true;
	otherwise:
		now roguelike mode is false;

First for showing the title screen when done testing is false:
	do nothing.

First after showing the title screen (this is the run all tests rule):
	if done testing is true, make no decision;
	transcribe and stop capturing because "restarting with";
	now allowing screen effects is false;
	[TODO: handle interaction between test config file and scenario]
	start capturing text;
	test restarting for tests against true;
	Now the primary outcome is the test step after restarting for tests; [setting the primary outcome TODO: integrate with 'find test sets']
	now the scheduled event is the primary outcome;
	Choose row 1 in Table of Test Set Queue;
	if the random-seed entry is not 0:
		log "Seeding random number generator and dungeon generation with [random-seed entry]";
		now the dungeon generation seed is the random-seed entry;
		seed the random-number generator with the random-seed entry;
	log "Completed so far: [grand test summary], with [unresolved count entry] set[s] left to test";
	Repeat through Table of Test Results:
		if failures entry > 0:
			log "  [failures entry] failures in [test set entry]";
	schedule taking a turn;
	follow the scenario rules for the primary outcome;
	
The scenario rules are an outcome based rulebook.
	
this is the keep using the xorshift generator for automated tests rule:
	say "[banner text]Dungeon seed: [dungeon generation seed in hexadecimal to 8 places][xorshift seed in hexadecimal to 4 places][line break]";

The keep using the xorshift generator for automated tests rule substitutes for the show the banner with dungeon generation seed rule when done testing is false.

[Prevent the status window from opening]	
The check info panel capacity rule does nothing when done testing is false.
	
Chapter - Commands to Start Tests

Test queueing is an action out of world applying to one outcome. Understand "queue test [outcome]" as test queueing.

Carry out test queueing an outcome:
	say "[The outcome understood] will run now.";
	queue the outcome understood;
	start test transcript with "[the outcome understood]";
	
All-test queueing is an action out of world applying to nothing. Understand "queue test all" as all-test queueing.

Carry out all-test queueing:
	queue all automated tests;
	say "All automated tests will run now.";
	start test transcript with "all tests".
		
To start test transcript with (T - a text):
	unless the file of noninteractive tests exists:
		pause the game;
	write "Test transcript for Kerkerkruip: [T].[line break]" to file of test transcript;
	start the next test;
	
	
Understand "queue test/tests" and "queue test [text]" as a mistake ("You can 'queue test all' or test one of the following sets: [list automated tests]").

To say list automated tests:
	repeat with T running through enabled outcomes:
		say "[line break][T]";
	say paragraph break.

Chapter - Resetting the Game After Each Test Set (in place of Chapter - The Unit test rules unindexed in Simple Unit Tests by Dannii Willis)

To start the/-- next test:
	schedule restarting for tests;
	
Regular scheduling of restarting for tests:
	write file of test results from Table of Test Results;
	choose row 1 in Table of Test Set Queue;
	transcribe "Unresolved count includes [the list of requeueable outcomes]";
	now the unresolved count entry is the number of requeueable outcomes;
	if the attempt count of the scheduled event is 0:
		now the random-seed entry is the initial test random seed;
		transcribe "initializing random seed to [the random-seed entry] for [the scheduled event]";
	otherwise:
		if the xorshift seed is 0:
			if the dungeon generation seed is 0:
				increment the random-seed entry;
				transcribe "incrementing random seed to [the random-seed entry]";
			otherwise:
				now the xorshift seed is the dungeon generation seed;
				Let throwaway result be a random number from 1 to 2;
				transcribe "advancing random seed to [the xorshift seed]";	
				now the the random-seed entry is the xorshift seed;
		otherwise:
			transcribe "saving xorshift seed [the xorshift seed]";
			now the random-seed entry is the xorshift seed;
	transcribe "restarting with random seed [random-seed entry] testing [if the primary outcome is requeueable][current test description][otherwise][the list of requeueable outcomes][end if]";
	save test outcomes;
	write file of test set queue from Table of Test Set Queue;
	if file of save data exists:
		delete file of save data;
	transcribe and stop capturing because "starting the next test after";
	restart immediately.

For reading a command when done testing is false (this is the finish the last test rule):
	transcribe and stop capturing text because "finished final test";
	start the next test;
	
Before printing the player's obituary when done testing is false (this is the abort the primary outcome if game over rule):
	record failure report "the player died";
	transcribe and stop capturing because "game over at";
	start the next test.
		
Chapter - The assert phrase (in place of Chapter - The assert phrase in Simple Unit Tests by Dannii Willis)

The test assertion count is a number variable.
The total assertion count is a number variable.
The assertion failures count is a number variable.

To decide whether we assert (T - a text) based on (result - a truth state):
	update event description because "checking whether '[T]'";
	if result is true, yes;
	now the failure report is T;
	no.
	
To decide whether we assert that/-- (A - a value) is (B - a value) with label (T - an indexed text):
	if A is B:
		now failure report is "";
		yes;
	now the failure report is "Expected [T]: [B], Got: [A]";
	no.
	
To decide whether we assert result (T - a text):
	update event description because "checking if result includes '[T]'";
	if capturing damage text:
		unless the damage description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in damage text:[paragraph break]'[the damage description]'[line break]";
			no;
	otherwise:
		unless the event description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in the text:[paragraph break]'[the event description]'[line break]";
			no;
	now failure report is "";
	yes.
	
To decide whether we assert absence of result (T - a text):
	update event description because "checking if result does not include '[T]'";
	if capturing damage text:
		if the damage description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in damage text:[paragraph break]'[the damage description]'[line break]";
			no;
	otherwise:
		if the event description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in the text:[paragraph break]'[the event description]'[line break]";
			no;
	now failure report is "";
	yes.

To assert result (pattern - a text):
	record a test attempt;
	unless we assert result pattern, record a failure;
	
To assert absence of result (pattern - a text):
	record a test attempt;
	unless we assert absence of result pattern, record a failure;

[ Assert that two values are the same ]
To assert that/-- (A - a value) is (B - a value):
	assert that A is B with label "value";
	
To assert that/-- (A - a value) is (B - a value) with label (T - an indexed text):
	record a test attempt;
	unless A is B:
		Let error_msg be an indexed text;
		now error_msg is "Expected [T]: [B], Got: [A][line break]";
		record a failure report of error_msg;

To decide whether we assert that/-- (A - a value) is (B - a value):
	if A is B:
		now the failure report is "";
		yes;
	now the failure report is "Expected value for [the outcome described]: [B], Got: [A]";
	no.
		
To assert (T - a text) based on (C - a truth state):
	record a test attempt;
	unless C is true:
		record a failure report of T;

To assert that (N - a number) is between (A - a number) and (B - a number) with label (L - a text):
	assert "[L] [N] is not between [A] and [B]" based on whether or not N is at least A and N is at most B;
	
To decide whether we assert that (N - a number) is between (low - a number) and (high - a number):
	if N is greater than high or N is less than low:
		now the failure report is "[N] is outside expected range of [low]-[high]";
		no;
	now the failure report is "";
	yes.

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
	if place is not the location of guy:
		if guy is the player:
			now way-to-get-back is the best route from the place to the location;
			now way-to-get-there is the opposite of way-to-get-back;
		transcribe "moving [guy] to [place]";
		extract guy from combat;
		move guy to place;
		update the combat status;
	otherwise:
		transcribe "[the guy] [are] already in [place]";
	
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

Section - hiding, traveling sneakily

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
	now the fuligin cloak is not cursed;
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
			follow the set last-seen-location rule;
			follow the mark people as seen every turn rule;
			now traveling sneakily is already sneaking;
		otherwise:
			record failure report "Can't find a route to [place].";
			stop;
	now the way-to-get-back is the best route from the location to the retreat location;
	update the combat status.
			
previously-fast is a truth state that varies.
	
After taking a player action (this is the assume all actions are fast until every turn runs rule):
	now previously-fast is true;
	
First every turn (this is the remember if the last turn took time rule):
	now previously-fast is false;
	
Section - The reusable item

The reusable item is an object that varies.

First regular scheduling of an outcome (this is the return the reusable item rule):
	if the reusable item is a thing and the reusable item is not carried:
		now the player carries the reusable item;

Section - Readied weapons

To decide which object is the current weapon of (guy - a person):
	decide on a random readied weapon enclosed by guy.
	
Section - Occupied and Unoccupied

Definition: A room is occupied rather than unoccupied if it encloses a person.

Section - Counting Hits


A person has a number called the hitting count.

First before an actor hitting (this is the increment hitting count rule):
	increment the hitting count of the actor;
			
To reset hitting counts:
	Repeat with guy running through people:
		Now the hitting count of guy is 0.
		
A last initial scheduling rule for a test step (this is the reset hitting counts when scheduling a test step rule):
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

Section - Tension

To set the tension to (N - a number):
	transcribe "Setting tension to [N]";
	now the tension is N;
		
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

Section - Test Arena and Battle Phrases

Test Arena is an arena. The staging area of Test Arena is maze-waiting-room.

Test Arena is faction-imposing.
		
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
	
To say (event - combat hit):
	say "doing [the compelled action] for a [melee of compelled attacker] hit by [the compelled attacker]".
	
Table of Outcomes (continued)
outcome	likelihood	minimum attempts
combat hit	1	1

To decide what person is the compelled actor: decide on the actor part of the compelled action;

[TODO: extract text for reaction, attack roll and attack damage if requested]

To do (reaction - a stored action) for/-- a (strength - a number) melee hit by (aggressor - a person):
	now the compelled action is reaction;
	now the compelled attacker is aggressor;
	now the melee of the compelled attacker is strength;
	now the defence of the compelled actor is 50;
	schedule combat hit;
		
Regular scheduling of combat hit:
	now the health of the compelled actor is 1000;
	now the compelled actor is not asleep;
	now the compelled attacker is not asleep;
	clear event description;
	now the compelled actor is at-react; [enable reactions]
	try the compelled action;
	now the compelled actor is at-Inactive; [clear reaction state]
	try the compelled attacker hitting the compelled actor;
	update event description because "combat hit -";
	
[TODO: forget the compelled action? When resetting?]

Testing effects of combat hit:
	Let reaction be the action name part of the compelled action;
	Let saved mode be the capture mode;
	capture whole events;
	If the reaction is the parrying action:
		assert result "\(defender parrying\)";
	otherwise if the reaction is the dodging action:
		assert result "\(defender dodging\)";
	otherwise if the reaction is the blocking action:
		assert result "\(blocking\)"; [watch out - no message if block bonus is 0];
	now the capture mode is the saved mode;
	if capturing damage text, check damage of the compelled actor with 1000 health after "\n[The compelled attacker] [deal]";
	rule succeeds;

to decide whether we assert (prefix - a text) to (guy - a person) any damage (suffix - a text):
	Let the actual damage be 1000 - health of guy;
	now the health of guy is 1000;
	capture whole events;
	assert result "[prefix](\s*\d*<^\n>+) damage\s+[suffix]";
	capture damage text;
	now the damage description is the text matching subexpression 1;
	Let the value be the calculated value of the damage description;
	unless the actual damage is the value:
		now failure report is "damage to [guy] is [actual damage], but damage description adds up to [the value]";
		no;
	now failure report is "";
	yes.
		
to decide whether we assert (prefix - a text) to (guy - a person) a total of (expected damage - a number) damage (suffix - a text):
	Let the actual damage be 1000 - health of guy;
	unless we assert prefix to guy any damage suffix:
		no;
	unless actual damage is expected damage:
		now failure report is "damage to [guy] is [actual damage], but we expected [expected damage]";
		no;
	now failure report is "";
	yes.
	
to decide whether we assert (expected damage - a number) damage to (guy - a person) after (preamble - a text):
	Let the actual damage be 1000 - health of guy;
	unless we assert described damage to guy with 1000 health after preamble, no;
	unless actual damage is expected damage:
		now failure report is "damage to [guy] is [actual damage], but we expected [expected damage]";
		no;
	now failure report is "";
	yes.
	
To decide whether we assert described damage to (guy - a person) with (previous health - a number) health after (preamble - a text):
	Let the actual damage be previous health - health of guy;
	now the health of guy is 1000; [set things up for the next test]
	capture whole events;
	assert result "[preamble](\s*\d*<^\n>+) damage";
	capture damage text;
	now the damage description is the text matching subexpression 1;
	Let the value be the calculated value of the damage description;
	unless the actual damage is the value:
		now failure report is "damage to [guy] is [actual damage], but damage description adds up to [the value]";
		no;
	now failure report is "";
	yes.
	
To check damage of (guy - a person) with (previous health - a number) health after (preamble - a text):
	record a test attempt;
	unless we assert described damage to guy with (previous health) health after preamble, record a failure.
		
To assert that/-- (item - a weapon) readied after (circumstance - a text):
	assert "[The item] should be readied after [circumstance]" based on whether or not the player holds item and item is readied;
	
To decide whether we assert that (item - a weapon) readied:
	if the player holds item and item is readied:
		now the failure report is "";
		yes;
	now the failure report is "[The item] should be readied after [the outcome described]";
	no.
	
To assert no weapon after (circumstance - a text):
	Let the item be a random readied weapon enclosed by the player;
	assert "Nothing besides a natural weapon should be readied after [circumstance]" based on whether or not the item is nothing or the item is a natural weapon.
	
To decide whether we assert no weapon:
	Let the item be a random readied weapon enclosed by the player;
	if item is a natural weapon or item is nothing:
		now the failure report is "";
		yes;
	now the failure report is "[The item] is readied, but nothing besides a natural weapon should be readied after [the outcome described]";
	no.
		
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

First, there's a simple "X is Y" assertion, but we give it a label so the output will be clear about what we're comparing:

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
	
Once we have updated the event description, we can test it (or any text) with the "includes" assertion:
	
	assert that the event description includes "Feeding \d+ blood to the amulet will increase its power by \d+";

	assert that the damage description does not include "\+ \d+ \(heat\)";
	
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

To have things happen on a turn-by-turn basis, create a "test step," or more than one. A test step is a kind of value, and they run in the order that they were declared in the source. We must specify which test step is the first one of the test set, and the rest will follow automatically:

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

Since these rulebooks are NOT test-step based, we must need to use "when testing (move - a test step)" instead of giving a test step as the object of the rule.

To make other people do things, we can use the "compel (action - a stored action)" phrase.

	Initial scheduling of dagger-strike:
		compel the action of the swarm of daggers attacking the player.

By default, all (non-compelled) NPC actions are suppressed during tests. In the transcript, we can see when a character gets a combat round because the message "[suppressed action for X]" appears. NPCs are allowed to react, however. If we do want to allow NPCs to act freely, we can set a property of the test step:
	
	ape-cowering is an npc-enabling test step.
	
We can also enable AI actions manually with the phrase:

	Let everyone act freely;
	
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
	
	fail healer-healing player based on whether or not the injury of the player is less than 3;
	fail forbidden-teleport on result "Malygris suddenly teleports away";

When an outcome is tested, its likelihood is compared with its minimum and maximum attempts. Exactly how many times it is tested depends on these three numbers:

In the general case, we use the "test ... against" phrase to test an outcome. It will be tested for the minimum number of attempts, and then the number of successes (times the condition was met) will be compared with a target frequency. The target frequency is calculated as (likelihood/minimum attempts). If the number of successes ever comes close enough to the target, the event will be achieved, and if the maximum number of attempts is reached without ever coming in range, it will fail.

The "achieve" and "fail" phrases are for outcomes that are tested repeatedly until they happen once. In the "achieve" case, the outcome will be tested up to the maximum attempts, but in the "fail" case, testing will stop after the minimum attempts. If the given condition (either a regular expression match or a truth state) is met, the outcome will be achieved or failed depending on which phrase we invoked.

We can use the standard "test...against" phrase to get the same behavior as "achieve and fail:" if the likelihood of an event is set to 0, testing it has the same effect as the "fail" phrase. If the likelihood is set to the minimum attempts, the effect is similar, but the result must be true to succeed, instead of false. If the minimum attempts is set to 0, testing the outcome has the same effect as the "achieve" phrase - that is, it will be achieved as soon as the result is true. Here are some examples:
	
	Table of Outcomes (continued)
	outcome	likelihood	minimum attempts
	nested belief	1	0
	healer-healing-player	0	20
	healer-not-healing-player	20	20
	
	achieve nested belief on result "I believe that I believe"
	test nested belief against result "I believe that I believe" [same as above]
	
	fail healer-healing-player based on whether or not the injury of the player is 3;
	test healer-healing-player against whether or not the injury of the player is less than 3; [same as above]
	test healer-not-healing-player against whether or not the injury of the player is at least 3; [same again]

In some cases the action repetition of outcomes can be handled for us. Any test step will repeat if there are outcomes currently set to "outcome-possible." There are some predefined outcomes we can use implicitly. The most common one is used this way:

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

	While we haven't reset combat hit:

Section: Outcome dependencies

Some outcomes may not be testable until certain other conditions are met. We can ensure that those conditions are met without getting stuck in an infinite loop if they don't. The way to do this is with dependencies, or as they are called with outcomes, "antecedents."

	Table of Outcomes (continued)
	outcome	antecedent
	drakul statement	--
	nested belief	drakul statement
	
Antecedents are checked automatically before recording success or failure of an outcome. If we do this:
	
	achieve drakul statement on result "Drakul says, '";
	achieve nested belief on result "I believe that I believe";
	
Nested Belief will not be tested unless Drakul Statement has just happened. Note that Drakul Statement will have been achieved after the first pass, but it will continue to be checked as long as it has unresolved "dependents" - that is, other outcomes that have it for an antecedent. However, once its maximum attempts have been reached, all of its dependents will "time out" - whether or not they have been resolved.

Section: Generation tests

Outcome states and dependencies can be maintained even after a restart. This makes a convenient way to test dungeon generation. To test the state of the game after dungeon generation, use the "generation test" rulebook:
	
	Table of Outcomes (continued)
	outcome	likelihood	minimum attempts	maximum attempts	antecedent
	got-addicts-amulet	2	64	256	--
	cursed-addicts-amulet	2	2	--	got-addicts-amulet	

	Generation test when testing starting-kits-test:
		test got-addicts-amulet against whether or not the player wears the addict's amulet;
	
At the time of this writing (2015-03-23), we will get stuck in an infinite loop if we add any test steps after testing an outcome in a generation test. We must limit our test sets to either test dungeon generation or turns, but not both.

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
	
Each of these phrases performs a hit for us, setting a number of important conditions. It sets the health of the person being hit to 1000, and sets their reaction (no reaction doesn't set anything, block reaction sets them to at-block, and similarly for the parry reaction and dodge reaction). It sets the melee of the attacker to the number we specify and it sets the defence of the defender to 50, so we can be reasonably sure whether the attack will hit or not. For the result we give a text to match with the result of the hit, which will serve as our success condition.

If we don't specify a number of attempts, it does just one. If we do, it sets that as the minimum attempts for an outcome called "combat hit" and repeats the attempt until it is achieved or failed.

Finally, we can specify whether we're checking damage. If we're not checking damage, the result text is matched against the entire event description. But if we do, not only does the phrase invoke the "check damage" test, it also compares the result text with the damage description instead of the event description.

These phrases all make sure that the final hit is successful (as long the combat hit was achieved), so we can test additional circumstances afterwards. Here's an example of how this can be useful:
	
	have mouser do a dodge reaction to a 100 melee hit by the player with result "you drop the gilded rapier" in 1 out of 6 attempts;
	assert "the gilded rapier should be on the floor" based on whether or not the gilded rapier is in the location;

The "X melee hit" phrase does quite a bit of cleanup after each attack, including restoring any dropped, rusted, or shattered weapons. [TODO: hooks or rulebook for this?] Using the combination of the cleanup stage and the "after success" requirement, we can test not only the frequency with which the greasy gauntlets cause the player to drop a weapon, but also what happens afterwards.

Section: Other properties of test steps

TODO. (There are lots more properties of test steps - look through the code to see what they do. Location-target and hiding-check are useful for getting around the dungeon, for example.)

Section: Controlling text capture

We've already gone over the basics of how text is captured, but sometimes we need a little bit more. Because sometimes the system needs to stop capturing and display something to the screen, the full output of the current turn is saved in a "event description." This is automatically cleared at the beginning of a turn and updated when it is likely to be needed. Recall that we may use these phrases to clear and update the captured text:
		
clear the event description because "starting an iteration of the foobar test"

update the event description because "checking for frobnitz usage"

We can also control output directly, both to the screen and to the transcript. If we want to output information to the screen, use the phrase:

log (message - a text)

And if we want to output something to the transcript only, use the phrase:

transcribe (message - a text)

