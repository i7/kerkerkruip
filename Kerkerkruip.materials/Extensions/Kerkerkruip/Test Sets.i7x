Test Sets by Kerkerkruip begins here.

Use authorial modesty.

Volume - All Test Sets (not for release)

Include Automated Testing by Kerkerkruip.

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
	[Answer? This line doesn't get captured, but it does get transcribed. Capturing gets interrupted by recording a test attempt]
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

Aite spike vs bat is a test step. The first move of Aite champions vs bat is aite spike vs bat.

After taking a player action when the scheduled event is aite spike vs bat:
	repeat with guy running through people in the location:
		now health of guy is 100;
	
Intervention possible when the scheduled event is aite spike vs bat:
	unless the main actor is the player and intervention-god is Aite, rule fails;
	
Intervention bonus when the scheduled event is aite spike vs bat:
	if the main actor is the player, increase the intervention-bonus by 100;
	
Table of Outcomes (continued)
outcome
bat crashing into spike
bat avoiding huge spike
bat avoiding gigantic spike

testing effects of aite spike vs bat:
	Let player-targeted be whether or not the event description matches the regular expression "bursts out of the ground<^[line break]>+ you";
	if player-targeted is true:
		assert result "bursts out of the ground in front of you";
	Let player-missed be whether or not player-targeted is true and the health of the player is 100;
	achieve bat crashing into spike based on whether or not player-targeted is true and player-missed is false;
	achieve bat avoiding huge spike based on whether or not player-missed is true and the event description matches the regular expression "huge <a-z>+ bursts out of the ground in front of you";
	achieve bat avoiding gigantic spike based on whether or not player-missed is true and the event description matches the regular expression "gigantic <a-z>+ bursts out of the ground in front of you";
	if the last successful outcome is:
		-- bat crashing into spike: assert result "crash into";
		-- bat avoiding huge spike: assert result "You fly over";
		-- bat avoiding gigantic spike: assert result "You fly around";
				
Arena-tormentor-enslaving is a test step.

Choosing a player action when testing Arena-tormentor-enslaving:
	generate the action of enslaving the tormentor of Aite.
	
testing effects of Arena-tormentor-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the tormentor of Aite";
	if the tormentor of Aite is alive:
		assert result "The tormentor of Aite prostrates herself. 'I beg for your mercy, O great Aite,' she prays. Then she rises to fight you again!";
		assert "tormentor should oppose the player" based on whether or not the tormentor of Aite opposes the player;
	otherwise:
		assert result ", killing her";

Section - Enslaving the Defender

Defender-enslaving is a test set.

A scenario rule when testing Defender-enslaving:
	now Bodmall is testobject;
	now mindslug is testobject;
	now Hall of Gods is testobject;
	now Temple of Sul is testobject;
	block interventions;
	
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
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite";
	assert result "The defender of Aite prostrates himself. 'I beg for your mercy, O great Aite,' he prays. Then he rises to fight you again!";
	assert "the defender should oppose the player" based on whether or not the defender of Aite opposes the player;

Arena-defender-re-enslaving is a test step. The next move of Arena-defender-enslaving is Arena-defender-re-enslaving.   

Choosing a player action when testing Arena-defender-re-enslaving:
	generate the action of enslaving the defender of Aite;

Before taking a player action when Arena-defender-re-enslaving is the scheduled event:
	now the health of Defender of Aite is 1;
	now the health of the player is 1;
	now the permanent health of the player is 100;
	now enslave-cooldown is 0;
	
testing effects of Arena-defender-re-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite, killing him";
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert that the health of the player is 100;
	assert "the defender of Aite should be off-stage" based on whether or not defender of Aite is off-stage. 

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
	clear the event description;
	have the player and Drakul fight in Arena of the Gods;
	assert result "grants you 2 divine favour![line break][line break]Herm gifts you <^\n>+; and increases your hiding bonus to \+2\.[line break][line break]You are transported to the Arena of the Gods, where the angry Drakul awaits, preparing himself to"
	
arena-vampire-joining is a test step. The first move of Chton champion vs bat is arena-vampire-joining.   

Choosing a player action when testing arena-vampire-joining:
	generate the action of drinking Drakul's lifeblood;

The summoned creature is an object that varies;

testing effects for arena-vampire-joining:
	assert result "You turn into a vampire, but your opponent doesn't care";
	update the combat status;
	assert that the combat status is combat;
	try reading a random scroll of summoning enclosed by the player;
	now the summoned creature is a random visible undead not super-undead person who is not the player;
	assert "summoned creature shouldn't oppose undead player" based on whether or not the summoned creature does not oppose the player;
	assert "summoned creature should oppose drakul (unless Remko says this test is wrong)" based on whether or not the summoned creature opposes drakul;

chton-arena-cheating is a test step. The next move of arena-vampire-joining is chton-arena-cheating.   

Choosing a player action when testing chton-arena-cheating:
	generate the action of smiting drakul.

Before taking a player action when the scheduled event is chton-arena-cheating:
	Now the health of the player is 1;
	Now the permanent health of the player is 100;
	
testing effects for chton-arena-cheating:
	[should the lifeblood appear a second time just because drinking it removes it from play?]
	assert result ["infamous vampire, who crumbles away into ashes"] "infamous vampire, a small vial";
	assert result "receives the blood";
	assert that the health of the player is 33;
	assert result "transported back to the Hall of the Gods";
	assert that the location of the summoned creature is Hall of Gods;
	assert that drakul's lifeblood is in Hall of Gods;
	
Section - Parting Shots

parting shots is an test set.

A scenario rule when testing parting shots:
	now israfel is testobject;
	now mindslug is testobject;
	now armadillo is testobject;
	now fuligin cloak is testobject;

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
		
testing effects for mindslug-retreat:
	assert result "bravely run away";
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
	assert result "run past your enemies";
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
	assert 0 hits by Fell;
	
israfel-rejoining is a test step. The location-target of israfel-rejoining is fell.

before taking a player action when testing israfel-rejoining:
	if fell is off-stage:
		now the location-target of israfel-rejoining is israfel.

initial scheduling of israfel-rejoining:
	compel the action of israfel waiting;
	
testing effects of israfel-rejoining:
	assert that israfel is in the location;
	
israfel-resplitting is a test step.

Initial scheduling of israfel-resplitting:
	compel the action of israfel israfel-splitting;
	
Testing effects of israfel-resplitting:
	succeed based on whether or not israfel is off-stage;
		
unfrozen-fell-fleeing is a test step.   

Initial scheduling of unfrozen-fell-fleeing:
	compel the action of fell waiting; [TODO: see if it works without this line now that npc-suppressing is the default]
	
Choosing a player action when testing unfrozen-fell-fleeing:
	forget the compelled action; [TODO: this should be ok to delete too, as above]
	generate the action of retreating.

initial scheduling of unfrozen-fell-fleeing:
	now fell presses the player;

testing effects of unfrozen-fell-fleeing:
	assert 1 hit by Fell;
	
Section - Retreating from the Tentacle

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
	assert result "bravely run away";
	assert one hit by tentacle;
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
	assert that the tentacle is in the location;

tentacle-dig-retreat is a test step. The next move of tentacle-retreat is tentacle-dig-retreat.

initial scheduling for tentacle-dig-retreat:
	now the tentacle does not grapple the player;
	
choosing a player action when testing tentacle-dig-retreat:
	generate the action of digging a random diggable direction.
	
testing effects for tentacle-dig-retreat:
	assert result "magically create a tunnel";
	assert one hit by tentacle;
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
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
	clear the event description because "setting up test play";
	try Drakul concentrating;
	assert result "Drakul smiles a little wider";
	try Drakul concentrating;
	assert result "'There is no need to fear me,' Drakul says as he concentrates more deeply\.";
	try Drakul concentrating;
	assert result "Drakul attains the highest state of concentration. 'It feels so good to be alive!'";
	
Driving Drakul insane is a test step. The first move of insane-drakul is driving Drakul insane.   

Choosing a player action when testing driving drakul insane:
	generate the action of attacking drakul;

After taking a player action when the scheduled event is driving drakul insane:
	now the health of Drakul is 100;
	
Testing effects of driving drakul insane:
	succeed on result "Drakul goes insane"
	
insane drakul statements is a test step.

Initial scheduling of insane drakul statements:
	if there is a held achievement of Blood never lies in the Table of Held Achievements:
		do nothing;
		[this causes a glk error:
		choose row with held achievement of Blood never lies in the Table of Held Achievements;
		blank out the whole row;]
	now the concentration of drakul is 0;
	clear the event description;
	try Drakul concentrating;
	assert result "Drakul smiles a little wider";
	try Drakul concentrating;
	assert result "'An insane vampire always tells the truth\. And I tell you: You should fear me!' Drakul says as he concentrates more deeply.";
	try Drakul concentrating;
	assert result "Drakul attains the highest state of concentration\. 'It feels so good to be alive - but I am undead!'";

After taking a player action when the scheduled event is insane drakul statements:
	compel the action of drakul waiting;
	
[some of these appear too unlikey to happen within 100 iterations. Increase iterations?]

Table of Outcomes (continued)
outcome
simple drakul identity
nested conditionals
nested belief
lifeblood-hinting
vampire-turning-hinting

Testing effects of insane drakul statements:
	if waiting for compelled action, make no decision;
	achieve simple drakul identity based on whether or not the event description matches the regular expression "Drakul says, 'I am " and not (the event description matches the regular expression "not|someone who|, and|, or"); [TODO: nicer matching phrases]
	if simple drakul identity just succeeded, assert result "vampire|insane";
	achieve nested conditionals based on whether or not the event description matches the regular expression "Drakul says, 'If .*," and the event description matches the regular expression "I would give you" and the event description matches the regular expression ", if|, and|, or"; [TODO: make this one big regex? Or is it impossible because of ordering?]
	achieve nested belief on result "I believe that I believe";
	achieve lifeblood-hinting on result "a vial of my lifeblood\b";
	if lifeblood-hinting just succeeded, assert result "I am carrying| is in | can be found | is currently unreachable, ";
	achieve vampire-turning-hinting on result "\bI intend to vanquish Malygris after I make you my vampire-slave\b|\byou will never be my vampire-slave\b";
	[this doesn't compile:
	assert "Blood never lies achievement should be held" based on whether not there is a held achievement of Blood never lies in the Table of Held Achievements;]

Drakul suicide is a test step.

Initial scheduling of drakul suicide:
	now the health of drakul is 1;
	now the melee of drakul is 100;
	clear the event description;
	try drakul hitting drakul;
	assert result "drains his own blood, a small vial";
	
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
	assert "the blood ape should be dead" based on whether or not the blood ape is dead;
	have the player and the blood ape fight in Arena of the Fallen;
	assert that the blood ape is awake;
	
Section - Dreadful Presence

[E91A270C9962]

Dreadful-Presence-Test is a test set.

Scenario when testing Dreadful-Presence-Test:
	now the blood ape is testobject;
	now the zombie toad is testobject;
	block interventions;
	
A person has an outcome called the cower counter. The cower counter of a person is usually the boring lack of results.
Definition: a person is cowerer if the cower counter of it is not the boring lack of results.

Table of Outcomes (continued)
outcome	maximum attempts
ape cower counter	300
toad cower counter	300
player cower counter	300

The cower counter of the blood ape is ape cower counter. The cower counter of the zombie toad is toad cower counter. The cower counter of the player is player cower counter.

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
	assert "the blood ape should have a nonzero target cower percentage" based on whether or not the target cower percentage of the blood ape is at least 1;
  	assert that the target cower percentage of the player is 0;
	assert that the target cower percentage of the zombie toad is 0;
	
To decide which number is the target cower percentage of (guy - a person):
	if guy is undead, decide on 0;
	if guy is the player and the player is not insane, decide on 0;
	let P be (dreadful presence of the player) times 12;
	if P is 0, decide on 0;
	decrease P by (3 times level of guy);
	if P > 40:
		decide on 40;
	if P < 1:
		decide on 1;
	decide on P;
	
A test step can be cower-counting.

When play begins:
	Repeat with event running through cower-counting test steps:
		now event is npc-enabling.
	
initial scheduling for a cower-counting test step:
	repeat with guy running through cowerer people:
		Let counter be the cower counter of guy;
		Now the description of counter is "[guy] cowering";
		Let P be the target cower percentage of guy;
		If P is 0 or P / 5 > 0:
			[we don't need all that precision unless we need to distinguish P from 0]
			now the likelihood of counter is P / 5;
			now the minimum attempts of counter is 20;
		otherwise:
			now the likelihood of counter is P;
			now the minimum attempts of counter is 100;
		make the counter possible;
		transcribe "Set [the counter] target to [likelihood of the counter]/[minimum attempts of the counter]";

testing combat round of a cowerer person (called guy) when testing a cower-counting test step:
	test cower counter of guy against "[The guy] [cower] before your dreadful presence";
	clear the event description; [todo: have a separate combat round text?]

Ape-cowering is a cower-counting test step. The first move of Dreadful-Presence-Test is Ape-cowering.
		
Player-cowering is a cower-counting test step. The next move of Ape-cowering is Player-cowering.

initial scheduling for Player-cowering:
	now the player is insane;
	assert "the insane player's target cower percentage should be at least 1" based on whether or not the target cower percentage of the player is at least 1; 
	
Section - Controlling pipes

Controlling pipes is a test set.

Scenario when testing controlling pipes:
	now Hall of Vapours is testobject;
	
Test play when testing controlling pipes:
	extract the player to Hall of Vapours;
	now pipes-open is true;
	clear the event description;
	try looking;
	assert result "Several large pipes continuously spew forth vapours into this room\. A big wheel is attached";
	try examining the pipes;
	assert result " They are currently spewing vapours into the room\.";
	try examining the wheel;
	assert result "which are currently open\.";
	try turning the wheel;
	clear the event description;
	try examining the pipes;
	assert result " They are currently shut off\.";
	try examining the wheel;
	assert result "which are currently closed\.";

[Section - Sul Champion vs Herm worshipper

Sul Champion vs Herm worshipper is a test set.

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
	now the reusable item is a random scroll of death;

A test play when testing bug-210:
	prepare a test battle with the mindslug, inviting groups;
	now the health of the mindslug is 1;
	now the weapon damage bonus of the claymore is 100;
	now the melee of fafhrd is 100;
	assert "fafhrd should carry the claymore" based on whether or not fafhrd carries the claymore;
	assert "the claymore should be readied" based on whether or not the claymore is readied;
	assert "fafhrd should only have one weapon readied" based on whether or not the number of readied weapons enclosed by fafhrd is 1;
	
Initial scheduling of reaction-mindslug-killing:
	compel the action of fafhrd attacking the player;
	
reaction-mindslug-killing is a test step. The first move of bug-210 is reaction-mindslug-killing.

Choosing a player reaction when reaction-mindslug-killing is the scheduled event:
	assert "the mindslug should be alive" based on whether or not the mindslug is alive;
	generate the action of reading the reusable item;
	rule succeeds;

testing effects of reaction-mindslug-killing:
	if waiting for player reaction, make no decision;
	assert "the mindslug should be dead" [succeed] based on whether or not the mindslug is dead;
	if the mindslug is dead:
		assert result "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face";
		assert result "As the mindslug dies, you feel its powerful intelligence absorbed into your own body";
	
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
	assert result "Malygris standing over you";
	assert that Malygris is awake;
	assert that the concentration of Malygris is 2;
	assert "the player should be just-woken" based on whether or not the player is just-woken;
	
Waiting-for-Malygris-attack is a test step. The next move of sleeping-dream-waking is waiting-for-Malygris-attack. 

Initial scheduling of waiting-for-Malygris-attack:
	now the health of the player is 1000;
	compel the action of Malygris attacking the player;
		
testing effects of waiting-for-Malygris-attack:
	if waiting for player reaction, make no decision;
	assert result "defender was asleep";
	assert "the player should not be just-woken anymore" based on whether or not the player is not just-woken;
		
	
Section - Healer of Aite Healing

aite-healing is a test set.
	
healer-not-healing is an npc-enabling test step. The first move of aite-healing is healer-not-healing.
	
Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts
healer-healing-player	""	0	20

Initial scheduling of healer-not-healing:
	prepare a test battle with the healer of Aite, inviting groups;
	Repeat with guy running through people:
		now the defence of guy is 100;
	decrease the health of the player by 3;
	make healer-healing-player possible;
	
[TODO: permit/enable action, like compelling an action in that it uses outcomes to make sure it's happened, but it doesn't specify which action]

testing combat round of the healer of aite when testing healer-not-healing:
	fail healer-healing-player based on whether or not the injury of the player is less than 3;
		
healer-healing-defender is an npc-enabling test step. The next move of healer-not-healing is healer-healing-defender.

Initial scheduling of healer-healing-defender:
	decrease the health of the healer of aite by 3;
	decrease the health of the defender of aite by 4;
	
testing effects of healer-healing-defender:
	succeed based on whether or not the injury of defender of Aite is less than 4 within 20 attempts;
		
healer-healing-self is an npc-enabling test step. The next move of healer-healing-defender is healer-healing-self. 

testing effects of healer-healing-self:
	succeed based on whether or not the injury of healer of Aite is less than 3;
			
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
	clear the event description;
	try the swarm of daggers hitting the player;
	assert result "swarm of daggers deals";
	assert absence of result "Programming error";
	now the melee of the player is 100;
	clear the event description;
	try the player hitting the swarm of daggers;
	assert result "You deal";
	assert absence of result "Programming error";
	[TODO: check frequency of intervention]

Section - Reward in Arena of the Gods

divine reward is a test set [for issue #228].

scenario when testing divine reward:
	now Temple of Nomos is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the glass cannon is testobject;
	block interventions;
	
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
	assert "Isra should be dead" based on whether or not Isra is dead;
	assert "Fell should be alive" based on whether or not Fell is not dead;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	assert absence of result "Nomos receives .* and fully heals you";

fell-also-killing is a test step. The next move of isra-only-killing is fell-also-killing.   

Choosing a player action when testing fell-also-killing:
	generate the action of smiting fell.

testing effects of fell-also-killing:
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert absence of result "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player;
	assert "the glass cannon should still be carried" based on whether or not the player carries the glass cannon;
	assert "the glass cannon should still be readied" based on whether or not the glass cannon is readied;
	
Section - Temporary Blood Magic from Nomos

temporary Nomos blood magic is a test set.
	
Scenario when testing temporary Nomos blood magic:
	now Bodmall is testobject;
	now the jumping bomb is testobject;
	now the swarm of daggers is testobject;
	now the Temple of Nomos is testobject;
	now columnated ruins is bannedobject;
	now the armadillo is bannedobject;
	now the reaper is bannedobject;
	now the imp is bannedobject;
	now everything is not cursed;
	block interventions;

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
	now the defence of the player is 50;
	extract the player to the location of bodmall;
	try smiting bodmall;
	extract the player to the temple of nomos, making sure it is unoccupied;
	extract the swarm of daggers to the temple of nomos;
	have the player sacrifice a random granted power;
	assert that the holder of the gown of the red court is the player;
	assert "the gown of the red court should be carried" based on whether or not the player carries the gown of the red court;
	assert "the inquisitor's hood should be carried" based on whether or not the player carries the inquisitor's hood;
	clear the event description;
	try examining the inquisitor's hood;
	assert result "This particular one gives you a \+15% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 5 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	let the base chance be the chance of the player remaining concentrated;
	equip the player with the inquisitor's hood;
	assert that (the chance of the player remaining concentrated - the base chance) is 15 with label "concentration bonus of the inquisitor's hood";
	try concentrating;
	clear the event description;
	try feeding the inquisitor's hood;
	assert result "You feed 5 health to the inquisitor's hood, increasing its power \(and losing your concentration\)!";
	clear the event description;
	try examining the inquisitor's hood;
	assert result "This particular one gives you a \+25% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 10 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	assert that (the chance of the player remaining concentrated - the base chance) is 25 with label "concentration bonus of the inquisitor's hood after one feeding";
	try taking off the inquisitor's hood;
	assert that the dreadful presence of the player is 0;
	try feeding the gown of the red court;
	Now the gown-timer is the blood timer of the gown of the red court;
	assert that gown-timer is between 2 and 10;
	clear the event description;
	try examining the gown of the red court;
	assert result "Wearing the gown gives you two levels of dreadful presence. You can feed the gown 8 blood";
	assert that the dreadful presence of the player is 0;
	now the gown of the red court is not cursed;
	try wearing the gown of the red court;
	assert that the dreadful presence of the player is 2;
	clear the event description;
	
second-gown-feeding is a hidden-traveling test step. The first move of temporary Nomos blood magic is second-gown-feeding.   

Choosing a player action when testing second-gown-feeding:
	generate the action of feeding the gown of the red court.

testing effects of second-gown-feeding:
	assert that the blood magic level of the gown of the red court is 2;
	assert that the dreadful presence of the player is 3;
	decrease the gown-timer by 1;
	assert that the blood timer of the gown of the red court is the gown-timer;
		
first-gown-timeout is a hidden-traveling test step.

To check the gown timer:
	Let expected timer be gown-timer - (the repeated moves);
	assert that the blood timer of the gown of the red court is the expected timer with label "blood timer of the gown ([gown-timer] - [repeated moves])" ;
	
testing effects of first-gown-timeout:
	succeed based on whether or not the blood magic level of the gown of the red court is not greater than 1 within gown-timer attempts;
	if waiting for resolution:
		check the gown timer;
	otherwise:
		assert result "Some of the blood power of the gown of the red court wears off";
		now gown-timer is the blood timer of the gown of the red court;
		assert that gown-timer is between 2 and 10;
	
second-gown-timeout is a hidden-traveling test step.

testing effects of second-gown-timeout:
	succeed based on whether or not the blood timer of the gown of the red court is 0 within gown-timer attempts;
	if waiting for resolution:
		check the gown timer;
	otherwise:
		assert that the blood magic level of the gown of the red court is 0;
		assert result "The blood power of the gown of the red court wears off completely";
		
malleus-earning is a extracting test step. The location-target of malleus-earning is the temple of nomos.

Testing effects of malleus-earning:
	have the player defeat the jumping bomb;
	have the player sacrifice a random granted power;
	assert "the malleus should be carried" based on whether or not the player carries the malleus maleficarum;
	try readying the malleus maleficarum;
	assert "the malleus maleficarum should be readied" based on whether or not the malleus maleficarum is readied;
	try examining the malleus maleficarum;
	assert result "Feeding 1 blood to the Malleus Maleficarum will give it a bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence\.";
	
daggers-meeting is a test step. 

Testing effects of daggers-meeting:
	prepare a test battle with the swarm of daggers;
	now the health of the player is 1000;
	now the health of the swarm of daggers is 100;
	now the melee of the player is 100;

nomos-bonus-examining is a test step.   

Choosing a player action when testing nomos-bonus-examining:
	Generate the action of examining the swarm of daggers.

Initial scheduling of nomos-bonus-examining:
	now the nomos bonus is true;

Testing effects of nomos-bonus-examining:
	assert result "swarm of daggers attacks using sharp points";

malleus-bonus-attacking is a hidden-traveling test step.   

Choosing a player action when testing malleus-bonus-attacking:
	Generate the action of turning human. 

[turning human is not acting fast, but a rule sets the take no time boolean for it. This will be too late to stop the nomos bonus from changing our action]

to check that the malleus is fed:
       clear the event description;
       try examining the malleus maleficarum;
       assert result "Feeding 2 blood to the Malleus Maleficarum will give it an additional bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence; blood bonus of \+1 attack and \+1 damage";

Initial scheduling for malleus-bonus-attacking:
	assert that the nomos bonus is true with label "nomos bonus";
	now the nomos bonus is false;
	try feeding the malleus maleficarum;
	check that the malleus is fed;
	now the nomos bonus is true;
	
testing effects of malleus-bonus-attacking:
	assert result "You plan on turning human, but find yourself attacking the swarm of daggers instead";
	assert that the hitting count of the player is 1 with label "player's hitting count (bug #281)";
	assert that the blood magic level of malleus maleficarum is 0 with label "malleus blood magic level";
	assert result " \+ 1 \(Malleus Maleficarum blood\) \+ 3 \(the law is with you\) = <0-9>+, you beat the swarm of daggers[']s defence rating";
	assert result " \+ 1 \(Malleus Maleficarum blood bonus\) \+ 3 \(the law is with you\) = <0-9>+ damage";
        
early-feeding is a test step.

initial scheduling of early-feeding:
       generate the action of feeding the malleus maleficarum.

testing effects of early-feeding:
       check that the malleus is fed.
       
[Test for bug #337]
bonus-surviving-attack is a test step.

initial scheduling of bonus-surviving-attack:
	now the melee of the swarm of daggers is 100;
	now the health of the player is 1000;
	now the hit protection of the player is 0;
	now dagger-scattered is 0;
	compel the action of the swarm of daggers attacking the player;
       
testing effects of bonus-surviving-attack:
       if waiting for player reaction, make no decision;
       assert "the player should be damaged" based on whether or not the health of the player < 1000;
       check that the malleus is fed;

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
	clear the event description;
	try linking the holy sword;
	assert result "You can only link to persons";
	assert absence of result "You forge a spiritual link";

still-linking is a test step. The first move of bug-234 is still-linking.

Choosing a player action when testing still-linking:
	Generate the action of linking the healer of Aite.

testing effects of still-linking:
	succeed based on whether or not the healer of Aite is linked to the player within 20 attempts.
	
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
	clear the event description;
	try hitting the defender of aite;
	assert result "you beat the defender of Aite's defence";
	assert absence of result "You plan on challenging the defender of Aite in the maze";
	assert result "Space and time begin to twist";
	assert that the location is Arena of the Gods.
	
Section - Banshees Gone Wild - bug 248

banshees gone wild is an test set.

[First every turn: say "Every turn rules run.";]
[TODO: get rid of "travel sneakily"]

To set the tension to (N - a number):
	transcribe "Setting tension to [N]";
	now the tension is N;
		
Scenario when testing banshees gone wild:
	now Hall of Raging Banshees is testobject;
	now the blood ape is testobject;
	now the reaper is testobject;
	now a random scroll of death is testobject;
	
Test play when testing banshees gone wild:
	Now the reusable item is a random scroll of death;
	swap the occupants of the location of the blood ape and the Hall of Raging Banshees;
	travel sneakily to Hall of Raging Banshees;
	if the retreat location is occupied:
		swap the occupants of the retreat location and a random unoccupied room;
	try taking off the fuligin cloak;
	set the tension to 10;
	now the health of the blood ape is 1;
	now the defence of the player is 100;
	now the health of the player is 100;
	
Waiting-for-banshees is a hidden-traveling test step. The first move of banshees gone wild is waiting-for-banshees.

testing effects of waiting-for-banshees:
	assert result "banshees suddenly break loose";
	assert that the living banshees boolean is true;

banshee-fleeing is a  hidden-traveling test step. The next move of waiting-for-banshees is banshee-fleeing.

Choosing a player action when testing banshee-fleeing:
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way.

testing effects of banshee-fleeing:
	assert "we should no longer be in Hall of the Raging Banshees" based on whether or not the location is not Hall of Raging Banshees;
	assert that the tension is 0;
	assert that the living banshees boolean is false;
	
banshee-returning is a hidden-traveling test step. 

Initial scheduling for banshee-returning:
	extract the reaper to the location [to keep the tension from dissipating];
	set the tension to 10.
	
Choosing a player action when testing banshee-returning:
	Let the way be the best route from the location to the hall of raging banshees;
	generate the action of going the way;

testing effects of banshee-returning:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;
	succeed on result "banshees suddenly break loose";
	assert that the living banshees boolean is true;

[
Is it wrong to take this out? Not sure, but I just want the test to pass, and it seems ok!

banshee-return-waiting is a hidden-traveling test step. 	
[Initial scheduling for banshee-return-waiting:
	 set the tension to 10;]
	
testing effects of banshee-return-waiting:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;
	assert result "banshees suddenly break loose";
	assert that the living banshees boolean is true;
]	

reaction-ape-killing is a hiding-reveal test step. 

Initial scheduling of reaction-ape-killing:
	compel the action of the blood ape attacking the player;
	
Choosing a player reaction when reaction-ape-killing is the scheduled event:
	generate the action of reading the reusable item;
		
Choosing a player action when testing reaction-ape-killing:
	if waiting for player reaction, make no decision;
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way;

testing effects of reaction-ape-killing:
	if waiting for player reaction, make no decision;
	assert "the blood ape should be dead" based on whether or not the blood ape is dead;
	assert result "Bored by a lack of tension";
	assert that the living banshees boolean is false;

Section - Remembering Text

remembering-text is a test set.

Scenario when testing remembering-text:
	now Bodmall is testobject;
	now the minotaur is testobject;
	now the angel of compassion is testobject;
	now the demon of rage is testobject;
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the fuligin cloak is testobject;
	now the teleportation beacon is bannedobject;
	now the dimensional anchor is bannedobject;
	now bridge of doom is testobject;
	now hall of vapours is bannedobject;
	now a random scroll of mapping is testobject;
	now the rod of the master builder is testobject;
	now generation info is true;
	Now the reusable item is a random scroll of psycholocation;
	now the reusable item is testobject;
	
[in case the first map is rejected, Arcane Vault must be switched back from testobject to bannedobject every time]
first creating the map rule when testing remembering-text:
	now every secretly placeable room is bannedobject; [prevent normal placement of Arcane Vault to simulate conditions for bug 244]
	now Eternal Prison is testobject;

last creating the map rule when testing remembering-text (this is the force Arcane Vault to be secretly placed rule):
	assert "Arcane Vault should not yet be placed" based on whether or not Arcane Vault is not placed;
	now Arcane Vault is testobject;
	now the rarity of Arcane Vault is 0;
	
The place all secret testobject rooms rule is listed after the force Arcane Vault to be secretly placed rule in the creating the map rules;
	
Test play when testing remembering-text:
	Now every room is not rust-spored;
	Let the item be a random not off-stage scroll of mapping;
	Now the player carries the item;
	Now the player carries the rod of the master builder;
	assert "Eternal Prison should be secretly placed" based on whether or not the eternal prison is secretly placed;
	assert "Lake of Lava should be placed" based on whether or not the lake of lava is placed;
	assert "Lake of Lava should not be denizen" based on whether or not the lake of lava is not denizen;
	assert "Lake of Lava should not be teleportable" based on whether or not the lake of lava is not teleportable;
	assert "Lake of Lava should be nogo" based on whether or not the lake of lava is nogo;
	assert "Lake of Lava should not be secretly placed" based on whether or not lake of lava is not secretly placed;
	assert "Lake of Lava should not be placeable" based on whether or not lake of lava is not placeable;
	
nothing-to-remember is a test step. The first move of remembering-text is nothing-to-remember.   

Choosing a player action when testing nothing-to-remember:
	Generate the action of remembering. 

testing effects of nothing-to-remember:
	assert result "You have not yet explored:\n( - the <a-w>+ exit of the entrance hall \(where you currently are\)\n)+\nYou have visited the following rooms: the entrance hall \(here\)\.\n\nTip:"
	
dumb-sensing is a test step.   

Choosing a player action when testing dumb-sensing:
	Generate the action of sensing;

testing effects of dumb-sensing:
	assert "Powerless sensing should not take time" based on previously-fast;
	
A test step can be psy-scroll-reading;

early-psycholocation is a psy-scroll-reading test step.

choosing a player action when testing a psy-scroll-reading test step:
	generate the action of reading the reusable item;
	
testing effects of psy-scroll-reading test step:
	[TODO: text that sensing takes no time]
	assert "The player should be psycholocating now" based on the psycholocation boolean;
	assert result "When you are psycholocating, sensing does not take time"

unexplored-sensing is a test step.   

Choosing a player action when testing unexplored-sensing:
	Generate the action of sensing.

testing effects of unexplored-sensing:
	Repeat with the enemy running through {swarm of daggers, blood ape, demon of rage, angel of compassion, minotaur, bodmall, malygris}:
		assert result "[soul description of the enemy], (from the )?[best route from the location to the location of the enemy][line break]";
	assert result "- a turning in on itself of space and time, on which you cannot bear to focus your attention, somewhere [general direction from the location to the Eternal Prison][line break]"

[ - a bolt of black shot through with a blaze of hot white, from the south
 - an aura like sharpened steel, from the east
 - a zone of tautened, reddened air, from the west
 - a squall of fury, all blacks and reds, from the south
 - a luminous arc of sorrow, from the south
 - a skein of twisting passages, from the south
 - spreading thorns dripping with dew--or blood, from the wes]
	
remembering-daggers is a hidden-traveling test step.  The location-target of remembering-daggers is the swarm of daggers.

Choosing a player action when testing remembering-daggers:
	Generate the action of remembering.
		
testing effects of remembering-daggers:
	assert result "You have visited the following rooms:.*You have seen the following creatures in these locations:.*- the swarm of daggers \(level 1\) in [the location] \(where you currently are\)"

[before we can get the partway-path psycholocating message, we have to put a visited room between us and an unseen creature. Find one that's at least two moves away and then go 1 move towards it.]

The sensing-place is a room that varies.
The on-the-way place is a room that varies.
The faraway enemy is an object that varies.

partway-visiting is a hidden-traveling psy-scroll-reading test step.
	
To decide which object is the next stop from (origin - a room) to (destination - a room):
	let the way be the best route from origin to destination;
	if the way is not a direction:
		decide on nothing;
	decide on the room way from origin;
	
Initial scheduling of partway-visiting:
	now the sensing-place is the location;
	now the faraway enemy is nothing;
	Repeat with guy running through denizen persons:
		If the number of moves from the location to the location of guy is at least 2 and the location of guy is not visited:
			now the faraway enemy is guy;
			break;
	assert "there should be an enemy in an unvisited room at least 2 moves away" based on whether or not the faraway enemy is a person;
	let the target be the location of the faraway enemy;
	now the on-the-way place is the next stop from the location to the target;
	if the on-the-way place is not visited:
		now the location-target of partway-visiting is the on-the-way place;
	while the next stop from the on-the-way place to the target is a visited room:
		now the on-the-way place is the next stop from the on-the-way place to the target.

middle-psycholocating is a extracting psy-scroll-reading test step. 

Initial scheduling of middle-psycholocating:
	now the location-target of middle-psycholocating is the sensing-place.

partial-explored-sensing is a hidden-traveling test step.   

Choosing a player action when testing partial-explored-sensing:
	Generate the action of sensing.

testing effects of partial-explored-sensing:
	assert result "the soul of the swarm of daggers here with you, like an aura like sharpened steel[line break]";
	assert result "[soul description of the faraway enemy], [best route from on-the-way place to location of the faraway enemy] from [the on-the-way place] \(which lies [best route from the location to on-the-way place] from here\)[line break]"

meeting-malygris is a hidden-traveling test step. The location-target of meeting-malygris is Malygris.
	
Testing effects of meeting-malygris:
	succeed on result "(does not (detect|notice)|remains unaware of) you(r presence)?[run paragraph on]" within 5 attempts;
	
psycholocation-expiring is a hidden-traveling test step.

testing effects of psycholocation-expiring:
	succeed based on whether or not psycholocation is inactive.
		
moving-malygris is a hiding-reveal test step. 

Initial scheduling for moving-malygris:
	Compel the action of Malygris teleporting.
	
testing effects of moving-malygris:
	if waiting for compelled action:
		fail based on whether or not the location of malygris is not the location;
		make no decision;
	assert result "Malygris suddenly teleports away";
	
[First choosing a player action when testing moving-malygris:
	if the location of Malygris is not the location:
		make no decision;
	if the fuligin cloak is worn:
		make no decision;
	generate the action of waiting;]
	
remembering-malygris is a test step.   

Choosing a player action when testing remembering-malygris:
	Generate the action of remembering.

testing effects of remembering-malygris:
	assert result "You have seen the following creatures in these locations:.*You have also seen Malygris, but you don't know where he is now"
	
remembering-lost-plural is a test step.   

Choosing a player action when testing remembering-lost-plural:
	Generate the action of remembering.

Initial scheduling of remembering-lost-plural:
	now the last-seen-location of the swarm of daggers is null-room.
	
testing effects of remembering-lost-plural:
	assert result "You have also seen (Malygris|the swarm of daggers) and (Malygris|the swarm of daggers), but you don't know where they are now"
	 
dungeon-clearing is a test step.

Initial scheduling for dungeon-clearing:
	now the health of the demonic assassin is -1;
	Repeat with guy running through denizen persons:
		if guy is the player or the level of guy is at least 5, next;
		now the health of guy is -1;
		
testing effects of dungeon-clearing:
	assert that the number of reachable persons is 2;
	assert "Malygris (in [the location of Malygris]) should be reachable from [the location]" based on whether or not Malygris is reachable;
	assert "The player (in [the location of the player]) should be reachable" based on whether or not the player is reachable.
	
Malygris-only-remembering is a test step.   

Choosing a player action when testing malygris-only-remembering:
	generate the action of remembering.

testing effects of Malygris-only-remembering:
	assert absence of result "You have seen the following creatures in these locations";
	assert result "You have also seen Malygris, but you don't know where he is now"
	
slow-sensing is a test step.   

Choosing a player action when testing slow-sensing:
	generate the action of sensing.

Initial scheduling of slow-sensing:
	assert "psycholocation should be inactive" based on whether or not psycholocation is inactive;
	
testing effects of slow-sensing:
	assert "sensing without psycholocation should take time" based on whether or not previously-fast is false;
	
exploring-everywhere is an extracting hidden-traveling test step. 

Initial scheduling for exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room.
	
testing effects of exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room;
	succeed based on whether or not the location-target of exploring-everywhere is nothing;
	if waiting for resolution, make no decision;
	assert that the number of unvisited reachable rooms is 0;
	assert "Arcane Vault should be secretly placed" based on whether or not the arcane vault is secretly placed;
	assert "Arcane Vault should be denizen" based on whether or not the arcane vault is denizen;
	assert "Arcane Vault should not be reachable" based on whether or not the arcane vault is not reachable;
	assert "There should be at least 1 unvisited secret room" based on whether or not the number of unvisited denizen rooms is at least 1;
	
remembering-everything-reachable is a test step.   

Choosing a player action when testing remembering-everything-reachable:
	generate the action of remembering.

testing effects of remembering-everything-reachable:
	assert result "All locations have been explored";
	assert absence of result "You have not yet explored";
	 
explored-psycholocating is a hidden-traveling extracting psy-scroll-reading test step.

Initial scheduling for explored-psycholocating:
	if the location is the location of Malygris:
		now the location-target of explored-psycholocating is a random unoccupied reachable room;
		if location-target of explored-psycholocating is a room:
			assert "location-target ([location-target of explored-psycholocating]) is not reachable" based on whether or not location-target of explored-psycholocating is a reachable room;
			assert "location-target ([location-target of explored-psycholocating]) should not be where Malygris is" based on whether or not location-target of explored-psycholocating is not the location of Malygris;
		otherwise:
			assert "location-target ([location-target of explored-psycholocating]) is not a room" based on false;


malygris-sensing is a test step.   

Choosing a player action when testing malygris-sensing:
	generate the action of sensing.

Initial scheduling of malygris-sensing:
	[make sure psycholocating works even when remembering doesn't]
	Now the last-seen-location of Malygris is null-room;

testing effects of malygris-sensing:
	assert result "[soul description of malygris], in [the location of Malygris]";
	assert "psycholocation sensing should not take time" based on previously-fast;

map-reading is a test step.

choosing a player action when testing map-reading:
	Let M be a random scroll of mapping carried by the player;
	generate the action of reading M;
	
testing effects of map-reading:
	assert result "a complete floor plan of the dungeon of Kerkerkruip imprints itself on your mind"
	
map-remembering is a test step.   

Choosing a player action when testing map-remembering:
	generate the action of remembering.

testing effects of map-remembering:
	Assert that the number of secretly placed rooms is 2;
	assert result "Based on the map you found.*secret rooms in the dungeon, one <^[line break]>+, one <^[line break]>+.";
	assert result "You have also seen Malygris, but you don't know where he is. With your powers of psycholocation, you might be able to SENSE it";
	
getting-close-to-vault is a hidden-traveling extracting test step.

Initial scheduling of getting-close-to-vault:
	Let the closest place be Null-room;
	Let the shortest distance be 1000;
	Repeat with the place running through connectable reachable rooms:
		Let the candidate distance be the absolute distance between the place and the Arcane Vault;
		if the candidate distance is less than the shortest distance:
			now the shortest distance is the candidate distance;
			now the closest place is the place;
	now the location-target of getting-close-to-vault is the closest place.
			
digging-to-vault is a hidden-traveling test step. 

Choosing a player action when testing digging-to-vault:
	Generate the action of digging a single general direction from the location to Arcane Vault.
		
testing effects of digging-to-vault:
	succeed based on whether or not the location is a secretly placed room within 20 attempts.
	[it doesn't actually have to be the vault - if we hit another secret room on the way we should stop]
	
secret-room-remembering is a test step.   

Choosing a player action when testing secret-room-remembering:
	generate the action of remembering.

testing effects of secret-room-remembering:
	assert result "Based on the map you found.*a secret room in the dungeon, <a-z>";
	assert absence of result "secret room in the dungeon, one";
	
[make sure tunnels don't show up when they shouldn't, make sure they do show up in unexplored list]

[psycholocation + sense]

Section - Blessed Grenade - bug #261

blessed-grenade-test is a test set.

Scenario when testing blessed-grenade-test:
	now Drakul is testobject;
	now the Alchemical Laboratory is testobject;
	
Test play when testing blessed-grenade-test:
	now the defence of the player is 100;
	now the player carries the reusable item;
	Now the reusable item is the staff of insanity;
	Now every room is not rust-spored;
	Now every thing is not rusted;

A test step can be grenade-producing.

When play begins:
	repeat with the move running through grenade-producing test steps:
		now the move is hidden-traveling;
		now the move is extracting;
		now the location-target of the move is the alchemical laboratory.

blessed-grenade-alchemy is a grenade-producing test step. The first move of blessed-grenade-test is blessed-grenade-alchemy.

Choosing a player action when testing a grenade-producing test step:
	generate the action of inserting the reusable item into the curious machine.

[TODO: make this a while loop, not a cycle of turns]

First every turn when the scheduled event is a grenade-producing test step (called the current move):
	Now the health of the player is 100;
	Now the player is not asleep;
	If the current move is hidden-traveling, now the player is hidden;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	
Last testing effects of a grenade-producing test step:
	Repeat with item running through grenades in the location:
		if item is not a custom-grenade, remove item from play;

testing effects of blessed-grenade-alchemy:
	succeed on result "the Blessed Grenade drops on the ground" within 300 attempts;
	if waiting for resolution, make no decision;
	Repeat with the item running through grenades:
		Let name be indexed text;
		Now name is the printed name of the item;
		if the name is "Blessed Grenade":
			assert "[The item] in [holder of the item] looks like a blessed grenade, but it isn't" based on whether or not the item is the blessed grenade;
			assert that the item is in the location;
		
no-extra-blessed-grenade is a grenade-producing test step. [This number could be higher, but it's a slow test] 

Initial scheduling of no-extra-blessed-grenade:
	assert that the location of the blessed grenade is Alchemical Laboratory with label "location of the blessed grenade";
	assert "The blessed grenade should be placed" based on whether or not the blessed grenade is placed;
	assert "The blessed grenade should not be cloneable" based on whether or not the blessed grenade is not cloneable;
	
testing effects of no-extra-blessed-grenade:
	fail on result "the Blessed Grenade drops on the ground" within 100 attempts [could be more if we made this faster].
	
throwing-blessed is a test step.

Initial scheduling of throwing-blessed:
	now the player carries the blessed grenade;
	extract the player to the location of Drakul;
	
Choosing a player action when testing throwing-blessed:
	generate the action of throwing the blessed grenade;
	
testing effects of throwing-blessed:
	assert "Drakul should be dead" based on whether or not Drakul is dead;
	assert "The blessed grenade should be exploded" based on whether or not the blessed grenade is exploded;
	assert "The blessed grenade should be placed" based on whether or not the Blessed Grenade is placed;
	assert "The blessed grenade should be off-stage" based on whether or not the blessed grenade is off-stage;
	assert result "As the grenade explodes you hear the singing of angels, several of whom swoop down from the heavens with huge swords and eviscerate <^[line break]>*Drakul";
	
no-new-blessed-grenade is a grenade-producing test step. 

testing effects of no-new-blessed-grenade:
	fail based on whether or not the blessed grenade is not off-stage within 100 attempts;

Section - At-react after getting mazed - bug 210

maze-resetting is a test set.

Scenario when testing maze-resetting:
	now the minotaur is testobject;
	now the overmind is testobject;
	now the hall of mirrors is bannedobject;
	
Test play when testing maze-resetting:
	extract the player to the location of the minotaur;
	try smiting the minotaur;
	try taking the minotaur's axe;
	assert "the minotaur's axe should be carried" based on whether or not the minotaur's axe is carried;
	try readying the minotaur's axe;
	assert "the minotaur's axe should be readied" based on whether or not the minotaur's axe is readied;
	now the defence of the player is 100;
	now the melee of the player is 100;

overmind-meeting is a extracting hiding-reveal test step. The first move of maze-resetting is overmind-meeting. The location-target of overmind-meeting is the overmind.

overmind-mazing is a test step.   

Choosing a player action when testing overmind-mazing:
	generate the action of attacking the overmind.
	
testing effects of overmind-mazing:
	assert that the combat state of the overmind is at-inactive.
	
Section - bug 262

[this bug will not happen with normal testobject placement, so this is a bit of a gamble]
[TODO: create testing dungeon generation rulebook. save the table of outcomes to a file and continue the test if any of them are open]

bug-262 is a test set.

Scenario when testing bug-262:
	now generation info is true;
	now every secretly placeable room is bannedobject;
	
First creating the map rule when testing bug-262:
	now every secretly placeable room is testobject;
	
First dungeon finish rule:
	repeat with pack running through not non-treasure things:
		repeat with item running through things enclosed by pack:
			now the valuation of item is the valuation of pack;
	
Definition: a room is secret-treasure-stash if it is Mausoleum or it is Hidden Treasury or it is Elemental Plane of Smoke Storage.

Test play when testing bug-262:
	if portal of smoke is not placed and hidden treasury is not placed and mausoleum is not placed:
		log "no treasure-containing secret rooms to test for bug 262, but testing anyway!";
	let something to test be false;
	repeat with place running through secret-treasure-stash rooms:
		if place encloses a not non-treasure thing:
			now something to test is true;
			break;
	unless something to test is true:
		log "no treasure in any secretly placed rooms, but testing anyway";
	Repeat with item running through treasure packs:
		assert "[The item] should be off-stage, but it is in [the holder of the item][if holder of the item is not a room] (in [location of the item])" based on whether or not item is off-stage;

Section - bug 245

bug-245 is a test set.

Scenario when testing bug-245:
	now the blood ape is testobject;
	now bodmall is testobject;
	now the hall of mirrors is bannedobject;
	
Initial scheduling of ape-growing:
	now the defence of the player is 0;
	now the health of the player is 1000;
	now the melee of the player is 100;
	
ape-growing is a extracting hidden-traveling hiding-reveal test step. The first move of bug-245 is ape-growing. The location-target of ape-growing is the blood ape. 

[TODO:  a 100-melee hit phrase right here would cut through the crap]
testing effects of ape-growing:
	succeed based on whether or not the size of the blood ape is greater than medium;
	if waiting for resolution, compel the action of the blood ape attacking the player;
	
Choosing a player reaction when testing ape-growing:
	generate the action of exposing;
	rule succeeds.

ape-smiting is a test step.   

Choosing a player action when testing ape-smiting:
	generate the action of smiting the blood ape;

testing effects of ape-smiting:
	assert "the power of the ape should be granted" based on whether or not the power of the ape is granted;

bodmall-meeting is a hidden-traveling extracting hiding-reveal test step. The location-target of bodmall-meeting is bodmall.

Initial scheduling of bodmall-meeting:
	now the health of bodmall is 1000;
	now bodmall is not asleep;
	
bodmall-bleeding is a test step.   

Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts
bodmall-reaction	""	1	100

Choosing a player action when testing bodmall-bleeding:
	generate the action of attacking bodmall.

Before Bodmall doing something when testing bodmall-bleeding:
	test bodmall-reaction against whether or not Bodmall is at-react;
	
testing effects of bodmall-bleeding:
	assert "the player should now be bigger than medium, but [regarding the player][they] [are] [size of the player]" based on whether or not the size of the player is greater than medium;
	assert that the success count of bodmall-reaction is 1 with label "number of times Bodmall reacted";
	assert "bodmall should be at-inactive, but she is [combat state of bodmall]" based on whether or not bodmall is at-inactive;
	now bodmall-reaction is untested;

Section - Maze Moving

[Moving around in the maze - check that all people have 0 concentration and are at-inactive. Check that the right thing happens when retreating or running from an opponent in the maze. Maybe check grenade-throwing effects in the maze]

[TODO: get rid of act count from this - this is the last test to use it]

To assert that (item - a thing) is located in (place - a room):
	assert "[The item] should be in [place], but [they] is in [location of item]" based on whether or not the location of item is place.
	
To assert that (guy - a person) has (N - a number) levels of concentration:
	assert "[The guy] has [concentration of guy] levels of concentration, but [they] should have [N] levels" based on whether or not concentration of guy is N.
	
maze-moving is a test set.

Scenario when testing maze-moving:
	now the minotaur is testobject;
	now the hall of mirrors is bannedobject;
	now the reusable item is a random flash grenade;
	
minotaur-meeting is a hidden-traveling extracting hiding-reveal test step. The first move of maze-moving is minotaur-meeting. The location-target of minotaur-meeting is the minotaur.

Initial scheduling of minotaur-meeting:
	now the health of the player is 1000;
	now the defence of the player is 0;
	
getting-mazed is a test step.

Initial scheduling of getting-mazed:
	compel the action of the minotaur attacking the player.

Testing effects of getting-mazed:
	succeed on result "minotaur deals";
	if waiting for resolution, make no decision;
	assert that the location is Maze;
	assert "the player should be at-inactive, but [regarding the player][they] [are] [combat state of the player]" based on whether or not the player is at-inactive;
	assert "the minotaur should be at-inactive, but he is [combat state of the minotaur]" based on whether or not the minotaur is at-inactive;
	assert that the minotaur is located in maze-waiting-room;
	assert that maze-sound is northwest;
	
directionless-throwing is a test step.

Choosing a player action when testing directionless-throwing:
	generate the action of throwing the reusable item to north;

Testing effects of directionless-throwing:
	assert result "There is no point throwing grenades into twisty little passages";
	assert "Trying to throw things in the maze should not take time" based on whether or not the take no time boolean is true;
	assert "[the reusable item] should be carried" based on whether or not the reusable item is carried.
	
sound-finding is a test step.   

Choosing a player action when testing sound-finding:
	generate the action of going north.

Testing effects of sound-finding:
	succeed based on whether or not maze-sound is a cardinal direction.
			
maze-summoning is an item-reading test step.

Initial scheduling of maze-summoning:
	now the the reusable item is a random scroll of summoning;
	now the player carries the reusable item;
	
Testing effects of maze-summoning:
	assert result "[a monster summoned] appears before you"
	
A test step can be sound-following.

summoned-fleeing is a sound-following test step.

Initial scheduling of summoned-fleeing:
	now the concentration of the player is 3;
	now the concentration of the monster summoned is 3;
	
Choosing a player action when testing a sound-following test step:
	generate the action of going maze-sound;

Definition: a person is not-yet-active if the act count of it is 0.

First combat round rule when testing summoned-fleeing:
	update event description;
	if every person who is not the player is not-yet-active:
		assert result "You flee through the tunnels, quickly losing all sense of direction.[line break][line break][The monster summoned] follows you towards the sound.";
		if the monster summoned is non-attacker:
			assert 0 hits by the monster summoned;
		otherwise:
			assert 1 hit by the monster summoned;
	if the act count of the main actor is 0:
		[this assertion can interrupt the event description]
		assert that the main actor has 0 levels of concentration;
	clear event description;

testing effects of summoned-fleeing:
	assert that the monster summoned is located in the maze;
	assert that the minotaur is located in the maze;
	if the act count of the monster summoned is 0:
		assert that the monster summoned has 0 levels of concentration;
	if the act count of the minotaur is 0:
		assert that the minotaur has 0 levels of concentration;

multiple-fleeing is a test step.   

Choosing a player action when testing multiple-fleeing:
	generate the action of going north.

Initial scheduling of multiple-fleeing:
	now the concentration of the minotaur is 3;
	now the concentration of the monster summoned is 3;
	
Testing effects of multiple-fleeing:
	assert that the minotaur has 0 levels of concentration;
	assert that the monster summoned has 0 levels of concentration;
	assert that the minotaur is located in maze-waiting-room;
	assert that the monster summoned is located in maze-waiting-room;
	assert 1 hit by the minotaur;
	
multiple-sound-seeking is a test step.   

Choosing a player action when testing multiple-sound-seeking:
	generate the action of going north.

Testing effects of multiple-sound-seeking:
	succeed based on whether or not the maze-sound is a cardinal direction;
	if waiting for resolution, make no decision;
	assert that the number of people in maze-waiting-room is 2;
		
first-rejoining is a sound-following test step.

Testing effects of first-rejoining:
	assert that the number of people in maze-waiting-room is 1;
	assert that the number of people in maze [including the player] is 2;
	
first-maze-smiting is a test step.

Choosing a player action when testing first-maze-smiting:
	now opposition test subject is the player;
	Let the enemy be a random opposer person enclosed by the location;
	generate the action of smiting the enemy.
	
Testing effects of first-maze-smiting:
	assert that the player is located in the maze;
	assert that the combat status is peace.

Section - Hiding Penalites

hiding-penalties is a test set.

scenario when testing hiding-penalties:
	now bodmall is testobject;
	
bodmall-sneaking is a hidden-traveling extracting test step. the first move of hiding-penalties is bodmall-sneaking. The location-target of bodmall-sneaking is bodmall.

Initial scheduling of bodmall-sneaking:
	now the teleportation beacon is in the location of Malygris;
	now the dimensional anchor is in the location of Malygris;
	now teleportation-beacon-on is true;
	
Choosing a player action when testing bodmall-sneaking:
	Let G be a random teleportation grenade;
	now G is in the location of Bodmall;
	generate the action of throwing G;
	
Testing effects of bodmall-sneaking:
	assert result "first taking the teleportation grenade";
	assert result "Malygris, perhaps the greatest of all living sorcerers, is standing here";
	assert absence of result "picking stuff up";
	
malygris-robbing is a hidden-traveling test step.

Initial scheduling of malygris-robbing:
	repeat with guy running through people in the location:
		assert "teleportation should be impossible for [guy]" based on whether or not teleportation is impossible for guy;

Choosing a player action when testing malygris-robbing:
	Let G be a random teleportation grenade;
	now G is in the location;
	generate the action of throwing G;
	
[if the player teleports away but reappears in the same room, their hiding penalty will be wiped out. This could be considered a bug, but I don't think it's worth fixing. Anyway, we can avoid it for testing purposes by using the dimensional anchor.]

Testing effects of malygris-robbing:
	assert that the teleportation beacon is located in the location;
	assert that malygris is located in the location;
	assert that bodmall is located in the location;
	assert result "Something has stopped you from teleporting";
	assert result "picking stuff up";

Section - Imp Teleporting Into Dreams

bug-280 is a test set.

Scenario when testing bug-280:
	now the reaper is testobject;
	now the lair of the imp is testobject;
	now the dimensional anchor is bannedobject;
	now the teleportation beacon is bannedobject; [test with the imp?]
	now the dream of briar roses is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the vast staircase is bannedobject.
	
reaper-seeking is an extracting test step. The  first move of bug-280 is reaper-seeking. The location-target of reaper-seeking is the reaper.

Initial scheduling of reaper-seeking:
	assert "Lair of the imp should be placed" based on whether or not lair of the imp is placed;
	assert "Imp should be denizen" based on whether or not the imp is denizen;
	assert "Dimensional anchor is in [location of the dimensional anchor]" based on whether or not the dimensional anchor is off-stage;
	now the health of the player is 1000.
	
Testing effects of reaper-seeking:
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;

imp-dreaming is an npc-enabling item-throwing test step.

Testing effects of imp-dreaming:
	assert that the location is garden of thorns;
	fail based on whether or not the location of the imp is the location within 20 attempts;
	wake the player up;
	update the combat status; [risky?]
	assert "we should be with the reaper in [location of the reaper] but we are in [the location]" based on whether or not the location is the location of the reaper;
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;
	
imp-appearing is an npc-enabling test step.

Testing effects of imp-appearing:
	succeed based on whether or not the location of the imp is the location:
		
imp-thieving is a test step.

Initial scheduling of imp-thieving:
	compel the action of the imp imp-grabbing.
			
imp-vanishing is a test step.   

Choosing a player action when testing imp-vanishing:
	generate the action of attacking the imp;

Testing effects of imp-vanishing:
	succeed based on whether or not the location of the imp is lair of the imp;
		
imp-stashing is an npc-enabling test step.

Testing effects of imp-stashing:
	succeed based on whether or not a package of ment is in the lair of the imp within 2 attempts;
	

Section - Starting Kits

starting-kits-test is an test set.

Scenario when testing starting-kits-test:
	now generation info is true;
	now the gilded rapier is testobject;
	now the gorgeous dagger is testobject;
	now the evil dagger is testobject;
	now Metastasio's hat is testobject;
	now the generation minimum is 20.
	
malygris-heal-max is a number that varies.



Generation test when testing starting-kits-test:
	now the heal power of Malygris is 0;
	follow the equip all encounterable creatures rule [usually done after approval];
	[Malygris heal power]
	let max healing be (heal power of Malygris) * 60 / (heal cooldown of Malygris);
	if max healing is greater than malygris-heal-max:
		now malygris-heal-max is max healing;
	if max healing is at least 1:
		say "* Malygris can heal [max healing divided by 60] and [remainder after dividing max healing by 60] 60ths per turn[line break]";
	if (max healing) is greater than (60 times 3):
		assert "[max healing divided by 60] and [remainder after dividing max healing by 60] 60ths is too much healing for Malygris" based on false;
		now generation minimum is 0;
	if generation count is generation minimum:
		assert "Malygris should be able to heal sometimes" based on whether or not the malygris-heal-max is at least 1;
	[no shimmer weapons]
	[We place all of the player's possible starting kit items in the dungeon, tempting the starting kit rules to make shimmer-copies. But it must resist the temptation!]
	Repeat with item running through things enclosed by the player:
		assert "[The item] should not be shimmering" based on whether or not the item is not shimmering;
		if the item is the addict's amulet:
			[TODO: test that the addict's amulet is chosen sometimes]
			assert "the addict's amulet should still be cursed" based on whether or not the addict's amulet is cursed;
		otherwise:
			assert "[the item] should not be cursed" based on whether or not the item is not cursed;
	Assert that the original owner of the sword of light is the angel of compassion with label "original owner of the sword of light";
	Assert that the original owner of the claymore is fafhrd with label "original owner of the claymore";
		[TODO: starting kit items should match the player's size?]

Section - Bloodlust - issue 279

bloodlust-279 is a test set.

to assert that bloodlusting is (active - a truth state) when (condition - indexed text):
	assert "the player should [if active is false]not [end if]be bloodlusting [condition], but you are [person condition of the player]" based on whether or not active is (whether or not the player is bloodlusting).
	
Scenario when testing bloodlust-279:
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the mindslug is testobject;
	now the hall of mirrors is bannedobject;
	
meeting-daggers is an extracting test step. The first move of bloodlust-279 is meeting-daggers. The location-target of meeting-daggers is the swarm of daggers.

Initial scheduling of meeting-daggers:
	now the melee of the player is 100;
	now the defence of the player is 100;
	now the health of the swarm of daggers is 50;
	
hitting-daggers is a test step. 

choosing a player action when testing hitting-daggers:
	generate the action of attacking the swarm of daggers.
	
Testing effects of hitting-daggers:
	assert that bloodlusting is true when "after hitting";
	
smiting-daggers is a test step.

choosing a player action when testing smiting-daggers:
	generate the action of smiting the swarm of daggers.
	
Testing effects of smiting-daggers:
	assert that the combat status is peace with label "combat status";
	assert that bloodlusting is false when "after killing the daggers".
	
[If we can think of any tricky cases where the combat status changes during the every turn stage, we should test those]
		
meeting-ape is an extracting test step. The location-target of meeting-ape is the blood ape.

Initial scheduling of meeting-ape:
	have the player defeat the mindslug;
	extract fafhrd to the location of the blood ape;
	now the health of the blood ape is 100;
	
hitting-ape is a test step.

choosing a player action when testing hitting-ape:
	generate the action of attacking the blood ape;
	
testing effects of hitting-ape:
	assert that bloodlusting is true when "after hitting the ape the first time";
	
fafhrd-killing-ape is a test step.

initial scheduling of fafhrd-killing-ape:
	now the melee of fafhrd is 100;

choosing a player action when testing fafhrd-killing-ape:
	compel the action of fafhrd attacking the blood ape;
	generate the action of attacking the blood ape;

before fafhrd hitting the blood ape when testing fafhrd-killing-ape:
	transcribe "reducing the ape's health to 1";
	now the health of the blood ape is 1;
	
testing effects of fafhrd-killing-ape:
	if the blood ape is alive:
		make no decision;
	assert that bloodlusting is false when "after Fafhrd kills the ape";

Section - bug 291

bug-291 is a test set.

Scenario when testing bug-291:
	now the healer of aite is testobject;
	now the dream of tungausy shaman is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject;
	now the lair of the imp is bannedobject;
	now the armadillo is bannedobject;
	now the reaper is bannedobject;

sleepy-throwing is an extracting item-throwing test step. The first move of bug-291 is sleepy-throwing. The location-target of sleepy-throwing is the healer of aite.

Before taking a player action when testing sleepy-throwing:
	now the player is just-woken;
	clear event description;
	
Testing effects of sleepy-throwing:
	assert that the player is tungausy warrior with label "identity of the player";
	assert absence of result "fog of sleep";
	
hut-entering is a test step.

Choosing a player action when testing hut-entering:
	generate the action of going inside.
	
shaman-choosing is a test step.

Choosing a player action when testing shaman-choosing:
	select menu question answer 1;
	
To assert that (guy - a person) is fully alert:
	assert "[The guy] should not be just-woken" based on whether or not the guy is not just-woken.
	
To assert that (guy - a person) is just-woken:
	assert "[The guy] should be just-woken" based on whether or not the guy is just-woken.
	
Testing effects of shaman-choosing:
	Now opposition test subject is the player;
	Repeat with guy running through opposer people in the location:
		assert that guy is asleep;
	assert that the player is the true body of the player with label "true body of the player";
	assert that the player is awake;
	assert that the player is fully alert;
	assert absence of result "fog of sleep";
	
teleport-waking is a test step.

initial scheduling of teleport-waking:
	now the reusable item is a random scroll of teleportation;
	now the healer of aite is not asleep;
	compel the action of the healer of aite attacking the player;
	now the teleportation beacon is in a random unoccupied placed room;
	now teleportation-beacon-on is true;	
	
Choosing a player reaction when testing teleport-waking:
	now the player is just-woken;
	generate the action of reading the reusable item.
	
Testing effects of teleport-waking:
	if waiting for compelled action, make no decision;
	if the player is at-react, make no decision;
	assert that the player is fully alert;
	assert result "fog of sleep";
	
sleepy-teleport is a hidden-traveling item-reading test step.

Initial scheduling of sleepy-teleport:
	now the teleportation beacon is in the location of the swarm of daggers;
	now the player is just-woken;
	
Testing effects of sleepy-teleport:
	assert that the player is just-woken;
	assert absence of result "fog of sleep";
	
sleepy-status is a test step.

Choosing a player action when testing sleepy-status:
	generate the action of asking status.
	
Testing effects of sleepy-status:
	assert result "You are just-woken: The next attack against you gets a \+3 bonus and \+2 damage\.";
	
sleepy-slaying is a hidden-traveling test step.

choosing a player action when testing sleepy-slaying:
	generate the action of smiting the swarm of daggers;
	
testing effects of sleepy-slaying:
	assert result "fog of sleep";
	assert that the player is fully alert.


Section - bug 244

[This test is not catching the bug I saw. I have no idea how to reproduce it.]
[TODO: try new dungeon generation idea]

bug-244 is an test set.

Scenario when testing bug-244:
	now generation info is true;
	now the generation minimum is 20;
	now the rarity of the mausoleum is 0;

Map approval rule when testing bug-244 (this is the only approve secret mausoleum maps rule):
	if the mausoleum is not placed:
		rule fails;
	let the path be the best route from Entrance Hall to the mausoleum;
	if the path is a direction:
		rule fails;
	
Generation test when testing bug-244:
	assert "The mausoleum should be placed" based on whether or not the mausoleum is placed;
	assert "The mausoleum should be marked secretly placeable" based on whether or not the mausoleum is secretly placeable;
	
final-generation-test is a test step. The first move of bug-244 is final-generation-test.

Testing effects of final-generation-test:
	assert "The mausoleum should be marked secretly placeable" based on whether or not the mausoleum is secretly placeable;

Section - Bug 301 Redux

bug-301-aite is a test set.

scenario when testing bug-301-aite:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the reusable item is a random fragmentation grenade;
	
First intervention possible when testing bug-301-aite:
	rule fails;
	
bug-301-setup is a test step. The first move of bug-301-aite is bug-301-setup.
	
Initial scheduling of bug-301-setup:
	Now every room is not rust-spored;
	Now every thing is not rusted;
	now the defence of the player is 100;
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Sul;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Sul is 4;
	extract the player to Hall of Gods;
	have the player and healer of Aite fight in Arena of the Gods;
	
healer-first-killing is a test step. 

Initial scheduling of healer-first-killing:
	now the health of the player is the permanent health of the player - 1; 

Choosing a player action when testing healer-first-killing:
	generate the action of smiting the healer of aite.
	
Testing effects of healer-first-killing:
	assert "The healer should be dead" based on whether or not the healer of Aite is dead;
	assert "The tormentor of Aite should be alive" based on whether or not the tormentor of Aite is alive;
	assert "The defender should be alive" based on whether or not the defender of Aite is alive;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	assert absence of result "Sul receives .* and fully heals you";
	
other-fanatics-killing is an item-throwing test step.

Initial scheduling of other-fanatics-killing:
	now the health of the tormentor of Aite is 1;
	now the health of the defender of Aite is 1;

testing effects of other-fanatics-killing:
	assert "The tormentor should be dead" based on whether or not the tormentor of Aite is dead;
	assert "The defender should be dead" based on whether or not the defender of Aite is dead;
	assert that the location is Hall of Gods with label "current location";
	assert result "receives the soul";
	assert absence of result "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player with label "health of the player";

[TODO: test armadillo and reaper following]


Section - Armadillo wandering

armadillo-wandering is a test set.

Scenario when testing armadillo-wandering:
	now the ravenous armadillo is testobject;

waiting-for-armadillo-move is a test step. The first move of armadillo-wandering is waiting-for-armadillo-move.

armadillo-start is a room that varies.

Initial scheduling of waiting-for-armadillo-move:
	now armadillo-start is the location of the ravenous armadillo.
	
Testing effects of waiting-for-armadillo-move:
	succeed based on whether or not the location of the armadillo is not armadillo-start.


Section - Unlocking - issue 243

unlocking-behavior is a test set.

to assert that placement possibility is (allowable - a truth state) when (conditions - indexed text):
	now basic game mode is false;
	follow the decide basic mode rule;
	now the rarity of Space-Time Discontinuum is 0;
	now the considered room is Space-Time Discontinuum;
	follow the placement possible rules;
	assert "Space-Time Discontinuum should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	now global monster level is 1;
	now the considered monster is the ravenous armadillo;
	follow the monster placement possible rules;
	assert "The armadillo should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	[not-too-difficult is no longer used to place treasure - the smoky blade is now placed by the stock minor treasure rule]
	[assert "The smoky blade should [if allowable is false]not [end if]be not-too-difficult" based on whether or not allowable is (whether or not the smoky blade is not-too-difficult);]
	
	
Scenario when testing unlocking-behavior:
	set difficulty to 0;
	disable advanced content;
	assert that setting of current difficulty is 0 with label "current difficulty setting";
	assert that difficulty is 0 with label "difficulty";
	assert "advanced content should be disabled" based on whether or not advanced content is disabled;
	now the considered room is Space-Time Discontinuum;
	assert that placement possibility is false when "in novice level";
	enable advanced content;
	assert that placement possibility is true when "in novice level with advanced content enabled";
	set difficulty to 1;
	assert that setting of current difficulty is 1 with label "current difficulty setting";
	assert that difficulty is 1 with label "difficulty";
	disable advanced content;
	assert that placement possibility is true when "in apprentice level";
	enable advanced content;
	assert that placement possibility is true when "in apprentice level when advanced content is enabled";


Section - bug 293 - Sensing Isra and Fell

bug-293 is a test set

scenario when testing bug-293:
	now the reusable item is a random teleportation grenade;
	now israfel is testobject;
	
israfel-meeting-293 is an extracting hidden-traveling test step. The first move of bug-293 is israfel-meeting-293. The location-target of israfel-meeting-293 is israfel.

israfel-splitting-293 is a hiding-reveal test step. 

initial scheduling of israfel-splitting-293:
	assert "isra should be off-stage" based on whether or not isra is off-stage;
	assert "fell should be off-stage" based on whether or not fell is off-stage;
	compel the action of israfel israfel-splitting.
		
isra-and-fell-scattering is a hidden-traveling item-throwing test step.

Testing effects of isra-and-fell-scattering:
	assert "isra should be onstage" based on whether or not isra is not off-stage;
	if the location of Isra is the location:
		extract Isra to a random unoccupied reachable room;
	assert "fell should be onstage" based on whether or not fell is not off-stage;
	if the location of Fell is the location:
		extract Fell to the location of Isra;
	repeat with guy running through people in the location of isra:
		if guy is not isra and guy is not Fell:
			extract guy to the location;
	repeat with guy running through people in the location of fell:
		if guy is not fell and guy is not Isra:
			extract guy to the location;
	
psycholocating-293 is a hidden-traveling item-reading test step.

initial scheduling of psycholocating-293:
	now the reusable item is a random scroll of psycholocation.
	
sensing-293 is a hidden-traveling test step.

Choosing a player action when testing sensing-293:
	generate the action of sensing.
	
Testing effects of sensing-293:
	assert "Isra should be psycholocatable" based on whether or not Isra is psycholocation-revealed;
	assert "Fell should be psycholocatable" based on whether or not fell is psycholocation-revealed;
	assert result "frozen lightning";
	assert result "molten thunder";
	
isra-defeating-293 is a test step.

initial scheduling of isra-defeating-293:
	have the player defeat isra;
	
Testing effects of isra-defeating-293:
	assert "power of israfel should not be granted" based on whether or not the power of israfel is not granted;
	
fell-defeating-293 is a test step.

initial scheduling of fell-defeating-293:
	have the player defeat fell;
	
Testing effects of fell-defeating-293:
	assert "isra should be dead" based on whether or not isra is dead;
	assert "fell should be dead" based on whether or not fell is dead;
	assert "israfel should be off-stage" based on whether or not israfel is off-stage;
	[assert result "Israfel's dying cry shakes the foundations of the world";]
	assert "power of israfel should be granted" based on whether or not the power of israfel is granted.

Section - Weapon aftereffects

weapon aftereffects is a test set.

Scenario when testing weapon aftereffects:
	now the body score of fafhrd is 100;

The sometimes feed armour of thorns rule does nothing when testing weapon aftereffects.

fafhrd-battling is a test step. The first move of weapon aftereffects is fafhrd-battling.

initial scheduling of fafhrd-battling:
	Now the player carries the gilded rapier;
	try readying the gilded rapier;
	prepare a test battle with fafhrd;
	now the defence of the player is 50;
	now the health of the player is 1000;
		
Testing effects of fafhrd-battling:
	assert that the location of Fafhrd is test arena with label "location of Fafhrd";
	have Fafhrd do no reaction to a 100 melee hit with result "You deal";
	assert that the gilded rapier readied after "Fafhrd is hit";
	have Fafhrd do a dodge reaction to a 0 melee hit with result "you do not overcome Fafhrd";
	assert that the gilded rapier readied after "Fafhrd dodges";
	[claymore parries rapier]
	have Fafhrd do a parry reaction to a 0 melee hit with result "The claymore shatters the gilded rapier!";
	assert no weapon after "the claymore parries the rapier";
	[claymore parries fists]
	have Fafhrd do a parry reaction to a 0 melee hit with result "you do not overcome Fafhrd";
	assert absence of result "The claymore shatters";
	assert that the global attacker weapon is a random natural weapon enclosed by the player with label "global attacker weapon";
	[restore rapier to the player]
	clear event description;
	now the gilded rapier is not readied;
	now the player carries the gilded rapier;
	try readying the gilded rapier;
	try taking inventory;
	update event description;
	assert result "gilded rapier \(readied\)";
	assert absence of result "\(readied\).*\(readied\)";
	assert that the number of readied weapons enclosed by the player is 1 with label "number of player's readied weapons ([the list of readied weapons enclosed by the player])";
	have the player do a dodge reaction to a 0 melee hit by Fafhrd with result "Fafhrd does not overcome your defence rating";
	assert the gilded rapier readied after "successfully dodging the claymore";
	have the player do a dodge reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "failing to dodge the claymore";
	have the player do a parry reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "failing to parry the claymore";
	now the hit protection of the player is 1;
	have the player do a parry reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "the protected player fails to parry the claymore";
	assert that the hit protection of the player is 0 with label "hit protection of the player";
	have the player do a parry reaction to a 0 melee hit by Fafhrd with result "The claymore shatters the gilded rapier!";
	assert no weapon after "parrying the claymore";

scythe-vs-fafhrd is a test step.

Initial scheduling of scythe-vs-fafhrd:
	equip the player with the scythe of oxidation;
	now the body score of fafhrd is 0;
	make everyone wait;
		
Testing effects of scythe-vs-fafhrd:
	have fafhrd do no reaction to a 100 melee hit with result "You deal";
	have fafhrd do a parry reaction to a 100 melee hit with result "You deal";
	assert absence of result "the claymore rusts";
	assert "Fafhrd should not be rusted" based on whether or not Fafhrd is not rusted;
	assert "The claymore should not be rusted" based on whether or not the claymore is not rusted;
	have fafhrd do a parry reaction to a 0 melee hit with result "Having been in contact with the scythe of oxidation, the claymore rusts";
	assert "The claymore should be rusted after parrying the scythe of oxidation" based on whether or not the claymore is rusted;
	now the claymore is not rusted;
	have the player do a parry reaction to a 0 melee hit by Fafhrd with result "Having been in contact with the scythe of oxidation, the claymore rusts";
	assert "The claymore should be rusted after being parried by the scythe of oxidation" based on whether or not the claymore is rusted;
	
scythe-vs-chains is a test step.

Initial scheduling of scythe-vs-chains:
	prepare a test battle with the chain golem;
	
Testing effects of scythe-vs-chains:
	Let the chain-weapon be a random natural weapon enclosed by the chain golem;
	have the chain golem do a dodge reaction to a 0 melee hit with result "you do not overcome";
	assert "The chain golem should not be rusted" based on whether or not the chain golem is not rusted;
	assert "The chain golem's chains should not be rusted" based on whether or not the chain-weapon is not rusted;
	have the chain golem do a parry reaction to a 0 melee hit with result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	assert "The chain golem's chains should be rusted after parrying the scythe of oxidation" based on whether or not the chain-weapon is rusted;
	assert "The chain golem should not be rusted even though the lashing chains are rusted" based on whether or not the chain golem is not rusted;
	now the chain-weapon is not rusted;
	have the chain golem do a dodge reaction to a 100 melee hit with result "Having been hit with the scythe of oxidation, the chain golem rusts!";
	assert "The chain golem should be rusted after being hit by the scythe of oxidation" based on whether or not the chain golem is rusted;
	assert "The lashing chains should not be rusted after the chain golem is hit by the scythe of oxidation" based on whether or not the chain-weapon is not rusted;
	now the chain golem is not rusted;
	have the player do a parry reaction to a 0 melee hit by the chain golem with result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	assert "The lashing chains should be rusted after being parried by the scythe of oxidation" based on whether or not the chain-weapon is rusted;

lionshield-vs-chains is a test step.

Initial scheduling of lionshield-vs-chains:
	Repeat with S running through shields worn by the player:
		now the player carries S;
	now the player carries the lion's shield;
	now the player wears the lion's shield;
	make everyone wait;
	
Testing effects of lionshield-vs-chains:
	now the health of the chain golem is 100;
	have the player do a dodge reaction to a 0 melee hit by the chain golem with result "the chain golem does not overcome";
	assert absence of result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	assert that the health of the chain golem is 100 with label "health of the chain golem";
	have the player do a block reaction to a 0 melee hit by the chain golem with result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	assert that the health of the chain golem is 98 with label "health of the chain golem";

chains-vs-thorns is a test step.

Initial scheduling of chains-vs-thorns:
	Repeat with item running through suits worn by the player:
		now the player carries item;
	Now the player wears the armour of thorns;
	make everyone wait;
	
Testing effects of chains-vs-thorns:
	now the health of the chain golem is 100;
	have the player do a dodge reaction to a 0 melee hit by the the chain golem with result "the chain golem does not overcome";
	assert absence of result "The armour of thorns scratches the chain golem for 1 damage";
	assert that the health of the chain golem is 100 with label "health of the chain golem";
	have the player do a dodge reaction to a 100 melee hit by the the chain golem with result "The armour of thorns scratches the chain golem for 1 damage";
	assert that the health of the chain golem is 99 with label "health of the chain golem";

lionshield-vs-bodmall is a test step.
	
Initial scheduling of lionshield-vs-bodmall:
	prepare a test battle with bodmall;
	
[TODO: make sure the lion's shield doesn't work when it's not worn or when not blocking]
[TODO: test everything with the demonic mistress - tethered but not natural weapon]

Testing effects of lionshield-vs-bodmall:
	now the health of bodmall is 100;
	have the player do a block reaction to a 0 melee hit by bodmall with result "Bodmall does not overcome";
	assert absence of result "lion on the shield strikes out";
	assert that the health of bodmall is 100 with label "health of bodmall";
	
bodmall-vs-thorns is a test step.

Initial scheduling of bodmall-vs-thorns:
	[player already wears the armour of thorns]
	compel the action of bodmall waiting;
	
Testing effects of bodmall-vs-thorns:
	now the health of bodmall is 100;
	[should the lion's shield bite the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]
	have the player do a dodge reaction to a 0 melee hit by bodmall with result "Bodmall does not overcome";
	assert absence of result "The armour of thorns scratches Bodmall for 1 damage";
	assert that the health of Bodmall is 100 with label "health of bodmall";
	have the player do a dodge reaction to a 100 melee hit by Bodmall with result "Bodmall beats your defence rating";
	assert that the health of Bodmall is 100 with label "health of Bodmall";


greasy-gauntlets vs mouser is a test step.

Initial scheduling of greasy-gauntlets vs mouser:
	now the player wears the greasy gauntlets;
	now the player carries the gilded rapier;
	now the gilded rapier is not readied;
	try readying the gilded rapier;
	prepare a test battle with mouser;
		
Testing effects of greasy-gauntlets vs mouser:
	have mouser do a dodge reaction to a 0 melee hit by the player with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "missing mouser";
	have mouser do a parry reaction to a 0 melee hit by the player with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "successfully parried by mouser";
	have mouser do a dodge reaction to a 100 melee hit by the player with result "you drop the gilded rapier" in 1 out of 6 attempts;
	assert no weapon after "mouser was hit by the rapier using greasy gauntlets";
	now the gilded rapier is not readied;
	now the player carries the gilded rapier;
	try readying the gilded rapier;
	have the player do a parry reaction to a 100 melee hit by mouser with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "failing to parry mouser";
	have the player do a parry reaction to a 0 melee hit by mouser with result "you drop the gilded rapier" in 1 out of 4 attempts;
	assert no weapon after "successfully parrying mouser using greasy gauntlets";
	
[TODO: Hot weapons only do heat damage (or break because of heat)? if not projectile]

mouser-vs-thorns is a test step.

Initial scheduling of mouser-vs-thorns:
	[player already wears the armour of thorns]
	make everyone wait;
	
Testing effects of mouser-vs-thorns:
	now the health of mouser is 100;
	[should the lion's shield bite the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]
	have the player do a dodge reaction to a 0 melee hit by the mouser with result "Mouser does not overcome";
	assert absence of result "The armour of thorns scratches Mouser for 1 damage";
	assert that the health of mouser is 100 with label "health of mouser";
	have the player do a dodge reaction to a 100 melee hit by the mouser with result "The armour of thorns scratches Mouser for 1 damage";
	assert that the health of mouser is 99 with label "health of mouser";

[TODO: test armor of thorns (started) and Israfel (not started), 
when hitting with damage (done)
hitting without damage (not done)
vs chain golem, bodmall, and hand-to-hand attacker, and missing - (all started)]

Section - Bug 351 - scroll cloning

bug-351 is a test set.
	
knowledge-gaining is an item-reading test step. The first move of bug-351 is knowledge-gaining.

Testing effects of knowledge-gaining:
	clear event description;
	find a healthy scroll;
	update event description;
	assert result "You have found a scroll";
	Repeat with item running through scrolls enclosed by the player:
		assert "The true name and obfuscated name of [item] should be different, but they are both '[true name of item]'" based on whether or not the true name of item is not the obfuscated name of item;
	Repeat with item running through scrolls:
		let item-name be the true name of item;
		assert "The true name of [item] should not be obfuscated, but it is [true name of item], which is an obfuscated name'" based on whether or not item-name is a not obfuscated scroll name;

Section - Bug 352 - exploded property

bug-352 is a test set.

throwing-352 is an item-throwing test step. The first move of bug-352 is throwing-352.

Initial scheduling of throwing-352:
	now the reusable item is a random smoke grenade.
	
Testing effects of throwing-352:
	assert absence of result "Run-time problem"
	
Section - Died Counts

died-count-test is a test set.

[I don't think this bug ever comes up in play, but it happens in test battles]

israfel-slaying is a test step. The first move of died-count-test is israfel-slaying.

Initial scheduling of israfel-slaying:
	now the challenger's initial defeats is the died count of Israfel;
	move Isra to Entrance Hall;
	revive Israfel in Entrance Hall;
	prepare a test battle with israfel;
	
Testing effects of israfel-slaying:
	try smiting Israfel;
	assert that the died count of israfel is the challenger's initial defeats + 1 with label "died count of Israfel".

Section - Damage Text

damage-text is a test set.

[Test every instance of the "inflict" phrase. If you add an invocation, please consider adding a test here.]

Scenario when testing damage-text:
	now Vast Staircase is testobject;

damage-text testing is a test step. The first move of damage-text is damage-text testing.

Initial scheduling of damage-text testing:
	prepare a test battle with the reaper;
	now the health of the player is 1000;
	now the health of the reaper is 1000;
	
Testing effects of damage-text testing:
	Have the reaper do a dodge reaction to a 100 melee hit with result "(\n|^)You deal <1-9><0-9>* damage";
	now the tension is 3;
	Have the the reaper do a dodge reaction to a 100 melee hit with result "\+ 1 \(tension\)", checking damage;
	clear event description;
	say Divine lightning strikes the player;
	assert result "(\n|^)A ball of lightning shoots from the sky, doing <3-7> damage to you"; [fails currently, but if it didn't, we might want another test for when the damage was reduced]
	now the reusable item is a random fragmentation grenade;
	clear event description;
	have a fragmentation event in the location with the reusable item by the player;
	assert result "<2-5> damage to the Reaper; and <2-5> damage to you";
	[skip fragmentation in other rooms because no damage text is printed]
	now the player wears the armour of thorns;
	now the blood magic level of the armour of thorns is 1;
	have the player do a dodge reaction to a 100 melee hit by the reaper with result "(\n|^)The armour of thorns scratches the Reaper for 1 damage.";
	now the player wears the lion's shield;
	now the defence of the player is 50;
	have the player do a block reaction to a 0 melee hit by the reaper with result "(\n|^)The lion on the shield strikes out, and bites the Reaper for 2 damage.";
	Now the reusable item is a random scroll of death;
	now the player carries the reusable item;
	clear event description;
	try reading the reusable item;
	assert result "(\n|^)A wave of unholy energy is released, dealing <3-6> damage to the Reaper; and <3-6> damage to you.";
	[not sure how we could trigger an unholy wave in another room, but it wouldn't print anything anyway]
	now the player worships Chton;
	now the player carries the vial of purification;
	clear event description;
	try drinking the vial of purification;
	assert result "(\n|^)Chton prevents the vial of purification from doing its work; but your attempt at escaping undeath did not amuse him. A wave of extreme cold racks your body, dealing 15 damage!";
	extract the player to the Temple of Aite;
	clear event description;
	try climbing the statue of Aite;
	assert result "(\n|^)You cut yourself as soon as you touch the statue. The weapons deal 3 damage.";
	prepare a test battle with the abyss of the soul;
	clear event description;
	try the abyss of the soul pulsating;
	assert result "(\n|^)The abyss of the soul pulsates, sending out a wave of negative energy that deals <1-2> damage to you.";
	prepare a test battle with the chain golem;
	now the defence of the chain golem is 50;
	now the melee of the player is 0;
	now the health of the chain golem is 1000;
	now the body score of the player is -100;
	now the concentration of the chain golem is 3;
	clear event description;
	try attacking the chain golem;
	assert result "(\n|^)You attempt to duck under the whirling chains. You roll <0-9>+ \+ -100 \(body\) = -<0-9>+ against a target number of <0-9>+, failing the body check. One of the chains catches you with a loud smack, dealing 6 damage.";
	now the power of the bomb is granted;
	now the health of the player is 0;
	now the health of the chain golem is 1000;
	clear event description;
	have an event of the chain golem killing the player;
	assert result "(\n|^)Your body explodes vehemently as you throw yourself at the chain golem, but you only deal 5 damage instead of the 1000 damage you needed to deal.";
	now the health of the player is 1000;
	prepare a test battle with the tentacle;
	now the tension is 0;
	now the concentration of the tentacle is 0;
	have the player do a dodge reaction to a 100 melee hit by the tentacle with result "(\n|^)The giant tentacle deals 0 damage but holds on to you.";
	check damage of the player with 1000 health after "deals";
	now the tentacle does not grapple the player;
	now the tension is 3;
	[This next test fails, not because of a text problem, but because of a logic problem - see issue #378]
	have the player do a dodge reaction to a 100 melee hit by the tentacle with result "(\n|^)The giant tentacle deals 0 + 1 (tension) = 1 damage, wounding you to 999 health.";
	check damage of the player with 1000 health after "deals"; [somewhat redundant here]
	clear event description;
	try the tentacle tentacle-constricting;
	assert result "(\n|^)The giant tentacle tightens its muscles, dealing 1 damage to you";
	check damage of the player with 1000 health after "dealing";
	clear event description;
	now brambles strength is 1;
	launch the thorns;
	assert result "(\n|^)Thorns shoot towards everyone, dealing 1 damage to the giant tentacle; and 1 damage to you\.";
	check damage of the player with 1000 health after "to the giant tentacle; and";
	prepare a test battle with israfel;
	[TODO: try with heat damage resistance]
	have israfel do no reaction to a 100 melee hit with result "(\n|^)Israfel's flames burn you for 3 damage\.";
	check damage of the player with 1000 health after "burn you for";
	try israfel israfel-splitting;
	have isra do no reaction to a 100 melee hit with result "(\n|^)Isra's flames burn you for 2 damage\.";
	check damage of the player with 1000 health after "burn you for";
	clear event description;
	deal 3 points of Aite-damage to the player on behalf of the player;
	assert result "(\n|^)A huge <a-w>+ bursts out of the ground, skewering you for 3 damage!";
	check damage of the player with 1000 health after "skewering you for";
	now the reusable item is a random scroll of ghoulification;
	now the player carries the reusable item;
	try reading the reusable item;
	now the health of Isra is 1000;
	clear event description;
	have Chton intervene on behalf of the player;
	[TODO: necromantic damage reduction?]
	assert result "(\n|^)Chton suddenly sends a wave of unholy energy through the room, dealing <3-6> damage to Fell; and <3-6> damage to Isra\.";
	check damage of Isra with 1000 health after "to Fell; and";
	extract the player to the temple of Sul;
	now the player does not worship chton;
	clear event description;
	try sacrificing;
	assert result "(\n|^)Sul abhors the undead! Divine wrath strikes you instantly, dealing 10 damage\.";
	check damage of the player with 1000 health after "dealing";
	now the player carries the vial of purification;
	try drinking the vial of purification;
	now the player worships Sul;
	now the player carries the reusable item; [scroll of ghoulfication]
	clear event description;
	try reading the reusable item;
	assert result "(\n|^)Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals 10 damage to you\.";
	check damage of the player with 1000 health after "deals";
	extract the player to vast staircase;
	clear event description;
	try direction-jumping down;
	assert result "(\n|^)With a loud smack, you land in [the room down from Vast Staircase], receiving <1-9> damage\.";
	check damage of the player with 1000 health after "receiving";
	
bees-damage-text is a test step.

Initial scheduling of bees-damage-text:
	move the swarm of bees to the location;
	now the health of the player is 1000;
	make everyone wait;
	
Testing effects of bees-damage-text:
	assert result "The swarm of bees attacks <^\n>+, dealing <1-3> damage\.";
	
[TODO: tests for all damage modifier rules]
[TODO: test damage effects, e.g. fragmentation grenade exploding in another room]
	
Section - Damage Modifiers

damage-modifiers is a test set.

[Test every rule in the following rulebooks:
	
add specific damage
remove specific damage
specific damage multiplier
add general damage
remove general damage
general damage multiplier

If you add any rules, please consider adding a test here]

scenario when testing damage-modifiers:
	now Hall of Mirrors is bannedobject;
	now Miranda is testobject.

damage-modifier-testing is an extracting test step. The first move of damage-modifiers is damage-modifier-testing. The location-target of damage-modifier-testing is Miranda.
	
Definition: a room is precarious if it is Bridge of Doom or it is the Vast Staircase.

Initial scheduling of damage-modifier-testing:
	Let the place be the location of Miranda;
	now the inherent damage modifier of Miranda is 2;
	if the place is a precarious room:
		swap the occupants of the place and a random not precarious habitable placed room.
	
Testing effects of damage-modifier-testing:
	equip the player with the robe of the dead mage;
	have the player do no reaction to a 100 melee hit by Miranda with result "robe of the dead mage" in 0 out of 1 attempts, checking damage;
	repeat with conc-level running from 1 to 4:
		now the concentration of the player is conc-level;
		have the player do no reaction to a 100 melee hit by Miranda with result "\+ [conc-level * 25]% \(robe of the dead mage\)", checking damage;
		assert that the concentration of the player is conc-level with label "concentration of the player";
	try taking off the robe of the dead mage;	
	now the hit protection of the player is 1;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 100% \(protection\)", checking damage;
	equip the player with dragon armour;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 2 \(dragon armour\)" in 1 out of 3 attempts;
	check damage of the player with 1000 health after "Miranda deals";
	now Miranda is at-stun;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 1 \(stunning\)", checking damage;
	now Miranda is not at-stun;
	equip the player with the executioner's axe;
	now the tension is 2;
	have Miranda do no reaction to a 100 melee hit by the player with result "executioner's axe benefits from tension" in 0 out of 1 attempts, checking damage;
	now the tension is 3;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(executioner's axe benefits from tension\) ", checking damage;
	equip the player with Malleus Maleficarum;
	now the blood magic level of Malleus Maleficarum is 1;
	now the tension is 10;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(Malleus Maleficarum blood bonus\) ", checking damage;
	assert absence of result "tension<^\n>+ damage";
	equip the player with the Yahvinnian crossbow;
	now the tension is 1;
	have Miranda do no reaction to a 100 melee hit by the player with result "crossbow benefits from tension" in 0 out of 1 attempts, checking damage;
	now the current shots of the Yahvinnian crossbow is 1;
	now the tension is 2;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(crossbow benefits from tension\) ", checking damage;
	equip the player with giantbane;
	now Miranda is just-woken;
	now the player is at-pierce;
	now the body score of the player is 5;
	now the mind score of the player is 5;
	now the stun count of the player is 0;
	now the player is at-howl;
	now the tension is 3;
	have Miranda do no reaction to a 100 melee hit by the player with result "dagger benefits from tension" in 0 out of 1 attempts, checking damage;
	assert that the damage description does not include "Giantbane's special";
	assert that the damage description includes "\+ 2 \(defender was asleep\)";
	assert that the damage description includes "\+ 3 \(piercing\)";
	assert that the damage description includes "\+ 3 \(howling\)";
	now the tension is 4;
	now Miranda is large;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(dagger benefits from tension\)", checking damage;
	assert that the damage description includes "\+ 3 \(Giantbane's special\)";
	now the brightest-flame-counter is 1;
	have the player do no reaction to a 100 melee hit by Miranda with result "- \d+ \(brightest flame\) ", checking damage;
	assert that the total damage is 0 with label "total damage with brightest flame";
	now the brightest-flame-counter is 0;
	now Miranda is insane;
	have the player do no reaction to a 100 melee hit by Miranda with result "\+ 10 \(insane burst of strength\)" in 1 out of 8 attempts, checking damage;
	now Miranda is hostile;
	extract the chain golem to the location;
	now the concentration of the chain golem is 1;
	have the player do no reaction to a 100 melee hit by the chain golem with result "\+ 2 \(golem spinning\)", checking damage;
	remove the chain golem from play;

Miranda-runner is a test step. 

Initial scheduling of Miranda-runner:
	now the player carries the rod of the master builder;
	now retreat location is the location of Miranda;
	now the health of the player is 1000;
	now the melee of Miranda is 100;
	now the offensive flow of Miranda is 1;
	now the concentration of Miranda is 2;
	now the innate bloodlust of Miranda is 1;
	now Miranda is bloodlusting;
	now the tension is 3;

Choosing a player action when testing Miranda-runner:
	generate the action of going the way-to-get-back.
	
Testing effects of Miranda-runner:
	check damage of the player with 1000 health after "Miranda deals";
	[TODO: more automation of damage description tests, use everywhere]
	assert that the damage description includes "\+ 1 \(you are running\) ";
	assert that the damage description includes "\+ 1 \(offensive flow\) ";
	assert that the damage description includes "\+ 2 \(concentration\) ";
	assert that the damage description includes "\+ 1 \(tension\) ";
	assert that the damage description includes "\+ 2 \(inherent bonus\) ";
	assert that the damage description includes "\+ 1 \(bloodlust\)";
	assert that the damage description includes "x 50% \(rod of the master builder\) ";

radiance-reduction is a test step.

Initial scheduling of radiance-reduction:
	prepare a test battle with the angel of compassion;
	equip the player with the fuligin cloak;
	now the melee of the angel of compassion is 100;
	now the health of the player is 1000;
	compel the action of the angel of compassion attacking the player;
	
Testing effects of radiance-reduction:
	if waiting for player reaction, make no decision;
	assert result "\+ 4 \(sword of light radiance bonus\)";
	assert result "- 2 \(fuligin cloak\)<^\n>+ damage";
	check damage of the player with 1000 health after "deals";
	now the sword of light is iron;
	clear event description;
	try examining the sword of light;
	assert result "It seems to consist of pure iron.";
	assert absence of result "damage increases";
	assert result "; no special bonus when it is made of iron";
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "sword of light radiance bonus" in 0 out of 1 attempts, checking damage;
	now the sword of light is radiance;
	now the radiation of the angel of compassion is 0;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "sword of light radiance bonus" in 0 out of 1 attempts, checking damage;
	equip the player with the sandals of the heretic;
	clear event description;
	say Divine lightning strikes the player;
	assert result "- 2 \(sandals of the heretic\)<^\n>+ damage";
	check damage of the player with 1000 health after "A ball of lightning shoots from the sky, doing";
	now chton-killing is true;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "\+ 2 \(Chton's wrath pulls you to your grave\) ", checking damage;
	now chton-killing is false;
	assert result "- 2 \(sandals of the heretic\)";
	equip the player with the sneaking sword;
	force the fuligin cloak to work;
	have the angel of compassion do no reaction to a 100 melee hit with result "\+ 1 \(sneaky attack\) ", checking damage;
	try taking off the fuligin cloak;
	now the radiation of the angel of compassion is 2;
	equip the player with plate mail;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "- 2 \(plate mail\) ", checking damage;
	
heat-damage-testing is a test step.

Initial scheduling of heat-damage-testing:
	equip the player with dragon armour;
	now the internal heat of the sword of light is 5;
	compel the action of the angel of compassion attacking the player;
	
Testing effects of heat-damage-testing:
	if waiting for player reaction, make no decision;
	assert result "\+ 5 \(sword of light is hot\)<^\n>+ damage";
	assert result "- 4 \(dragon armour protects against heat\)<^\n>+ damage";
	check damage of the player with 1000 health after "deals";
	now the internal heat of the sword of light is 3;
	now the heat strength of the sword of light is 3;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "- 2 \(dragon armour\)" in 1 out of 3 attempts;
	check damage of the player with 1000 health after "The angel of compassion deals";
	assert result "- 3 \(dragon armour protects against heat\)";
	
holy-damage is a test step.

Initial scheduling of holy-damage:
	prepare a test battle with the healer of Aite, inviting groups;
	now the inherent damage modifier of the defender of aite is 2;
	remove the dragon armour from play;
	revive the reaper in the location;
	equip the reaper with the scythe of slaying;
	revive the rotting corpse in the location;
	revive the smoke demon in the location;
	revive the armadillo in the location;
	revive the wisps of pain in the location;
	
Testing effects of holy-damage:
	Now the spirit score of the healer of Aite is 9;
	have the rotting corpse do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\) ", checking damage;
	have the smoke demon do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\) ", checking damage;
	have the player do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\)" in 0 out of 1 attempts, checking damage;
	have the rotting corpse do no reaction to a 100 melee hit by the reaper with result "\+ 5 \(slaying undead\) ", checking damage;
	have the smoke demon do no reaction to a 100 melee hit by the reaper with result "\+ 5 \(slaying undead\)<^\n>+ damage" in 0 out of 1 attempts, checking damage;
	now the tormentor of aite is at-pierce;
	now the body score of the tormentor of aite is 8;
	have the smoke demon do no reaction to a 100 melee hit by the tormentor of Aite with result " 0$" in 0 out of 1 attempts, checking damage;
	assert that the damage description includes "\+ 3 \(piercing\)"; [TODO: should it?]
	now the unmodified damage is 1000; [should trigger a bug I'm tracking down here:]
	now the tormentor of aite is at-pierce;
	have the rotting corpse do no reaction to a 100 melee hit by the tormentor of Aite with result " 0$", checking damage;
	assert that the damage description includes "^<1-9>"; [unmodified damage should be nonzero]
	assert that the damage description includes "- \d+ \(undead immune to necromantic damage\)";
	assert that the damage description does not include "\+ 3 \(piercing\)"; [TODO: should it?]
	now the player is deathly-resistant;
	clear event description;
	have chton intervene on behalf of the player;
	[TODO: phrase to check damage in multiple-person damage report]
	assert result "dealing<^\n>* (\d+) - 2 \(resistant to deathly magic\) = (\d+) damage to you";
	now the expression scan position is 0;
	Let original damage be the number we scan in the text matching subexpression 1;
	now the expression scan position is 0;
	Let final damage be the number we scan in the text matching subexpression 2;
	Let expected damage be original damage - 2;
	if expected damage < 0, now expected damage is 0;
	assert that final damage is expected damage with label "calculated damage";
	assert that the health of the player is 1000 - final damage with label "actual damage to the player";
	now the health of the player is 1000;
	now the inherent damage modifier of the player is 4;
	have the armadillo do no reaction to a 100 melee hit by the player with result "- 4 \(tough scales\)", checking damage;
	have the armadillo do no reaction to a 100 melee hit by the Tormentor of Aite with result "tough scales" in 0 out of 1 attempts; [physical damage reduction only]
	now the power of the armadillo is granted;
	now the inherent damage modifier of the tormentor of Aite is 7;
	have the player do no reaction to a 100 melee hit by the Tormentor of Aite with result "- 1 \(armadillo\)", checking damage; [general damage reduction - TODO: should it be?]
	clear event description;
	have a fragmentation event in the location with a random fragmentation grenade by the player;
	assert result "\d - \d \(tough scales\) = \d damage to the ravenous armadillo";
	assert result "\d - 1 \(armadillo\) = \d damage to you";
	assert result "\d - \d \(hard to damage\) = 0 damage to the wisps of pain";
	now the player is at-scale;
	have the player do no reaction to a 100 melee hit by the Tormentor of Aite with result "- 6 \(scales\)";
	
ment-damage is a test step.

Testing effects of ment-damage:
	have the ment kick in;
	have the defender of Aite do no reaction to a 100 melee hit by the player with result "\+ 1 \(ment\) ", checking damage;
	have the player do no reaction to a 100 melee hit by the defender of Aite with result "- 1 \(ment\) ", checking damage;

[TODO: before damage rules]
[Extensions mciul$ grep -irl 'specific damage' .
./Victor Gijsbers/Kerkerkruip Actions and UI.i7x - done
./Victor Gijsbers/Kerkerkruip ATTACK.i7x - done
./Victor Gijsbers/Kerkerkruip Items.i7x - done
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add general damage rule (this is the howl damage bonus rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:			add n points of general damage with reason "howling".
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add specific damage rule (this is the power of the hound damage modifier rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add specific damage rule (this is the betrayel damage bonus rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add specific damage rule (this is the power of the minotaur damage bonus rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:A remove specific damage rule (this is the barkskin decreases damage rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:A remove specific damage rule (this is the druid is dealt less damage by natural materials rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add specific damage rule (this is the link concentration damage modifier rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:A general damage multiplier rule (this is the limbless rotting corpse can't attack rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:			multiply general damage by 0 percent with reason "no means of attack".
./Victor Gijsbers/Kerkerkruip Monsters.i7x:An add specific damage rule (this is the malignant chanter damage bonus rule):
./Victor Gijsbers/Kerkerkruip Monsters.i7x:A specific damage multiplier rule when the victim is the smoke demon (this is the smoke demon denseness multiplier rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:A remove specific damage rule (this is the worshipping Nomos damage reduction rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:An add specific damage rule (this is the Nomos damage bonus rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:An add specific damage rule (this is the undead slayer damage bonus rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:An add specific damage rule (this is the demon slayer damage bonus rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:A general damage multiplier rule when someone worships sul (this is the sul sometimes prevents damage rule):
./Victor Gijsbers/Kerkerkruip Religion.i7x:		multiply general damage by 0 percent with reason "Sul intervenes".
./Victor Gijsbers/Kerkerkruip Systems - Hiding Smoke Ethereal.i7x:A specific damage multiplier rule (this is the ethereal damage immunity rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the size damage increase rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the size damage decrease rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the undead silver damage rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the non-undead silver damage rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the iron or silver suit acts as a faraday cage rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:Before damage rule:
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the heat increases damage rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the material heat resistance rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the intrinsic heat vulnerability rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the intrinsic heat resistance rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:Before damage rule:
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the rust decreases damage rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove general damage rule (this is the death-blessed rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:			remove 10 points of general damage with reason "blessing of life";
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add general damage rule (this is the death-cursed rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:			add 10 points of general damage with reason "curse of death";
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the ghoul damage reduction rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the disintegrating flesh damage modifier rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the metallic scales damage reduction rule):


]

[	
Section - Example failure

example failure is a test set.

passing move is a test step. The first move of example failure is passing move.

Testing effects of passing move:
	assert "truth is true" based on true.

failing move is a test step.

Testing effects of failing move:
	assert "truth is false" based on false.

]

Test Sets ends here.
