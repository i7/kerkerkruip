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
For all other values, a tolerance range will be established that should achieve the outcome in 99.5% of cases with correctly randomized successes

maximum attempts - outcome will "time out" and fail if it reaches this number without being achieved first. If you don't set this, a reasonable default will be chosen for you
maximum tolerance - do not set, will be calculated
state - determines whether the outcome has been tested and whether more testing is needed
antecedent - the outcome that must succeed before this can be tested
]

Table of Outcomes
outcome	attempt count	success count	likelihood (number)	minimum attempts (number)	maximum attempts (number)	maximum tolerance (number)	state (outcome state)	label (text)	antecedent (outcome)
boring lack of results	0	0	0	1	1	0	outcome-untested	--	boring lack of results
restarting for tests	0	0	1	1	1	0	--	--	--

label-tagging relates an outcome (called the event) to a text (called the tag) when the label of the event is the tag.

The verb to be labeled means the label-tagging relation.

Section - Statistical Help

[This phrase helps us set a reasonable error tolerance of repeated tests so they will succeed most of the time. If we use a success rate of 0.995, that will set a threshold of error such that the outcome will be achieved for 99.5% of random seeds]

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
[TODO: allow everyone to act, without messing up the normal suppresion behavior]

To compel (the desired action - a stored action):
	Let the guy be the actor part of the desired action;
	transcribe "compelling [the desired action][if the guy is sleeping in this world] and waking up [the guy]";
	if the guy is sleeping in this world, now the guy is not asleep;
	Now the compelled action is the desired action;
	schedule compelling an action; [this should automatically stop and wait for a turn]

To compel (the desired action - a stored action) as a reaction to (guy - a person):
	Let the compelled defender be the actor part of the desired action;
	transcribe "setting the compelled attacker to [the guy][if the guy is sleeping in this world] and waking [them] up[end if][if the compelled defender is sleeping in this world] and waking [the compelled defender] up[end if]";
	if the guy is sleeping in this world, now the guy is not asleep;
	if the compelled defender is sleeping in this world, now the compelled defender is not asleep;
	Now the compelled attacker is the guy;
	Now the compelled action is the desired action;
	schedule compelling an attack; [this should automatically stop and wait for a turn]

To wait for (guy - a person) to act freely:
	[TODO: waking or not-waking options?]
	now the act-outcome of the guy is the outcome described;
	now the outcome described is scheduled for later testing;

First initial scheduling of an outcome (called event) (this is the usually suppress npc action rule):
	[This should be timed to suppress all npc action most of the time, but if suppression is manually disabled, we should wait to turn it back on until the test step is tested]
	if event is a test step or event is a test set:
		now suppress npc action is true;

To forget the/-- compelled action:
	now the compelled attacker is nothing;
	now the compelled action is the action of waiting;

The automated menu question answer is a number that varies.

First for reading a command when the automated menu question answer is greater than 0:
	change the text of the player's command to "[the automated menu question answer]";

First after reading a command when done testing is false (this is the restart capture after reading a command rule):
	[We don't need to worry about the finish the last test rule, because it restarts before we get here. The reading a command activity causes text capturing to stop, even when "text capturing is active" remains true. Normally we don't use the reading a command rulebook during automated tests, but we do it when we answer questions. This seems to fix it:]
	transcribe and stop capturing text because "faked a command";
	start capturing text.

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
		if there is an antecedent entry, now the antecedent of the outcome entry is the antecedent entry;

Section - The Test Transcript

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
			say  "[primary outcome]";
			if the scheduled event is not the primary outcome:
				say ", [scheduled event]";
			if the outcome described is not the scheduled event and the outcome described is not boring lack of results:
				say ", [the outcome described] attempt [attempt count of the outcome described]";
		if the test assertion count > 0:
			if the primary outcome is not boring lack of results:
				say " turn [the turn count], ";				
			if there is a relevant achieved outcome:
				say "achieved [the list of relevant achieved outcomes] | ";
			if there is a relevant failed outcome:
				say "failed [the list of relevant failed outcomes] | ";
			repeat with event running through possible relevant outcomes:
				if the number of relevant outcomes > 1 and event is not the primary outcome:
					say "'[event]'";
				say " [success count of event]/[attempt count of event] times | ";
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

Section - Test Results

The file of test results is called "testresults".

Table of Test Results
Test Set (outcome)	Total (number)	Failures (number)	Failure Messages (indexed text)
with 100 blank rows

Section - Test Queue

The file of test set queue is called "testqueue"

