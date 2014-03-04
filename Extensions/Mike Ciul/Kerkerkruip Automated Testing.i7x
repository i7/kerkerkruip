Kerkerkruip Automated Testing by Mike Ciul begins here.

Volume - Test Framework

Chapter - Persistent data

The file of test transcript is called "testtranscript".

The event description is an indexed text that varies.

To log (T - an indexed text):
	let currently capturing be whether or not text capturing is active;
	if currently capturing is true, transcribe and stop capturing text;
	say "[line break][T]";
	append "**** [T][line break]" to file of test transcript;
	if currently capturing is true, start capturing text;
	
To transcribe (T - an indexed text):
	let message be indexed text;
	now message is "[bracket][T][close bracket][command clarification break]";
	if text capturing is active:
		say message;
	otherwise:
		append "[message]" to file of test transcript;
	
To transcribe and stop capturing text/--:
	stop capturing text;
	if "[the captured text]" matches the regular expression ".":
		transcribe "[current test set], [scheduled event] turn [the turn count], assertion count=[test assertion count]";
		append "[the captured text]" to file of test transcript;
	 
To transcribe and restart capturing text/--:
	if text capturing is active, transcribe and stop capturing text;
	start capturing text;
	
To stop and save event description:
	transcribe and stop capturing text;
	now the event description is "[the captured text]";
	
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
	transcribe and stop capturing;
	say ": ";
	start capturing text;

To record a/-- failure report of/-- (msg - an indexed text):
	Let testnum be current test set as a number;
	choose row with test set of testnum in Table of Test Results;	
	increment the assertion failures count;
	increment the failures entry;
	now the failure messages entry is "[failure messages entry]Failure for test: [the current test set], step: [the scheduled event], assertion [the test assertion count]: [msg][paragraph break]";
	log msg;

To display test results:
	log "Test results:[line break]";
	let grand test total be 0;
	let grand test failures be 0;
	Repeat through Table of Test Results:
		now grand test total is grand test total plus total entry;
		now grand test failures is grand test failures plus failures entry;
		log "[test set entry as a test set]: [total entry] tests, [failures entry] failures[line break]";
	log "Total: [grand test total] tests, [grand test failures] failures.";
	Repeat through Table of Test Results:
		if failures entry is at least 1:
			log "[line break]Failures for [test set entry as a test set]:[paragraph break]";
			log "[failure messages entry]";	
	say "To view a full transcript of all tests, see the file 'testtranscript.glkdata' in the project directory.";
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
	transcribe and restart capturing;
	if the event described is not the scheduled event:
		now the scheduled event is the event described;
		if the event described is normal keyboard input:
			transcribe and stop capturing;
			say line break;
			start capturing text;
		otherwise:
			log "  next step:  [the event described]";
		follow the initial scheduling rules for the event described;
		now the repeated moves is 0;
	otherwise:
		transcribe and stop capturing;
		start capturing text;
		increment the repeated moves;
	now the event described is not generated;
	transcribe and restart capturing;
	
Before taking a player action when the scheduled event is generated:
	stop and save event description;
	Let repeat be whether or not (the scheduled event is repeatable) and (the repeated moves > 0);
	now the scheduled event is not generated;
	say " .[run paragraph on]";
 	start capturing text;
	follow the testing effects rules for the scheduled event;
	transcribe and stop capturing;
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
		
The test step player action rule is listed before the parse command rule in the for taking a player action rulebook.
		
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
		transcribe and restart capturing;
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
	
A Standard AI rule for a person (called P) (this is the compel an action rule):
	if P is at-Act and the actor part of the compelled action is P:
		try the compelled action;
		now the compelled action is the action of waiting;
		rule succeeds.
	
The compel an action rule is listed before the insane people attack themselves rule in the standard AI rulebook.
	
[A last AI action selection rule for an at-Act person (called P) when the compelled action is not the action of waiting:
	unless P is the actor part of the compelled action, make no decision;
	blank out the whole of the Table of AI Action Options;
	choose a blank row in the Table of AI Action Options;
	now the Option entry is the compelled action;
	now the Action Weight entry is 1000;
	now the compelled action is the action of waiting.]

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

First when play begins (this is the run all tests rule):
	write "Test transcript for Kerkerkruip.[line break]" to file of test transcript;
	initialize test steps;
	start the next test;
	transcribe and restart capturing text;
	if done testing is false:
		Now the current unit test name is "[the current test set]";
		log "Now testing [the current test set].";
		consider the scenario rules;
	otherwise:
		transcribe and stop capturing.

The random seed rule is listed before the run all tests rule in the when play begins rules.
	
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
		consider the test play rules;
		schedule the first move of the current test set;
	
The scenario rules are a rulebook.

The test play rules are a rulebook.

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
		print (INDEXED_TEXT_TY_Say) (+ the current unit test name +);
		print ", assertion: ", (+ the test assertion count +), ". (Asserted condition is false)^";
	}
	StartCapture();
];
-).

Chapter - Resetting the Game After Each Test Set (in place of Chapter - The Unit test rules unindexed in Simple Unit Tests by Dannii Willis)

The current unit test name is an indexed text variable.

To start the/-- next test:
	transcribe and stop capturing;
	Repeat with T running through enabled test sets:
		now the current test set is T;
		if the result of saving undo state is successful save, stop;
		read file of test results into Table of Test Results;
	now done testing is true;
	display test results;

For reading a command when done testing is false:
	transcribe and stop capturing text;
	write file of test results from Table of Test Results;
	restore undo state.
	
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
	stop and save event description;
	assert that the event description includes pattern;
	transcribe and restart capturing;
	
To pause and assert that the event description does not include (pattern - an indexed text):
	stop and save event description;
	assert that the event description does not include pattern;
	transcribe and restart capturing.

Section - hiding-check, hidden-traveling and hiding-reveal

Traveling sneakily is a truth state that varies.

A detection rule when traveling sneakily is true:
	say "+ 100 (traveling sneakily for testing purposes)[run paragraph on]";
	increase hiding roll by 100;

The way-to-get-back is a direction that varies.
The way-to-get-there is a direction that varies.

To force the cloak of shadows to work:
	transcribe "hiding immediately";
	if the player does not enclose the cloak of shadows, now the player carries the cloak of shadows;
	if the cloak of shadows is not worn, try wearing the cloak of shadows;
	now the player is hidden;
		
Carry out taking off the cloak of shadows:
	now traveling sneakily is false;
	
To travel sneakily to (place - a room):
	transcribe "traveling sneakily to [place]";
	force the cloak of shadows to work;
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
	if traveling sneakily is true, force the cloak of shadows to work;
	
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
	generate the action of taking off the shadows cloak. ["the action of taking of the cloak of shadows" doesn't parse  ]

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
