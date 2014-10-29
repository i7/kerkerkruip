Kerkerkruip Test Sets by Mike Ciul begins here.

Use authorial modesty.

Volume - All Test Sets (not for release)

Include Kerkerkruip Automated Testing by Mike Ciul.

Section - Aite Champions vs Bat

Aite champions vs bat is a test set.

A scenario rule when testing Aite champions vs bat:
	now Bodmall is testobject;
	now mindslug is testobject;
	now Hall of Gods is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Chton is testobject;
		
[TODO: create randomized test plays
attempt rulebook does something that might make the test qualify
application rulebook check if the test applies and marks it as completed - or chooses which test to run based on attempt outcome
assertion rulebook runs the test's assertions]
	
A test play when testing Aite champions vs bat:
	say "updating monster statistics.";
	[TODO: Why doesn't this interrupt text capture when doing it from the killing rules does?]
	update the monster statistics;
	assert "should be capturing text" based on whether or not text capturing is active;
	say "This should be captured.";
	now the player carries Drakul's lifeblood;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Chton;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Chton is 4;
	extract the player to the location of the mindslug;
	have the player defeat the mindslug;
	now the mind score of the player is 200;
	extract the player to Hall of Gods;
	have the player and the healer of aite fight in Arena of the Gods;
	try drinking Drakul's lifeblood;
	try turning bat;
	Repeat with guy running through people in Arena of the Gods:
		now the defence of guy is 100;

Player-targeted is a truth state that varies.
Player-damaged is a truth state that varies.

Aite spike vs bat is a test step. The first move of Aite champions vs bat is aite spike vs bat.

After taking a player action when the scheduled event is aite spike vs bat:
	repeat with guy running through people in the location:
		now health of guy is 100;
	now player-damaged is false;
	now player-targeted is false;
	
Intervention possible when the scheduled event is aite spike vs bat:
	unless the main actor is the player and intervention-god is Aite, rule fails;
	
Intervention bonus when the scheduled event is aite spike vs bat:
	if the main actor is the player, increase the intervention-bonus by 100;
	
testing effects of aite spike vs bat:
	now player-damaged is whether or not the health of the player is less than 100;
	if the event description matches the regular expression "bursts out of the ground<^[line break]>+ you":
		now player-targeted is true;
		assert that the event description includes "bursts out of the ground in front of you";
	
bat crashing into spike is a randomized outcome. It results from Aite spike vs bat.
bat avoiding huge spike is a randomized outcome. It results from Aite spike vs bat.
bat avoiding gigantic spike is a randomized outcome. It results from Aite spike vs bat.

randomized outcome testing when bat crashing into spike became the possibility:
	if player-damaged is false, make no decision;
	mark the outcome achieved;
	assert that the event description includes "crash into";
	
randomized outcome testing when bat avoiding huge spike became the possibility:
	if player-targeted is false, make no decision;
	if player-damaged is true, make no decision;
	unless the event description matches the regular expression "huge <a-z>+ bursts out of the ground in front of you", make no decision;
	mark the outcome achieved;
	assert that the event description includes "You fly over";

randomized outcome testing when bat avoiding gigantic spike became the possibility:
	if player-targeted is false, make no decision;
 	if player-damaged is true, make no decision;
	unless the event description matches the regular expression "gigantic <a-z>+ bursts out of the ground in front of you", make no decision;
	mark the outcome achieved;
	assert that the event description includes "You fly around";

Arena-tormentor-enslaving is a test step.

Choosing a player action when testing Arena-tormentor-enslaving:
	generate the action of enslaving the tormentor of Aite.
	
testing effects of Arena-tormentor-enslaving:
	assert that the event description includes "will do your bidding";
	assert that the event description includes "ball of lightning .* damage to the tormentor of Aite";
	if the tormentor of Aite is alive:
		assert that the event description includes "The tormentor of Aite prostrates herself. 'I beg for your mercy, O great Aite,' she prays. Then she rises to fight you again!";
		assert that the tormentor of Aite opposes the player;
	otherwise:
		assert that the event description includes ", killing her";

Section - Enslaving the Defender

Defender-enslaving is a test set.

A scenario rule when testing Defender-enslaving:
	now Bodmall is testobject;
	now mindslug is testobject;
	now Hall of Gods is testobject;
	now Temple of Sul is testobject;
	
A test play when testing Defender-enslaving:
	try butterflying;
	try meatboying;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Sul;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Sul is 4;
	extract the player to the location of the mindslug;
	have the player defeat the mindslug;
	now the mind score of the player is 1000;
	extract the player to Hall of Gods;
	have the player and the healer of aite fight in Arena of the Gods;
	try smiting the tormentor of Aite;
	try smiting the healer of Aite;
	now the health of Defender of Aite is 100;
	
Arena-defender-enslaving is a test step. The first move of Defender-enslaving is Arena-defender-enslaving. 

Choosing a player action when testing Arena-defender-enslaving:
	generate the action of enslaving the defender of Aite.

testing effects of Arena-defender-enslaving:
	assert that the event description includes "will do your bidding";
	assert that the event description includes "ball of lightning .* damage to the defender of Aite";
	assert that the event description includes "The defender of Aite prostrates himself. 'I beg for your mercy, O great Aite,' he prays. Then he rises to fight you again!";
	assert that the defender of Aite opposes the player;

Arena-defender-re-enslaving is a test step. The next move of Arena-defender-enslaving is Arena-defender-re-enslaving.   

Choosing a player action when testing Arena-defender-re-enslaving:
	generate the action of enslaving the defender of Aite;

Before taking a player action when Arena-defender-re-enslaving is the scheduled event:
	now the health of Defender of Aite is 1;
	now the health of the player is 1;
	now the permanent health of the player is 100;
	now enslave-cooldown is 0;
	
[prevent Aite spikes]
Intervention possible when Arena-defender-re-enslaving is the scheduled event:
	rule fails.
	
testing effects of Arena-defender-re-enslaving:
	assert that the event description includes "will do your bidding";
	assert that the event description includes "ball of lightning .* damage to the defender of Aite, killing him";
	assert that the location is Hall of Gods;
	assert that the event description includes "receives the soul";
	assert that the health of the player is 100;
	assert truth of whether or not defender of Aite is off-stage with message "the defender of Aite should be off-stage"

Section - Chton Champion vs Bat

Chton champion vs bat is a test set.

A scenario rule when testing Chton champion vs bat:
	now Hall of Gods is testobject;
	now Bodmall is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Herm is testobject;
	now a random scroll of summoning is testobject;

A test play when testing Chton champion vs bat:
	try butterflying;
	try meatboying;
	now the player carries Drakul's lifeblood;
	let the item be a random not off-stage scroll of summoning;
	now the player carries the item;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Herm;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Herm is 4;
	extract the player to Hall of Gods;
	transcribe and restart capturing;
	have the player and Drakul fight in Arena of the Gods;
	pause and assert that the event description includes "grants you 2 divine favour![line break][line break]Herm gifts you two scrolls, a magical spade and a Morphean grenade; and increases your hiding bonus to \+2\.[line break][line break]You are transported to the Arena of the Gods, where the angry Drakul awaits, preparing himself to"
	
arena-vampire-joining is a test step. The first move of Chton champion vs bat is arena-vampire-joining.   

Choosing a player action when testing arena-vampire-joining:
	generate the action of drinking Drakul's lifeblood;

The summoned creature is an object that varies;

testing effects for arena-vampire-joining:
	assert that the event description includes "You turn into a vampire, but your opponent doesn't care";
	update the combat status;
	assert that the combat status is combat;
	try reading a random scroll of summoning enclosed by the player;
	now the summoned creature is a random visible undead not super-undead person who is not the player;
	assert truth of whether or not the summoned creature does not oppose the player with message "summoned creature shouldn't oppose undead player";
	assert truth of whether or not the summoned creature opposes drakul with message "summoned creature should oppose drakul (unless Remko says this test is wrong)";

chton-arena-cheating is a test step. The next move of arena-vampire-joining is chton-arena-cheating.   

Choosing a player action when testing chton-arena-cheating:
	generate the action of smiting drakul.

Before taking a player action when the scheduled event is chton-arena-cheating:
	Now the health of the player is 1;
	Now the permanent health of the player is 100;
	
testing effects for chton-arena-cheating:
	[should the lifeblood appear a second time just because drinking it removes it from play?]
	assert that the event description includes ["infamous vampire, who crumbles away into ashes"] "infamous vampire, a small vial";
	assert that the event description includes "receives the blood";
	assert that the health of the player is 33;
	assert that the event description includes "transported back to the Hall of the Gods";
	assert that the location of the summoned creature is Hall of Gods;
	assert that drakul's lifeblood is in Hall of Gods;
	
		
Section - Parting Shots

parting shots is an test set.

A scenario rule when testing parting shots:
	now israfel is testobject;
	now mindslug is testobject;
	now armadillo is testobject;
	now fuligin cloak is testobject;

A person has a number called the hitting count.

First before an actor hitting:
	increment the hitting count of the actor.
	
To assert (N - a number) hit/hits by (guy - a person):
	Let msg be indexed text;
	Now msg is "Expected hitting count for [The guy]: [N] Got: [hitting count of the guy].";
	assert truth of whether or not N is hitting count of the guy with message msg;
	
A test play when testing parting shots:
	force the fuligin cloak to work;
	try butterflying;
	Travel sneakily to the location of the mindslug;
	now every person enclosed by the location is not asleep;
	
mindslug-hiding-check is a hiding-check test step. The first move of parting shots is mindslug-hiding-check.

mindslug-hidden-retreat is a hiding-check test step.   

Choosing a player action when testing mindslug-hidden-retreat:
	generate the action of retreating.
	
Before taking a player action when mindslug-hidden-retreat is the scheduled event:
	assert that the mindslug is in the location;
	assert that fafhrd is in the location;
	assert that mouser is in the location;
	update the combat status;
	assert that the combat status is combat;
	
testing effects for mindslug-hidden-retreat:
	assert zero hits by mindslug;
	assert zero hits by fafhrd;
	assert zero hits by mouser;
	
mindslug-hidden-runner is a hiding-check test step.

initial scheduling of mindslug-hidden-runner:
	extract the player to the location of the mindslug;
	
Choosing a player action when testing mindslug-hidden-runner:
	generate the action of going way-to-get-back.
	
testing effects for mindslug-hidden-runner:
	assert zero hits by mindslug;
	assert zero hits by fafhrd;
	assert zero hits by mouser;
	
mindslug-reveal is a hiding-reveal test step. The next move of mindslug-hidden-runner is mindslug-reveal.

Initial scheduling for mindslug-reveal:
	try going way-to-get-there;

mindslug-retreat is a test step.  The next move of mindslug-reveal is mindslug-retreat.   

Choosing a player action when testing mindslug-retreat:
	generate the action of retreating.

Before taking a player action [or reaction] when mindslug-retreat is the scheduled event:
	now mindslug presses the player;
	now concentration of mindslug is 0;
	now fafhrd does not press the player;
	now concentration of fafhrd is 1;
	now mouser does not press the player;
	now concentration of mouser is 0;

Before taking a player action:
	Repeat with guy running through people:
		Now the hitting count of guy is 0.
		
testing effects for mindslug-retreat:
	assert that the event description includes "bravely run away";
	assert one hit by mindslug;
	assert one hit by fafhrd;
	assert zero hits by mouser;
	
mindslug-runner is a test step.

Initial scheduling of mindslug-runner:
	extract the player to the location of the mindslug;
	now retreat location is the location of the mindslug;

Choosing a player action when testing mindslug-runner:
	generate the action of going the way-to-get-back;
	
testing effects for mindslug-runner:
	assert that the event description includes "run past your enemies";
	assert one hit by mindslug;
	assert one hit by fafhrd;
	assert one hit by mouser;
	
israfel-meeting-ps is a hidden-traveling extracting hiding-reveal test step. The location-target of israfel-meeting-ps is Israfel.

Initial scheduling of israfel-meeting-ps:
	now the health of israfel is 1000;
	compel the action of israfel israfel-splitting;
	
fell-freezing is a test step.

Initial scheduling of fell-freezing:
	Now Fell presses the player;
	now the initiative of Fell is 100;
	compel the action of fell israfel-reuniting;
	
Last carry out an actor israfel-reuniting when testing parting shots:
	now the initiative of the actor is -2;
	
frozen-fell-fleeing is a test step.   

Choosing a player action when testing frozen-fell-fleeing:
	generate the action of retreating.

testing effects of frozen-fell-fleeing:
	assert that israfel-reuniting-initiator is Fell with label "the reuniting initiator";
	assert that the hitting count of Fell is 0 with label "hitting count of Fell";
	
israfel-rejoining is a test step. The location-target of israfel-rejoining is fell.

before taking a player action when testing israfel-rejoining:
	if fell is off-stage:
		now the location-target of israfel-rejoining is israfel.

initial scheduling of israfel-rejoining:
	compel the action of israfel waiting;
	
testing effects of israfel-rejoining:
	assert that israfel is in the location;
	
israfel-resplitting is repeatable test step.

Initial scheduling of israfel-resplitting:
	compel the action of israfel israfel-splitting;
	
Testing effects of israfel-resplitting:
	if israfel is off-stage:
		record success of israfel-resplitting.
		
unfrozen-fell-fleeing is a test step.   

Initial scheduling of unfrozen-fell-fleeing:
	compel the action of fell waiting;
	
Choosing a player action when testing unfrozen-fell-fleeing:
	generate the action of retreating.

initial scheduling of unfrozen-fell-fleeing:
	now fell presses the player;

testing effects of unfrozen-fell-fleeing:
	assert that the hitting count of fell is 1 with label "hitting count of fell";

Section - Retreating from the Tentacle

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

tentacle-grab is a test set.

Scenario when testing tentacle-grab:
	Now the giant tentacle is testobject;
	now the fuligin cloak is testobject;
	now the hall of mirrors is bannedobject;
	Now the pickaxe is testobject;
	Now every not connectable room is bannedobject; [the bridge of doom stops digging]
	
A test play when testing tentacle-grab:
	now the player carries the pickaxe;
	try butterflying;
	Travel sneakily to the location of the tentacle;
	now every person enclosed by the location is not asleep;
	
tentacle-hiding-check is a hiding-check test step. The first move of tentacle-grab is tentacle-hiding-check.

Tentacle-reveal is a hiding-reveal test step. The next move of tentacle-hiding-check is tentacle-reveal.

tentacle-retreat is a test step.  The next move of tentacle-reveal is tentacle-retreat.   

Choosing a player action when testing tentacle-retreat:
	generate the action of retreating.

Before taking a player action when testing tentacle-grab:
	if the player is at-react:
		now the defence of the player is 100;
	otherwise:
		now the defence of the player is 0;
		
Initial scheduling for tentacle-retreat:
	now tentacle presses the player;
	now concentration of tentacle is 3;
	now the melee of the tentacle is 50;
	now the health of the player is 100;
		
testing effects for tentacle-retreat:
	assert that the event description includes "bravely run away";
	assert one hit by tentacle;
	assert that the player is grappled by the tentacle;
	assert that the location of the player is the location of the tentacle;

tentacle-dig-retreat is a test step. The next move of tentacle-retreat is tentacle-dig-retreat.

initial scheduling for tentacle-dig-retreat:
	now the tentacle does not grapple the player;
	
choosing a player action when testing tentacle-dig-retreat:
	generate the action of digging a random diggable direction.
	
testing effects for tentacle-dig-retreat:
	assert that the event description includes "magically create a tunnel";
	assert one hit by tentacle;
	assert that the player is grappled by the tentacle;
	assert that the location of the player is the location of the tentacle;
	

Section - Insane Drakul

insane-drakul is an test set.

A scenario rule when testing insane-drakul:
	Now drakul's lifeblood is bannedobject;
	Now drakul is testobject;
	Now staff of insanity is testobject;
	
A test play when testing insane-drakul:
	try butterflying;
	try ramboing;
	now the mind score of the player is 100;  
	extract the player to the location of drakul;
	now the player carries staff of insanity;
	while the size of the staff of insanity is less than medium:
		increase the size of the staff of insanity;
	try readying staff of insanity;
	transcribe and restart capturing;
	try Drakul concentrating;
	pause and assert that the event description includes "Drakul smiles a little wider";
	try Drakul concentrating;
	pause and assert that the event description includes "'There is no need to fear me,' Drakul says as he concentrates more deeply\.";
	try Drakul concentrating;
	pause and assert that the event description includes "Drakul attains the highest state of concentration. 'It feels so good to be alive!'";
	
Driving Drakul insane is a test step. The first move of insane-drakul is driving Drakul insane.   

Choosing a player action when testing driving drakul insane:
	generate the action of attacking drakul;

After taking a player action when the scheduled event is driving drakul insane:
	now the health of Drakul is 100;
	
drakul going insane is a randomized outcome. It results from driving drakul insane.

randomized outcome testing when drakul going insane became the possibility:
	if drakul is not insane, make no decision;
	mark the outcome achieved;
	assert that the event description includes "Drakul goes insane";
	
insane drakul statements is a test step.

Initial scheduling of insane drakul statements:
	if there is a held achievement of Blood never lies in the Table of Held Achievements:
		do nothing;
		[this causes a glk error:
		choose row with held achievement of Blood never lies in the Table of Held Achievements;
		blank out the whole row;]
	now the concentration of drakul is 0;
	transcribe and restart capturing;
	try Drakul concentrating;
	pause and assert that the event description includes "Drakul smiles a little wider";
	try Drakul concentrating;
	pause and assert that the event description includes "'An insane vampire always tells the truth\. And I tell you: You should fear me!' Drakul says as he concentrates more deeply.";
	try Drakul concentrating;
	pause and assert that the event description includes "Drakul attains the highest state of concentration\. 'It feels so good to be alive - but I am undead!'";

After taking a player action when the scheduled event is insane drakul statements:
	compel the action of drakul waiting;
	
[some of these appear too unlikey to happen within 100 iterations. Increase iterations?]
simple drakul identity is a randomized outcome. simple drakul identity results from insane drakul statements.
nested conditionals is a randomized outcome. nested conditionals results from insane drakul statements. 
nested belief is a randomized outcome. nested belief results from insane drakul statements.
lifeblood-hinting is a randomized outcome. lifeblood-hinting results from insane drakul statements.
vampire-turning-hinting is a randomized outcome. vampire-turning-hinting results from insane drakul statements.

randomized outcome testing when simple drakul identity became the possibility:
	if the event description matches the regular expression "Drakul says, 'I am ":
		if the event description matches the regular expression "not|someone who|, and|, or", make no decision;
		mark the outcome achieved;
		assert that the event description includes "vampire|insane";
		
randomized outcome testing when nested conditionals became the possibility:
	unless the event description matches the regular expression "Drakul says, 'If .*,", make no decision;
	if the event description matches the regular expression "I would give you", make no decision;
	if the event description matches the regular expression ", if|, and|, or", mark the outcome achieved;
		
randomized outcome testing when nested belief became the possibility:
	unless the event description matches the regular expression "I believe that I believe", make no decision;
	mark the outcome achieved;
		
randomized outcome testing when lifeblood-hinting became the possibility:
	unless the event description matches the regular expression "a vial of my lifeblood\b", make no decision;
	mark the outcome achieved;
	assert that the event description includes "I am carrying| is in | can be found | is currently unreachable, ";
	
randomized outcome testing when vampire-turning-hinting became the possibility:
	unless the event description matches the regular expression "\bI intend to vanquish Malygris after I make you my vampire-slave\b|\byou will never be my vampire-slave\b", make no decision;
	[this doesn't compile:
	assert "Blood never lies achievement should be held" based on whether not there is a held achievement of Blood never lies in the Table of Held Achievements;]
	mark the outcome achieved;

Drakul suicide is a test step.

Initial scheduling of drakul suicide:
	now the health of drakul is 1;
	now the melee of drakul is 100;
	transcribe and restart capturing;
	try drakul hitting drakul;
	pause and assert that the event description includes "drains his own blood, a small vial";
	
Section - Enemies should always start out awake in Arena of the Fallen

Sleeping Fallen is a test set.

Scenario when testing Sleeping Fallen:
	now the blood ape is testobject;
	now Entrance to the Arena is testobject;
	now a random scroll of death is testobject;
	
To assert that (guy - a person) is asleep:
	assert "[The guy] should be asleep" based on whether or not the guy is asleep;
	
To assert that (guy - a person) is awake:
	assert "[The guy] should be awake" based on whether or not the guy is not asleep;
	
Test play when testing Sleeping Fallen:
	now the blood ape is asleep;
	extract the player to the location of the blood ape;
	Let the snuffer be a random not off-stage scroll of death;
	now the player carries the snuffer;
	now the health of the blood ape is 1;
	try reading the snuffer;
	assert that the blood ape is asleep;;
	assert truth of whether or not the blood ape is dead with message "the blood ape should be dead";
	have the player and the blood ape fight in Arena of the Fallen;
	assert that the blood ape is awake;
	
Section - Dreadful Presence

[E91A270C9962]

Dreadful-Presence-Test is a test set.

Scenario when testing Dreadful-Presence-Test:
	now the blood ape is testobject;
	now the zombie toad is testobject;
	
A person has a number called the cower count;

Test play when testing Dreadful-Presence-Test:
	repeat with guy running through denizen people:
		now the defence of guy is 100;
	now the mind score of the player is 10;
	now the player worships Nomos;
	raise the favour of the player to 9;
	try wearing the gown of the red court;
	try readying the malleus;
	now the blood ape is not asleep;
	now the zombie toad is not asleep;
  	extract the player to the location of the blood ape;
	extract the zombie toad to the location;
	assert that the dreadful presence of the player is 2;
	[Can't depend on the blood ape's mind being constant - there could be room effects, for example
	assert that the final mind of the blood ape is 5;]
	assert truth of whether or not the target cower percentage of the blood ape is at least 1 with message "the blood ape should have a nonzero target cower percentage";
  	assert that the target cower percentage of the player is 0;
	assert that the target cower percentage of the zombie toad is 0;
	
To decide which number is the target cower percentage of (guy - a person):
	if guy is undead, decide on 0;
	if guy is the player and the player is not insane, decide on 0;
	let n be dreadful presence of the player;
	let m be 10 times n;
	increase m by 5;
	decrease m by final mind of guy;
	decrease m by level of guy;
	if m > 40:
		now m is 40;
	if m < 0:
		now m is 0;
	decide on m;

To check if (guy - a person) cowered this turn:
	let pattern be indexed text;
	now pattern is "[The guy] [cower] before your dreadful presence";
	if the event description matches the regular expression pattern:
		increment cower count of the guy;
	
To decide whether (guy - a person) is within (delta - a number) percent of cowering target:
	if the act count of guy is 0, decide no;
	let cower percentage be cower count of guy times 100 divided by the act count of guy;
	let percent difference be cower percentage minus the target cower percentage of guy;
	if the percent difference is less than 0, now the percent difference is 0 minus the percent difference;
	decide on whether or not the percent difference not greater than delta;
		
To say cower report:
	Repeat with guy running through people in the location:
		say "After [act count of guy] rounds, [the guy] cowered [cower count of guy] times versus a target of [target cower percentage of guy] percent ([target cower percentage of guy times act count of guy divided by 100]).";
	
A test step can be cower-counting.

A cower-counting test step is usually repeatable.

When play begins:
	repeat with E running through cower-counting test steps:
		now the maxed out report of E is "[cower report]";
		now the maximum repeats of E is 300;
	
initial scheduling for a cower-counting test step:
	repeat with guy running through people:
		now the cower count of guy is 0;

testing effects of a cower-counting test step:
	Let success count be 0;
	Repeat with guy running through people in the location:
		check if guy cowered this turn;
		if guy is within 5 percent of cowering target, increment success count;	
	if the repeated moves is at least 20 and success count is the number of people in the location:
		record success of the scheduled event;

Ape-cowering is a cower-counting test step. The first move of Dreadful-Presence-Test is Ape-cowering.
		
Player-cowering is a cower-counting test step. The next move of Ape-cowering is Player-cowering.

initial scheduling for Player-cowering:
	now the player is insane;
	assert truth of whether or not the target cower percentage of the player is at least 1 with message "the insane player's target cower percentage should be at least 1"; 
	
Section - Controlling pipes

Controlling pipes is a test set.

Scenario when testing controlling pipes:
	now Hall of Vapours is testobject;
	
Test play when testing controlling pipes:
	extract the player to Hall of Vapours;
	now pipes-open is true;
	transcribe and restart capturing;
	try looking;
	pause and assert that the event description includes "Several large pipes continuously spew forth vapours into this room\. A big wheel is attached";
	try examining the pipes;
	pause and assert that the event description includes " They are currently spewing vapours into the room\.";
	try examining the wheel;
	pause and assert that the event description includes "which are currently open\.";
	try turning the wheel;
	transcribe and restart capturing;
	try examining the pipes;
	pause and assert that the event description includes " They are currently shut off\.";
	try examining the wheel;
	pause and assert that the event description includes "which are currently closed\.";

Section - Sul Champion vs Herm worshipper

[Sul Champion vs Herm worshipper is a test set.

A scenario rule when testing Sul Champion vs Herm worshipper:
	now Hall of Gods is testobject;
	now Bodmall is testobject;
	now Temple of Herm is testobject;

A test play when testing Sul Champion vs Herm worshipper:
	extract the player to the location of Bodmall;
	try smiting Bodmall;
	extract the player to Temple of Herm;
	have the player sacrifice a random granted power;
	extract the player to Hall of Gods;
	have the player and Israfel fight in Arena of the Gods;
	now the melee of the player is 100;
	now the melee of israfel is 100;
	test israfel-defended-by-sul;
	test player-defended-by-herm;
	try israfel israfel-splitting;
	test isra-defended-by-sul;
	
israfel-defended-by-sul is a randomized event;

player-defended-by-herm is a randomized event;

isra-defended-by-sul is a randomized event;]

Section - Bug 210

bug-210 is a test set. 

A scenario rule when testing bug-210:
	now the mindslug is testobject;
	now a random scroll of death is testobject;

A test play when testing bug-210:
	Let the death-scroll be a random not off-stage scroll of death;
	Now the player carries the death-scroll;
	extract the player to the location of the mindslug;
	now the health of the mindslug is 1;
	now the weapon damage bonus of the claymore is 100;
	now the melee of fafhrd is 100;
	update the combat status;
	assert truth of whether or not fafhrd carries the claymore with message "fafhrd should carry the claymore";
	assert truth of whether or not the claymore is readied with message "the claymore should be readied";
	assert truth of whether or not the number of readied weapons enclosed by fafhrd is 1 with message "fafhrd should only have one weapon readied";
	
Initial scheduling of reaction-mindslug-killing:
	now the mind score of fafhrd is 100; [protects against mirror confusion]
	compel the action of fafhrd attacking the player;
	
reaction-mindslug-killing is a repeatable test step. The first move of bug-210 is reaction-mindslug-killing.

Choosing a player reaction when reaction-mindslug-killing is the scheduled event:
	assert truth of whether or not the mindslug is alive with message "the mindslug should be alive";
	if the player carries a scroll of death:
		let the death-scroll be a random carried scroll of death;
		generate the action of reading the death-scroll;
		now the scheduled event is not repeatable;
		rule succeeds;

testing effects of reaction-mindslug-killing:
	if the scheduled event is repeatable, make no decision;
	assert that the event description includes "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face";
	assert that the event description includes "As the mindslug dies, you feel its powerful intelligence absorbed into your own body";
	assert truth of whether or not the mindslug is dead with message "the mindslug should be dead";
	assert truth of whether or not (the player is not at-react) with message "the player should not be at-react"; [probably redundant]
	
Section - Dream of Sleeping

dream-of-sleeping-test is a test set.

Scenario when testing dream-of-sleeping-test:
	now the dream of sleeping is current-test-dream;
	now the reusable item is a random morphean grenade;
	
Sleeping-dream-dreaming is an item-throwing test step. The first move of dream-of-sleeping-test is sleeping-dream-dreaming.

Initial scheduling of sleeping-dream-dreaming:
	Now Malygris is asleep;

Sleeping-dream-waking is a test step. The next move of sleeping-dream-dreaming is sleeping-dream-waking.   

Choosing a player action when testing sleeping-dream-waking:
	generate the action of exiting.

testing effects of sleeping-dream-waking:
	assert that the event description includes "Malygris standing over you";
	assert that Malygris is awake;
	assert that the concentration of Malygris is 2;
	assert truth of whether or not the player is just-woken with message "the player should be just-woken";
	
Waiting-for-Malygris-attack is a repeatable test step. The next move of sleeping-dream-waking is waiting-for-Malygris-attack. 

Initial scheduling of waiting-for-Malygris-attack:
	now the health of the player is 1000;
	compel the action of Malygris attacking the player;
	
Carry out Malygris hitting the player when waiting-for-Malygris-attack is the scheduled event:
	now waiting-for-Malygris-attack is not repeatable.
	
testing effects of waiting-for-Malygris-attack:
	if waiting-for-Malygris-attack is repeatable, make no decision;
	assert that the event description includes "defender was asleep";
	assert truth of whether or not the player is not just-woken with message "the player should not be just-woken anymore";
		
	
Section - Healer of Aite Healing

aite-healing is a test set.

Scenario when testing aite-healing:
	now the statue of shards is bannedobject;
	now healer of aite is testobject.
	
Test play when testing aite-healing:
	extract the player to the location of healer of aite;
	Repeat with guy running through people:
		now the defence of guy is 100;
	decrease the health of the player by 3;
	
healer-not-healing is a repeatable test step. The first move of aite-healing is healer-not-healing. The maximum repeats of healer-not-healing is 20.
	
Before the healer of Aite doing anything when healer-not-healing is the scheduled event:
	now healer-not-healing is uneventful;
	
testing effects of healer-not-healing:
	unless the injury of the player is 3:
		record failure of the scheduled event with message "the player should still be damaged for 3 health";
		
healer-healing-defender is a repeatable test step. The next move of healer-not-healing is healer-healing-defender. The maximum repeats of healer-healing-defender is 20.

Initial scheduling of healer-healing-defender:
	decrease the health of the healer of aite by 3;
	decrease the health of the defender of aite by 4;
	
testing effects of healer-healing-defender:
	if the injury of defender of Aite is less than 4:
		record success of healer-healing-defender;
		
healer-healing-self is a repeatable test step. The next move of healer-healing-defender is healer-healing-self. The maximum repeats of healer-healing-self is 100.

testing effects of healer-healing-self:
	if the injury of healer of Aite is less than 3:
		record success of healer-healing-self.
		
Section - Sul's intervention

sul-intervention-test is an test set [for issue #227].

Scenario when testing sul-intervention-test:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject; 
	
Test play when testing sul-intervention-test:
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to the temple of sul;
	have the player sacrifice a random granted power;
	now the swarm of daggers is not asleep;
	extract the player to the location of the swarm of daggers;
	now the melee of the swarm of daggers is 100;
	transcribe and restart capturing;
	try the swarm of daggers hitting the player;
	stop and save event description;
	assert that the event description includes "swarm of daggers deals";
	assert that the event description does not include "Programming error";
	now the melee of the player is 100;
	transcribe and restart capturing;
	try the player hitting the swarm of daggers;
	stop and save event description;
	assert that the event description includes "You deal";
	assert that the event description does not include "Programming error";
	[TODO: check frequency of intervention]

Section - Reward in Arena of the Gods

divine reward is a test set [for issue #228].

scenario when testing divine reward:
	now Temple of Nomos is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the glass cannon is testobject;
	
First intervention possible when testing divine reward:
	rule fails;
	
Test play when testing divine reward:
	now the player carries the glass cannon;
	try readying the glass cannon;
	now the defence of the player is 100;
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Nomos;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Nomos is 4;
	extract the player to Hall of Gods;
	have the player and Israfel fight in Arena of the Gods;
	now the health of the player is the permanent health of the player - 1;
	try Israfel Israfel-splitting;
	
isra-only-killing is a test step. The first move of divine reward is isra-only-killing.   

Choosing a player action when testing isra-only-killing:
	generate the action of smiting isra.

initial scheduling of isra-only-killing:
	now fell is asleep;

testing effects of a test step (called the current move) when testing divine reward:
	assert "Nomos counter should be zero on [the current move]" based on whether or not the nomos counter is zero;
	assert "Nomos bonus should be false on [the current move]" based on whether or not the nomos bonus is false;

testing effects of isra-only-killing:
	assert truth of whether or not Isra is dead with message "Isra should be dead";
	assert truth of whether or not Fell is not dead with message "Fell should be alive";
	assert truth of whether or not the health of the player is less than the permanent health of the player with message "The player should not be healed";
	assert that the event description does not include "Nomos receives .* and fully heals you";

fell-also-killing is a test step. The next move of isra-only-killing is fell-also-killing.   

Choosing a player action when testing fell-also-killing:
	generate the action of smiting fell.

testing effects of fell-also-killing:
	assert that the location is Hall of Gods;
	assert that the event description includes "receives the soul";
	assert that the event description does not include "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player;
	assert truth of whether or not the player carries the glass cannon with message "the glass cannon should still be carried";
	assert truth of whether or not the glass cannon is readied with message "the glass cannon should still be readied";
	
Section - Temporary Blood Magic from Nomos

temporary Nomos blood magic is a test set.

first intervention possible when testing temporary Nomos blood magic:
	rule fails.
	
Scenario when testing temporary Nomos blood magic:
	now Bodmall is testobject;
	now the jumping bomb is testobject;
	now the swarm of daggers is testobject;
	now the Temple of Nomos is testobject;
	now columnated ruins is bannedobject;
	now everything is not cursed;

The gown-timer is a number that varies;

To decide what number is the chance of (guy - a person) remaining concentrated:
	let the previous defender be the global defender;
	now the global defender is guy;
	now the remain concentrated chance is 0;
	follow the remain concentrated rules;
	now the global defender is previous defender;
	decide on the remain concentrated chance.
	
Test play when testing temporary Nomos blood magic:
	now every room is not rust-spored;
	now the health of the player is 1000;
	now the defence of the player is 100;
	extract the player to the location of bodmall;
	try smiting bodmall;
	extract the player to the temple of nomos;
	have the player sacrifice a random granted power;
	assert that the holder of the gown of the red court is the player;
	assert truth of whether or not the player carries the gown of the red court with message "the gown of the red court should be carried";
	assert truth of whether or not the player carries the inquisitor's hood with message "the inquisitor's hood should be carried";
	transcribe and restart capturing;
	try examining the inquisitor's hood;
	pause and assert that the event description includes "This particular one gives you a \+15% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 5 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	let the base chance be the chance of the player remaining concentrated;
	try wearing the inquisitor's hood;
	assert that (the chance of the player remaining concentrated - the base chance) is 15;
	try feeding the inquisitor's hood;
	transcribe and restart capturing;
	try examining the inquisitor's hood;
	pause and assert that the event description includes "This particular one gives you a \+25% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 10 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	assert that (the chance of the player remaining concentrated - the base chance) is 25;
	try taking off the inquisitor's hood;
	assert that the dreadful presence of the player is 0;
	try feeding the gown of the red court;
	Now the gown-timer is the blood timer of the gown of the red court;
	assert that gown-timer is between 2 and 10;
	transcribe and restart capturing;
	try examining the gown of the red court;
	stop and save event description;
	assert that the event description includes "Wearing the gown gives you two levels of dreadful presence. You can feed the gown 8 blood";
	assert that the dreadful presence of the player is 0;
	try wearing the gown of the red court;
	assert that the dreadful presence of the player is 2;
	transcribe and restart capturing;
	
second-gown-feeding is a hidden-traveling test step. The first move of temporary Nomos blood magic is second-gown-feeding.   

Choosing a player action when testing second-gown-feeding:
	generate the action of feeding the gown of the red court.

testing effects of second-gown-feeding:
	assert that the blood magic level of the gown of the red court is 2;
	assert that the dreadful presence of the player is 3;
	decrease the gown-timer by 1;
	assert that the blood timer of the gown of the red court is the gown-timer;
	now the maximum repeats of first-gown-timeout is gown-timer;
		
first-gown-timeout is a repeatable hidden-traveling test step.

testing effects of first-gown-timeout:
	if the blood magic level of the gown of the red court > 1:
		assert truth of whether or not the blood timer of the gown of the red court is (gown-timer - (the repeated moves + 1)) with message "Blood timer of [blood timer of the gown of the red court] should have been ([gown-timer] - [repeated moves + 1] = [gown-timer - (repeated moves + 1)])";
	otherwise:
		assert that the event description includes "Some of the blood power of the gown of the red court wears off";
		now gown-timer is the blood timer of the gown of the red court;
		assert that gown-timer is between 2 and 10;
		now the maximum repeats of second-gown-timeout is gown-timer;
		now first-gown-timeout is not repeatable
	
second-gown-timeout is a repeatable hidden-traveling test step. The next move of first-gown-timeout is second-gown-timeout.

testing effects of second-gown-timeout:
	assert that the blood timer of the gown of the red court is (gown-timer - (the repeated moves + 1));
	if the blood timer of the gown of the red court is 0:
		assert that the blood magic level of the gown of the red court is 0;
		assert that the event description includes "The blood power of the gown of the red court wears off completely";
		now second-gown-timeout is not repeatable.
		
malleus-earning is a extracting test step. The location-target of malleus-earning is the temple of nomos.

Testing effects of malleus-earning:
	have the player defeat the jumping bomb;
	have the player sacrifice a random granted power;
	assert truth of whether or not the player carries the malleus maleficarum with message "the malleus should be carried";
	try readying the malleus maleficarum;
	assert truth of whether or not the malleus maleficarum is readied with message "the malleus maleficarum should be readied";
	try examining the malleus maleficarum;
	pause and assert that the event description includes "Feeding 1 blood to the Malleus Maleficarum will give it a bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence\.";
	
daggers-meeting is a extracting test step. The location-target of daggers-meeting is the swarm of daggers.

Testing effects of daggers-meeting:
	now the health of the player is 1000;
	now the health of the swarm of daggers is 100;
	now the melee of the player is 100;

nomos-bonus-examining is a test step.   

Choosing a player action when testing nomos-bonus-examining:
	Generate the action of examining the swarm of daggers.

Initial scheduling of nomos-bonus-examining:
	now the nomos bonus is true;

Testing effects of nomos-bonus-examining:
	assert that the event description includes "swarm of daggers attacks using sharp points";

malleus-bonus-attacking is a hidden-traveling test step.   

Choosing a player action when testing malleus-bonus-attacking:
	Generate the action of turning human. 

[turning human is not acting fast, but a rule sets the take no time boolean for it. This will be too late to stop the nomos bonus from changing our action]

Initial scheduling for malleus-bonus-attacking:
	assert that the nomos bonus is true with label "nomos bonus";
	now the nomos bonus is false;
	try feeding the malleus maleficarum;
	transcribe and restart capturing;
	try examining the malleus maleficarum;
	pause and assert that the event description includes "Feeding 2 blood to the Malleus Maleficarum will give it an additional bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence; blood bonus of \+1 attack and \+1 damage";
	now the nomos bonus is true;
	
testing effects of malleus-bonus-attacking:
	assert that the event description includes "You plan on turning human, but find yourself attacking the swarm of daggers instead";
	assert that the hitting count of the player is 1 with label "player's hitting count (bug #281)";
	assert that the blood magic level of malleus maleficarum is 0 with label "malleus blood magic level";
	assert that the event description includes " \+ 1 \(Malleus Maleficarum blood\) \+ 3 \(the law is with you\) = <0-9>+, you beat the swarm of daggers[']s defence rating";
	assert that the event description includes " \+ 1 \(Malleus Maleficarum blood bonus\) \+ 3 \(the law is with you\) = <0-9>+ damage";

Section - bug 234

bug-234 is an test set.

Scenario when testing bug-234:
	Now Israfel is testobject;
	Now the swarm of daggers is testobject;
	Now temple of Herm is testobject;
	Now Hall of Gods is testobject;
	
Test play when testing bug-234:
	extract the player to the location of Israfel;
	try smiting israfel;
	extract the player to the location of the swarm of daggers;
	try smiting the swarm of daggers;
	extract the player to temple of herm;
	have the player sacrifice the power of the daggers;
	extract the player to Hall of Gods;
	now the health of the player is 1000;
	have the player and the healer of Aite fight in Arena of the Gods;
	[also test bug 235]
	transcribe and restart capturing;
	try linking the holy sword;
	pause and assert that the event description includes "You can only link to persons";
	assert that the event description does not include "You forge a spiritual link";

still-linking is a repeatable test step. The first move of bug-234 is still-linking. The maximum repeats of still-linking is 20.   

Choosing a player action when testing still-linking:
	Generate the action of linking the healer of Aite.

testing effects of still-linking:
	if the healer of Aite is linked to the player:
		record success of still-linking;
	
Section - Attempting to Maze Someone in Arena of the Gods

challenger-mazing is an test set.

Scenario when testing challenger-mazing:
	Now Bodmall is testobject;
	Now the minotaur is testobject;
	Now temple of Herm is testobject;
	Now Hall of Gods is testobject;

Test play when testing challenger-mazing:
	extract the player to the location of Bodmall;
	try smiting Bodmall;
	extract the player to the temple of Nomos;
	have the player sacrifice a random granted power;
	extract the player to the location of the minotaur;
	try smiting the minotaur;
	try taking the minotaur's axe;
	try readying the minotaur's axe;
	extract the player to hall of gods;
	have the player and the healer of aite fight in the arena of the gods;
	Now Nomos bonus is true;
	now the melee of the player is 100;
	now the health of the defender of Aite is 100;
	transcribe and restart capturing;
	try hitting the defender of aite;
	pause and assert that the event description includes "you beat the defender of Aite's defence";
	assert that the event description does not include "You plan on challenging the defender of Aite in the maze";
	assert that the event description includes "Space and time begin to twist";
	assert that the location is Arena of the Gods.
	
Section - Banshees Gone Wild - bug 248

banshees gone wild is an test set.

[First every turn: say "Every turn rules run.";]

Definition: A room is occupied rather than unoccupied if it encloses a person.

To swap the occupants of (first place - a room) and (second place - a room):
	Let swap place be a random unoccupied room;
	Repeat with guy running through people in first place:
		extract guy to the swap place;
	if the second place is not the swap place:
		Repeat with guy running through people in second place:
			extract guy to first place;
		Repeat with guy running through people in swap place:
			extract guy to second place;
			
To set the tension to (N - a number):
	transcribe "Setting tension to [N]";
	now the tension is N;
		
Scenario when testing banshees gone wild:
	now Hall of Raging Banshees is testobject;
	now the blood ape is testobject;
	now the reaper is testobject;
	now a random scroll of death is testobject;
	
Test play when testing banshees gone wild:
	Let the death-scroll be a random not off-stage scroll of death;
	Now the player carries the death-scroll;
	swap the occupants of the location of the blood ape and the Hall of Raging Banshees;
	travel sneakily to Hall of Raging Banshees;
	if the retreat location is occupied:
		swap the occupants of the retreat location and a random unoccupied placed room;
	try taking off the fuligin cloak;
	set the tension to 10;
	now the health of the blood ape is 1;
	now the defence of the player is 100;
	now the health of the player is 100;
	
Waiting-for-banshees is a test step. The first move of banshees gone wild is waiting-for-banshees.

testing effects of waiting-for-banshees:
	assert that the event description includes "banshees suddenly break loose";
	assert that the living banshees boolean is true;

banshee-fleeing is a test step. The next move of waiting-for-banshees is banshee-fleeing.

Choosing a player action when testing banshee-fleeing:
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way.

testing effects of banshee-fleeing:
	assert "we should no longer be in Hall of the Raging Banshees" based on whether or not the location is not Hall of Raging Banshees;
	assert that the tension is 0;
	assert that the living banshees boolean is false;
	
banshee-returning is a test step. The next move of banshee-fleeing is banshee-returning.

Initial scheduling for banshee-returning:
	extract the reaper to the location [to keep the tension from dissipating];
	set the tension to 10.
	
Choosing a player action when testing banshee-returning:
	Let the way be the best route from the location to the hall of raging banshees;
	generate the action of going the way;

testing effects of banshee-returning:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;

banshee-return-waiting is a test step. The next move of banshee-returning is banshee-return-waiting.
	
[Initial scheduling for banshee-return-waiting:
	 set the tension to 10;]
	
testing effects of banshee-return-waiting:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;
	assert that the event description includes "banshees suddenly break loose";
	assert that the living banshees boolean is true;
	
reaction-ape-killing is a repeatable test step. The next move of banshee-return-waiting is reaction-ape-killing. 

Initial scheduling of reaction-ape-killing:
	compel the action of the blood ape attacking the player;
	
Choosing a player reaction when reaction-ape-killing is the scheduled event:
	if the player carries a scroll of death:
		let the death-scroll be a random carried scroll of death;
		generate the action of reading the death-scroll;
		now the scheduled event is not repeatable;
		
Choosing a player action when testing reaction-ape-killing:
	if reaction-ape-killing is repeatable:
		make no decision;
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way;

testing effects of reaction-ape-killing:
	if the scheduled event is repeatable, make no decision;
	assert "the blood ape should be dead" based on whether or not the blood ape is dead;
	assert that the event description includes "Bored by a lack of tension";
	assert that the living banshees boolean is false;

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
		
Section - Example failure

example failure is a test set.

passing move is a test step. The first move of example failure is passing move.

Testing effects of passing move:
	assert "truth is true" based on true.

failing move is a test step.

Testing effects of failing move:
	assert "truth is false" based on false.
		
Kerkerkruip Test Sets ends here.