Table of Test Set Queue
Random-Seed (number)	Unresolved Count (number)
0	0
with 1 blank row

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
	choose row 1 in Table of Test Set Queue;
	let total test count be (number of filled rows in Table of Test Results) plus unresolved count entry;
	say "[grand test total] test[s] in [number of filled rows in Table of Test Results]/[total test count] set[s], [grand test failures] failure[s]";
	if the width of the main window is at least 98:
		let the remaining outcome tests be the maximum attempts of the primary outcome - attempt count of the primary outcome;
		if the number of not preset possible outcomes is at least 1:
			say "; testing [number of not preset possible outcomes] outcome[s] up to [remaining outcome tests] more time[s]" ;

[TODO: square these numbers with 'requeueable' count?]

To decide whether there are test results to display:
	decide on whether or not the number of filled rows in Table of Test Results is at least 1;

To display test results:
	log "Test results:";
	Repeat through Table of Test Results:
		if failures entry is 0:
			transcribe "[test set entry]: [total entry] tests, all passed";
		otherwise:
			log "[test set entry]: [total entry] tests, [failures entry] failures";
	log "[line break]Full results: [grand test summary].";
	Repeat through Table of Test Results:
		if failures entry is at least 1:
			log "";
			log "Failures for [test set entry]:";
			log "[failure messages entry]";
	say "To view a full transcript of all tests, see the file 'testtranscript.glkdata' in the project directory.";
	Blank out the whole of Table of Test Results;
	write file of test results from Table of Test Results;
	if running interactively is true:
		pause the game;
	otherwise:
		stop the game abruptly;

Section - Testing Configuration Files

The file of noninteractive tests is called "noninteractivetests".

Running interactively is a truth state that varies. Running interactively is true.

The file of random seeding (owned by another project) is called "randomseed".

Table of Initial Test Random Seed
seed value (number)
71

To decide what number is the initial test random seed:
	choose row 1 in Table of Initial Test Random Seed;
	decide on seed value entry.

To load testing configuration:
	if file of noninteractive tests exists, now running interactively is false;
	if file of random seeding exists:
		read file of random seeding into Table of Initial Test Random Seed;

Setting the random seed to is an action out of world applying to one number. Understand "randomseed [number]" as setting the random seed to.

