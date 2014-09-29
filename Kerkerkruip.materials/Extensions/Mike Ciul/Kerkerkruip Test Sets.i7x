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
	now pattern is "[The guy] cower[s] before your dreadful presence";
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
		
Kerkerkruip Test Sets ends here.