Carry out setting the random seed to:
	choose row 1 in Table of Initial Test Random Seed;
	Let oldseed be the seed value entry;
	now the seed value entry is the number understood;
	write file of random seeding from Table of Initial Test Random Seed;
	say "Changed random seed from [oldseed] to [seed value entry] and saved to file."

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
	if (capture_active || ~~(+ allowing screen effects +)) {
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
	if (capture_active || ~~(+ allowing screen effects +)) {
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
			Let dependent-max be the calculated maximum attempts of item; [TODO: multiply by minimum / likelihood?]
			if dependent-max is greater than max:
				now max is dependent-max;
	decide on max;

[Note that INCREASING the target achievement results in SHORTER times to success - increasing target achievement broadens the range outcomes that are considered successful, by raising tolerances]

To make (event - an outcome) testable:
	if event is untested:
		now state of event is outcome-possible;
		now maximum attempts of event is the calculated maximum attempts of event;
		set the maximum tolerance for event with 0.998 achievement;

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
		clear event description; [TODO: capture combat round text?]
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
	load testing configuration;
	if running interactively is false:
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
	log "Current progress: [grand test summary]";
	Repeat through Table of Test Results:
		if failures entry > 0:
			log "  [failures entry] failures in [test set entry]";
	schedule taking a turn;
	follow the scenario rules for the primary outcome;

The scenario rules are an outcome based rulebook.

this is the keep using the xorshift generator for automated tests rule:
	say "[banner text]Dungeon seed: [dungeon generation seed in hexadecimal][line break]";

The keep using the xorshift generator for automated tests rule substitutes for the show the banner with dungeon generation seed rule when done testing is false.

[Prevent the status window from opening]
The check info panel capacity rule does nothing when done testing is false.

[Prevent manually selected test objects from appearing]
The mark test objects from file rule does nothing when done testing is false.

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
	if running interactively is true:
		pause the game;
	write "Test transcript for Kerkerkruip: [T].[line break]" to file of test transcript;
	start the next test;

Wrong-test queueing is an action out of world applying to one topic. Understand "queue test [text]" as wrong-test queueing.
	Check wrong-test queueing:
		try test listing instead.

Test listing is an action out of world applying to nothing. Understand "queue test/tests" and "list test/tests" as test listing.

Carry out test listing:
	say "You can 'queue test all' or test one of the following sets:";
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
				now the random-seed entry is the xorshift seed;
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

First after printing the player's obituary when done testing is false (this is the abort the primary outcome if game over rule):
	record failure report "the game ended";
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

To say trimmed (T - a text):
	replace the regular expression "^\s+|\s+$" in T with "";
	say T;

To decide whether we assert result (T - a text):
	update event description because "checking if result includes '[T]'";
	if capturing damage text:
		unless the damage description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in damage text:[paragraph break]'[trimmed the damage description]'[line break]";
			no;
	otherwise:
		unless the event description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was not found in the text:[paragraph break]'[trimmed the event description]'[line break]";
			no;
	now failure report is "";
	yes.

To decide whether we assert absence of result (T - a text):
	update event description because "checking if result does not include '[T]'";
	if capturing damage text:
		if the damage description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was found in damage text (when it should not have been):[paragraph break]'[trimmed the damage description]'[line break]";
			no;
	otherwise:
		if the event description matches the regular expression T:
			now the failure report is "Regular expression '[T]' was found in the text (when it should not have been):[paragraph break]'[trimmed the event description]'[line break]";
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

Section - Scenario Settings

To ban wandering monsters:
	now the smoke demon time-out is -1; [a bit of a hack, but prevents it from becoming 0]
	now the overmind is bannedobject;
	now lair of the imp is bannedobject;
	now the armadillo is bannedobject;
	Repeat with guy running through follower monsters:
		now guy is bannedobject.

To ban faculty modifiers:
	now the bull totem is bannedobject;
	now the focal totem is bannedobject;
	now tungausy totem is bannedobject;
	now addict-kit is bannedobject.

To prevent sleeping:
	Repeat with guy running through people:
		now initial sleep chance of guy is 0.

To allow teleportation:
	now the dimensional anchor is bannedobject;
	now the teleportation beacon is bannedobject.

Curse prevention is a truth state that varies.

To prevent curses:
	now curse prevention is true.

The sometimes curse clothing rule does nothing when curse prevention is true.
The sometimes curse weapons rule does nothing when curse prevention is true.

Last treasure placement rule (this is the prevent curses for testing rule):
	if curse prevention is true:
		Repeat with item running through things:
			now the hidden identity of item is non-thing.

Section - Movement

Definition: A room (called place) is reachable:
	if the place is the location, yes;
	if the place is nogo, no;
	decide on whether or not the best route from the location to the place is a direction.

Definition: A thing is reachable if the location of it is a reachable room.

To swap the occupants of (first place - a room) and (second place - a room):
	if second place is nothing:
		repeat with guy running through people in first place:
			transcribe "removing [guy] from play";
			extract guy from combat;
			remove guy from play;
	otherwise:
		Let swap place be a random unoccupied room;
		Repeat with guy running through people in first place:
			transcribe "moving [guy] to [swap place]";
			extract guy to the swap place;
		if the second place is not the swap place:
			Repeat with guy running through people in second place:
				transcribe "moving [guy] to [first place]";
				extract guy to first place;
			Repeat with guy running through people in swap place:
				transcribe "finally moving [guy] to [second place]";
				extract guy to second place;

To extract (guy - a person) to (place - a room), making sure it is unoccupied:
	if making sure it is unoccupied and place is occupied:
		Let elsewhere be a random unoccupied reachable room;
		if elsewhere is nothing:
			now elsewhere is a random unoccupied placed not nogo room;
		if elsewhere is [still] nothing:
			now elsewhere is a random unoccupied not nogo room;
		[we want to avoid removing the occupants from play, because if Malygris is one of the occupants, the game ends!]
		transcribe "moving occupants of [place] to [elsewhere]";
		swap the occupants of place and elsewhere;
	if place is not the location of guy:
		if guy is the player:
			now way-to-get-back is the best route from the place to the location;
			if way-to-get-back is a direction:
				now way-to-get-there is the opposite of way-to-get-back;
			otherwise:
				now way-to-get-there is nothing;
		transcribe "moving [guy] to [place]";
		extract guy from combat;
		move guy to place;
		update the combat status;
	otherwise:
		transcribe "[the guy] [are] already in [place]";

Section - Religion

To have (guy - a person) worship (deity - a god) with (N - a number) favour:
	transcribe "having [if guy is the player]the player[otherwise][the guy][end if] worship [deity] with [N] favour";
	now guy worships deity;
	now the favour of guy is 0;
	raise favour of guy to N;
	
To set the Nomos counter to (N - a number):
	Let guy be the player;
	unless the player worships Nomos:
		now guy is a random person who worships Nomos;
	if guy is nothing:
		transcribe "failed to set Nomos counter - no Nomos worshippers";
		stop;
	transcribe "setting Nomos counter for [guy] to [N] (main actor is [main actor], who is [combat state of main actor])";
	now the Nomos attacker is guy;
	now the Nomos bonus is false;
	now the Nomos counter is N.

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

The way-to-get-back is an object that varies. [a direction or nothing]
The way-to-get-there is an object that varies. [a direction or nothing]

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
	try sneaking;
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

Regular scheduling of an outcome labeled "try throwing" (this is the try throwing the reusable item rule):
	now the reusable item is not rusted;
	try throwing the reusable item.
	
Regular scheduling of an outcome labeled "try reading" (this is the try reading the reusable item rule):
	try reading the reusable item.
	
Regular scheduling of an outcome labeled "compel throwing" (this is the compel throwing the reusable item rule):
	now the reusable item is not rusted;
	compel the action of throwing the reusable item.
	
Regular scheduling of an outcome labeled "compel reading" (this is the compel reading the reusable item rule):
	compel the action of reading the reusable item.

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
	Repeat with digit-value running from 0 to 9:
		if character number (digit-value + 1) in "0123456789" is C:
			decide on digit-value;
	decide on -1;

To decide what number is the number we scan in (T - a text):
	Let scanned-value be 0;
	Let digit-encountered be false;
	while the expression scan position is not greater than the number of characters in T:
		Let C be character number expression scan position in T;
		Let the next digit be digit C;
		if the next digit is not -1:
			now scanned-value is (scanned-value * 10) + the next digit;
			now digit-encountered is true;
		otherwise:
			if digit-encountered is true:
				decide on scanned-value;
		increment the expression scan position;
	decide on scanned-value;

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
	Let scanned-value be the number we scan in T;
	if character number expression scan position in T is "%":
		now scanned-value is approximately (scanned-value) percent of N;
		increment the expression scan position;
	decide on scanned-value.

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
	if the compelled actor is sleeping in this world, now the compelled actor is not asleep;
	if the compelled attacker is sleeping in this world, now the compelled attacker is not asleep;
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
	Let damage-value be the calculated value of the damage description;
	unless the actual damage is damage-value:
		now failure report is "damage to [guy] is [actual damage], but damage description adds up to [damage-value]";
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
	Let damage-value be the calculated value of the damage description;
	unless the actual damage is damage-value:
		now failure report is "damage to [guy] is [actual damage], but damage description adds up to [damage-value]";
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

To have (guy - a person) defeat (loser - a person):
	transcribe "having [guy] defeat [loser]";
	Now the health of loser is -1;
	Have an event of guy killing loser;

Automated Testing ends here.

---- DOCUMENTATION ----

Chapter: Basics

Section: Introduction

Kerkerkruip Automated Testing provides a framework for creating detailed playthroughs and testing that they behave as expected. Each test is associated with an "outcome." If an outcome involves starting a new playthrough with dungeon generation, it is considered a "test set." Every outcome that follows that one is considered part of the test set. Certain outcomes in a test set are considered "test steps." Test steps run one at a time until each one and all its dependencies have been tested. We can test every outcome starting with a particular test set, or we can test all outcomes. A summary of tests will be output in the game console, but a detailed transcript will also be written to a file called "testtranscript."

Kerkerkrup Automated Testing is built on the foundation of Simple Unit Tests by Dannii Willis, and makes heavy use of Text Capture by Eric Eve.

Section: Invoking Tests

To run the tests, enter the command

	> QUEUE TEST ALL

to run all test sets, or

	> QUEUE TEST TARGET-SET

to run the target test set. Entering an invalid value of TARGET-SET will produce an error listing all possible test sets.

The queue test commands can also be run from the debug console (press ~ when in the opening menu), but no error messages are shown from the console at the time of this writing (2015-02-27).

To run tests noninteractively, create a file called "noninteractivetests" and then run Kerkerkruip from a command-line interpreter.

Section: Outcomes

Automated Testing defines a kind of value called "outcome." Outcomes describe the structure of a test, and they can form branching dependency trees. They must be defined in the Table of Outcomes:

	Table of Outcomes (continued)
	outcome	likelihood	minimum attempts	maximum attempts	antecedent
	healer-healing-player	0	20	100	--

Section: Dependency, Presets, Test Sets, Test Steps

An outcome can have an "antecedent." If it does, it will not be scheduled or tested until its antecedent has produced the expected result. Any outcome that has an antecedent is considered to be "dependent."

Section: Presets

Some outcomes are designed to be used by multiple tests. These are called "preset" outcomes. The default outcome is a preset, and it is called "boring lack of results." It functions as a null outcome.

Most presets must be scheduled manually, and there are phrases to schedule each of these. Presets generally don't follow a dependency tree, but form a pool of requirements that must be fulfilled before the non-preset outcomes can be tested. Many of them depend on particular events happening in the game, like a character getting a turn.

Presets are not tested in the same way as other outcomes - internal code causes them to be resolved when their goals have been achieved.

Test Sets

If an outcome has the special preset antecedent "restarting for tests," it will trigger a restart of the game every time it is tested. An outcome like this is considered a "test set". Test sets can be run individually from within the game with the "queue test" command, and when "queue test all" is run, each test set will be run.

If a test set is tested more than once, it will restart the game each time, so it can (and should) be used to test dungeon generation.

After a test set and its dependents are resolved, every outcome following it will be tested in the order that it appears in the Table of Outcomes, until another test set is encountered.

Test Steps

If an outcome doesn't have an antecedent, it will wait until all prior dependencies have been fulfilled before it will be scheduled or tested. An outcome like this is considered a "test step," and it is the basic unit of test structures. When a test step is scheduled, the captured text will be cleared and all previous outcomes will be reset. This test step will now be considered to be "the scheduled event." The scheduled event will be tested, and if the rule succeeds, its dependencies will be tested. If anything is left unresolved after all possible dependencies have been tested, the scheduled event will be tested again, and the process repeats either until every dependency is resolved, or something times out.

Ordering

Ordering is important when it comes to outcomes. Outcomes listed first in the Table will be tested first. Because of this, dependencies must always follow their antecedent without any gaps. This is fine:

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
drakul statement	1	1	200	--
drakul identity	1	0	--	drakul statement
simple drakul identity	1	0	--	drakul identity
drakul conditional	1	0	--	drakul statement
double conditional	1	0	--	drakul conditional
nested conditionals	1	0	--	double conditional
lifeblood-hinting	1	0	--	drakul statement
lifeblood-location	1	0	--	lifeblood-hinting
vampire-turning-hinting	1	0	--	drakul statement
Drakul suicide	1	1	--	--

But this would not be:

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
drakul statement	1	1	200	--
drakul identity	1	0	--	drakul statement
simple drakul identity	1	0	--	drakul identity
Drakul suicide	1	1	--	--
drakul conditional	1	0	--	drakul statement

...because Drakul suicide is a test step, and drakul statement would be reset before drakul conditional could be tested.

Section: Resolving Outcomes

When an outcome is tested, its likelihood is compared with its minimum and maximum attempts. If the frequency of success falls within a certain range of tolerance, the outcome will be considered "resolved" and it will not be tested any further. The tolerance is determined by the three numbers specified:

likelihood / minimum attempts represents the expected frequency of success. For example:

	0 likelihood / 1 minimum attempt means it should be tested once, and the rule should not succeed.
	1 likelihood / 1 minimum attempt means it should be tested once, and the rule should succeed.
	20 likelihood / 20 minimum attempts means it should be tested 20 times exactly, and the rule should succeed every time.
	1 likelihood / 3 minimum attempts means the rule should succeed once out of every three attempts, with a certain error tolerance allowed (which is calculated for you)
	1 likelihood / 0 minimum attempts means the rule should succeed at least once.

The maximum attempts are used mainly in the final two cases, where success is not strictly deterministic. If the maximum is reached, the outcome is considered to have "timed out" and the failure will be reported. The maximum attempts also determine how strict the error tolerance will be - the tolerance is calculated such that the test will be accurate 99.5% of the time, regardless of what the maximum attempts are.

Likelihood and minimum attempts should always be specified, but maximum attempts may be left blank. A reasonable default will be chosen (usually 1 or 100, unless it is influenced by dependencies).

Using Dependency to Test Probabilities

The most powerful aspect of dependency is to test events that depend on each other within the game. For example, if there is a one-in-three chance that the player will drop her weapon, and there is a one-in-five chance that the weapon will be destroyed when it is dropped, we can test that like so:

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
risky move	1	1	--
dropped-weapon	1	3	risky move
destroyed-weapon	1	5	dropped-weapon

This way, "risky move" will be scheduled again every time we want to test "dropped-weapon", which will be tested again every time we want to test "destroyed-weapon." But "destroyed-weapon" will not be tested unless "dropped-weapon" actually happened.

Section: Scheduling and Testing Outcomes

Three rulebooks determine how each outcome is tested:

	initial scheduling of (event - an outcome):
	regular scheduling of (event - an outcome):
	testing effects of (event - an outcome):

The initial scheduling rules create the circumstances that the test requires. Any output produced during these rules will be forgotten.

The regular scheduling rules run every time a test is repeated. They should perform the action that the outcome is testing, after resetting any state that the action may have changed in previous iterations.

The testing effects rules determine whether the action had the desired result. The rule should succeed if the test performed as expected.

Here's an example:

	initial scheduling of aite-smashing:
		extract the player to the Temple of Aite.
		now aite-wrath is false;
		now the Statue of Aite is in the Temple of Aite;

	regular scheduling of aite-smashing: try attacking the Statue of Aite.

	testing effects of aite-smashing: if aite-wrath is true, rule succeeds.

Section: Assertions as Conditions

We can always perform very simple tests on outcomes:

	testing effects of fafhrd-parry-fail: if the claymore is not rusted, rule succeeds.

But there are some phrases to help us make more complicated assertions. These are especially helpful when there is more than one possible "wrong" value for what we're testing, because the phrase will include the actual value in the failure report.

	if we assert result "You drop the gilded rapier", rule succeeds.

	if we assert absence of result "You drop the gilded rapier", rule succeeds.

	if we assert that the health of the chain golem is 98, rule succeeds.

	if we assert that the health of the chain golem is between 90 and 99, rule succeeds.

These are the main phrases we will need: the first makes sure that the text (a regular expression) was found in the captured output. The second makes sure that it wasn't found. The third compares two values, and the fourth compares a value with a range (inclusively).

Section: Standalone Assertions

In addition to the assertion-conditions above, we can also make isolated assertions if we don't want to create a whole new outcome to test them:

testing effects of sleeping-dream-waking:
	assert result "Malygris standing over you";
	assert absence of result "arrives from the";
	assert "Malygris should be awake" based on whether or not Malygris is not asleep;
	assert that the concentration of Malygris is 2 with label "concentration of Malygris";
	if the player is just-woken, rule succeeds.

Here we have phrases to test the captured output as before, but we also have two new kinds of phrases: The first tests whether a condition is true, and the second compares values while giving a label which will appear in the failure message if they don't match. There is also a "between" version just like the assertion-condition:

	assert that the concentration of Malygris is between 1 and 3 with label "concentration of Malygris";

These are good to use in outcomes that will only be tested once, but if an outcome is repeated, they can lead to a big dump of repeated failure messages. In that case, dependencies might work better.

Sometimes we will want to test a smaller portion of text. Currently there is one other option: to capture the damage description. The tests remember what set of output we are currently testing, and the "assert result" phrases will refer to that. We can change it implicity using this phrase:

	check damage of (guy - a person) with (N - a number) health after (prefix - a text):

Here's an example:

	check damage of the player with 1000 health after "Miranda deals";

This will search the captured text for the words "Miranda deals" and save the text between that prefix and the word "damage." This text will then be checked to make sure the damage calculation adds up correctly, and we will be switched to damage text capture mode for all future "assert result" phrases.
A few more phrases do similar things:

	to decide whether we assert (prefix - a text) to (guy - a person) a total of (expected damage - a number) damage (suffix - a text):

Example:

	if we assert "The giant tentacle deals" to the player a total of 0 damage "but holds on to you\.", rule succeeds.

If we don't care about the amount, we can use the "any damage" variation:

	if we assert "Chton suddenly sends a wave of unholy energy through the room, dealing <3-6> damage to Fell; and" to Isra any damage "to Isra\.", rule succeeds.

Section: Capturing Text

All output of the tests is captured and saved in the transcript file. In addition, some recently produced output is saved for use by tests.

To switch back and forth between testing the entire output and testing damage text, we use these phrases:

	capture whole events;
	capture damage text;

These phrases don't change what has already been captured, they just select what the "assert result" phrases will test. So if the captured text were:

	Time passes.

	Rolling 4 + 100 (inherent bonus) - 1 (robe of the dead mage) + 1 (overmind) = 104, Miranda beats your defence rating of 50.

	Miranda deals 6 + 10 (inherent bonus) = 16 damage, wounding you to 984 health.

... and we gave this command:

	check damage of the player with 1000 health after "Miranda deals";

..the damage description would now be:

	6 + 10 (inherent bonus) = 16

This assertion would succeed:

	assert result "\+ 10 \(inherent bonus\)";

But this would fail:

	assert result "wounding you";

...until we gave this command:

	capture whole events;

...and then it would succeed.

Section: Updating the Captured Text

If we do want to change what has been captured, we can use these phrases:

	clear event description;
	clear event description because "testing the frobnitz";

The clear event description phrase will do just that - but it leaves the damage description alone. If we want to put something new in the damage description, we must use one of the damage assertions above.

	update event description;
	update event description because "we just hopped the third rail";

The "update event description" phrase will append any text that has been captured since the description was last updated.

Both phrases can take a "because" text, which will be written to the transcript - but only if there was any text in the event description already. If we want to write something to the transcript no matter what, we can use this phrase:

	transcribe "this text will always appear in the transcript";

Finally, we can output a message to both the screen and the transcript:

	log "this text will appear on the screen and also in the transcript";

Normally we will not need to ever invoke the clear/update phrases ourselves. Here are some practices that will make sure we always get the output we want to test:

The "testing effects" rules should produce no game output.
The "scheduling" rules should perform no assertions.
The "initial scheduling" rules should not produce any output that we'd want to test (to put it another way, if there is output we don't want to test, we should put it here).

Output is cleared when the scheduled event is scheduled. It is not cleared for dependents. Here's an example:

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
talking to God	1	1	--
listening for God's answer	1	1000	--
A detail about the answer	1	1	listening for God's answer

In this example, the output of "talking to God" will be cleared before we schedule "listening for God's answer". But the output of that will NOT be cleared before we test "A detail about the answer," because that outcome depends on "listening for God's answer."

There is one exception, and that is when we test individual combat rounds with the "wait for (guy - a person) to act freely" phrase. In this case, output is cleared before every combat round.

Section: Moving People Around

Moving people in Kerkerkruip has many side effects. To help us deal with this, here are some phrases:

	To extract (guy - a person) to (place - a room), making sure it is unoccupied:

This moves the guy to the selected room. If we use the "making sure it is unoccupied" option, it removes any other rogues who might be there. The occupants will be kept in the dungeon if possible, but if there are no empty rooms they could travel to, they will be removed from play.

	To swap the occupants of (first place - a room) and (second place - a room):

"Swap the occupants" does pretty much what it sounds like. The second place is allowed to be nothing, in which case the occupants of the first place will be removed from play and not replaced with anyone.

	Try sneaking

The sneaking action makes the player instantly hidden, with a +100 hiding bonus so they can't be discovered. To unhide the player:

	try taking off the fuligin cloak
	
The sneaking action is implicit in this phrase:

	To travel sneakily to (place - a room):

This also moves the player to the specified room, but it uses the "going" action and makes sure that rooms and monsters on the way will be visited and seen, although since the player is hidden they will not be seen or attacked by anyone they encounter.

	way-to-get-there
	
	way-to-get-back
	
These variables are set when extracting the player or when traveling sneakily, to give the test a convenient direction for the player to travel they need to retreat (way-to-get-back), or come back to the room again afterwards (way-to-get-there). When such a way exists, these values are opposite directions of each other. When no such way exists, these values are set to nothing, so tests should take care when using them.

	Definition: a direction (called way) is diggable:

This is convenient when testing digging tools.

Section: Compelling Actions

Tests don't have to run through the full turn sequence, but sometimes we want them to. We can do this by compelling an action - this will cause the player or a rogue to try whatever action we specify, but only when it is their turn in the combat round. The every turn rules will run and all combatants will get their own round. Normally, each rogue's action is suppressed with the message "[suppressed action for X]", but we can control that as well. Rogues are always allowed to react, however.

Phrases to control player and rogue action should normally be invoked from "regular scheduling" rules:

	To compel (the desired action - a stored action):

Example:
	regular scheduling of throwing-blessed: compel the action of throwing the Blessed Grenade.

For convenience, there is a variable called "the reusable item," which will be returned the player before regular scheduling of a test step. This enables us to repeat actions that consume an object:

	initial scheduling of throwing-blessed: now the reusable item is a random morphean grenade.
	regular scheduling of throwing-blessed: compel the action of throwing the reusable item.

We can also compel reactions:

	initial scheduling of reaction-ape-killing:
		now the health of the blood ape is 1;
		now the reusable item is a random scroll of death.

	regular scheduling of reaction-ape-killing: compel the action of reading the reusable item as a reaction to the blood ape.

This will cause the blood ape to attack the player, and the player to read the scroll of death as a reaction.

If we want to allow NPCs to act freely, we can use this phrase:

	To wait for (guy - a person) to act freely:

Example:

	regular scheduling of ape-cowering: wait for the blood ape to act freely.

	testing effects of ape-cowering: if we assert result "The blood ape cowers before your dreadful presence", rule succeeds.
	
Using this phrase creates a link between the outcome that invoked it and the person being waited for. It will cause the outcome to be tested immediately after that person gets a combat round, and the captured text will contain only the text that was output during that round. If we want to test combat round output for more than one person in a single turn, we must make a separate outcome for each person, and create another outcome to be the antecedent of everything tested in that turn. The antecedent must not have any turn-generating effects like compelling an action or waiting for anyone to act freely. Don't forget to make sure that the person is not asleep before using this phrase!

One more useful property is the "hitting count." This is a number that is reset to 0 for every person when a test set is scheduled. It is incremented for a person whenever they try the hitting action. For example, to test whether the blood ape hit a retreating player:

	regular scheduling of ape-retreat: compel the action of retreating.

	testing effects of ape-retreat: if we assert that the hitting count of the blood ape is 1, rule succeeds.

Section: Quick Controlled Attacks

Sometimes we want an attack to happen, but we don't want to go through the whole turn sequence. This phrase can help:

	To do (reaction - a stored action) for/-- a (strength - a number) melee hit by (aggressor - a person):

This phrase sets several useful properties: it sets the defender's defence to 50 and the attacker's melee to the strength specified. This gives us a good degree of certainty about whether the attack will hit. (Avoiding certain influences like the Hall of Mirrors and Miranda's amulet will also help.) It also sets the defender's health to 1000, so we can be confident that the defender will survive, and we can measure the damage done. Also, if we use the "capture damage text" option before invoking the phrase, we will automatically check that the damage report is consistent with the defender's health after the attack:

	regular scheduling of concentrated-hit:
		capture damage text;
		now the concentration of the blood ape is 2;
		do the action of waiting for a 100 melee hit by the blood ape.

	testing effects of concentrated-hit: if we assert result "\+ 2 \(concentration\)", rule succeeds.

Section: Handling Questions

Kerkerkruip occasionally asks the player questions. If we want the player to answer a menu question instead of taking an action, we can use the "select menu question answer (N - a number)" phrase:

	regular scheduling of entree-selection:
		Let m be 0;
		repeat with entree running through banquet-items:
			increment m;
			if the entree is the overmind:
				break;
		select menu question answer m;

Section: Manipulating Religion

Here are some phrases that help us test religious situations:

	To have the player sacrifice (stuff - a power):

This handles the menu operations involved in choosing a power to sacrifice.

	To block interventions:

This sets a variable such that gods will not intervene.

	To allow interventions:

This ensures that gods will intervene as they normally do.

Section: Miscellaneous Phrases

	To set the tension to (N - a number):

Sets the tension, and writes a message to the transcript to record it.

	To decide what number is the number we scan in (T - a text):

This can be used to parse text into numbers, and it is used when checking damage. It requires setting a variable called the "expression scan position" - if we want to parse the first number in the text, we set it to 0.

	To prepare a test battle with (guy - a person), inviting groups:

This transports the player and the guy to a room called Test Arena, where there are no exits and no funny room or scenery effects. The "inviting groups" option brings the guy's allied group as well. To add additional combatants, this is the safest phrase:

	revive another-guy in the location;

If we want to get a rogue's power, or see some effects of killing it:

	To have (guy - a person) defeat (loser - a person):

We don't even need to be in the same room for that to work.

Section: Dungeon Scenarios

Just as we can require objects from the Kerkerkruip Console, we can force things to be included or excluded from a test when the dungeon is generated. For this we use the "scenario" rules:

	Scenario for insane-drakul:
		Now drakul's lifeblood is bannedobject;
		Now drakul is testobject;

This will ensure that Drakul is placed in the dungeon, and when he is killed, his lifeblood will appear. "testobject" and "bannedobject" work for rooms as well as most treasures and rogues. Dreams can be given the property "current-test-dream". At this time, starting kits can't be controlled this way, but equipment and abilities can be rearranged after dungeon generation if necessary.

Some scenarios are common to many tests. In several cases, we want to prevent monsters from wandering into the room where we are testing things. Since the Reaper, the armadillo, and the imp tend to do this, we can ban all wanderers at once with the phrase:

	ban wandering monsters;
	
Many objects in the dungeon affect faculties. If a test requires that a faculty have a particular value, this can be used to avoid them:
	
	ban faculty modifiers;

Section: Testing Dungeon Creation

Outcome states and dependencies are maintained even after a restart. This makes a convenient way to test dungeon generation. To test the state of the game after dungeon generation, just make sure that the test set can be tested multiple times:

	Table of Outcomes (continued)
	outcome	likelihood	minimum attempts	maximum attempts	antecedent
	got-addicts-amulet	2	64	256	restarting for tests
	cursed-addicts-amulet	2	2	--	got-addicts-amulet

	Testing effects of got-addicts-amulet: if the player wears the addict's amulet, rule succeeds.
	Testing effects of cursed-addicts-amulet: if the addict's amulet is cursed, rule succeeds.

Section: Randomness

Automated Testing has a global variable that is used to set the random number generator, both for dungeon generation and for play. This is called the "initial test random seed." We can change this number if we want to run all the tests under a different configuration, and we should change it periodically, whenever all tests are passing.
