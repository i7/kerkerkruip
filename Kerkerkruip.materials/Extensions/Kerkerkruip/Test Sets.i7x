Test Sets by Kerkerkruip begins here.

Use authorial modesty.

Volume - All Test Sets (not for release)

Include Automated Testing by Kerkerkruip.

Book - Tests

Chapter - aite champions vs mindbat

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
aite champions vs mindbat	0	1	restarting for tests
player-targeted	1	0	--
spike-flyer	1	0	player-targeted
player-missed	1	0	player-targeted
player-damaged	1	0	player-targeted
bat crashing into spike	1	0	player-damaged
bat avoiding huge spike	1	0	player-missed
bat avoiding gigantic spike	1	0	player-missed
Arena-tormentor-enslaving	1	0	--
arena-tormentor-damaged	1	0	arena-tormentor-enslaving
arena-tormentor-killed	1	0	arena-tormentor-enslaving
tormentor-killed-only-once	1	1	arena-tormentor-killed

Scenario rule for aite champions vs mindbat:
	now mindslug is testobject;
	now Hall of Gods is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Chton is testobject;

Regular scheduling of aite champions vs mindbat:
	[TODO: Why doesn't this interrupt text capture when doing it from the killing rules does?]
	update the monster statistics;
	now the player carries Drakul's lifeblood;
	have the player worship Chton with 4 favour;
	extract the player to the location of the mindslug;
	have the player defeat the mindslug;
	now the mind score of the player is 200;
	extract the player to Hall of Gods;
	have the player and the healer of aite fight in Arena of the Gods;
	try drinking Drakul's lifeblood;
	try turning bat;

regular scheduling of player-targeted:
	repeat with guy running through people in the location:
		now health of guy is 1000;
	compel the action of waiting;

First intervention possible when testing aite champions vs mindbat:
	unless testing player-targeted, rule fails;
	unless the main actor is the player and intervention-god is Aite, rule fails;

Intervention bonus when testing player-targeted:
	if the main actor is the player, increase the intervention-bonus by 100;

testing effects of player-targeted: if we assert result "bursts out of the ground<^\n>+ you", rule succeeds.
testing effects of spike-flyer: if we assert result "bursts out of the ground in front of you", rule succeeds.
testing effects of player-missed: if the health of the player is 1000, rule succeeds.
testing effects of player-damaged: if the health of the player is less than 1000, rule succeeds.
testing effects of bat crashing into spike: if we assert result "crash into", rule succeeds.
testing effects of bat avoiding huge spike: if we assert result "huge <a-z>+ bursts out of the ground in front of you", rule succeeds.
testing effects of bat avoiding gigantic spike: if we assert result "gigantic <a-z>+ bursts out of the ground in front of you", rule succeeds.

Initial scheduling of Arena-tormentor-enslaving:
	now the health of the tormentor of Aite is the permanent health of the tormentor of Aite;

Regular scheduling of Arena-tormentor-enslaving:
	now enslave-cooldown is 0;
	compel the action of enslaving the tormentor of Aite.

testing effects of Arena-tormentor-enslaving:
	assert result "will do your bidding";
	if we assert result "ball of lightning .* damage to the tormentor of Aite", rule succeeds.

Testing effects of Arena-tormentor-damaged:
	if the tormentor of Aite is not alive, make no decision;
	assert "tormentor should oppose the player" based on whether or not the tormentor of Aite opposes the player;
	if we assert result "The tormentor of Aite prostrates herself. 'I beg for your mercy, O great Aite,' she prays. Then she rises to fight you again!", rule succeeds;

testing effects of Arena-tormentor-killed:
	if the tormentor of Aite is dead, rule succeeds;

testing effects of tormentor-killed-only-once:
	assert result ", killing her";
	if we assert absence of result "killing her.*killing her", rule succeeds.

Section - Enslaving the Defender

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
Defender-enslaving	1	1
defender-re-enslaving	1	1

initial scheduling of Defender-enslaving:
	try turning human;
	now the player worships Sul;
	now the favour of the player is 4; [not sure if this is really important]
	have the player defeat the healer of Aite;
	now the health of Defender of Aite is 100;

regular scheduling of an outcome (called event):
	if event is defender-enslaving or event is defender-re-enslaving:
		now enslave-cooldown is 0;
		compel the action of enslaving the defender of Aite.

testing effects of defender-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite";
	assert result "The defender of Aite prostrates himself. 'I beg for your mercy, O great Aite,' he prays. Then he rises to fight you again!";
	if the defender of Aite opposes the player, rule succeeds;

regular scheduling of defender-re-enslaving:
	now the health of Defender of Aite is 1;
	now the health of the player is 1;
	now the permanent health of the player is 100;

testing effects of defender-re-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite, killing him";
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert "the defender of Aite should be off-stage" based on whether or not defender of Aite is off-stage;
	if the health of the player is 100, rule succeeds;

Chapter - Chton Champion vs Bat

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
Chton champion vs bat	0	1	--	restarting for tests
herm-arena-bonus	1	1	--	--
arena-vampire-joining	1	1	--	--
herm-ally-summoning	1	1	"try reading"	--
summoned-drakul-opponent	1	1	--	--
chton-arena-cheating	1	1	--	--

scenario rule for Chton champion vs bat:
	now Hall of Gods is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Herm is testobject;
	now the reusable item is a random scroll of summoning;

initial scheduling of herm-arena-bonus:
	now the player carries Drakul's lifeblood;
	have the player worship Herm with 4 favour;
	extract the player to Hall of Gods;

regular scheduling of herm-arena-bonus: have the player and Drakul fight in Arena of the Gods;
testing effects of herm-arena-bonus: if we assert result "grants you 2 divine favour![line break][line break]Herm gifts you <^\n>+; and increases your hiding bonus to \+2\.[line break][line break]You are transported to the Arena of the Gods, where the angry Drakul awaits, preparing himself to", rule succeeds;

regular scheduling of arena-vampire-joining: compel the action of drinking Drakul's lifeblood.
testing effects for arena-vampire-joining: if we assert result "You turn into a vampire, but your opponent doesn't care", rule succeeds.

Initial scheduling of herm-ally-summoning:
	update the combat status;
	assert that the combat status is combat;

testing effects of herm-ally-summoning: if the monster summoned does not oppose the player, rule succeeds.
testing effects of summoned-drakul-opponent: if the monster summoned opposes drakul, rule succeeds.

Regular scheduling of chton-arena-cheating:
	Now the health of the player is 1;
	Now the permanent health of the player is 100;
	compel the action of smiting drakul.

testing effects for chton-arena-cheating:
	[should the lifeblood appear a second time just because drinking it removes it from play?]
	assert result ["infamous vampire, who crumbles away into ashes"] "infamous vampire, a small vial";
	assert result "receives the blood";
	assert that the health of the player is 33;
	assert result "transported back to the Hall of the Gods";
	assert that the location of the monster summoned is Hall of Gods;
	assert that drakul's lifeblood is in Hall of Gods;
	rule succeeds.

Chapter - Parting Shots

Section - Basic Behavior

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
parting shots	0	1	restarting for tests
mindslug-hiding-check	1	1	--
mindslug-hidden-retreat	1	1	--
mindslug-hidden-runner	1	1	--
mindslug-reveal	1	1	--
mindslug-retreat	1	1	--
mindslug-runner	1	1	--
mindslug-sleeper-runner	1	1	--

[TODO: ignore testobject choices from file when running automated tests]

scenario for parting shots:
	prevent sleeping;
	now generation info is true;
	now israfel is testobject;
	now mindslug is testobject;
	now armadillo is testobject.

The wake people when fighting rule does nothing when testing parting shots.
The asleep rule does nothing when testing parting shots. [why?]
independent action when testing parting shots: rule fails.

initial scheduling of parting shots:
	Travel sneakily to the location of the mindslug;
	now the defence of the player is 100;

Testing effects of mindslug-hiding-check:
	assert that the mindslug is in the location;
	assert that fafhrd is in the location;
	assert that mouser is in the location;
	assert that the combat status is combat;
	if the player is hidden, rule succeeds.

regular scheduling of mindslug-hidden-retreat: compel the action of retreating.

testing effects for mindslug-hidden-retreat:
	assert that the hitting count of mindslug is 0 with label "hitting count of mindslug";
	assert that the hitting count of fafhrd is 0 with label "hitting count of fafhrd";
	assert that the hitting count of mouser is 0 with label "hitting count of mouser";
	rule succeeds.

initial scheduling of mindslug-hidden-runner: extract the player to the location of the mindslug.

regular scheduling of mindslug-hidden-runner: compel the action of going way-to-get-back.
testing effects for mindslug-hidden-runner:
	assert that the hitting count of mindslug is 0 with label "hitting count of mindslug";
	assert that the hitting count of fafhrd is 0 with label "hitting count of fafhrd";
	assert that the hitting count of mouser is 0 with label "hitting count of mouser";
	rule succeeds.

Initial scheduling for mindslug-reveal: try going way-to-get-there.
regular scheduling of mindslug-reveal: compel the action of taking off the fuligin cloak.
Testing effects of mindslug-reveal: if the player is not hidden, rule succeeds.

regular scheduling of mindslug-retreat:
	now mindslug presses the player;
	now concentration of mindslug is 0;
	now fafhrd does not press the player;
	now concentration of fafhrd is 1;
	now mouser does not press the player;
	now concentration of mouser is 0;
	compel the action of retreating.

testing effects for mindslug-retreat:
	assert that the hitting count of mindslug is 1 with label "hitting count of mindslug";
	assert that the hitting count of fafhrd is 1 with label "hitting count of fafhrd";
	assert that the hitting count of mouser is 0 with label "hitting count of mouser";
	if we assert result "bravely run away", rule succeeds.

Initial scheduling of mindslug-runner:
	extract the player to the location of the mindslug;
	now retreat location is the location of the mindslug;

regular scheduling of mindslug-runner: compel the action of going the way-to-get-back.

testing effects for mindslug-runner:
	assert that the hitting count of mindslug is 1 with label "hitting count of mindslug";
	assert that the hitting count of fafhrd is 1 with label "hitting count of fafhrd";
	assert that the hitting count of mouser is 1 with label "hitting count of mouser";
	if we assert result "run past your enemies", rule succeeds.

initial scheduling of mindslug-sleeper-runner:
	extract the player to the location of the mindslug;
	now retreat location is the location of the mindslug;
	now fafhrd is asleep;
	
regular scheduling of mindslug-sleeper-runner: compel the action of going the way-to-get-back.

testing effects for mindslug-sleeper-runner:
	assert that the hitting count of mindslug is 1 with label "hitting count of mindslug";
	assert that the hitting count of fafhrd is 0 with label "hitting count of fafhrd";
	assert that the hitting count of mouser is 1 with label "hitting count of mouser";
	if we assert result "run past your enemies", rule succeeds.

Section - Israfel's Parting Shots

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
fell-freezing	0	1
frozen-fell-fleeing	1	1
israfel-rejoining	1	0
israfel-resplitting	1	1
unfrozen-fell-fleeing	1	1

Initial scheduling of fell-freezing:
	travel sneakily to the location of israfel;
	try taking off the fuligin cloak;
	now the health of israfel is 1000;
	try israfel israfel-splitting.

regular scheduling of fell-freezing:
	now Fell presses the player;
	compel the action of Fell israfel-reuniting.

regular scheduling of frozen-fell-fleeing: compel the action of retreating.

testing effects of frozen-fell-fleeing:
	assert that israfel-reuniting-initiator is Fell with label "the reuniting initiator";
	if we assert that the hitting count of Fell is 0, rule succeeds.

regular scheduling of israfel-rejoining:
	if the attempt count of israfel-rejoining is 0:
		compel the action of going the way-to-get-there;
	otherwise:
		compel the action of waiting.

testing effects of israfel-rejoining: if we assert that the location of Israfel is the location, rule succeeds.

regular scheduling of israfel-resplitting: compel the action of israfel israfel-splitting.
Testing effects of israfel-resplitting: if israfel is off-stage, rule succeeds.

initial scheduling of unfrozen-fell-fleeing: now fell presses the player.
regular scheduling of unfrozen-fell-fleeing: compel the action of retreating.
testing effects of unfrozen-fell-fleeing: if we assert that the hitting count of Fell is 1 with label "hitting count of Fell", rule succeeds.

Chapter - Angel of Mercy Parting Shots

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	label	antecedent
mercy parting shots	1	0	10	--	restarting for tests
long-path-to-angel	1	0	--	--	mercy parting shots
run-gargantuan-angel	1	1	--	"mercy run"	--
dig-gargantuan-angel	1	1	--	--	--
retreat-gargantuan-angel	1	1	--	"mercy retreat"	--
gohome-gargantuan-angel	1	1	--	"mercy home"	--
nothome-gargantuan-angel	1	1	--	"mercy home"	--
retreatless-gargantuan-angel	1	1	--	"mercy retreat"	--
run-medium-angel	1	1	50	"mercy run"	--
angel-obstruct-unhurt	1	0	--	--	run-medium-angel
aou-text	1	1	--	--	angel-obstruct-unhurt
angel-escape-unhurt	1	0	--	--	run-medium-angel
aeu-text	1	1	--	--	angel-escape-unhurt
angel-obstruct-burn	1	0	--	--	run-medium-angel
aob-text	1	1	--	--	angel-obstruct-burn
angel-escape-burn	1	0	--	--	run-medium-angel
aeb-text	1	1	--	--	angel-escape-burn

[TODO: tiny player escape gargantuan angel]

[TODO: Refactor into normal parting shots rules]

Scenario for mercy parting shots:
	prevent sleeping;
	now generation info is true;
	now pickaxe-kit is testobject;
	ban wandering monsters;
	ban faculty modifiers;
	now bridge of doom is bannedobject; [can't collapse connection]
	now vast staircase is testobject; [guaranteed to have 2 exits];
	now angel of mercy is testobject;

mercy-retreat-place is a room that varies.
mercy-way-from-entrance is a direction that varies.
mercy-retreat-way is a direction that varies.
mercy-run-way is a direction that varies.
mercy-dig-way is a direction that varies.
	
regular scheduling of mercy parting shots:
	extract the angel of mercy to Vast Staircase, making sure it is unoccupied;
	travel sneakily to Vast Staircase;
	try taking off the fuligin cloak;
	now mercy-retreat-way is the best route from the location to retreat location;
	now mercy-retreat-place is retreat location;
	now mercy-run-way is up;
	if mercy-run-way is mercy-retreat-way, now mercy-run-way is down;
	now mercy-dig-way is a random diggable direction;
	now the health of the player is 1000;

[TODO: use map approval rules instead?]

testing effects of mercy parting shots:
	assert "mercy-retreat-way should be a direction" based on whether or not mercy-retreat-way is a direction;
	assert "mercy-run-way should be a direction" based on whether or not mercy-run-way is a direction;
	if mercy-dig-way is a direction, rule succeeds.

testing effects of long-path-to-angel:
	[force the dungeon to regenerate unless the path between Entrance Hall and Staircases is long enough for our tests]
	Let way be the best route from Entrance Hall to Vast Staircase;
	Let waypoint be the room way from Entrance Hall;
	unless waypoint is Vast Staircase, rule succeeds.

regular scheduling of an outcome labeled "mercy run": compel the action of going mercy-run-way.
testing effects of an outcome (called event):
	if the event is labeled "mercy run" or the event is dig-gargantuan-angel:
		if we assert result "The Angel of Mercy cries out, 'Do not pass!' and moves to block your escape.<\n\s>+You attempt to get by", rule succeeds.

First testing effects of a test step when testing mercy parting shots:
	assert "no grappling allowed at the end of the turn" based on whether or not the angel of mercy does not grapple the player.

regular scheduling of dig-gargantuan-angel: compel the action of digging mercy-dig-way.

initial scheduling of retreat-gargantuan-angel:
	extract the player to Vast Staircase;
	now concentration of the angel of mercy is 3;
	now angel of mercy presses the player;

regular scheduling of retreat-gargantuan-angel: compel the action of going mercy-retreat-way.
testing effects of an outcome (called event):
	if event is labeled "mercy retreat" or event is gohome-gargantuan-angel:
		assert that the hitting count of the angel of mercy is 0 with label "angel of mercy hitting count";
		assert absence of result "block your escape";
		if we assert that the location is mercy-retreat-place, rule succeeds.

initial scheduling of an outcome labeled "mercy home":
	extract the player to Vast Staircase;
	now retreat location is Vast Staircase;
	if the best route from the location to Entrance Hall is a direction:
		now mercy-retreat-way is the best route from the location to Entrance Hall;
		now mercy-retreat-place is the room mercy-retreat-way from the location.
	
regular scheduling of gohome-gargantuan-angel: compel the action of going mercy-retreat-way.
first testing effects of gohome-gargantuan-angel: assert absence of result "foolish adventurer".

regular scheduling of nothome-gargantuan-angel: compel the action of going mercy-run-way.
testing effects of nothome-gargantuan-angel:
	assert that the location is Vast Staircase;
	assert that the hitting count of the angel of mercy is 1 with label "angel of mercy hitting count";
	if we assert result "The Angel of Mercy cries out, 'Do not pass!' and moves to block your escape\. You attempt to get by, but the angel is just too big\.", rule succeeds.
	
initial scheduling of retreatless-gargantuan-angel:
	extract the player to Entrance Hall;
	now the player carries the rod of the master builder;
	now mercy-way-from-entrance is the best route from Entrance Hall to Vast Staircase;
	Let way be an object;
	now way is mercy-way-from-entrance;
	while way is a direction:
		try collapsing way;
		if way is the best route from Entrance Hall to Vast Staircase:
			assert "Failed to collapse [way] from Entrance Hall to [the room way from Entrance Hall]" based on false;
			break;
		now way is the best route from Entrance Hall to Vast Staircase;
	remove the rod of the master builder from play;
	extract the player to Vast Staircase;
	now mercy-retreat-place is the room mercy-run-way from Vast Staircase.

regular scheduling of retreatless-gargantuan-angel: compel the action of going mercy-run-way.
First testing effects of retreatless-gargantuan-angel: assert result "foolish adventurer".

Initial scheduling of run-medium-angel:
	extract the player to Entrance Hall;
	try digging mercy-way-from-entrance; [reconnect]
	now the angel of mercy is medium;
	now radiation of the angel of mercy is 3;

regular scheduling of run-medium-angel:
	extract the player to Vast Staircase;
	now the health of the player is 100;
	now the body score of the player is 6.

testing effects of angel-obstruct-unhurt:
	if we assert that the location is Vast Staircase and we assert that the health of the player is 100, rule succeeds.
testing effects of aou-text:
	if we assert result "You attempt to get by without being burned. You roll \d+ \+ 6 \(body\) = \d+ against a target number of \d+, succeeding at the body check\. You are unhurt! Unfortunately, you were unable to escape", rule succeeds.
	
testing effects of angel-obstruct-burn:
	if we assert that the location is Vast Staircase and the health of the player < 100, rule succeeds.
testing effects of aob-text:
	if we assert result "You attempt to get by without being burned. You roll \d+ \+ 6 \(body\) = \d+ against a target number of \d+, failing the body check\. The angel's searing body burns you for \d+ damage\.\n\nUnfortunately, you were unable to escape\.", rule succeeds.

testing effects of angel-escape-unhurt:
	if we assert that the health of the player is 100 and the location is not Vast Staircase, rule succeeds.
testing effects of aeu-text:
	if we assert result "You attempt to get by without being burned\. You roll \d+ \+ 6 \(body\) = \d+ against a target number of \d+, succeeding at the body check\. You are unhurt, and you escape as well!", rule succeeds.
	
testing effects of angel-escape-burn:
	if the health of the player < 100 and the location is not Vast Staircase, rule succeeds.
testing effects of aeb-text:
	if we assert result  "You attempt to get by without being burned. You roll \d+ \+ 6 \(body\) = \d+ against a target number of \d+, failing the body check\. The angel's searing body burns you for \d+ damage\.\n\nYou escape anyway!", rule succeeds.

Chapter - Retreating from the Tentacle

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
tentacle-grab	0	1	restarting for tests
tentacle-retreat	1	1	--
tentacle-dig-retreat	1	1	--

Scenario for tentacle-grab:
	prevent sleeping;
	Now the giant tentacle is testobject;
	now the fuligin cloak is testobject;
	now the hall of mirrors is bannedobject;
	Now the pickaxe is testobject;
	Now every not connectable room is bannedobject; [the bridge of doom stops digging]

initial scheduling of tentacle-grab:
	now the player carries the pickaxe;
	Travel sneakily to the location of the tentacle;

initial scheduling of tentacle-retreat:
	try taking off the fuligin cloak;
	now the health of the player is 1000;
	now the defence of the player is 0.

regular scheduling of tentacle-retreat: compel the action of retreating.

Initial scheduling for tentacle-retreat:
	now tentacle presses the player;
	now concentration of tentacle is 3;
	now the melee of the tentacle is 50;
	now the health of the player is 100;

testing effects for tentacle-retreat:
	assert result "bravely run away";
	assert that the hitting count of tentacle is 1 with label "hitting count of tentacle";
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
	if the tentacle is in the location, rule succeeds.

initial scheduling for tentacle-dig-retreat: now the tentacle does not grapple the player.
regular scheduling of tentacle-dig-retreat: compel the action of digging a random diggable direction.

testing effects for tentacle-dig-retreat:
	assert result "magically create a tunnel";
	assert that the hitting count of tentacle is 1 with label "hitting count of tentacle";
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
	if the tentacle is in the location, rule succeeds.

Chapter - Insane Drakul

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
insane-drakul	0	1	restarting for tests
drakul-mild-concentration	1	1	--
drakul-med-concentration	1	1	--
drakul-max-concentration	1	1	--
Driving Drakul insane	1	1	--
insane-mild-concentration	1	1	--
insane-med-concentration	1	1	--
insane-max-concentration	1	1	--

Scenario for insane-drakul:
	Now drakul's lifeblood is bannedobject;
	Now drakul is testobject;

Initial scheduling of insane-drakul:
	now the mind score of the player is 100;
	extract the player to the location of drakul;
	equip the player with the staff of insanity;
	while the size of the staff of insanity is less than medium:
		increase the size of the staff of insanity;

Regular scheduling of an outcome (called event):
	if event is drakul-mild-concentration or event is drakul-med-concentration or event is drakul-max-concentration or event is insane-mild-concentration or event is insane-med-concentration or event is insane-max-concentration:
		try Drakul concentrating;

Testing effects of drakul-mild-concentration: if we assert result "Drakul smiles a little wider", rule succeeds.

Testing effects of drakul-med-concentration: if we assert result "'There is no need to fear me,' Drakul says as he concentrates more deeply\.", rule succeeds.

Testing effects of drakul-max-concentration: if we assert result "Drakul attains the highest state of concentration. 'It feels so good to be alive!'", rule succeeds.

Regular scheduling of driving drakul insane: do the action of Drakul waiting for a 100 melee hit by the player.
Testing effects of driving drakul insane: if we assert result "Drakul goes insane", rule succeeds.

Initial scheduling of insane-mild-concentration:
	if there is a held achievement of Blood never lies in the Table of Held Achievements:
		do nothing;
		[this causes a glk error:
		choose row with held achievement of Blood never lies in the Table of Held Achievements;
		blank out the whole row;]
	now the concentration of drakul is 0;

Testing effects of insane-mild-concentration: if we assert result "Drakul smiles a little wider", rule succeeds.

Testing effects of insane-med-concentration: if we assert result "'An insane vampire always tells the truth\. And I tell you: You should fear me!' Drakul says as he concentrates more deeply.", rule succeeds.

Testing effects of insane-max-concentration: if we assert result "Drakul attains the highest state of concentration\. 'It feels so good to be alive - but I am undead!'", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
drakul statement	1	1	200	--
drakul identity	1	0	--	drakul statement
simple drakul identity	1	0	--	drakul identity
drakul conditional	1	0	--	drakul statement
double conditional	1	0	--	drakul conditional
nested conditionals	1	0	--	double conditional
nested belief	1	0	200	drakul statement
lifeblood-hinting	1	0	--	drakul statement
lifeblood-location	1	0	--	lifeblood-hinting
vampire-turning-hinting	1	0	--	drakul statement
Drakul suicide	1	1	--	--

Regular scheduling of drakul statement: try Drakul waiting.

Testing effects of drakul statement:
	if we assert result "Drakul says, '(<^'\n>*)":
		now the event description is the text matching subexpression 1;
		rule succeeds.

testing effects of drakul identity: if we assert result "I am .+ (vampire|insane)", rule succeeds.
testing effects of simple drakul identity: if we assert absence of result "not|someone who|, and|, or", rule succeeds.
testing effects of drakul conditional: if we assert result "^If .*,", rule succeeds.
testing effects of double conditional: if we assert result "I would give you", rule succeeds.
testing effects of nested conditionals: if we assert result ", if|, and|, or", rule succeeds.
testing effects of nested belief: if we assert result "I believe that I believe", rule succeeds.
testing effects of lifeblood-hinting: if we assert result "a vial of my lifeblood\b", rule succeeds.
testing effects of lifeblood-location: if we assert result "I am carrying| is in | can be found | is currently unreachable, ", rule succeeds.
testing effects of vampire-turning-hinting: if we assert result "\bI intend to vanquish Malygris after I make you my vampire-slave\b|\byou will never be my vampire-slave\b", rule succeeds.

	[this doesn't compile:
	assert "Blood never lies achievement should be held" based on whether not there is a held achievement of Blood never lies in the Table of Held Achievements;]

Initial scheduling of drakul suicide:
	now the health of drakul is 1;
	now the melee of drakul is 100;

regular scheduling of drakul suicide: try drakul hitting drakul.
Testing effects of drakul suicide: if we assert result "drains his own blood, a small vial", rule succeeds.

Chapter - Dreadful Presence

[E91A270C9962]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
dreadful-presence-test	0	1	--	restarting for tests
player-presence	1	1	1	dreadful-presence-test
ape-only-cowering	0	1	200	--
ape-cower1	21	100	100	ape-only-cowering
toad-cower1	0	20	--	ape-only-cowering
player-cower1	0	20	--	ape-only-cowering
insane-player-cowering	0	1	200	--
ape-cower2	21	100	100	insane-player-cowering
toad-cower2	0	20	--	insane-player-cowering
player-cower2	6	25	100	insane-player-cowering

[To decide which number is the target cower percentage of (guy - a person):
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

blood ape: (dreadful presence 2) * 12 - (level 1 *3) = 21
insane player: (dreadful presence 2) * 12 - (level 0 * 3) = 24]

Scenario for Dreadful-Presence-Test:
	prevent sleeping;
	block interventions;

regular scheduling of Dreadful-Presence-Test:
	repeat with guy running through people:
		now the defence of guy is 100;
	now the mind score of the player is 10;
	now the player worships Nomos;
	raise the favour of the player to 9;
	try wearing the gown of the red court;
	try readying the malleus;
	prepare a test battle with the blood ape;
	revive the zombie toad in the location;

Testing effects of player-presence: if we assert that the dreadful presence of the player is 2, rule succeeds;

To decide which object is the cowerer of (event - an outcome):
	if event is ape-cower1 or event is ape-cower2:
		decide on the blood ape;
	if event is toad-cower1 or event is toad-cower2:
		decide on the zombie toad;
	if event is player-cower1 or event is player-cower2:
		decide on the player;
	decide on nothing;

Definition: an outcome is cower-counter if the cowerer of it is a person;

regular scheduling of an outcome (called event):
	if event is ape-only-cowering or event is insane-player-cowering:
		now the health of the player is 1000;
		now the health of the blood ape is 1000;
		now the health of the zombie toad is 1000;

regular scheduling of a cower-counter outcome (called event): wait for the cowerer of event to act freely;

testing effects of a cower-counter outcome (called the event) (this is the cower counting rule):
	if we assert result "[The main actor] [cower] before your dreadful presence", rule succeeds;

initial scheduling of insane-player-cowering: now the player is insane.

Chapter - Sul Champion vs Herm worshipper

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
Sul Champion vs Herm worshipper	0	1	restarting for tests
player-defended-by-herm	1	0	--
israfel-undamaged	1	0	--
israfel-defended-by-sul	1	0	israfel-undamaged
isra-undamaged	1	0	--
isra-defended-by-sul	1	0	isra-undamaged

[TODO: figure out actual probabilities of interventions]

A scenario rule for Sul Champion vs Herm worshipper:
	now Hall of Gods is testobject;

Regular scheduling of player-defended-by-herm: do the action of waiting for a 100 melee hit by Israfel.
Testing effects of player-defended-by-herm: if we assert result "Herm bends space and time around you and Israfel, and you suddenly find yourself in the role of attacker!", rule succeeds.

[TODO: check that a hit actually took place, try to produce a Herm intervention for another person]
Initial scheduling of Sul Champion vs Herm worshipper:
	now the player worships Herm;
	equip the player with the gilded rapier; [not the evil dagger!]
	raise the favour of the player by 4;
	have the player and Israfel fight in Arena of the Gods;

Regular scheduling of israfel-undamaged: do the action of israfel waiting for a 100 melee hit by the player.
Testing effects of israfel-undamaged: if we assert 0 damage to israfel after "You deal", rule succeeds.
Testing effects of israfel-defended-by-sul: if we assert result "\(Sul intervenes\)", rule succeeds.

Initial scheduling of isra-undamaged: try Israfel israfel-splitting.
Regular scheduling of isra-undamaged: do the action of Isra waiting for a 100 melee hit by the player.
Testing effects of isra-undamaged: if we assert 0 damage to Isra after "You deal", rule succeeds.
Testing effects of isra-defended-by-sul: if we assert result "\(Sul intervenes\)", rule succeeds.


Chapter - Bug 210

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-210	0	1	restarting for tests
reaction-mindslug-killing	1	1	--
mindslug-soul-revival	1	1	reaction-mindslug-killing

scenario for bug-210: now the reusable item is a random scroll of death.

Initial scheduling of bug-210:
	prepare a test battle with the mindslug, inviting groups;
	now the health of the mindslug is 1;
	now the weapon damage bonus of the claymore is 100;
	now the melee of Fafhrd is 100;

Testing effects of bug-210:
	assert "fafhrd should carry the claymore" based on whether or not fafhrd carries the claymore;
	assert "the claymore should be readied" based on whether or not the claymore is readied;
	assert "fafhrd should only have one weapon readied" based on whether or not the number of readied weapons enclosed by fafhrd is 1;

regular scheduling of reaction-mindslug-killing: compel the action of reading the reusable item as a reaction to fafhrd.

[TODO: make sure the mindslug is alive before the reaction?]

testing effects of reaction-mindslug-killing: if the mindslug is dead, rule succeeds.

testing effects of mindslug-soul-revival: if we assert result "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face.*As the mindslug dies, you feel its powerful intelligence absorbed into your own body", rule succeeds.

Chapter - Reward in Arena of the Gods

[for issue #228]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
divine reward	0	1	restarting for tests
isra-only-killing	1	1	--
fell-also-killing	1	1	--

scenario for divine reward:
	now Temple of Nomos is testobject;
	now Hall of Gods is testobject;
	now the glass cannon is testobject;
	block interventions;

Initial scheduling of divine reward:
	equip the player with the glass cannon;
	now the defence of the player is 100;
	now the player worships Nomos;
	raise the favour of the player by 4;
	extract the player to Hall of Gods;
	have the player and Israfel fight in Arena of the Gods;
	now the health of the player is the permanent health of the player - 1;
	try Israfel Israfel-splitting;

Regular scheduling of isra-only-killing:
	now fell is asleep;
	compel the action of smiting isra.

first testing effects of an outcome (called the current move) when testing divine reward:
	assert "Nomos counter should be zero on [the outcome described]" based on whether or not the nomos counter is zero;
	assert "Nomos bonus should be false on [the outcome described]" based on whether or not the nomos bonus is false;

testing effects of isra-only-killing:
	assert "Isra should be dead" based on whether or not Isra is dead;
	assert "Fell should be alive" based on whether or not Fell is not dead;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	assert absence of result "Nomos receives .* and fully heals you";
	rule succeeds.

regular scheduling of fell-also-killing: compel the action of smiting fell.

testing effects of fell-also-killing:
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert absence of result "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player;
	assert "the glass cannon should still be carried" based on whether or not the player carries the glass cannon;
	assert "the glass cannon should still be readied" based on whether or not the glass cannon is readied;
	rule succeeds.

Chapter - Temporary Blood Magic from Nomos

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
temporary Nomos blood magic	0	1	restarting for tests
gown-gift-in-combat	1	1	--
hood-gift-in-combat	1	1	--
unfed-hood-description	1	1	--
unfed-hood-power	1	1	--
concentrated-hood-feeding	1	1	--
still-concentrated-with-hood	1	1	--
fed-hood-description	1	1	--
fed-hood-power	1	1	--

Scenario for temporary Nomos blood magic:
	ban faculty modifiers;
	now the swarm of daggers is testobject;
	now the Temple of Nomos is testobject;
	now columnated ruins is bannedobject;
	ban wandering monsters;
	now everything is not cursed;
	block interventions;

The tnbm-number is a number that varies.

To decide what number is the chance of (guy - a person) remaining concentrated:
	let the previous defender be the global defender;
	now the global defender is guy;
	now the remain concentrated chance is 0;
	follow the remain concentrated rules;
	now the global defender is previous defender;
	decide on the remain concentrated chance.

Initial scheduling of temporary Nomos blood magic:
	now every room is not rust-spored;
	now the health of the player is 1000;
	now the defence of the player is 50;
	now the power of Bodmall is granted;
	extract the player to the temple of nomos, making sure it is unoccupied;
	extract the swarm of daggers to the temple of nomos;

regular scheduling of temporary Nomos blood magic: have the player sacrifice a random granted power.
testing effects of gown-gift-in-combat: if the player carries the gown of the red court, rule succeeds.
testing effects of hood-gift-in-combat: if the player carries the inquisitor's hood, rule succeeds.

regular scheduling of an outcome (called event):
	if event is unfed-hood-description or event is fed-hood-description:
		try examining the inquisitor's hood.

testing effects of unfed-hood-description: if we assert result "This particular one gives you a \+20% chance of remaining concentrated when damaged\. It also allows you to maintain concentration when paying blood magic costs\. Feeding 5 blood to the hood will temporarily add 15% to the chance of remaining concentrated", rule succeeds.

regular scheduling of unfed-hood-power:
	now tnbm-number is the chance of the player remaining concentrated;
	equip the player with the inquisitor's hood.

testing effects of unfed-hood-power: if we assert that (the chance of the player remaining concentrated - tnbm-number) is 20, rule succeeds.

initial scheduling of concentrated-hood-feeding: try concentrating.
regular scheduling of concentrated-hood-feeding: try feeding the inquisitor's hood.
testing effects of concentrated-hood-feeding: if we assert result "You feed 5 health to the inquisitor's hood, increasing its power \(maintaining concentration\)!", rule succeeds.

testing effects of still-concentrated-with-hood: if we assert that the concentration of the player is 1 with label "player's concentration", rule succeeds.

testing effects of fed-hood-description: if we assert result "This particular one gives you a \+35% chance of remaining concentrated when damaged\. It also allows you to maintain concentration when paying blood magic costs\. Feeding 10 blood to the hood will temporarily add 15% to the chance of remaining concentrated", rule succeeds.

testing effects of fed-hood-power: if we assert that (the chance of the player remaining concentrated - the tnbm-number) is 35 with label "concentration bonus of the inquisitor's hood after one feeding", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
unworn-fed-gown	1	1
fed-gown-description	1	1
dreadless-unworn-gown	1	1
dreadful-worn-gown	1	1
second-gown-feeding	1	1

initial scheduling of unworn-fed-gown:
	try taking off the inquisitor's hood;
	try feeding the gown of the red court;
	Now the tnbm-number is the blood timer of the gown of the red court;

testing effects of unworn-fed-gown: if we assert that tnbm-number is between 2 and 10, rule succeeds.

regular scheduling of fed-gown-description: try examining the gown of the red court.
testing effects of fed-gown-description: if we assert result "Wearing the gown gives you two levels of dreadful presence. You can feed the gown 4 blood", rule succeeds.

testing effects of dreadless-unworn-gown: if we assert that the dreadful presence of the player is 0, rule succeeds.

regular scheduling of dreadful-worn-gown: try wearing the gown of the red court.
testing effects of dreadful-worn-gown: if we assert that the dreadful presence of the player is 2, rule succeeds.

regular scheduling of second-gown-feeding: compel the action of feeding the gown of the red court.

testing effects of second-gown-feeding:
	assert that the blood magic level of the gown of the red court is 2;
	assert that the dreadful presence of the player is 3;
	decrease the tnbm-number by 1;
	if we assert that the blood timer of the gown of the red court is the tnbm-number, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
first-gown-timeout	1	0	10	--
first-timeout-wearoff	1	1	--	first-gown-timeout
gown-timer-reset	1	1	--	--
second-gown-timeout	1	0	10	--
second-timeout-wearoff	1	1	--	second-gown-timeout

regular scheduling of an outcome (called event):
	if event is first-gown-timeout or event is second-gown-timeout, compel the action of waiting.

testing effects of an outcome (called event):
	if event is first-gown-timeout or event is second-gown-timeout:
		Let blood-target be 0;
		if event is first-gown-timeout, now blood-target is 1;
		if the blood magic level of the gown of the red court is blood-target:
			rule succeeds;
		otherwise:
			Let expected timer be tnbm-number - (attempt count of the event + 1);
			assert that the blood timer of the gown of the red court is the expected timer with label "blood timer of the gown ([tnbm-number] - [attempt count of the event + 1])";

testing effects of first-timeout-wearoff: if we assert result "Some of the blood power of the gown of the red court wears off", rule succeeds.

initial scheduling of gown-timer-reset: now tnbm-number is the blood timer of the gown of the red court.
testing effects of gown-timer-reset: if we assert that tnbm-number is between 2 and 10, rule succeeds.

testing effects of second-timeout-wearoff: if we assert result "The blood power of the gown of the red court wears off completely", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
malleus-earning	1	1
malleus-readying	1	1
unfed-malleus-description	1	1
nomos-bonus-examining	1	1
fed-malleus-description	1	1
malleus-bonus-attacking	0	1
early-feeding	1	1
bonus-surviving-attack	1	1
malleus-fed-after-attack	1	1
malleus-blood-tension	1	1

regular scheduling of malleus-earning: raise the favour of the player to 6.
testing effects of malleus-earning: if the player carries the malleus maleficarum, rule succeeds.

regular scheduling of malleus-readying: try readying the malleus maleficarum.
testing effects of malleus-readying: if the malleus maleficarum is readied, rule succeeds.

regular scheduling of unfed-malleus-description: try examining the malleus maleficarum.
testing effects of unfed-malleus-description: if we assert result "Feeding 1 blood to the Malleus Maleficarum will give it a bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence\.", rule succeeds.

initial scheduling of nomos-bonus-examining:
	now the health of the player is 1000;
	now the health of the swarm of daggers is 100;
	now the melee of the player is 100;
	now the nomos bonus is true;

regular scheduling of nomos-bonus-examining: compel the action of examining the swarm of daggers.
Testing effects of nomos-bonus-examining:
	assert that the nomos bonus is true with label "nomos bonus";
	if we assert result "swarm of daggers attacks using sharp points", rule succeeds.

Definition: an outcome is malleus-feeding if it is fed-malleus-description or it is early-feeding.
Definition: an outcome is malleus-fed if it is malleus-feeding or it is malleus-fed-after-attack.

initial scheduling for a malleus-feeding outcome:
	now the nomos bonus is false;
	try feeding the malleus maleficarum;

regular scheduling of a malleus-fed outcome: try examining the malleus maleficarum.
testing effects of a malleus-fed outcome: if we assert result "Feeding 2 blood to the Malleus Maleficarum will give it an additional bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence; blood bonus of \+1 attack and \+1 damage", rule succeeds.

initial scheduling of malleus-bonus-attacking: now the nomos bonus is true.
regular scheduling of malleus-bonus-attacking: compel the action of turning human.
[turning human is not acting fast, but a rule sets the take no time boolean for it. This will be too late to stop the nomos bonus from changing our action]
testing effects of malleus-bonus-attacking:
	assert result "You plan on turning human, but find yourself attacking the swarm of daggers instead";
	assert that the hitting count of the player is 1 with label "player's hitting count (bug #281)";
	assert that the blood magic level of malleus maleficarum is 0 with label "malleus blood magic level";
	assert result " \+ 1 \(Malleus Maleficarum blood\) \+ 4 \(the law is with you\) = <0-9>+, you beat the swarm of daggers[']s defence rating";
	assert result " \+ 1 \(Malleus Maleficarum blood bonus\) \+ 3 \(the law is with you\) = <0-9>+ damage";

[Test for bug #337]

initial scheduling of bonus-surviving-attack:
	now the melee of the swarm of daggers is 100;
	now the inherent damage modifier of the swarm of daggers is 10;
	now the health of the player is 1000;
	now the hit protection of the player is 0;
	now dagger-scattered is 0;

regular scheduling of bonus-surviving-attack: compel the action of the player waiting as a reaction to the swarm of daggers.
testing effects of bonus-surviving-attack: if the health of the player < 1000, rule succeeds.

initial scheduling of malleus-blood-tension:
	now total damage is 0;
	now the tension is 10.

regular scheduling of malleus-blood-tension: try feeding the gown of the red court.

Testing effects of malleus-blood-tension:
	assert result "The Malleus Maleficarum uses your bloodletting to reduce the tension";
	if we assert that the tension is 4, rule succeeds.

Chapter - bug 234

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
bug-234	0	1	--	restarting for tests
link-holy-sword	1	1	--	--
no-holy-sword-link	1	1	--	link-holy-sword
still-linking	1	0	20	--

Scenario for bug-234:
	Now Israfel is testobject;
	Now temple of Herm is testobject;
	Now Hall of Gods is testobject;

initial scheduling of bug-234:
	extract the player to the location of Israfel;
	have the player defeat israfel;
	have the player worship herm with 1 favour;
	extract the player to Hall of Gods;
	now the health of the player is 1000;
	have the player and the healer of Aite fight in Arena of the Gods;

[also test bug 235]

regular scheduling of link-holy-sword: try linking the holy sword.
testing effects of link-holy-sword: if we assert result "You can only link to persons", rule succeeds.
testing effects of no-holy-sword-link: if we assert absence of result "You forge a spiritual link", rule succeeds.

regular scheduling of still-linking: compel the action of linking the healer of Aite.
testing effects of still-linking: if the healer of Aite is linked to the player, rule succeeds.

[not sure if this is testing the bug correctly]

Chapter - Attempting to Maze Someone in Arena of the Gods

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
mazing-tests	0	1	restarting for tests
axing-defender	1	1	--

Scenario for mazing-tests:
	Now the minotaur is testobject;
	Now Hall of Gods is testobject;
	now the overmind is testobject;
	now the hall of mirrors is bannedobject;

initial scheduling of mazing-tests:
	now the player worships Nomos;
	raise the favour of the player by 4;
	extract the player to the location of the minotaur;
	have the player defeat the minotaur;
	equip the player with the minotaur's axe;
	extract the player to hall of gods;
	have the player and the healer of aite fight in the arena of the gods;

regular scheduling of axing-defender: do the action of the defender of Aite waiting for a 100 melee hit by the player.

testing effects of axing-defender:
	assert result "you beat the defender of Aite's defence";
	assert absence of result "You plan on challenging the defender of Aite in the maze";
	assert result "Space and time begin to twist";
	assert that the location is Arena of the Gods;
	rule succeeds.

Section - At-react after getting mazed - bug 210

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
overmind-mazing	1	1
overmind-maze-reset	1	1

initial scheduling of overmind-mazing: extract the player to the location of the overmind.
regular scheduling of overmind-mazing: compel the action of the overmind waiting as a reaction to the player.
testing effects of overmind-mazing: if the location is Maze, rule succeeds.
testing effects of overmind-maze-reset: if the combat state of the overmind is at-inactive, rule succeeds.

Chapter - Banshees Gone Wild - bug 248

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
banshees gone wild	0	1	restarting for tests
waiting-for-banshees	1	1	--
banshees-break-loose	1	1	waiting-for-banshees
banshee-fleeing	1	1	--
banshee-returning	1	1	--
reaction-ape-killing	1	1	--

[First every turn: say "Every turn rules run.";]
[TODO: get rid of "travel sneakily"]

Scenario for banshees gone wild:
	now Hall of Raging Banshees is testobject;
	now the blood ape is testobject;
	now the reaper is testobject;
	now the reusable item is a random scroll of death;
	now the statue of shards is bannedobject;

first independent action when testing banshees gone wild (this is the no wandering monsters when testing banshees rule):
	rule fails.

Initial scheduling of banshees gone wild:
	swap the occupants of the location of the blood ape and the Hall of Raging Banshees;
	travel sneakily to Hall of Raging Banshees;
	if the retreat location is occupied:
		swap the occupants of the retreat location and a random unoccupied room;
	try taking off the fuligin cloak;
	set the tension to 10;
	now the health of the blood ape is 1;
	now the defence of the player is 100;
	now the health of the player is 100;

regular scheduling of waiting-for-banshees: compel the action of waiting.
testing effects of waiting-for-banshees: if the living banshees boolean is true, rule succeeds.
testing effects of banshees-break-loose: if we assert result "banshees suddenly break loose", rule succeeds.

regular scheduling of banshee-fleeing:
	force the fuligin cloak to work;
	compel the action of going way-to-get-back.

testing effects of banshee-fleeing:
	assert that the tension is 0 with label "tension";
	assert that the living banshees boolean is false with label "banshees living";
	if we assert that the location is the room way-to-get-back from Hall of the Raging Banshees, rule succeeds.

Initial scheduling for banshee-returning:
	extract the reaper to the location [to keep the tension from dissipating];
	set the tension to 10.

regular scheduling of banshee-returning: compel the action of going way-to-get-there.
testing effects of banshee-returning:
	assert that the living banshees boolean is true with label "living banshees";
	assert that the tension is between 10 and 13 with label "tension";
	if we assert result "banshees suddenly break loose", rule succeeds.

regular scheduling of reaction-ape-killing: compel the action of reading the reusable item as a reaction to the blood ape.
testing effects of reaction-ape-killing:
	assert result "Bored by a lack of tension";
	if the living banshees boolean is false, rule succeeds.

[The original test involved fleeing the room as soon as the ape was dead. But I think this was just to avoid a delayed message - I think this is also fine]

Chapter - Remembering Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
remembering-text	1	1	restarting for tests

Scenario for remembering-text:
	allow teleportation;
	now Bodmall is testobject;
	now the minotaur is testobject;
	now the angel of compassion is testobject;
	now the demon of rage is testobject;
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now bridge of doom is testobject;
	now hall of vapours is bannedobject;
	now the rod of the master builder is testobject;
	now generation info is true;
	
initial scheduling of remembering-text: now every room is not rust-spored.

[in case the first map is rejected, Arcane Vault must be switched back from testobject to bannedobject every time]
first creating the map rule when testing remembering-text:
	now every secretly placeable room is bannedobject; [prevent normal placement of Arcane Vault to simulate conditions for bug 244]
	now Eternal Prison is testobject;

last creating the map rule when testing remembering-text (this is the force Arcane Vault to be secretly placed rule):
	assert "Arcane Vault should not yet be placed" based on whether or not Arcane Vault is not placed;
	now Arcane Vault is testobject;
	now the rarity of Arcane Vault is 0;

The place all secret testobject rooms rule is listed after the force Arcane Vault to be secretly placed rule in the creating the map rules;

Initial scheduling of remembering-text:
	Now every room is not rust-spored;
	now the reusable item is a random scroll of mapping;
	equip the player with the rod of the master builder;

testing effects of remembering-text:
	assert "Eternal Prison should be secretly placed" based on whether or not the eternal prison is secretly placed;
	assert "Lake of Lava should be placed" based on whether or not the lake of lava is placed;
	assert "Lake of Lava should not be denizen" based on whether or not the lake of lava is not denizen;
	assert "Lake of Lava should not be teleportable" based on whether or not the lake of lava is not teleportable;
	assert "Lake of Lava should be nogo" based on whether or not the lake of lava is nogo;
	assert "Lake of Lava should not be secretly placed" based on whether or not lake of lava is not secretly placed;
	assert "Lake of Lava should not be placeable" based on whether or not lake of lava is not placeable;
	assert "Arcane Vault should be secretly placed" based on whether or not the arcane vault is secretly placed;
	assert "Arcane Vault should not be normally placed" based on whether or not the arcane vault is not normally placed;
	assert "Arcane Vault should be denizen" based on whether or not the arcane vault is denizen;
	assert "Arcane Vault should not be reachable" based on whether or not the arcane vault is not reachable;
	rule succeeds. [TODO: make these all actual tests, so the dungeon will be regenerated if they fail?]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
nothing-to-remember	1	1	--
powerless-sensing	1	1	"compel sensing"
item-sensing	1	1	"compel sensing"
early-psycholocation	0	1	"psycholocate"
unexplored-sensing	0	1	"compel sensing"
remembering-daggers	1	1	--
middle-psycholocating	0	1	"psycholocate"
partial-explored-sensing 	1	1	"compel sensing"

[TODO: figure out if "seen" needs to be updated even when acting fast]

regular scheduling of nothing-to-remember: try remembering.
testing effects of nothing-to-remember: if we assert result "You have not yet explored:\n( - the <a-w>+ exit of the entrance hall \(where you currently are\)\n)+\nYou have visited the following rooms: the entrance hall \(here\)\.\n\nTip:", rule succeeds.

regular scheduling of an outcome labeled "compel sensing": compel the action of sensing.

[sensing should take no time if you don't have enough powers to do it]
testing effects of powerless-sensing: if previously-fast is true, rule succeeds.

initial scheduling of item-sensing:
	repeat with item running through denizen epic things:
		unless the player encloses item:
			remove item from play;
	now the staff of insanity is in Arcane Vault;
	now the suit of dragon armour is in Arcane Vault;
	now the power of bodmall is granted.
	
testing effects of item-sensing:
	if we assert result "You sense an (epic artefact that is currently unreachable, but lies somewhere.*)\n+You sense another \1", rule succeeds.

initial scheduling of early-psycholocation: now the power of bodmall is not granted.

initial scheduling of an outcome labeled "psycholocate": now the reusable item is a random scroll of psycholocation.
regular scheduling of an outcome labeled "psycholocate": try reading the reusable item.
testing effects of an outcome labeled "psycholocate":
	assert "The player should be psycholocating now" based on the psycholocation boolean;
	assert result "When you are psycholocating, sensing does not take time";

testing effects of unexplored-sensing:
	Repeat with the enemy running through {swarm of daggers, blood ape, demon of rage, angel of compassion, minotaur, bodmall, malygris}:
		assert result "[soul description of the enemy], (from the )?[best route from the location to the location of the enemy][line break]";
	assert result "- a turning in on itself of space and time, on which you cannot bear to focus your attention, somewhere [general direction from the location to the Eternal Prison][line break]";

[ - a bolt of black shot through with a blaze of hot white, from the south
 - an aura like sharpened steel, from the east
 - a zone of tautened, reddened air, from the west
 - a squall of fury, all blacks and reds, from the south
 - a luminous arc of sorrow, from the south
 - a skein of twisting passages, from the south
 - spreading thorns dripping with dew--or blood, from the wes]

initial scheduling of remembering-daggers: travel sneakily to the location of the swarm of daggers.
regular scheduling of remembering-daggers: compel the action of remembering.
testing effects of remembering-daggers: if we assert result "You have visited the following rooms:.*You have seen the following creatures in these locations:.*- the swarm of daggers \(level 1\) in [the location] \(where you currently are\)", rule succeeds.

[before we can get the partway-path psycholocating message, we have to put a visited room between us and an unseen creature. Find one
 that's at least two moves away and then go 1 move towards it.]
The sensing-place is a room that varies.
The on-the-way place is a room that varies.
The faraway enemy is an object that varies.
To decide which object is the next stop from (origin - a room) to (destination - a room):
	let the way be the best route from origin to destination;
	if the way is not a direction:
		decide on nothing;
	decide on the room way from origin.

Initial scheduling of middle-psycholocating:
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
		travel sneakily to the on-the-way place;
	while the next stop from the on-the-way place to the target is a visited room:
		now the on-the-way place is the next stop from the on-the-way place to the target;
	extract the player to the sensing-place.

testing effects of partial-explored-sensing:
	assert result "the soul of the swarm of daggers here with you, like an aura like sharpened steel[line break]";
	if we assert result "[soul description of the faraway enemy], [best route from on-the-way place to location of the faraway enemy] from [the on-the-way place] \(which lies [best route from the location to on-the-way place] from here\)[line break]", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
meeting-malygris	1	1
psycholocation-expiring	1	0
moving-malygris	1	1
remembering-malygris	1	1
remembering-lost-plural	1	1
wanderer-waiting	1	0
wanderer-remembering	1	1
dungeon-clearing	0	1
Malygris-only-remembering	1	1

initial scheduling of meeting-malygris: travel sneakily to the location of Malygris.
regular scheduling of meeting-malygris:
	now traveling sneakily is true;
	now malygris is not asleep;
	wait for Malygris to act freely.
Testing effects of meeting-malygris: if we assert result "(does not (detect|notice)|remains unaware of) you(r presence)?[run paragraph on]", rule succeeds.

regular scheduling of psycholocation-expiring: compel the action of waiting.
testing effects of psycholocation-expiring: if psycholocation is inactive, rule succeeds.

Initial scheduling for moving-malygris: try taking off the fuligin cloak.
regular scheduling of moving-malygris:
	now the teleport amount of Malygris is 1;
	compel the action of Malygris teleporting.

testing effects of moving-malygris: if we assert result "Malygris suddenly teleports away", rule succeeds.

regular scheduling of remembering-malygris: try remembering.
testing effects of remembering-malygris: if we assert result "You have seen the following creatures in these locations:.*You have also seen Malygris, but you don't know where he is now", rule succeeds.

Initial scheduling of remembering-lost-plural: now the last-seen-location of the swarm of daggers is null-room.
regular scheduling of remembering-lost-plural: try remembering.
testing effects of remembering-lost-plural: if we assert result "You have also seen (Malygris|the swarm of daggers) and (Malygris|the swarm of daggers), but you don't know where they are now", rule succeeds.

regular scheduling of wanderer-waiting: compel the action of waiting.
testing effects of wanderer-waiting: if we assert that the location of the demonic assassin is the location, rule succeeds.

regular scheduling of wanderer-remembering: try remembering.
testing effects of wanderer-remembering: if we assert result "demonic assassin <^\n>+\(where you currently are\)", rule succeeds.

Initial scheduling for dungeon-clearing:
	have the player defeat the demonic assassin;
	Repeat with guy running through denizen persons:
		if guy is the player or the level of guy is at least 5, next;
		have the player defeat guy;

testing effects of dungeon-clearing:
	assert that the number of reachable persons is 2;
	assert "Malygris (in [the location of Malygris]) should be reachable from [the location]" based on whether or not Malygris is reachable;
	assert "The player (in [the location of the player]) should be reachable" based on whether or not the player is reachable.

regular scheduling of malygris-only-remembering: try remembering.
testing effects of Malygris-only-remembering:
	assert absence of result "You have seen the following creatures in these locations";
	if we assert result "You have also seen Malygris, but you don't know where he is now", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
slow-sensing	1	1	"compel sensing"
exploring-everywhere	1	0	--
unexplored-vault	1	1	--
remembering-everything-reachable	1	1	--
explored-psycholocating	0	1	"psycholocate"
malygris-sensing	1	1	"compel sensing"
map-reading	1	1	"compel reading"
map-remembering	0	1	--

testing effects of slow-sensing: if previously-fast is false, rule succeeds.

regular scheduling of exploring-everywhere:
	let destination be a random unvisited reachable room;
	if destination is a room, extract the player to destination;

testing effects of exploring-everywhere: unless there is an unvisited reachable room, rule succeeds.
testing effects of unexplored-vault: if Arcane Vault is unvisited, rule succeeds.

regular scheduling of remembering-everything-reachable: try remembering.

testing effects of remembering-everything-reachable:
	assert result "All locations have been explored";
	if we assert absence of result "You have not yet explored", rule succeeds.

Initial scheduling for explored-psycholocating:
	if the location is the location of Malygris:
		extract the player to a random unoccupied reachable room.


Initial scheduling of malygris-sensing: Now the last-seen-location of Malygris is null-room.
testing effects of malygris-sensing:
	assert result "[soul description of malygris], in [the location of Malygris]";
	if previously-fast is true, rule succeeds.

initial scheduling of map-reading: now the reusable item is a random scroll of mapping.
testing effects of map-reading: if we assert result "a complete floor plan of the dungeon of Kerkerkruip imprints itself on your mind", rule succeeds.

regular scheduling of map-remembering: try remembering.
testing effects of map-remembering:
	Assert that the number of secretly placed rooms is 2;
	assert result "Based on the map you found.*secret rooms in the dungeon, one <^\n>+, one <^\n>+.";
	assert result "You have also seen Malygris, but you don't know where he is. With your powers of psycholocation, you might be able to SENSE him";

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts
digging-to-vault	1	0	20
secret-room-remembering	0	1	--

Initial scheduling of digging-to-vault:
	Let the closest place be Null-room;
	Let the shortest distance be 1000;
	Repeat with the place running through connectable reachable rooms:
		Let the candidate distance be the absolute distance between the place and the Arcane Vault;
		if the candidate distance is less than the shortest distance:
			now the shortest distance is the candidate distance;
			now the closest place is the place;
	force the fuligin cloak to work;
	extract the player to the closest place.

regular scheduling of digging-to-vault: compel the action of digging a single general direction from the location to Arcane Vault.
testing effects of digging-to-vault: if the location is a secretly placed room, rule succeeds.
[it doesn't actually have to be the vault - if we hit another secret room on the way we should stop]

regular scheduling of secret-room-remembering: compel the action of remembering.

testing effects of secret-room-remembering:
	assert result "Based on the map you found.*a secret room in the dungeon, <a-z>";
	assert absence of result "secret room in the dungeon, one";

[TODO: make sure tunnels don't show up when they shouldn't, make sure they do show up in unexplored list]

[TODO: psycholocation + sense]

Chapter - Blessed Grenade - bug #261

Scenario for blessed-grenade-test:
	now Drakul is testobject;
	now the Alchemical Laboratory is testobject;
	now the Blessed Grenade is bannedobject;

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	label	antecedent
blessed-grenade-test	0	1	1	--	restarting for tests
getting-blessed	1	0	1000	"produce grenade"	--
no-extra-blessed	0	300	300	"produce grenade"	--
throwing-blessed	1	0	10	--	--
no-new-blessed	0	300	300	"produce grenade"	--

initial scheduling of blessed-grenade-test:
	now the defence of the player is 100;
	Now the reusable item is the staff of insanity;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	extract the player to the alchemical laboratory, making sure it is unoccupied;

Regular scheduling of an outcome labeled "produce grenade":
	Repeat with item running through grenades in the location:
		remove item from play;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	if the reusable item is not a thing:
		transcribe "DEBUG: produce a grenade - no reusable item";
	now exploding-grenade is the player; [if we produce a grenade but it explodes, this will keep track of that]
	now the player carries the reusable item;
	try inserting the reusable item into the curious machine;
	Now the health of the player is 100;
	Now the player is not asleep;
	if the location is not Alchemical Laboratory, extract the player to Alchemical Laboratory;
	[If the current move is hidden-traveling, now the player is hidden;]

Testing effects of an outcome labeled "produce grenade":
	if exploding-grenade is a grenade:
		[we got a grenade, but it exploded]
		if we assert that exploding-grenade is the blessed grenade, rule succeeds;
	otherwise:
		[the grenade we just got is now on the floor]
		if we assert that the holder of the blessed grenade is the location, rule succeeds.

Initial scheduling of no-extra-blessed: now the player carries the blessed grenade.

Regular scheduling of throwing-blessed:
	extract Drakul to the Alchemical Laboratory;
	compel the action of throwing the blessed grenade;

testing effects of throwing-blessed:
	assert "Drakul should be dead" based on whether or not Drakul is dead;
	assert "The blessed grenade should be exploded" based on whether or not the blessed grenade is exploded;
	assert "The blessed grenade should be placed" based on whether or not the Blessed Grenade is placed;
	assert "The blessed grenade should be off-stage" based on whether or not the blessed grenade is off-stage;
	assert result "As the grenade explodes you hear the singing of angels, several of whom swoop down from the heavens with huge swords and eviscerate <^\n>*Drakul";
	rule succeeds.

First testing effects of no-new-blessed:
	assert "The Blessed Grenade should be off-stage" based on whether or not the blessed grenade is off-stage.

Chapter - Pile of Limbs

Scenario for pile-of-limbs-test:
	now quartering room is testobject;
	now mausoleum is bannedobject;
	ban wandering monsters.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	label	antecedent
pile-of-limbs-test	0	1	1	--	restarting for tests
early-pile-search	0	1	--	"search pile"	--	
getting-deathly	1	0	--	--	early-pile-search
getting-healthy	1	0	--	--	early-pile-search
getting-delights	0	100	--	--	early-pile-search
getting-bad-scroll	0	100	--	--	early-pile-search
early-out	1	0	2000	"out of scrolls"	early-pile-search
corpse-appears	14	15	--	--	early-out
find-glory	1	0	--	--	early-out
find-vecna	1	0	400	--	early-out
late-pile-search	0	1	--	"search pile"	--
late-out	1	0	20	"out of scrolls"	late-pile-search
find-arm	1	0	--	--	late-out
after-search	1	1	--	--	--
	
initial scheduling of pile-of-limbs-test:
	now the defence of the player is 100;
	extract the player to the quartering room, making sure it is unoccupied;

Regular scheduling of an outcome labeled "search pile":
	Repeat with item running through scrolls enclosed by the location:
		remove item from play;
	if the player carries the hand of glory:
		remove the hand of glory from play;
	if the player carries the hand of vecna:
		remove the hand of vecna from play;
	Repeat with guy running through people enclosed by the location:
		if guy opposes the player:
			remove guy from play;
	if the pile search count < 0:
		now the pile search count is 0;
	try searching the large pile of body parts;

Testing effects of getting-deathly:
	Let item be a random scroll carried by the player;
	if item is a scroll of death or item is a scroll of summoning or item is a scroll of ghoulification, rule succeeds.
	
Testing effects of getting-healthy:
	Let item be a random scroll carried by the player;
	if item is a scroll of death or item is a scroll of summoning or item is a scroll of ghoulification, rule fails;
	if item is a scroll, rule succeeds.

Testing effects of getting-delights: if the player carries a scroll of afternoon delights, rule succeeds.

[This is an extremely longwinded way of making sure a scroll is legit:]
Testing effects of getting-bad-scroll:
	Let item be a random scroll carried by the player;
	if item is not a scroll, rule fails;
	unless item is a scroll of afternoon delights or item is a scroll of death or item is a scroll of summoning or item is a scroll of ghoulification or item is a scroll of teleportation or item is a scroll of knowledge or item is a scroll of curse removal or item is a scroll of shadows or item is a scroll of the blade or item is a scroll of protection or item is a scroll of skill or item is a scroll of alteration or item is a scroll of mapping or item is a scroll of psycholocation or item is a scroll of enchantment:
		now the failure report is "The player got [the item], which is a scroll, but not one of a meaningful kind.";
		rule succeeds.
		

Testing effects of an outcome labeled "out of scrolls": unless the player carries a scroll, rule succeeds.
Testing effects of corpse-appears: if the rotting corpse is in the location, rule succeeds.
Testing effects of find-glory: if we assert that the holder of the hand of glory is the player, rule succeeds.
Testing effects of find-vecna: if we assert that the holder of the hand of vecna is the player, rule succeeds.

Initial scheduling of late-pile-search: extract the rotting corpse to Entrance Hall.
Testing effects of find-arm: if the player carries the putrefying arm, rule succeeds.
Regular scheduling of after-search: try searching the large pile of body parts;
Testing effects of after-search: if we assert result "You find nothing else in the pile", rule succeeds.

Chapter - bug 262

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
generation-tests	0	1	--	restarting for tests
bug-262	1	0	--	generation-tests
no-placed-treasure-packs	5	5	--	bug-262

Scenario for generation-tests:
	now generation info is true;

[
First dungeon finish rule:
	repeat with pack running through not non-treasure things:
		repeat with item running through things enclosed by pack:
			now the valuation of item is the valuation of pack;

TODO: figure out what all that crap is for
	]

Definition: a room is secret-treasure-stash if it is Mausoleum or it is Hidden Treasury or it is Elemental Plane of Smoke Storage.

testing effects of bug-262:
	unless portal of smoke is placed or hidden treasury is placed or mausoleum is placed, make no decision;
	repeat with place running through secret-treasure-stash rooms:
		if place encloses a not non-treasure thing, rule succeeds.

testing effects of no-placed-treasure-packs:
	Repeat with item running through treasure packs:
		if item is not off-stage:
			now the failure report is "[The item] should be off-stage, but it is in [the holder of the item][if holder of the item is not a room] (in [location of the item])";
			rule fails;
	rule succeeds.

Section - bug 244

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
bug-244	1	0	300	generation-tests
mausoleum-secret	10	10	--	bug-244

testing effects of bug-244 (this is the mausoleum must be secret rule):
	if the mausoleum is not placed, rule fails;
	let the path be the best route from Entrance Hall to the mausoleum;
	if the path is a direction, rule fails;
	rule succeeds.

[Finally found the cause of bug 244! The mausoleum could become connected to a secretly placed room. That made things kind of complicated!]
Testing effects of mausoleum-secret: if the mausoleum is secretly placed, rule succeeds;

Section - Starting Kits

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
malygris-healing	1	5	--	generation-tests
too-much-malygris-healing	0	10	--	malygris-healing
got-addicts-amulet	2	64	256	generation-tests
cursed-addicts-amulet	2	2	--	got-addicts-amulet
got-shield	1	8	--	generation-tests
wearing-shield	5	5	--	got-shield
compassion-placed	1	0	--	generation-tests
fafhrd-placed	1	0	--	generation-tests
sword-of-light-owner	10	10	10	compassion-placed
claymore-owner	10	10	10	fafhrd-placed

Scenario for generation-tests (this is the tempt kerkerkruip to make shimmer copies rule):
	now the gilded rapier is testobject;
	now the gorgeous dagger is testobject;
	now the evil dagger is testobject;
	now Metastasio's hat is testobject;
	set difficulty to 1;

malygris-heal-max is a number that varies.

Regular scheduling of malygris-healing:
	[Malygris heal power]
	now malygris-heal-max is (heal power of Malygris) * 60 / (heal cooldown of Malygris);
	if the heal power of Malygris is at least 1:
		say "* Malygris can heal [malygris-heal-max divided by 60] and [remainder after dividing malygris-heal-max by 60] 60ths per turn[line break]";

Testing effects of malygris-healing: if malygris-heal-max is at least 1, rule succeeds.
Testing effects of too-much-malygris-healing:
	if malygris-heal-max is greater than (60 times 3):
		now the failure report is "[malygris-heal-max divided by 60] and [remainder after dividing malygris-heal-max by 60] 60ths is too much healing for Malygris";
		rule succeeds.

Testing effects of got-shield: if the player has a shield, rule succeeds.
Testing effects of wearing-shield: if the player wears a shield, rule succeeds.

Testing effects of got-addicts-amulet: if the player wears the addict's amulet, rule succeeds.
Testing effects of cursed-addicts-amulet: if the addict's amulet is cursed, rule succeeds.
Testing effects of compassion-placed: if the angel of compassion is denizen, rule succeeds.
Testing effects of sword-of-light-owner: if the original owner of the sword of light is the angel of compassion, rule succeeds.
Testing effects of fafhrd-placed: if fafhrd is denizen, rule succeeds.
Testing effects of claymore-owner: if the original owner of the claymore is fafhrd, rule succeeds.

[TODO: we have removed shimmering. Test stolen weapon behavior in arenas]

	[TODO: starting kit items should match the player's size?]
	[TODO: check ownership/starting kits in Arena of the Gods and Arena of the Fallen]

Chapter - bug 245

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-245	0	1	restarting for tests
ape-growing	1	0	--
ape-smiting	1	1	--
bodmall-meeting	1	0	--
bodmall-attack	1	1	--
bodmall-reaction	1	1	bodmall-attack
bodmall-bleeding	1	1	bodmall-attack

Scenario for bug-245:
	prevent sleeping;
	now the blood ape is testobject;
	now bodmall is testobject;
	now the hall of mirrors is bannedobject;

Initial scheduling of ape-growing:
	extract the player to the location of the blood ape;
	now the defence of the player is 0;
	now the melee of the player is 100;

regular scheduling of ape-growing: do the action of waiting for a 100 melee hit by the blood ape.
testing effects of ape-growing: if the size of the blood ape is greater than medium, rule succeeds.

regular scheduling of ape-smiting: compel the action of smiting the blood ape.
testing effects of ape-smiting: if the power of the ape is granted, rule succeeds.

initial scheduling of bodmall-meeting:
	now the health of bodmall is 1000;
	extract the player to the location of Bodmall.
regular scheduling of bodmall-meeting: compel the action of waiting.
testing effects of bodmall-meeting: rule succeeds.

regular scheduling of bodmall-attack: compel the action of attacking bodmall.
testing effects of bodmall-attack: rule succeeds.

regular scheduling of bodmall-reaction: now bodmall-reaction is scheduled for later testing.
testing effects of bodmall-reaction:
	if Bodmall is at-react, rule succeeds.

A standard AI rule for a person (called P) when testing bodmall-attack (this is the make sure Bodmall reacts rule):
	if P is Bodmall:
		now bodmall-reaction is scheduled for immediate testing;
		test effects of bodmall-reaction;

First combat round rule when testing bodmall-attack and bodmall-reaction is achieved (this is the bodmall should only react once rule):
	assert that the combat state of Bodmall is at-inactive with label "combat state of bodmall".

The make sure Bodmall reacts rule is listed before the compel an attack rule in the standard AI rules.
The bodmall should only react once rule is listed before test combat round of previous main actor rule in the combat round rules.

testing effects of bodmall-bleeding:
	assert "the player should now be bigger than medium, but [regarding the player][they] [are] [size of the player]" based on whether or not the size of the player is greater than medium;
	[assert that the success count of bodmall-reaction is 1 with label "number of times Bodmall reacted"; [how do we test this?]]
	assert "bodmall should be at-inactive, but she is [combat state of bodmall]" based on whether or not bodmall is at-inactive;
	rule succeeds.

Chapter - Maze Moving

[Moving around in the maze - check that all people have 0 concentration and are at-inactive. Check that the right thing happens when retreating or running from an opponent in the maze. Maybe check grenade-throwing effects in the maze]

[TODO: what if we flee a summoned creature but not towards the sound?]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
maze-moving	0	1	restarting for tests
getting-mazed	1	0	--
mazed-player-inactive	1	1	getting-mazed
mazing-minotaur-inactive	1	1	getting-mazed
mazing-minotaur-staged	1	1	getting-mazed
no-maze-sound-yet	1	1	getting-mazed
mazing-minotaur-damage	1	1	getting-mazed
directionless-throwing	1	1	--
fast-throwing-failure	1	1	directionless-throwing
inconsequential-throwing	1	1	directionless-throwing
meta-throwing-test	1	1	--

Scenario for maze-moving:
	now the minotaur is testobject;
	now the hall of mirrors is bannedobject;
	now the reusable item is a random flash grenade;

Initial scheduling of getting-mazed:
	now the health of the player is 1000;
	extract the player to the location of the minotaur;

regular scheduling of getting-mazed: compel the action of exposing as a reaction to the minotaur.

Testing effects of getting-mazed: if the location is Maze, rule succeeds.
Testing effects of mazed-player-inactive: if the player is at-inactive, rule succeeds.
Testing effects of mazing-minotaur-inactive: if the minotaur is at-inactive, rule succeeds.
Testing effects of mazing-minotaur-staged: if we assert that the location of the minotaur is maze-waiting-room, rule succeeds.
Testing effects of no-maze-sound-yet: if maze-sound is northwest, rule succeeds.
Testing effects of mazing-minotaur-damage: if we assert result "minotaur deals", rule succeeds.

Regular scheduling of directionless-throwing: try throwing the reusable item to north.
Testing effects of directionless-throwing: if we assert result "There is no point throwing grenades into twisty little passages", rule succeeds.
testing effects of fast-throwing-failure: if the take no time boolean is true, rule succeeds.
testing effects of inconsequential-throwing: if the reusable item is carried, rule succeeds.

regular scheduling of meta-throwing-test: remove the reusable item from play.
testing effects of meta-throwing-test: unless the reusable item is carried, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
sound-finding	1	0	--	--
maze-summoning	1	1	"try reading"	--
summoned-fleeing	1	1	--	--
summoned-hits	1	1	--	summoned-fleeing
summoned-followed	1	1	--	summoned-fleeing
arrived-at-minotaur	1	1	--	summoned-fleeing

To assert that everyone is unconcentrated:
	Repeat with guy running through people in the location:
		assert that the concentration of guy is 0 with label "concentration of [guy]".

regular scheduling of sound-finding: compel the action of going north.
Testing effects of sound-finding: if maze-sound is a cardinal direction, rule succeeds.

Initial scheduling of maze-summoning: now the the reusable item is a random scroll of summoning.
Testing effects of maze-summoning: if we assert result "[a monster summoned] appears before you", rule succeeds.

Initial scheduling of summoned-fleeing:
	now the concentration of the player is 3;
	now the concentration of the monster summoned is 3;

regular scheduling of summoned-fleeing: try going maze-sound.

testing effects of summoned-fleeing: if we assert result "You flee through the tunnels, quickly losing all sense of direction.[line break][line break][The monster summoned] follows you towards the sound.", rule succeeds.

testing effects of summoned-hits:
	assert that everyone is unconcentrated;
	let expected hits be 1;
	if the monster summoned is non-attacker:
		now expected hits is 0;
	if we assert that the hitting count of the monster summoned is the expected hits, rule succeeds.
	[if the act count of the main actor is 0: TODO: what is the point of this?
		[this assertion can interrupt the event description]
		assert that the main actor has 0 levels of concentration;]

testing effects of summoned-followed: if we assert that location of the monster summoned is the maze, rule succeeds.
testing effects of arrived-at-minotaur: if we assert that the location of the minotaur is the maze, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
multiple-fleeing	1	0	--
summoned-staged	1	1	multiple-fleeing
minotaur-staged	1	1	multiple-fleeing
minotaur-parting-shot	1	1	multiple-fleeing
multiple-sound-seeking	1	0	--
multiple-staged	1	1	multiple-sound-seeking
first-rejoining	1	1	--
one-staged	1	1	first-rejoining
first-maze-smiting	1	1	--
maze-peace	1	1	first-maze-smiting

Initial scheduling of multiple-fleeing:
	now the concentration of the minotaur is 3;
	now the concentration of the monster summoned is 3;

regular scheduling of multiple-fleeing: try going north.

Testing effects of multiple-fleeing:
	assert that everyone is unconcentrated;
	if we assert absence of result "follows you", rule succeeds.

testing effects of minotaur-staged: if the location of the  minotaur is maze-waiting-room, rule succeeds.
testing effects of summoned-staged: if the location of the monster summoned is maze-waiting-room, rule succeeds.
testing effects of minotaur-parting-shot: if we assert that the hitting count of the minotaur is 1, rule succeeds.

regular scheduling of multiple-sound-seeking: compel the action of going north.

Testing effects of multiple-sound-seeking: if the maze-sound is a cardinal direction, rule succeeds.
testing effects of multiple-staged: if we assert that the number of people in maze-waiting-room is 2, rule succeeds.

regular scheduling of first-rejoining: compel the action of going maze-sound.
Testing effects of first-rejoining: if we assert that the number of people in maze [including the player] is 2, rule succeeds.
testing effects of one-staged: if we assert that the number of people in maze-waiting-room is 1, rule succeeds.

regular scheduling of first-maze-smiting:
	now opposition test subject is the player;
	Let the enemy be a random opposer person enclosed by the location;
	compel the action of smiting the enemy.

Testing effects of first-maze-smiting: if we assert that the location of the player is the maze, rule succeeds.
Testing effects of maze-peace: if we assert that the combat status is peace, rule succeeds.

Chapter - Imp Teleporting Into Dreams

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-280	1	1	restarting for tests
reaper-seeking	1	1	--
rose-dreaming	20	20	--
imp-out-of-dream	20	20	rose-dreaming
imp-inactive	20	20	rose-dreaming
woke-from-garden	20	20	imp-out-of-dream
woke-with-reaper	20	20	woke-from-garden
woke-in-combat	20	20	woke-from-garden

[TODO: test imp with teleportation beacon?]

Scenario for bug-280:
	ban wandering monsters;
	allow teleportation;
	now the reaper is testobject; [overriding the wandering ban]
	now the lair of the imp is testobject; [overriding the wandering ban]
	now the dream of briar roses is testobject;
	now the reusable item is a random morphean grenade;
	now the vast staircase is bannedobject.

Testing effects of bug-280:
	if we assert that the combat state of the player is at-inactive with label "combat state of the player", rule succeeds.

Initial scheduling of reaper-seeking:
	extract the player to the location of the reaper;
	now the health of the player is 1000.
regular scheduling of reaper-seeking: compel the action of waiting.
Testing effects of reaper-seeking: if we assert that the combat state of the player is at-act, rule succeeds.

regular scheduling of rose-dreaming:
	compel the action of throwing the reusable item;
	now suppress npc action is false. [I don't think this actually does anything]

Testing effects of rose-dreaming: if we assert that the location is garden of thorns, rule succeeds.

testing effects of imp-out-of-dream: unless the location of the imp is the location, rule succeeds.
testing effects of imp-inactive: unless the imp is acting independently, rule succeeds.

regular scheduling of woke-from-garden:
	wake the player up;
	update the combat status. [risky?]

testing effects of woke-from-garden: unless the location is garden of thorns, rule succeeds.
testing effects of woke-with-reaper: if we assert that the location is the location of the reaper, rule succeeds.
testing effects of woke-in-combat: unless the combat status is peace, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts
imp-appearing	1	0	--
imp-thieving	1	1	--
imp-vanishing	1	0	--
imp-stashing	1	0	2

initial scheduling of imp-appearing: now the reusable item is nothing. [if the imp steals it, we don't want it coming back]
regular scheduling of imp-appearing: compel the action of waiting.
Testing effects of imp-appearing: if we assert that the location of the imp is the location, rule succeeds.

The imp's loot is an object that varies. [TODO: combine this variable with floor-item from hiding penalties?]

Regular scheduling of imp-thieving: compel the action of the imp imp-grabbing.
Testing effects of imp-thieving:
	Now the imp's loot is a random thing carried by the imp;
	if the imp's loot is a thing, rule succeeds.

first independent action rule when testing imp-vanishing: rule fails. [make sure the imp doesn't stash treasure or teleport back]
regular scheduling of imp-vanishing: compel the action of attacking the imp.
testing effects of imp-vanishing: if we assert that the location of the imp is lair of the imp, rule succeeds.

regular scheduling of imp-stashing: compel the action of waiting.
Testing effects of imp-stashing: if we assert that the holder of the imp's loot is the lair of the imp, rule succeeds.


Chapter - Bloodlust - issue 279

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bloodlust-279	0	1	restarting for tests
hitting-daggers	1	1	--
smiting-daggers	1	1	--
smitten-daggers	1	1	--
hitting-ape	1	1	--
fafhrd-killing-ape	1	0	--
fafhrd-killed-ape	1	1	--

[don't exit the arena - we want to make sure bloodlust stops even when we're not moved elsewhere]
the check for completed arena battle rule does nothing when testing bloodlust-279.

Initial scheduling of hitting-daggers:
	prepare a test battle with the swarm of daggers;
	now the melee of the player is 100;
	now the defence of the player is 100;
	now the health of the swarm of daggers is 50;

regular scheduling of hitting-daggers: compel the action of the swarm of daggers waiting as a reaction to the player.
Testing effects of hitting-daggers: if the player is bloodlusting, rule succeeds.

regular scheduling of smiting-daggers: compel the action of smiting the swarm of daggers.

Testing effects of smiting-daggers: if we assert that the combat status is peace, rule succeeds.
Testing effects of smitten-daggers: if the player is notlusting, rule succeeds.

[If we can think of any tricky cases where the combat status changes during the every turn stage, we should test those]

Initial scheduling of hitting-ape:
	have the player defeat the mindslug;
	revive the blood ape in the location;
	revive fafhrd in the location;
	now the health of the blood ape is 100;

regular scheduling of hitting-ape: compel the action of the blood ape waiting as a reaction to the player.
testing effects of hitting-ape: if the player is bloodlusting, rule succeeds.

regular scheduling of fafhrd-killing-ape:
	now the health of the blood ape is 100;
	compel the action of the blood ape waiting as a reaction to the player.

first standard AI rule for Fafhrd when testing fafhrd-killing-ape (this is the Fafhrd kills ape after player's hit rule):
	transcribe "reducing the ape's health to 1";
	now the health of the blood ape is 1;
	try Fafhrd attacking the blood ape;
	rule succeeds.

The Fafhrd kills ape after player's hit rule is listed before the compel a reaction rule in the standard AI rulebook.

testing effects of fafhrd-killing-ape: if the blood ape is not alive, rule succeeds.
testing effects of fafhrd-killed-ape: if the player is notlusting, rule succeeds.

Chapter - bug 291

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-291	0	1	restarting for tests
sleepy-throwing	1	1	--
in-tungausy-dream	1	1	--
hut-entering	0	1	--
shaman-choosing	1	1	--
player-alert	1	1	--
teleport-waking	1	1	--
sleepy-teleport	1	1	--
sleepy-status	1	1	--
sleepy-slaying	1	1	--

Scenario for bug-291:
	now the dream of tungausy shaman is testobject;
	now the reusable item is a random morphean grenade;
	now the healer of aite is testobject;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject;
	ban wandering monsters;
	allow teleportation;

initial scheduling of bug-291: Now every room is not rust-spored.

initial scheduling of sleepy-throwing: extract the player to the location of the healer of aite.
regular scheduling of sleepy-throwing:
	now the player is just-woken;
	compel the action of throwing the reusable item.

Testing effects of sleepy-throwing: if we assert absence of result "fog of sleep", rule succeeds.
Testing effects of in-tungausy-dream: if we assert that the player is tungausy warrior, rule succeeds.

regular scheduling of hut-entering: compel the action of going inside.

regular scheduling of shaman-choosing: select menu question answer 1.

Testing effects of shaman-choosing:
	Now opposition test subject is the player;
	Repeat with guy running through opposer people in the location:
		assert "[guy] should be asleep" based on whether or not guy is asleep;
	assert that the player is the true body of the player with label "true body of the player";
	assert absence of result "fog of sleep";
	if player is not asleep, rule succeeds.

Testing effects of player-alert: unless the player is just-woken, rule succeeds.

initial scheduling of teleport-waking:
	now the reusable item is a random scroll of teleportation;
	now the healer of aite is not asleep;
	now the teleportation beacon is in a random unoccupied placed room;
	now teleportation-beacon-on is true.

regular scheduling of teleport-waking: compel the action of reading the reusable item as a reaction to the healer of aite.
Before reading when testing teleport-waking: now the player is just-woken.

Testing effects of teleport-waking:
	assert result "fog of sleep";
	unless the player is just-woken, rule succeeds.

Initial scheduling of sleepy-teleport: now the teleportation beacon is in the location of the swarm of daggers.
regular scheduling of sleepy-teleport:
	now the player is just-woken;
	compel the action of reading the reusable item.

Testing effects of sleepy-teleport:
	assert absence of result "fog of sleep";
	if the player is just-woken, rule succeeds.

regular scheduling of sleepy-status: compel the action of asking status.
Testing effects of sleepy-status: if we assert result "You are just-woken: The next attack against you gets a \+3 bonus and \+2 damage\.", rule succeeds.

regular scheduling of sleepy-slaying: compel the action of smiting the swarm of daggers;

testing effects of sleepy-slaying:
	assert result "fog of sleep";
	unless the player is just-woken, rule succeeds.

Chapter - Bug 301 Redux

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
bug-301-aite 	0	1	--	restarting for tests
healer-first-killing	1	1	--	--
other-fanatics-killing	1	1	"compel throwing"	--

scenario for bug-301-aite:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the reusable item is a random fragmentation grenade;
	block interventions;

Initial scheduling of bug-301-aite:
	Now every room is not rust-spored;
	Now every thing is not rusted;
	now the defence of the player is 100;
	now the player worships Sul;
	raise the favour of the player by 4;
	extract the player to Hall of Gods;
	have the player and healer of Aite fight in Arena of the Gods;

Initial scheduling of healer-first-killing: now the health of the player is the permanent health of the player - 1.
regular scheduling of healer-first-killing: compel the action of smiting the healer of aite.

Testing effects of healer-first-killing:
	assert "The healer should be dead" based on whether or not the healer of Aite is dead;
	assert "The tormentor of Aite should be alive" based on whether or not the tormentor of Aite is alive;
	assert "The defender should be alive" based on whether or not the defender of Aite is alive;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	if we assert absence of result "Sul receives .* and fully heals you", rule succeeds.

Initial scheduling of other-fanatics-killing:
	now the health of the tormentor of Aite is 1;
	now the health of the defender of Aite is 1;

testing effects of other-fanatics-killing:
	assert "The tormentor should be dead" based on whether or not the tormentor of Aite is dead;
	assert "The defender should be dead" based on whether or not the defender of Aite is dead;
	assert that the location is Hall of Gods with label "current location";
	assert result "receives the soul";
	assert that the health of the player is the permanent health of the player with label "health of the player";
	if we assert absence of result "receives the soul.* receives the soul", rule succeeds.

[TODO: test reaper following]

Chapter - Armadillo wandering

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
armadillo-wandering	1	1	--	restarting for tests
armadillo-can-move	1	1	--	--
armadillo-moved	1	0	200	--

Scenario for armadillo-wandering:
	prevent sleeping;
	now the ravenous armadillo is testobject.

Armadillo-origin is a room that varies.

Testing effects of armadillo-wandering: if the ravenous armadillo is acting independently, rule succeeds.
Testing effects of armadillo-can-move: if the ravenous armadillo can move, rule succeeds.

Initial scheduling of armadillo-moved: now armadillo-origin is the location of the ravenous armadillo.
Regular scheduling of armadillo-moved: compel the action of waiting.
Testing effects of armadillo-moved: if the location of the armadillo is not the armadillo-origin, rule succeeds.

Chapter - Unlocking - issue 243

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
unlocking-behavior	0	1	restarting for tests

to assert that placement possibility is (allowable - a truth state) when (conditions - indexed text):
	now basic game mode is false;
	follow the decide basic mode rule;
	assert "basic game mode should not be [allowable] when  difficulty is [the difficulty] and advanced content is [if advanced content is enabled]en[otherwise]dis[end if]abled and the dungeon generation seed is [the dungeon generation seed]" based on whether or not basic game mode is not allowable;
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


Scenario for unlocking-behavior:
	Let the saved seed be the dungeon generation seed;
	now the dungeon generation seed is 0;
	set difficulty to 0;
	disable advanced content;
	assert that setting of current difficulty is 0 with label "current difficulty setting";
	assert that difficulty is 0 with label "difficulty";
	assert "advanced content should be disabled" based on whether or not advanced content is disabled;
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
	now the dungeon generation seed is the saved seed;
	set difficulty to 0;
	disable advanced content;
	assert that placement possibility is true when "in novice level with a preset dungeon generation seed";
	enable advanced content;
	assert that placement possibility is true when "in novice level with advanced content enabled with a preset dungeon generation seed";
	set difficulty to 1;
	disable advanced content;
	assert that placement possibility is true when "in apprentice level with a preset dungeon generation seed";
	enable advanced content;
	assert that placement possibility is true when "in apprentice level when advanced content is enabled with a preset dungeon generation seed";

Chapter - bug 293 - Sensing Isra and Fell

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
bug-293	0	1	--	restarting for tests
israfel-splitting-293	1	1	--	--
isra-and-fell-scattering	1	1	"compel throwing"	--
psycholocating-293	1	1	--	--
isra-defeating-293	1	1	--	--
fell-defeating-293	1	1	--	--

scenario for bug-293:
	now the reusable item is a random teleportation grenade;
	now israfel is testobject;

initial scheduling of israfel-splitting-293: extract the player to the location of israfel.
regular scheduling of israfel-splitting-293: compel the action of israfel israfel-splitting.
testing effects of israfel-splitting-293: if Israfel is off-stage, rule succeeds.

Testing effects of isra-and-fell-scattering: if isra is not off-stage and fell is not off-stage, rule succeeds.

initial scheduling of psycholocating-293:
	if the location of Isra is the location:
		extract Isra to a random unoccupied reachable room;
	if the location of Fell is the location:
		extract Fell to the location of Isra;
	repeat with guy running through people in the location of isra:
		if guy is not isra and guy is not Fell:
			extract guy to the location;
	repeat with guy running through people in the location of fell:
		if guy is not fell and guy is not Isra:
			extract guy to the location;
	now the reusable item is a random scroll of psycholocation.

regular scheduling of psycholocating-293:
	try reading the reusable item;
	try sensing.

Testing effects of psycholocating-293:
	assert "Isra should be psycholocatable" based on whether or not Isra is psycholocation-revealed;
	assert "Fell should be psycholocatable" based on whether or not fell is psycholocation-revealed;
	assert result "frozen lightning";
	assert result "molten thunder";
	rule succeeds.

initial scheduling of isra-defeating-293: have the player defeat isra.
Testing effects of isra-defeating-293: unless the power of israfel is granted, rule succeeds.

initial scheduling of fell-defeating-293: have the player defeat fell.

Testing effects of fell-defeating-293:
	assert "isra should be dead" based on whether or not isra is dead;
	assert "fell should be dead" based on whether or not fell is dead;
	assert "israfel should be off-stage" based on whether or not israfel is off-stage;
	[assert result "Israfel's dying cry shakes the foundations of the world";]
	if the power of israfel is granted, rule succeeds.

Chapter - Bug #397  - Overmind and Soul Absorption

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
bug-397	0	1	--	restarting for tests
overmind-assembly	1	0	"overmind call"	--
overmind-alliance	1	1	"overmind call"	--
absorb-first-ally	1	1	"absorb target"	--
absorb-overmind	1	1	"absorb target"	--
absorb-second-ally	1	1	"absorb target"	--

Scenario for bug-397:
	ban wandering monsters;
	Now the overmind is testobject; [overriding the wandering ban]

first-overmind-ally is an object that varies.
second-overmind-ally is an object that varies.
		
initial scheduling of bug-397:
	extract the player to the location of the overmind;

Regular scheduling of an outcome labeled "overmind call":
	now the concentration of the overmind is 1;
	compel the action of the overmind overmind-calling.

Testing effects of overmind-assembly:
	Repeat with guy running through npc people in the location:
		unless guy opposes the overmind or the level of guy is 0 or the level of guy > 3:
			if first-overmind-ally is nothing:
				transcribe "making [guy] the first target";
				now first-overmind-ally is guy;
			otherwise if first-overmind-ally is not guy:
				transcribe "making [guy] the second target";
				now second-overmind-ally is guy;
				[TODO: if we want monsters to claim kills for the ovemind,
				that has to be implemented and tested]
				rule succeeds;

[once again, we are not currently testing if the second-overmind-ally is claiming kills for the overmind]
Testing effects of overmind-alliance: rule succeeds.

The smiting target is a person that varies.

Regular scheduling of an outcome labeled "absorb target":
	now the health of the player is 1;
	compel the action of smiting the smiting target.
Testing effects of an outcome labeled "absorb target":
	assert that the health of the player is permanent health of the player with label "health of the player";
	Let soul be a random power granted by the smiting target;
	if soul is granted, rule succeeds.

Initial scheduling of absorb-overmind: now the smiting target is the overmind.
Initial scheduling of absorb-first-ally: now the smiting target is first-overmind-ally.
Initial scheduling of absorb-second-ally: now the smiting target is second-overmind-ally.

Chapter - Weapon aftereffects

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
weapon aftereffects	0	1	--	restarting for tests
fafhrd-battling	1	1	--	--
basic-hit	1	1	--	--
basic-hit-retaining	5	5	"retain rapier"	basic-hit
fafhrd-dodge	1	1	--	--
fafhrd-dodge-retaining	5	5	"retain rapier"	fafhrd-dodge
fafhrd-parry-rapier	1	1	--	--
parried-rapier-shatters	1	1	"lose weapon"	fafhrd-parry-rapier
fafhrd-parry-fists	1	1	--	--
rapier-recovery	1	1	"retain rapier"	--
rapier-inventory	1	1	--	--
dodge-fafhrd	1	1	--	--
dodge-fafhrd-retaining	1	1	"retain rapier"	dodge-fafhrd
dodge-fafhrd-fail	1	1	--	--
dodge-fafhrd-fail-retaining	1	1	"retain rapier"	dodge-fafhrd-fail
parry-fafhrd-fail	1	1	--	--
parry-fafhrd-fail-retaining	1	1	"retain rapier"	parry-fafhrd-fail
parry-fafhrd-protected	1	1	--	--
parry-fafhrd-protected-retaining	1	1	"retain rapier"	parry-fafhrd-protected
parry-fafhrd	1	1	--	--
parry-fafhrd-shatter	1	1	"lose weapon"	parry-fafhrd

[TODO: claymore parries projectile & tethered weapon]
[TODO: add gauntlet of attraction tests]

initial scheduling of weapon aftereffects:
	Repeat with guy running through people:
		now inherent damage modifier of the guy is 10;
	now every weapon is not cursed.

Last testing effects of an outcome labeled "retain rapier":
	if the number of readied weapons enclosed by the player is greater than 1:
		now the failure report is "the player has too many readied weapons: [the list of readied weapons enclosed by the player]";
		rule fails;
	if the player holds the gilded rapier and the gilded rapier is readied, rule succeeds.

Last testing effects of a outcome labeled "lose weapon":
	if the number of readied weapons enclosed by the player is greater than 1:
		now the failure report is "the player has too many readied weapons: [the list of readied weapons enclosed by the player]";
		rule fails;
	Let the item be a random readied weapon enclosed by the player;
	if item is a natural weapon or item is nothing, rule succeeds.

The sometimes feed armour of thorns rule does nothing when testing weapon aftereffects.

initial scheduling of fafhrd-battling:
	now the body score of fafhrd is 100;
	equip the player with the gilded rapier;
	prepare a test battle with fafhrd;
	now the defence of the player is 50;
	now the health of the player is 1000;

Testing effects of fafhrd-battling: if we assert that the location of Fafhrd is test arena, rule succeeds.

regular scheduling of basic-hit: do the action of Fafhrd waiting for a 100 melee hit by the player.
testing effects of basic-hit:
	assert that the gilded rapier readied after "Fafhrd is hit";
	if we assert result "You deal", rule succeeds.

regular scheduling of fafhrd-dodge: do the action of Fafhrd dodging a 0 melee hit by the player.
Testing effects of fafhrd-dodge: if we assert result "you do not overcome Fafhrd", rule succeeds.

Regular scheduling of fafhrd-parry-rapier: do the action of Fafhrd parrying a 0 melee hit by the player.
Testing effects of fafhrd-parry-rapier: if we assert result "The claymore shatters the gilded rapier!", rule succeeds.

regular scheduling of fafhrd-parry-fists: do the action of Fafhrd parrying a 0 melee hit by the player.
Testing effects of fafhrd-parry-fists:
	assert result "you do not overcome Fafhrd";
	assert that the global attacker weapon is a random natural weapon enclosed by the player with label "global attacker weapon";
	if we assert absence of result "The claymore shatters", rule succeeds.

initial scheduling of rapier-recovery: equip the player with the gilded rapier.

regular scheduling of rapier-inventory: try taking inventory.
testing effects of rapier-inventory:
	assert absence of result "\(readied\).*\(readied\)";
	if we assert result "gilded rapier \(readied\)", rule succeeds.

regular scheduling of dodge-fafhrd: do the action of dodging a 0 melee hit by Fafhrd.
testing effects of dodge-fafhrd: if we assert result "Fafhrd does not overcome your defence rating", rule succeeds.

regular scheduling of dodge-fafhrd-fail: do the action of dodging a 100 melee hit by Fafhrd.
Testing effects of dodge-fafhrd-fail: if we assert result "Fafhrd beats your defence rating", rule succeeds.

regular scheduling of parry-fafhrd-fail: do the action of parrying a 100 melee hit by Fafhrd.
Testing effects of parry-fafhrd-fail: if we assert result "Fafhrd beats your defence rating", rule succeeds.

regular scheduling of parry-fafhrd-protected:
	now the hit protection of the player is 1;
	do the action of parrying a 100 melee hit by Fafhrd.

Testing effects of parry-fafhrd-protected:
	assert that the hit protection of the player is 0 with label "hit protection of the player";
	if we assert result "Fafhrd beats your defence rating", rule succeeds.

regular scheduling of parry-fafhrd: do the action of parrying a 0 melee hit by Fafhrd.
Testing effects of parry-fafhrd: if we assert result "The claymore shatters the gilded rapier!", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
scythe-vs-fafhrd	1	1
fafhrd-parry-fail	1	1
fafhrd-parry-scythe	1	1
scythe-parry-fafhrd	1	1
scythe-vs-chains	1	1
chains-parry-scythe	1	1
chains-dodge-fail	1	1
parry-chains	1	1

Initial scheduling of scythe-vs-fafhrd:
	equip the player with the scythe of oxidation;
	now the body score of fafhrd is 0;

regular scheduling of scythe-vs-fafhrd: do the action of fafhrd waiting for a 100 melee hit by the player.
Testing effects of scythe-vs-fafhrd: if we assert result "You deal", rule succeeds.

regular scheduling of fafhrd-parry-fail: do the action of fafhrd parrying a 100 melee hit by the player.
Testing effects of fafhrd-parry-fail:
	assert result "You deal";
	assert absence of result "the claymore rusts";
	assert "Fafhrd should not be rusted" based on whether or not Fafhrd is not rusted;
	if the claymore is not rusted, rule succeeds.

regular scheduling of fafhrd-parry-scythe: do the action of fafhrd parrying a 0 melee hit by the player.
Testing effects of fafhrd-parry-scythe:
	assert result "Having been in contact with the scythe of oxidation, the claymore rusts";
	if the claymore is rusted, rule succeeds.

initial scheduling of scythe-parry-fafhrd: now the claymore is not rusted.
regular scheduling of scythe-parry-fafhrd: do the action of parrying a 0 melee hit by Fafhrd.
Testing effects of scythe-parry-fafhrd:
	assert result "Having been in contact with the scythe of oxidation, the claymore rusts";
	if the claymore is rusted, rule succeeds.

Initial scheduling of scythe-vs-chains: prepare a test battle with the chain golem.
regular scheduling of scythe-vs-chains: do the action of the chain golem dodging a 0 melee hit by the player.
Testing effects of scythe-vs-chains:
	assert result "you do not overcome";
	assert "The chain golem should not be rusted" based on whether or not the chain golem is not rusted;
	if the current weapon of the chain golem is not rusted, rule succeeds.

Regular scheduling of chains-parry-scythe: do the action of the chain golem parrying a 0 melee hit by the player.
Testing effects of chains-parry-scythe:
	assert result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	assert "The chain golem should not be rusted even though the lashing chains are rusted" based on whether or not the chain golem is not rusted;
	if the current weapon of the chain golem is rusted, rule succeeds.

initial scheduling of chains-dodge-fail: now the current weapon of the chain golem is not rusted.
regular scheduling of chains-dodge-fail: do the action of the chain golem dodging a 100 melee hit by the player.
Testing effects of chains-dodge-fail:
	assert result "Having been hit with the scythe of oxidation, the chain golem rusts!";
	assert "The lashing chains should not be rusted after the chain golem is hit by the scythe of oxidation" based on whether or not the current weapon of the chain golem is not rusted;
	if the chain golem is rusted, rule succeeds.

initial scheduling of parry-chains: now the chain golem is not rusted.
regular scheduling of parry-chains: do the action of parrying a 0 melee hit by the chain golem.
Testing effects of parry-chains:
	assert result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	if the current weapon of the chain golem is rusted, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
lionshield-vs-chains	1	1
lion-block-chains	1	1
chains-vs-thorns	1	1
thorns-dodge-chains-protected	1	1
thorns-dodge-chains	1	1
lionshield-vs-bodmall	1	1
bodmall-vs-thorns	1	1
thorns-dodge-bodmall-fail	1	1

Initial scheduling of lionshield-vs-chains:
	now the health of the chain golem is 100;
	equip the player with the lion's shield.

regular scheduling of lionshield-vs-chains: do the action of dodging a 0 melee hit by the chain golem.
Testing effects of lionshield-vs-chains:
	assert result "the chain golem does not overcome";
	assert absence of result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	if the health of the chain golem is 100, rule succeeds.

regular scheduling of lion-block-chains: do the action of blocking a 0 melee hit by the chain golem.
Testing effects of lion-block-chains:
	assert result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	if we assert that the health of the chain golem is 98, rule succeeds.

Initial scheduling of chains-vs-thorns:
	now the health of the chain golem is 100;
	equip the player with the armour of thorns.

regular scheduling of chains-vs-thorns: do the action of dodging a 0 melee hit by the the chain golem.
Testing effects of chains-vs-thorns:
	assert result "the chain golem does not overcome";
	assert absence of result "armour of thorns scratches the chain golem for 1 damage";
	if the health of the chain golem is 100, rule succeeds.

initial scheduling of thorns-dodge-chains-protected:
	now the health of the chain golem is 100;
	now the hit protection of the player is 1;

regular scheduling of thorns-dodge-chains-protected: do the action of dodging a 100 melee hit by the the chain golem.
testing effects of thorns-dodge-chains-protected: if we assert absence of result "armour of thorns scratches the chain golem", rule succeeds.

initial scheduling of thorns-dodge-chains:
	now the hit protection of the player is 0;

regular scheduling of thorns-dodge-chains: do the action of dodging a 100 melee hit by the the chain golem.
Testing effects of thorns-dodge-chains:
	assert result "armour of thorns scratches the chain golem for 1 damage";
	if the health of the chain golem is 99, rule succeeds.

Initial scheduling of lionshield-vs-bodmall:
	prepare a test battle with bodmall;
	now the health of bodmall is 100.

[TODO: make sure the lion's shield doesn't work when it's not worn or when not blocking]
[TODO: test everything with the demonic mistress - tethered but not natural weapon]

regular scheduling of lionshield-vs-bodmall: do the action of blocking a 0 melee hit by bodmall.
Testing effects of lionshield-vs-bodmall:
	assert result "Bodmall does not overcome";
	assert absence of result "lion on the shield strikes out";
	if we assert that the health of bodmall is 100, rule succeeds.

[should the lion's shield bite the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]

regular scheduling of bodmall-vs-thorns: do the action of dodging a 0 melee hit by bodmall.
Testing effects of bodmall-vs-thorns:
	assert result "Bodmall does not overcome";
	assert absence of result "armour of thorns scratches Bodmall for 1 damage";
	if we assert that the health of Bodmall is 100, rule succeeds.

regular scheduling of thorns-dodge-bodmall-fail: do the action of dodging a 100 melee hit by Bodmall.
Testing effects of thorns-dodge-bodmall-fail:
	assert result "Bodmall beats your defence rating";
	if we assert that the health of Bodmall is 100, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
mouser-dodge-greasy	20	20	--
mouser-parry-greasy	20	20	--	--
greasy-retaining	1	1	"retain rapier"	--
greasy-undodged-drop	1	6	--	--
greasy-undodged-dropped	1	1	"lose weapon"	greasy-undodged-drop
greasy-parry-fail	20	20	--	--
greasy-parry-fail-retaining	1	1	"retain rapier"	--
greasy-parry-drop	1	4	--	--
greasy-parry-dropped	1	1	"lose weapon"	greasy-parry-drop

Initial scheduling of mouser-dodge-greasy:
	equip the player with the greasy gauntlets;
	equip the player with the gilded rapier;
	prepare a test battle with mouser;

regular scheduling of mouser-dodge-greasy: do the action of mouser dodging a 0 melee hit by the player.
testing effects of mouser-dodge-greasy: if we assert absence of result "you drop the gilded rapier", rule succeeds.

regular scheduling of mouser-parry-greasy: do the action of mouser parrying a 0 melee hit by the player.
testing effects of mouser-parry-greasy: if we assert absence of result "you drop the gilded rapier", rule succeeds.

regular scheduling of greasy-undodged-drop:
	equip the player with the gilded rapier;
	do the action of mouser dodging a 100 melee hit by the player.
testing effects of greasy-undodged-drop: if we assert result "you drop the gilded rapier", rule succeeds.

initial scheduling of greasy-parry-fail: equip the player with the gilded rapier.
regular scheduling of greasy-parry-fail: do the action of parrying a 100 melee hit by Mouser.
testing effects of greasy-parry-fail: if we assert absence of result "you drop the gilded rapier", rule succeeds.

regular scheduling of greasy-parry-drop:
	equip the player with the gilded rapier;
	do the action of parrying a 0 melee hit by mouser.
testing effects of greasy-parry-drop: if we assert result "you drop the gilded rapier", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
mouser-vs-thorns	1	1
thorns-dodge-mouser-fail	1	1

regular scheduling of mouser-vs-thorns:
	now the health of mouser is 100;
	[TODO:should the thorns scratch the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]
	do the action of dodging a 0 melee hit by the mouser.

testing effects of mouser-vs-thorns:
	assert result "Mouser does not overcome";
	assert absence of result "armour of thorns scratches Mouser for 1 damage";
	if we assert that the health of mouser is 100, rule succeeds.

regular scheduling of thorns-dodge-mouser-fail: do the action of dodging a 100 melee hit by the mouser.
testing effects of thorns-dodge-mouser-fail:
	assert result "armour of thorns scratches Mouser for 1 damage";
	if we assert that the health of mouser is 99, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
israfel-blinds-sighted	1	1	"israfel blinds"
israfel-blinds-blind	0	1	"israfel blinds"
israfel-blinds-blind-eyeless	0	1	"israfel blinds"
israfel-blinds-eyeless-player	0	1	"israfel blinds"
israfel-blinds-eyeless-monster	1	1	--

initial scheduling of israfel-blinds-sighted:
	prepare a test battle with israfel;
	extract the jumping bomb to the location;
	
Regular scheduling of an outcome labeled "israfel blinds": do the action of waiting for a 100 melee hit by Israfel.
Testing effects of an  outcome labeled "israfel blinds": if we assert result "Israfel's flaming attack blinds you", rule succeeds.

Initial scheduling of israfel-blinds-blind-eyeless:
	[Israfel's code re-blinds anyone who has a flash grenade timer <= 6 but is not blind... not sure why it's written that way, but the effect is that an eyeless player can be re-blinded when they're already blind. This is currently considered a failure.]
	now the flash-grenade-timer of the player is 5;
	now eyeless vision is adapted.

Initial scheduling of israfel-blinds-eyeless-player: now the flash-grenade-timer of the player is 0.

Initial scheduling of israfel-blinds-eyeless-monster:
	now eyeless vision is not adapted;
	now the flash-grenade-timer of the player is 0.
	
Regular scheduling of israfel-blinds-eyeless-monster: do the action of JB waiting for a 100 melee hit by Israfel.

Testing effects of israfel-blinds-eyeless-monster: if we assert absence of result "flaming attack blinds", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
fell-blinds-sighted	1	1	"fell blinds"
fell-blinds-blind	0	1	"fell blinds"
fell-blinds-blind-eyeless	0	1	"fell blinds"
fell-blinds-eyeless-player	0	1	"fell blinds"
fell-blinds-eyeless-monster	1	1	--

initial scheduling of fell-blinds-sighted:
	prepare a test battle with fell;
	extract the jumping bomb to the location;
	
Regular scheduling of an outcome labeled "fell blinds": do the action of waiting for a 100 melee hit by fell.
Testing effects of an outcome labeled "fell blinds": if we assert result "Fell's nails strike your eyes, blinding you for 3 turns", rule succeeds.

Initial scheduling of fell-blinds-blind-eyeless:
	now the flash-grenade-timer of the player is 2;
	now eyeless vision is adapted.

Initial scheduling of fell-blinds-eyeless-player: now the flash-grenade-timer of the player is 0.

Initial scheduling of fell-blinds-eyeless-monster:
	now eyeless vision is not adapted;
	now the flash-grenade-timer of the player is 0.
	
Regular scheduling of fell-blinds-eyeless-monster: do the action of JB waiting for a 100 melee hit by fell.

Testing effects of fell-blinds-eyeless-monster: if we assert absence of result "Fell's nails strike", rule succeeds.

[TODO: stun effect - Malleus should not stun dead opponent]
[TODO: Hot weapons only do heat damage (or break because of heat)? if not projectile]
[TODO: test armor of thorns (started) and Israfel (done yet?),
when hitting with damage (done)
hitting without damage (not done)
vs chain golem, bodmall, and hand-to-hand attacker, and missing - (all started)]

Chapter - Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
damage-text	0	1	restarting for tests
basic attack damage text	1	1	--
tense attack damage text	1	1	--
divine-lightning text	1	1	--
fragmentation damage text	1	1	--

[Test every instance of the "inflict" phrase. If you add an invocation, please consider adding a test here.]

[TODO: test #384 - glass cannon weapon damage bonus]

Scenario for damage-text:
	now generation info is true;
	ban faculty modifiers;
	prevent sleeping;
	now Drawing Room is bannedobject;
	now Vast Staircase is testobject;
	now slaying-kit is testobject;

Initial scheduling of basic attack damage text:
	prepare a test battle with the reaper;
	now the health of the player is 1000;
	set the tension to 0;

Regular scheduling of basic attack damage text: do the action of the reaper dodging a 100 melee hit by the player.
Testing effects of basic attack damage text:
	assert that a random readied weapon enclosed by the Reaper is the scythe of slaying with label "Reaper's weapon";
	if we assert result "(\n|^)You deal <1-9><0-9>* damage", rule succeeds.

Regular scheduling of tense attack damage text:
	set the tension to 3;
	capture damage text; [TODO: reset capture mode when "make possible?" or "scheduling?" - done but possibly not done right]
	do the action of the reaper dodging a 100 melee hit by the player.

Testing effects of tense attack damage text: if we assert result "\+ 1 \(tension\)", rule succeeds.

regular scheduling of divine-lightning text: say Divine lightning strikes the player;
testing effects of divine-lightning text: if we assert result "(\n|^)A ball of lightning shoots from the sky, doing <3-7> damage to you", rule succeeds.

regular scheduling of fragmentation damage text: have a fragmentation event in the location with a random fragmentation grenade by the player.
testing effects of fragmentation damage text: if we assert result "<2-5> damage to the Reaper; and <2-5> damage to you", rule succeeds.

[skip fragmentation in other rooms because no damage text is printed]

Section - Defensive and Religious Items Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
dodge-thorns damage text	1	1	--
lion-block damage text	1	1	--
death-scroll damage text	1	1	"try reading"
anti-purification damage text	1	1	--
aite-statue damage text	1	1	--

Initial scheduling of dodge-thorns damage text:
	[This is for the rest of the tests, to make sure everyone does some damage when they hit]
	Repeat with guy running through people:
		now inherent damage modifier of the guy is 10;

Regular scheduling of dodge-thorns damage text:
	now the armour of thorns is not cursed;
	equip the player with the armour of thorns;
	now the blood magic level of the armour of thorns is 1;
	do the action of dodging a 100 melee hit by the reaper.

Testing effects of dodge-thorns damage text: if we assert result "(\n|^)The armour of thorns scratches the Reaper for 1 damage.", rule succeeds.

Regular scheduling of lion-block damage text:
	now the player wears the lion's shield;
	do the action of blocking a 0 melee hit by the reaper.

Testing effects of lion-block damage text: if we assert result "(\n|^)The lion on the shield strikes out, and bites the Reaper for 2 damage.", rule succeeds.

Initial scheduling of death-scroll damage text: now the reusable item is a random scroll of death.

Testing effects of death-scroll damage text: if we assert result "(\n|^)A wave of unholy energy is released, dealing <3-6> damage to the Reaper; and <3-6> damage to you.", rule succeeds.

[not sure how we could trigger an unholy wave in another room, but it wouldn't print anything anyway]

Regular scheduling of anti-purification damage text:
	now the player worships Chton;
	now the player carries the vial of purification;
	try drinking the vial of purification.

Testing effects of anti-purification damage text: if we assert result "(\n|^)Chton prevents the vial of purification from doing its work; but your attempt at escaping undeath did not amuse him. A wave of extreme cold racks your body, dealing 15 damage!", rule succeeds.

Regular scheduling of aite-statue damage text:
	extract the player to the Temple of Aite;
	try climbing the statue of Aite.

Testing effects of aite-statue damage text: if we assert result "(\n|^)You cut yourself as soon as you touch the statue\. The weapons deal 3 damage\.", rule succeeds.

Section - Special Monster Power Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
abyss-wave damage text	1	1
chain-smack damage text	1	1
bomb-power damage text	1	1

Initial scheduling of abyss-wave damage text: prepare a test battle with the abyss of the soul.
regular scheduling of abyss-wave damage text: try the abyss of the soul pulsating.
Testing effects of abyss-wave damage text: if we assert result "(\n|^)The abyss of the soul pulsates, sending out a wave of negative energy that deals <1-2> damage to you.", rule succeeds.

Initial scheduling of chain-smack damage text:
	prepare a test battle with the chain golem;
	now the body score of the player is -100;
	now the melee of the player is 0;
	now the health of the chain golem is 1000;
	now the defence of the chain golem is 50;
	now the concentration of the chain golem is 3.

regular scheduling of chain-smack damage text: try attacking the chain golem.
[TODO: make sure attacking doesn't leave crap in the delayed actions table?]
Testing effects of chain-smack damage text: if we assert result "(\n|^)You attempt to duck under the whirling chains\. You roll <0-9>+ \+ -100 \(body\) = -<0-9>+ against a target number of <0-9>+, failing the body check\. One of the chains catches you with a loud smack, dealing <3-6> damage\.", rule succeeds.

Regular scheduling of bomb-power damage text:
	now the power of the bomb is granted;
	now the health of the player is 0;
	now the health of the chain golem is 1000;
	have an event of the chain golem killing the player.

Testing effects of bomb-power damage text: if we assert result "(\n|^)Your body explodes vehemently as you throw yourself at the chain golem, but you only deal 5 damage instead of the 1000 damage you needed to deal.", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
tentacle-hold no damage text	1	1
tentacle-attack wounding text	1	1
tentacle-constrict damage text	1	1

Initial scheduling of tentacle-hold no damage text:
	prepare a test battle with the tentacle;
	now the hit protection of the player is 1;
	[make sure the tentacle "holds on to you" when the attack does no damage]

regular scheduling of tentacle-hold no damage text: do the action of dodging a 100 melee hit by the tentacle.
Testing effects of tentacle-hold no damage text: if we assert "The giant tentacle deals" to the player a total of 0 damage "but holds on to you\.", rule succeeds.

Initial scheduling of tentacle-attack wounding text:
	now the tentacle does not grapple the player;
	set the tension to 3;

regular scheduling of tentacle-attack wounding text: do the action of dodging a 100 melee hit by the tentacle.
Testing effects of tentacle-attack wounding text:
	assert result "(\n|^)The giant tentacle deals 0 \+ <^=>+ = \d+ damage, wounding you to \d+ health\.";
	check damage of the player with 1000 health after "deals";
	rule succeeds.

regular scheduling of tentacle-constrict damage text: try the tentacle tentacle-constricting;
Testing effects of tentacle-constrict damage text: if we assert "The giant tentacle tightens its muscles, dealing" to the player a total of 1 damage "to you", rule succeeds.

Section - Bodmall Thorns and Israfel Burning Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
thorns-launch damage text	1	1
israfel-burn damage text	1	1
isra-burn damage text	1	1

Regular scheduling of thorns-launch damage text:
	now brambles strength is 1;
	launch the thorns.

Testing effects of thorns-launch damage text: if we assert "Thorns shoot towards everyone, dealing 1 damage to the giant tentacle; and" to the player a total of 1 damage "to you\.", rule succeeds.

Initial scheduling of israfel-burn damage text: prepare a test battle with Israfel.
regular scheduling of israfel-burn damage text: do the action of Israfel waiting for a 100 melee hit by the player.
Testing effects of israfel-burn damage text: if we assert 3 damage to the player after "Israfel's flames burn you for", rule succeeds.

initial scheduling of isra-burn damage text: try israfel israfel-splitting.
regular scheduling of isra-burn damage text: do the action of isra waiting for a 100 melee hit by the player.
Testing effects of isra-burn damage text: if we assert 2 damage to the player after "Isra's flames burn you for", rule succeeds.

[TODO: check damage and damage description in one phrase?]

Section - Miscellaneous Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
aite-spike damage text	1	1	--
asdt-sleeper	1	1	"spike healer"
asdt-reduction	1	1	"spike healer"
asdt-concentration	1	1	"spike healer"
asdt-dead-beloved	1	1	"spike healer"

Regular scheduling of Aite-spike damage text: deal 3 points of Aite-damage to the player on behalf of the player.
Testing effects of Aite-spike damage text: if we assert 3 damage to the player after "A huge <a-w>+ bursts out of the ground, skewering you for", rule succeeds.

Regular scheduling of an outcome labeled "spike healer": deal 3 points of Aite-damage to the healer of Aite on behalf of the player.

Initial scheduling of asdt-sleeper:
	prepare a test battle with the healer of Aite;
	now the health of the healer of Aite is 1000;
	now the healer of Aite is asleep;
	
Testing effects of asdt-sleeper:
	assert "healer of Aite should be awake" based on whether or not the healer of Aite is not asleep;
	if we assert result "A huge <a-w>+ bursts out of the ground, skewering the healer of Aite for 3 damage!\n\nThe healer of Aite wakes up!", rule succeeds.
		
Initial scheduling of asdt-reduction:
	now the health of the healer of Aite is 1000;
	now the concentration of the healer of Aite is 3.

Remove specific damage when testing asdt-reduction:
	Remove 3 points of divine damage with reason "testing divine damage reduction".

Testing effects of asdt-reduction:
	assert that the concentration of the healer of Aite is 3 with label "healer's concentration";
	if we assert 0 damage to the healer of Aite after "A huge <a-w>+ bursts out of the ground, skewering the healer of Aite for", rule succeeds.

Initial scheduling of asdt-concentration:
	now the health of the healer of Aite is 1000;
	now the concentration of the healer of Aite is 3;
	
Testing effects of asdt-concentration:
	assert that the concentration of the healer of aite is 0 with label "concentration of the healer";
	if we assert result "A huge <a-w>+ bursts out of the ground, skewering the healer of Aite for 3 damage, breaking his concentration!", rule succeeds.

Initial scheduling of asdt-dead-beloved:
	now the health of the healer of Aite is 1;
	now the concentration of the healer of Aite is 3;

Testing effects of asdt-dead-beloved:
	assert "healer should be dead" based on whether or not the healer of Aite is dead;
	if we assert result "A huge <a-w>+ bursts out of the ground, skewering the healer of Aite for 3 damage and killing him!\n\nClearly, it doesn't always pay off to serve the mad goddess\.", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
chton-wave damage text	1	1	--
sul-sacrifice damage text	1	1	--
deathly-scroll damage text	1	1	"try reading"
downstairs damage text	1	1	--
bees damage text	1	1	--
glass damage text	1	1	--

Initial scheduling of chton-wave damage text:
	prepare a test battle with Isra;
	revive Fell in the location;
	now the reusable item is a random scroll of ghoulification;
	now the health of Isra is 1000;

regular scheduling of chton-wave damage text:
	try reading the reusable item;
	have Chton intervene on behalf of the player.

Testing effects of chton-wave damage text: if we assert "Chton suddenly sends a wave of unholy energy through the room, dealing <3-6> damage to Fell; and" to Isra any damage "to Isra\.", rule succeeds.

[TODO: necromantic damage reduction?]

Initial scheduling of sul-sacrifice damage text:
	extract the player to the temple of Sul;
	now the player does not worship chton.
	
Regular scheduling of sul-sacrifice damage text:	try sacrificing.

Testing effects of sul-sacrifice damage text: if we assert 10 damage to the player after "Sul abhors the undead! Divine wrath strikes you instantly, dealing", rule succeeds.

Initial scheduling of deathly-scroll damage text:
	now the player carries the vial of purification;
	try drinking the vial of purification;
	now the player worships Sul;

Testing effects of deathly-scroll damage text: if we assert "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals" to the player a total of 10 damage "to you\.", rule succeeds.

Initial scheduling of downstairs damage text: extract the player to vast staircase.
Regular scheduling of downstairs damage text: try direction-jumping down.

Testing effects of downstairs damage text: if we assert described damage to the player with 1000 health after "With a loud smack, you land in [the room down from Vast Staircase], receiving", rule succeeds.

Initial scheduling of bees damage text:
	move the swarm of bees to the location;
	compel the action of waiting; [TODO: "wait" label]

Testing effects of bees damage text: if we assert result "The swarm of bees attacks <^\n>+, dealing <1-3> damage\.", rule succeeds.

initial scheduling of glass damage text:
	prepare a test battle with the chain golem;
	equip the player with the glass cannon.

regular scheduling of glass damage text: do the action of the chain golem waiting for a 100 melee hit by the player.
testing effects of glass damage text: if we assert result "You deal 10 ", rule succeeds.

Chapter - Attack Modifiers

[TODO: add everything methodically]

[TODO: make sure attack rolls add up]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label	antecedent
attack-modifiers	0	1	--	restarting for tests
radiance-defend-sighted	1	1	"radiant defender"	--
radiance-attack-sighted	1	1	"radiant attacker"	--
radiance-defend-blind	0	1	"radiant defender"	--
radiance-attack-blind	0	1	"radiant attacker"	--
radiance-defend-eyeless-player	0	1	"radiant defender"	--
radiance-attack-eyeless-player	0	1	"radiant attacker"	--
radiance-defend-eyeless-monster	1	1	--	--
radiance-attack-eyeless-monster	1	1	--	--

Scenario for attack-modifiers:
	now evil-kit is bannedobject.

Initial scheduling of radiance-defend-sighted:
	prepare a test battle with the Angel of Compassion;

regular scheduling of an outcome labeled "radiant defender": do the action of the angel of compassion waiting for a 0 melee hit by the player.
testing effects of an outcome labeled "radiant defender": if we assert result "- 4 \(radiance\)<^\n>* you do not overcome", rule succeeds.

regular scheduling of an outcome labeled "radiant attacker": do the action of waiting for a 0 melee hit by the angel of compassion.
testing effects of an outcome labeled "radiant attacker": if we assert result "\+ 4 \(radiance\)<^\n>* compassion does not overcome", rule succeeds.

initial scheduling of radiance-defend-blind: now flash-grenade-timer of the player is 5.

initial scheduling of radiance-defend-eyeless-player:
	now flash-grenade-timer of the player is 0;
	now eyeless vision is adapted.

initial scheduling of radiance-defend-eyeless-monster:
	now the radiation of the player is 4;
	now eyeless vision is not adapted;
	prepare a test battle with the jumping bomb.
	
regular scheduling of radiance-defend-eyeless-monster: do the action of waiting for a 0 melee hit by the jumping bomb.

testing effects of radiance-defend-eyeless-monster: if we assert absence of result "- 4 \(radiance\)<^\n>* jumping bomb does not overcome", rule succeeds.

[The compiler doesn't like the word "jumping" in the name of an actor for an action description. A "to decide which person" phrase doesn't seem to work either]
JB is a person that varies. JB is the jumping bomb.
	
regular scheduling of radiance-attack-eyeless-monster:
	do the action of JB waiting for a 0 melee hit by the player.

testing effects of radiance-attack-eyeless-monster: if we assert absence of result "\+ 4 \(radiance\)<^\n>* you do not overcome", rule succeeds.

Section - Bright Lights in Entrance Hall Attack Modifier

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
sighted-attack-bright	1	1	"bomb bright defense"
blind-attack-bright	0	1	"bomb bright defense"
eyeless-player-attack-bright	0	1	"bomb bright defense"
eyeless-monster-attack-bright	1	1	--

Definition: an outcome is bomb-bright-defending if it is sighted-attack-bright or it is blind-attack-bright or it is eyeless-player-attack-bright.

Initial scheduling of sighted-attack-bright:
	extract the player to Entrance Hall, making sure it is unoccupied;
	now the smoke timer of Entrance Hall is 0;
	extract the jumping bomb to Entrance Hall.

regular scheduling of an outcome labeled "bomb bright defense":
	do the action of JB waiting for a 0 melee hit by the player.

testing effects of an outcome labeled "bomb bright defense": if we assert result "- 2 \(blinding light\)<^\n>* you do not overcome", rule succeeds.

initial scheduling of blind-attack-bright: now flash-grenade-timer of the player is 5.

initial scheduling of eyeless-player-attack-bright:
	now flash-grenade-timer of the player is 0;
	now eyeless vision is adapted.

initial scheduling of eyeless-monster-attack-bright: now eyeless vision is not adapted.
	
regular scheduling of eyeless-monster-attack-bright: do the action of waiting for a 0 melee hit by the jumping bomb.

testing effects of eyeless-monster-attack-bright: if we assert absence of result "- 2 \(blinding light\)<^\n>* jumping bomb does not overcome", rule succeeds.

Section - Hall of Mirrors Attack Modifier

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
sighted-attack-mirrors	5	5	"mirrors attack"
blind-attack-mirrors	0	5	"mirrors attack"
eyeless-player-attack-mirrors	0	5	"mirrors attack"
eyeless-monster-attack-mirrors	5	5	--

Initial scheduling of sighted-attack-mirrors:
	Extract the player to Hall of Mirrors, making sure it is unoccupied;
	Extract the jumping bomb to Hall of Mirrors;
	now the mind score of the player is 3;
	now the spirit score of the player is 0;
	now the mind score of the jumping bomb is 3;
	now the spirit score of the jumping bomb is 0;
	[these stats, with tension 0, should cause mirrors to intervene 100% of the time]
	Repeat with item running through extra things in Hall of Mirrors:
		remove item from play. [remove Focal Totem, etc]
		
Regular scheduling of an outcome labeled "mirrors attack":
	Now the tension is 0;
	do the action of JB waiting for a 100 melee hit by the player.
	
Testing effects of an outcome labeled "mirrors attack":
	if we assert result "Confused by the mirrors, you start attacking a reflection", rule succeeds.

Initial scheduling of blind-attack-mirrors: equip the player with the blindfold.

Initial scheduling of eyeless-player-attack-mirrors:
	remove the blindfold from play;
	now eyeless vision is adapted.
	
Initial scheduling of eyeless-monster-attack-mirrors: now eyeless vision is not adapted.

Regular scheduling of eyeless-monster-attack-mirrors:
	Now the tension is 0;
	now bomb-escape is true;
	do the action of waiting for a 100 melee hit by the jumping bomb.
	
Testing effects of eyeless-monster-attack-mirrors:
	if we assert absence of result "Confused by the mirrors", rule succeeds.

Section - Blindness Attack Modifiers

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
blind-attack	1	1	"blind attacker"
blind-defend	1	1	"blind defender"
blind-eyeless-player-attack	0	1	"blind attacker"
blind-eyeless-player-defend	0	1	"blind defender"
eyeless-player-attack	0	1	"blind attacker"
eyeless-player-defend	0	1	"blind defender"
sighted-attack	0	1	"blind attacker"
sighted-defend	0	1	"blind defender"
eyeless-monster-attack	1	1	--
eyeless-monster-defend	1	1	--

Regular scheduling of an outcome labeled "blind attacker": Do the action of the JB waiting for a 0 melee hit by the player.
Testing effects of an outcome labeled "blind attacker": If we assert result "- 3 \(blindness\)", rule succeeds.

Regular scheduling of an outcome labeled "blind defender": Do the action of the player waiting for a 0 melee hit by the jumping bomb.
Testing effects of an outcome labeled "blind defender": If we assert result "\+ 2 \(defender blind\)", rule succeeds.

Initial scheduling of blind-attack: equip the player with the blindfold.

Initial scheduling of blind-eyeless-player-attack: now eyeless vision is adapted.

Initial scheduling of eyeless-player-attack: remove the blindfold from play.

Initial scheduling of sighted-attack: now eyeless vision is not adapted.

Regular scheduling of eyeless-monster-attack: do the action of waiting for a 0 melee hit by JB.

Testing effects of eyeless-monster-attack: if we assert absence of result "- 3 \(blindness\)", rule succeeds.

Regular scheduling of eyeless-monster-defend: do the action of JB waiting for a 0 melee hit by player.

Testing effects of eyeless-monster-defend: if we assert absence of result "\(defender blind\)", rule succeeds.

[skipping test for AI concentrating in Phantasmagoria - how would we test that anyway?]

Section - Smoke Attack Modifier

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
blind-smoke-attack	0	1	"blind smoke attacker"
blind-eyeless-player-smoke-attack	0	1	"blind smoke attacker"
eyeless-player-smoke-attack	0	1	"blind smoke attacker"
sighted-smoke-attack	1	1	"blind smoke attacker"
eyeless-monster-smoke-attack	1	1	--

Regular scheduling of an outcome labeled "blind smoke attacker": Do the action of the JB waiting for a 0 melee hit by the player.
Testing effects of an outcome labeled "blind smoke attacker": If we assert result "- 2 \(smoke\)", rule succeeds.

Initial scheduling of blind-smoke-attack:
	prepare a test battle with the jumping bomb;
	now the smoke timer of the location is 8;
	equip the player with the blindfold.

Initial scheduling of blind-eyeless-player-smoke-attack: now eyeless vision is adapted.

Initial scheduling of eyeless-player-smoke-attack: remove the blindfold from play.

Initial scheduling of sighted-smoke-attack: now eyeless vision is not adapted.

Regular scheduling of eyeless-monster-smoke-attack: do the action of waiting for a 0 melee hit by JB.

Testing effects of eyeless-monster-smoke-attack: if we assert absence of result "\(smoke\)", rule succeeds.

Section - Size Attack Modifiers

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
too-small-block	1	1	--
agnostic-block	1	1	--
player-size-wait	6	6	"growing defender"
player-size-dodge	6	6	"growing defender"
player-size-parry	6	6	"growing defender"

Initial scheduling of too-small-block:
	prepare a test battle with the armadillo;
	now the player is medium;
	now the wooden buckler is tiny;
	equip the player with the wooden buckler;

Regular scheduling of too-small-block: do the action of blocking a 100 melee hit by the armadillo.
Testing effects of too-small-block: if we assert result "\+ 2 \(defender's shield too small\)", rule succeeds.

Initial scheduling of agnostic-block:
	equip the player with the bulwark of faith;
	now the player worships Sul;
	now favour of the player is 1;

Regular scheduling of agnostic-block: do the action of blocking a 100 melee hit by the armadillo.
Testing effects of agnostic-block: if we assert absence of result "defender's shield too small", rule succeeds.

Initial scheduling of an outcome labeled "growing defender":
	now the player is tiny;
	
First regular scheduling of an outcome labeled "growing defender":
	if the attempt count of the outcome described > 1:
		now the size of the player is the size after the size of the player;
		
Testing effects of an outcome labeled "growing defender":
	Let n be the size number of the player;
	Let minus-n be 0 - n;
	if the outcome described is player-size-parry:
		if n < 0:
			assert result "\+ [minus-n] \(parrying with outsized weapon\)";
		if n > 0:
			assert result "\+ [n] \(parrying with undersized weapon\)";
	if n is 0 or the outcome described is player-size-parry:
		if we assert absence of result "defender [size of the player]", rule succeeds;
	otherwise if n < 0:
		if we assert result "- [minus-n] \(defender [size of the player]\)", rule succeeds;
	otherwise if n > 0:
		if we assert result "\+ [n] \(defender [size of the player]\)", rule succeeds.

regular scheduling of player-size-wait: do the action of waiting for a 0 melee hit by the armadillo.
regular scheduling of player-size-dodge: do the action of dodging a 0 melee hit by the armadillo.

initial scheduling of player-size-parry:
	equip the player with the gilded rapier;
	now the gilded rapier is medium.
regular scheduling of player-size-parry: do the action of parrying a 0 melee hit by the armadillo.

Chapter - Damage Modifiers

[Test every rule in the following rulebooks:

add specific damage
remove specific damage
specific damage multiplier
add general damage
remove general damage
general damage multiplier

If you add any rules, please consider adding a test here]

[TODO: tests for all damage modifier rules]
[TODO: test damage effects, e.g. fragmentation grenade exploding in another room]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
damage-modifiers	0	1	--	restarting for tests
dead-mage-damage	5	5	--	--
protection-damage	1	1	--	--
dragonarmor-damage	1	3	21	--

First regular scheduling of an outcome when testing damage-modifiers: capture damage text.

scenario for damage-modifiers:
	Repeat with guy running through people:
		now inherent damage modifier of the guy is 10;
	ban faculty modifiers;
	prevent curses;
	now Hall of Mirrors is bannedobject;
	now Miranda is testobject.

Last starting kit setup for Miranda when testing damage-modifiers:
	remove Miranda's amulet from play;

Definition: a room is precarious if it is Bridge of Doom or it is the Vast Staircase.

Initial scheduling of dead-mage-damage:
	equip Miranda with nunchucks;
	Now the nunchucks are wood;
	Let the place be the location of Miranda;
	if the place is a precarious room:
		swap the occupants of the place and a random not precarious habitable placed room;
	extract the player to the location of Miranda;
	equip the player with the robe of the dead mage.

regular scheduling of dead-mage-damage:
	now the concentration of the player is the attempt count of dead-mage-damage;
	transcribe "setting player concentration to [concentration of the player]";
	do the action of waiting for a 100 melee hit by Miranda.

testing effects of dead-mage-damage:
	let conc-level be the attempt count of dead-mage-damage;
	if conc-level is 0:
		assert absence of result "robe of the dead mage";
	otherwise:
		assert result "\+ [conc-level * 25]% \(robe of the dead mage\)";
	if the concentration of the player is conc-level, rule succeeds.

initial scheduling of protection-damage:
	try taking off the robe of the dead mage;
	now the hit protection of the player is 1.

regular scheduling of protection-damage: do the action of waiting for a 100 melee hit by Miranda.
testing effects of protection-damage: if we assert result "- 100% \(protection\)", rule succeeds.

initial scheduling of dragonarmor-damage: equip the player with dragon armour.
regular scheduling of dragonarmor-damage: do the action of waiting for a 100 melee hit by Miranda.
testing effects of dragonarmor-damage: if we assert result "- 2 \(dragon armour\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
stun-damage	1	1
no-execution-damage	1	1
execution-damage	1	1
druid-vs-wood	1	1
bark-vs-axe	1	1
faraday-cage	1	1

initial scheduling of stun-damage: now Miranda is at-stun.
regular scheduling of stun-damage: do the action of waiting for a 100 melee hit by Miranda.
testing effects of stun-damage: if we assert result "- 1 \(stunning\)", rule succeeds.

initial scheduling of no-execution-damage:
	now Miranda is not at-stun;
	equip the player with the executioner's axe;
	set the tension to 2.

regular scheduling of no-execution-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of no-execution-damage: if we assert absence of result "executioner's axe benefits from tension", rule succeeds.

initial scheduling of execution-damage: set the tension to 3.
regular scheduling of execution-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of execution-damage: if we assert result "\+ 1 \(executioner's axe benefits from tension\) ", rule succeeds.

initial scheduling of druid-vs-wood: extract Bodmall to the location.
regular scheduling of druid-vs-wood: do the action of Bodmall waiting for a 100 melee hit by Miranda.
Testing effects of druid-vs-wood: if we assert result "- 1 \(druid resistant to wood\)", rule succeeds.

[barkskin does not protect against axes]
initial scheduling of bark-vs-axe: now Bodmall is barkskinned.
regular scheduling of bark-vs-axe: do the action of Bodmall waiting for a 100 melee hit by the player.
testing effects of bark-vs-axe: if we assert absence of result "barkskin", rule succeeds.

initial scheduling of faraday-cage: equip the player with the plate mail.
regular scheduling of faraday-cage: do the action of waiting for a 100 melee hit by Bodmall.
Testing effects of faraday-cage: if we assert result "- 3 \(suit acts as a Faraday cage\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts
pro-axe-damage	1	4	20
malleus-blood-damage	1	1	--
no-crossbow-tension-damage	1	1	--
crossbow-tension-damage	1	1	--

initial scheduling of pro-axe-damage:
	remove Bodmall from play;
	try taking off the plate mail;
	now the power of the minotaur is granted;
	now the body score of the player is 25.

regular scheduling of pro-axe-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of pro-axe-damage: if we assert result "\+ 10 \(axe proficiency\)", rule succeeds.

initial scheduling of malleus-blood-damage:
	equip the player with Malleus Maleficarum;
	now the blood magic level of Malleus Maleficarum is 1;
	set the tension to 10.

regular scheduling of malleus-blood-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of malleus-blood-damage:
	assert result "\+ 1 \(Malleus Maleficarum blood bonus\) ";
	if we assert absence of result "tension<^\n>+ damage", rule succeeds.

initial scheduling of no-crossbow-tension-damage:
	equip the player with the Yahvinnian crossbow;
	set the tension to 1.

regular scheduling of no-crossbow-tension-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of no-crossbow-tension-damage: if we assert absence of result "crossbow benefits from tension", rule succeeds.

initial scheduling of crossbow-tension-damage:
	now the current shots of the Yahvinnian crossbow is 1;
	set the tension to 2.
regular scheduling of crossbow-tension-damage: do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of crossbow-tension-damage: if we assert result "\+ 1 \(crossbow benefits from tension\) ", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
dagger-tension-damage	4	4
giantbane-vs-miranda	1	1
giantbane-vs-chain	1	1

initial scheduling of dagger-tension-damage:
	equip the player with giantbane;
	extract the chain golem to the location;
regular scheduling of dagger-tension-damage:
	if the attempt count of the outcome described is:
		-- 0: set the tension to 20;
		-- 1: set the tension to 8;
		-- 2: set the tension to 7;
		-- 3: set the tension to 1;
	do the action of Miranda waiting for a 100 melee hit by the player.
testing effects of dagger-tension-damage:
	if we assert absence of result "\+ \d+ \(dagger benefits from tension\)", rule succeeds.

initial scheduling of giantbane-vs-miranda:
	set the tension to 0;
	now Miranda is just-woken;
	now the player is at-pierce;
	now the body score of the player is 5;
	now the mind score of the player is 5;
	now the stun count of the player is 0;
	now the player is at-howl;
	now the hound provoker is Miranda;
	now the hound status is 1;
	now the concentration of Miranda is 2;
	now Miranda is linked to the player.

regular scheduling of giantbane-vs-miranda: do the action of Miranda waiting for a 100 melee hit by the player.

testing effects of giantbane-vs-miranda:
	assert that the final body of the player is 5 with label "final body of the player";
	assert that the final mind of the player is 5 with label "final mind of the player";
	assert absence of result "Giantbane's special";
	assert result "\+ 2 \(defender was asleep\)";
	assert result "\+ 3 \(piercing\)";
	assert result "\+ 3 \(howling\)";
	assert result "\+ 2 \(counterstrike\)";
	assert result "\+ 2 \(link\)";
	if we assert absence of result "dagger benefits from tension", rule succeeds.

initial scheduling of giantbane-vs-chain:
	now the hound status is 0;
	now the player is small.

regular scheduling of giantbane-vs-chain: do the action of the chain golem waiting for a 100 melee hit by the player.
testing effects of giantbane-vs-chain:
	assert result "- 1 \(small attacker\)";
	if we assert result "\+ 4 \(Giantbane's special\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
brightflame-damage	1	1
insane-damage	1	8
altered-vs-chain	1	1

initial scheduling of brightflame-damage:
	now the player is medium;
	now the brightest-flame-counter is 1.

regular scheduling of brightflame-damage: do the action of waiting for a 100 melee hit by Miranda.
testing effects of brightflame-damage:
	assert result "- \d+ \(brightest flame\) ";
	if we assert that the total damage is 0, rule succeeds.

Initial scheduling of insane-damage:
	now the brightest-flame-counter is 0;
	now Miranda is insane.

regular scheduling of insane-damage: do the action of waiting for a 100 melee hit by Miranda.
testing effects of insane-damage: if we assert result "\+ 10 \(insane burst of strength\)", rule succeeds.

initial scheduling of altered-vs-chain:
	now Miranda is hostile;
	now the concentration of the chain golem is 1;
	now disintegrating flesh is adapted;
	now metallic scales are adapted.

regular scheduling of altered-vs-chain: do the action of waiting for a 100 melee hit by the chain golem.
testing effects of altered-vs-chain:
	assert result "\+ 2 \(golem spinning\)";
	assert result "\+ 1 \(large attacker\)"; [TODO: primary or physical damage? size-agnostic?]
	assert result "\+ 1 \(disintegrating flesh\)";
	assert result "- 1 \(metallic scales\)";
	rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
blessed-and-cursed	0	1	--	--
death-blessing	1	15	200	blessed-and-cursed
death-curse	1	20	300	blessed-and-cursed
blessing-reset	1	2	10	death-blessing
curse-reset	1	2	10	death-curse

initial scheduling of blessed-and-cursed:
	now disintegrating flesh is not adapted;
	now metallic scales are not adapted;
	remove the chain golem from play;
	[not tested: ethereal damage removal]

regular scheduling of blessed-and-cursed:
		now the player is death-cursed;
		now the player is death-blessed; [nothing says you can't be both!]
		now the health of the player is 1000;
		deal 6 points of physical damage;
		deal 5 points of necromantic damage;
		clear event description;
		say "Chton tests you with [run paragraph on]";
		have Chton inflict damage on the player;

testing effects of blessed-and-cursed: check damage of the player with 1000 health after "Chton tests you with".

testing effects of death-blessing: if we assert result "- 10 \(blessing of life\)", rule succeeds.
testing effects of blessing-reset: if the player is death-blessed, rule succeeds.
testing effects of death-curse: if we assert result "\+ 10 \(curse of death\)", rule succeeds.
testing effects of curse-reset: if the player is death-cursed, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
Miranda-runner	1	1
radiance-reduction	1	1
iron-angelsword-description	1	1
iron-angelsword-damage	1	1
no-radiant-sword-damage	1	1

Initial scheduling of Miranda-runner:
	now the player is not death-blessed;
	now the player is not death-cursed;
	say paragraph break;
	now the player carries the rod of the master builder;
	now retreat location is the location of Miranda;
	now the health of the player is 1000;
	now the melee of Miranda is 100;
	now the offensive flow of Miranda is 1;
	now the concentration of Miranda is 2;
	now the innate bloodlust of Miranda is 1;
	[TODO: test bloodlust/insane strength with staff of pain (no bonus?)]
	now Miranda is bloodlusting;
	set the tension to 3;

regular scheduling of Miranda-runner: compel the action of going the way-to-get-back.

Testing effects of Miranda-runner:
	check damage of the player with 1000 health after "Miranda deals";
	assert result "\+ 1 \(you are running\) ";
	assert result "\+ 1 \(offensive flow\) ";
	assert result "\+ 2 \(concentration\) ";
	assert result "\+ 1 \(tension\) ";
	assert result "\+ 10 \(inherent bonus\) ";
	assert result "\+ 1 \(bloodlust\)";
	assert result "x 50% \(rod of the master builder\) ";
	rule succeeds.

Initial scheduling of radiance-reduction:
	prepare a test battle with the angel of compassion;
	equip the player with the fuligin cloak;
	now the melee of the angel of compassion is 100;
	now the health of the player is 1000.

regular scheduling of radiance-reduction: compel the action of waiting as a reaction to the angel of compassion.

Testing effects of radiance-reduction:
	assert that a random readied weapon enclosed by the angel of compassion is the sword of light with label "Angel of Compassion's weapon";
	assert that the location of the sword of light is the location of the angel of compassion with label "location of the sword of light";
	check damage of the player with 1000 health after "deals";
	assert result "\+ 4 \(sword of light radiance bonus\)";
	if we assert result "- 2 \(fuligin cloak\)", rule succeeds.

initial scheduling of iron-angelsword-description: now the sword of light is iron.
regular scheduling of iron-angelsword-description:
	capture whole events;
	try examining the sword of light.
testing effects of iron-angelsword-description:
	assert result "It seems to consist of pure iron.";
	assert absence of result "damage increases";
	if we assert result "; no special bonus when it is made of iron", rule succeeds.

regular scheduling of iron-angelsword-damage: do the action of waiting for a 100 melee hit by the angel of compassion.
testing effects of iron-angelsword-damage: if we assert absence of result "sword of light radiance bonus", rule succeeds.

initial scheduling of no-radiant-sword-damage:
	now the sword of light is radiance;
	now the radiation of the angel of compassion is 0.

regular scheduling of no-radiant-sword-damage: do the action of waiting for a 100 melee hit by the angel of compassion.
testing effects of no-radiant-sword-damage: if we assert absence of result "sword of light radiance bonus", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
heretic-damage	1	1
chton-statue-damage	1	1
sneaking-sword-damage	1	1
plate-damage	1	1

initial scheduling of heretic-damage: equip the player with the sandals of the heretic.
regular scheduling of heretic-damage: say Divine lightning strikes the player.
testing effects of heretic-damage:
	check damage of the player with 1000 health after "A ball of lightning shoots from the sky, doing";
	if we assert result "- 2 \(sandals of the heretic\)", rule succeeds.

initial scheduling of chton-statue-damage: now chton-killing is true.
regular scheduling of chton-statue-damage: do the action of waiting for a 100 melee hit by the angel of compassion.
testing effects of chton-statue-damage:
	assert result "- 2 \(sandals of the heretic\)";
	if we assert result "\+ 2 \(Chton's wrath pulls you to your grave\) ", rule succeeds.

initial scheduling of sneaking-sword-damage:
	now chton-killing is false;
	equip the player with the sneaking sword;
	force the fuligin cloak to work.

regular scheduling of sneaking-sword-damage: do the action of the angel of compassion waiting for a 100 melee hit by the player.
testing effects of sneaking-sword-damage: if we assert result "\+ 1 \(sneaky attack\) ", rule succeeds.

initial scheduling of plate-damage:
	try taking off the fuligin cloak;
	now the radiation of the angel of compassion is 2;
	equip the player with plate mail.

regular scheduling of plate-damage: do the action of waiting for a 100 melee hit by the angel of compassion.
testing effects of plate-damage: if we assert result "- 2 \(plate mail\) ", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
heat-damage-testing	0	1	--
dragon-vs-hotsword	1	1	--
armadillo-vs-angel	1	1	--
dragon-heat-plus-damage	1	3	--
heat-vulnerable-damage	1	1	dragon-heat-plus-damage
cool-armadillo-damage	1	1	--
rusted-flame-damage	1	1	--

Initial scheduling of heat-damage-testing:
	equip the player with dragon armour;
	now the internal heat of the sword of light is 5;
	now the heat strength of the sword of light is 5;

regular scheduling of dragon-vs-hotsword: do the action of waiting for a 100 melee hit by the angel of compassion.

Testing effects of dragon-vs-hotsword:
	assert result "\+ 5 \(sword of light is hot\)";
	if we assert result "- 4 \(dragon armour protects against heat\)", rule succeeds.

initial scheduling of armadillo-vs-angel: revive the armadillo in the location.
regular scheduling of armadillo-vs-angel: do the action of the armadillo waiting for a 100 melee hit by the angel of compassion.
testing effects of armadillo-vs-angel:
	assert result "- 3 \(intrinsic heat resistance\)";
	if we assert result "- 2 \(victim made of bone\)", rule succeeds.

initial scheduling of dragon-heat-plus-damage:
	now the internal heat of the sword of light is 2;
	now the heat strength of the sword of light is 2;
	now the intrinsic heat resistance of the player is -1.

regular scheduling of dragon-heat-plus-damage: do the action of waiting for a 100 melee hit by the angel of compassion.
testing effects of dragon-heat-plus-damage: if we assert result "- 2 \(dragon armour\)", rule succeeds.
testing effects of heat-vulnerable-damage:
	assert result "- 3 \(dragon armour protects against heat\)";
	if we assert result "\+ 1 \(intrinsic heat vulnerability\)", rule succeeds.

regular scheduling of cool-armadillo-damage: do the action of waiting for a 100 melee hit by the armadillo.
testing effects of cool-armadillo-damage: if we assert absence of result "intrinsic heat vulnerability", rule succeeds.

initial scheduling of rusted-flame-damage:
	equip the player with the scythe of flaming;
	now the scythe of flaming is rusted.

regular scheduling of rusted-flame-damage: do the action of the angel of compassion waiting for a 100 melee hit by the player.
testing effects of rusted-flame-damage:
	assert result "\(scythe of flaming is hot\)"; [not mentioning rust or heat]
	assert result "- 2 \(rust\)";
	if we assert result "- 3 \(victim made of radiance\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
undead-vs-holy-damage	1	1
demon-vs-holy-damage	1	1
human-vs-holy-damage	1	1
ghoul-vs-holy-damage	1	1

Initial scheduling of undead-vs-holy-damage:
	prepare a test battle with the healer of Aite, inviting groups;
	revive the rotting corpse in the location;
	revive the smoke demon in the location;
	Now the spirit score of the healer of Aite is 9.

The undeadguy is a person that varies. The undeadguy is the rotting corpse. [Inform doesn't seem to like "rotting corpse" in stored action]

regular scheduling of undead-vs-holy-damage: do the action of the undeadguy waiting for a 100 melee hit by the healer of Aite.
testing effects of undead-vs-holy-damage: if we assert result "\+ 2 \(holiness\) ", rule succeeds.

initial scheduling of demon-vs-holy-damage:
	remove the dragon armour from play;
	now the scythe of flaming is not rusted;
	now the concentration of the smoke demon is 2;
	set the tension to 9.

regular scheduling of demon-vs-holy-damage: do the action of the smoke demon waiting for a 100 melee hit by the healer of Aite.
testing effects of demon-vs-holy-damage:
	assert result "^ (\d) \+ 10 \(inherent bonus\) \+ 2 \(holiness\) \+ 3 \(tension\) \+ (<1-9>) \(smoke demon is quite dense\)";
	Now the expression scan position is 0;
	Let base damage be the number we scan in text matching subexpression 1;
	Now the expression scan position is 0;
	Let density damage be the number we scan in text matching subexpression 2;
	[holy sword does divine damage, so doesn't add to the density damage]
	assert that density damage is (base damage + 10 + 3) / 2 with label "density damage";
	if we assert result "\+ 2 \(holiness\) ", rule succeeds.

initial scheduling of human-vs-holy-damage: set the tension to 0.
regular scheduling of human-vs-holy-damage: do the action of waiting for a 100 melee hit by the healer of Aite.
testing effects of human-vs-holy-damage: if we assert absence of result "holiness", rule succeeds.

initial scheduling of ghoul-vs-holy-damage:
	now the reusable item is a random scroll of ghoulification;
	now the player carries the reusable item;
	try reading the reusable item.

regular scheduling of ghoul-vs-holy-damage: do the action of waiting for a 100 melee hit by the healer of Aite.
testing effects of ghoul-vs-holy-damage:
	assert result "- 1 \(ghoul\)";
	assert result "- 2 \(sandals of the heretic\)";
	if we assert result "\+ 2 \(holiness\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
undead-vs-silver	1	1
demon-vs-silver	1	1
human-vs-silver	1	1
necromantic-pierce	1	1
undead-vs-necromantic-pierce	1	1

initial scheduling of undead-vs-silver:
	now the player carries the vial of purification;
	try drinking the vial of purification;
	revive the reaper in the location;
	equip the reaper with the scythe of slaying.

regular scheduling of undead-vs-silver: do the action of the undeadguy waiting for a 100 melee hit by the reaper.
testing effects of undead-vs-silver:
	assert result "\+ 4 \(silver\)";
	assert absence of result "- \d+ \(silver\)";
	if we assert result "\+ 5 \(slaying undead\) ", rule succeeds.

regular scheduling of demon-vs-silver: do the action of the smoke demon waiting for a 100 melee hit by the reaper.
testing effects of demon-vs-silver:
	assert result "\+ 4 \(silver\)";
	assert absence of result "- \d+ \(silver\)";
	if we assert absence of result "\+ 5 \(slaying undead\)<^\n>+ damage", rule succeeds.

regular scheduling of human-vs-silver: do the action of waiting for a 100 melee hit by the reaper.
testing effects of human-vs-silver:
	assert absence of result "\+ \d+ \(silver\)";
	if we assert result "- 1 \(silver\)", rule succeeds.

initial scheduling of necromantic-pierce:
	now the tormentor of aite is at-pierce;
	now the body score of the tormentor of aite is 8.

regular scheduling of necromantic-pierce: do the action of the smoke demon waiting for a 100 melee hit by the tormentor of Aite.
testing effects of necromantic-pierce:
	assert absence of result "\+ 3 \(piercing\)"; [piercing only affects physical damage]
	if we assert absence of result " 0$", rule succeeds.

initial scheduling of undead-vs-necromantic-pierce:
	now the unmodified damage is 1000; [triggers an old bug]
	now the tormentor of aite is at-pierce.

regular scheduling of undead-vs-necromantic-pierce: do the action of the undeadguy waiting for a 100 melee hit by the tormentor of Aite.
testing effects of undead-vs-necromantic-pierce:
	assert result "^\s*<1-9>"; [unmodified damage should be nonzero]
	assert result "- \d+ \(undead immune to necromantic damage\)";
	assert absence of result "piercing";
	assert result " 0$";
	if we assert that the total damage is 0, rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
chton-resistant	1	1
scales-damage	1	1
scales-necromantic-damage	1	1
armadillo-power	1	1
bark-necromantic-damage	1	1
druid-vs-vapour	1	1

initial scheduling of chton-resistant: now the player is deathly-resistant.

regular scheduling of chton-resistant: have chton intervene on behalf of the player.

[TODO: phrase to check damage in multiple-person damage report]
testing effects of chton-resistant:
	capture whole events;
	assert result "dealing<^\n>* (\d+) - 2 \(resistant to deathly magic\) = (\d+) damage to you";
	now the expression scan position is 0;
	Let original damage be the number we scan in the text matching subexpression 1;
	now the expression scan position is 0;
	Let final damage be the number we scan in the text matching subexpression 2;
	Let expected damage be original damage - 2;
	if expected damage < 0, now expected damage is 0;
	assert that final damage is expected damage with label "calculated damage";
	if we assert that the health of the player is 1000 - final damage, rule succeeds.

initial scheduling of scales-damage:
	revive the armadillo in the location;
	now the health of the player is 1000;
	now the player is not deathly-resistant.

regular scheduling of scales-damage: do the action of the armadillo waiting for a 100 melee hit by the player.
testing effects of scales-damage: if we assert result "- 4 \(tough scales\)", rule succeeds.

regular scheduling of scales-necromantic-damage: do the action of the armadillo waiting for a 100 melee hit by the Tormentor of Aite.
testing effects of scales-necromantic-damage: if we assert absence of result "tough scales", rule succeeds. [physical damage reduction only]

initial scheduling of armadillo-power: now the power of the armadillo is granted.
regular scheduling of armadillo-power: do the action of waiting for a 100 melee hit by the Tormentor of Aite.
testing effects of armadillo-power: if we assert result "- 1 \(armadillo\)", rule succeeds. [general damage reduction - TODO: should it be?]

[TODO: turn the staff of pain silver and check effects on undead and demons]

initial scheduling of bark-necromantic-damage: revive Bodmall in the location;
regular scheduling of bark-necromantic-damage: do the action of Bodmall waiting for a 100 melee hit by the Tormentor of Aite.
testing effects of bark-necromantic-damage: if we assert absence of result "barkskin", rule succeeds

regular scheduling of druid-vs-vapour: do the action of Bodmall waiting for a 100 melee hit by the smoke demon.
Testing effects of druid-vs-vapour: if we assert result "- 3 \(druid resistant to vapour\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
frag-damage	0	1
scale-power	1	1
chanter-damage	1	1
nomos-damage-reduction	1	1
nomos-bonus-damage	1	1

initial scheduling of frag-damage: revive the wisps of pain in the location.
regular scheduling of frag-damage: have a fragmentation event in the location with a random fragmentation grenade by the player.
testing effects of frag-damage:
	capture whole events;
	assert result "\d - \d \(tough scales\) = \d damage to the ravenous armadillo";
	assert result "\d - \d \(hard to damage\) = 0 damage to the wisps of pain";
	assert result "\d - 1 \(barkskin\) = \d damage to Bodmall";
	assert result "\d - 1 \(armadillo\) = \d damage to you";

initial scheduling of scale-power:
	try taking off the sandals of the heretic;
	now the player is at-scale.
regular scheduling of scale-power: do the action of waiting for a 100 melee hit by the Tormentor of Aite.
Testing effects of scale-power: if we assert result "- 6 \(scales\)", rule succeeds.

initial scheduling of chanter-damage:
	revive the malignant chanter in the location;
	now the concentration of the malignant chanter is 1.

regular scheduling of chanter-damage: do the action of waiting for a 100 melee hit by the rotting corpse.
testing effects of chanter-damage: if we assert result "\+ 1 \(malignant chanter\)", rule succeeds.

initial scheduling of nomos-damage-reduction:
	now the player worships Nomos;
	now the favour of the player is 9.

regular scheduling of nomos-damage-reduction: do the action of waiting for a 100 melee hit by the armadillo.
Testing effects of nomos-damage-reduction: if we assert result "- 4 \(Nomos\)", rule succeeds.

initial scheduling of nomos-bonus-damage: now nomos bonus is true.
regular scheduling of nomos-bonus-damage: do the action of the defender of Aite waiting for a 100 melee hit by the player.
Testing effects of nomos-bonus-damage: if we assert result "\+ 4 \(the law is with you\)", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts
undead-vs-sul-worshipper	1	1	--
demon-vs-sul-worshipper	1	1	--
sul-intervention	1	5	20
no-sul-intervention	10	10	--
limb-removal	1	0	--
limbless-damage	1	1	--
slave-attacking	1	1	--
ment-damage-bonus	1	1	--
ment-damage-reduction	1	1	--

initial scheduling of undead-vs-sul-worshipper: now the player worships Sul.
regular scheduling of undead-vs-sul-worshipper: do the action of the undeadguy waiting for a 100 melee hit by the player.
Testing effects of undead-vs-sul-worshipper: if we assert result "\+ 2 \(undead slayer\)", rule succeeds.

regular scheduling of demon-vs-sul-worshipper: do the action of the smoke demon waiting for a 100 melee hit by the player.
Testing effects of demon-vs-sul-worshipper: if we assert result "\+ 2 \(demon slayer\)", rule succeeds.

[chance of no intervention = (39/40)^9 = 79.6%]
regular scheduling of sul-intervention: do the action of waiting for a 100 melee hit by the armadillo.
testing effects of sul-intervention:
	assert absence of result "Programming error";
	if we assert result "x 0% \(Sul intervenes\)", rule succeeds.

regular scheduling of no-sul-intervention: do the action of the armadillo waiting for a 100 melee hit by the player.
testing effects of no-sul-intervention:
	assert absence of result "Programming error";
	if we assert absence of result "x 0% \(Sul intervenes\)", rule succeeds.

initial scheduling of limb-removal:
	Repeat with item running through rotting limbs:
		[TODO: prevent rotting limbs from being cursed, or at least curse-identified?]
		now item is not cursed;
		now item is not curse-identified;
	now the player worships nothing;

regular scheduling of limb-removal: do the action of the undeadguy waiting for a 100 melee hit by the player.
Testing effects of limb-removal:
	capture whole events;
	assert result "As the corpse reels back from the blow, his rotting ";
	if we assert that the limbs of the rotting corpse is 0, rule succeeds.

regular scheduling of limbless-damage: do the action of waiting for a 100 melee hit by the rotting corpse.
testing effects of limbless-damage: if we assert result "x 0% \(no means of attack\)", rule succeeds.

Initial scheduling of slave-attacking:
	now the health of the reaper is 1000;
	now the reaper is player-enslaved.

regular scheduling of slave-attacking: compel the action of attacking the reaper.
Testing effects of slave-attacking:
	capture whole events;
	check damage of the reaper with 1000 health after "You deal";
	if we assert result "\+ 4 \(betrayed by [master]\)", rule succeeds.

initial scheduling of ment-damage-bonus: have the ment kick in.
regular scheduling of ment-damage-bonus: do the action of the defender of Aite waiting for a 100 melee hit by the player.
testing effects of ment-damage-bonus: if we assert result "\+ 1 \(ment\) ", rule succeeds.

regular scheduling of ment-damage-reduction: do the action of waiting for a 100 melee hit by the defender of Aite.
testing effects of ment-damage-reduction: if we assert result "- 1 \(ment\) ", rule succeeds.

Chapter - Damage Consequences

[mostly concentration effects. Currently there is no single system for triggering losing concentration, TODO: create a damage consequences system similar to attack aftereffects.]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
damage consequences	0	1	restarting for tests
launch-break-concentration	1	1	--
launch-broke-concentration	1	1	launch-break-concentration

Initial scheduling of launch-break-concentration:
	now the power of bodmall is granted;
	prepare a test battle with the minotaur;
	try summoning brambles;
	now the concentration of the minotaur is 3;
	[TODO: once the system is integrated, we may have to repeat the test given that sometimes the enemy can remain concentrated]
	now brambles strength is 1.
	
regular scheduling of launch-break-concentration: try launching.
testing effects of launch-break-concentration: if we assert result "Thorns shoot towards everyone, dealing 1 damage to the minotaur \(which breaks the minotaur's concentration\)", rule succeeds.

testing effects of launch-broke-concentration: if we assert that the concentration of the minotaur is 0, rule succeeds.
	
Chapter - Automatos

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
automatos-tests	0	1	restarting for tests
automatos-blow	1	1	--
automatos-stab	1	1	--

Initial scheduling of automatos-tests:
	prepare a test battle with Automatos;
	equip the player with the executioner's axe.

regular scheduling of automatos-blow:
	equip the player with the executioner's axe;
	set the tension to 12;
	do the action of Automatos waiting for a 100 melee hit by the player.

testing effects of automatos-blow:
	if we assert result "The impact of the attack is so great that Automatos staggers backwards and shakes its head several times. Some small, almost delicate mechanical parts fall out of its ", rule succeeds.

initial scheduling of automatos-stab:
	equip the player with the gorgeous dagger;
	set the size of the gorgeous dagger to medium;

regular scheduling of automatos-stab:
	set the tension to 20;
	now the concentration of the player is 3;
	do the action of Automatos waiting for a 100 melee hit by the player.

testing effects of automatos-stab: if we assert result "The dagger has struck deep between plates of steel and dislodged something inside Automatos. The behemoth staggers backwards and shakes its head several times. Some small, almost delicate mechanical parts fall out of its ", rule succeeds.

[


[These are meta tests, created to make sure that the test framework is working. If there seems to be a problem with the test framework, uncomment this section and check that the tests behave as described.]

Section - Outcome Behavior

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
outcome-behavior	1	0	600	restarting for tests
coin-flip	1	2	20	--
easy-flip	1	1	20	coin-flip
third-flip	1	2	20	easy-flip
new-flip	1	2	20	--
after-new-flip	1	2	20	new-flip
insufficient-flip	1	2	20	--
impossible-flip	39	40	400	insufficient-flip
more-impossible	1	2	1	impossible-flip
first-time	2	10	100	--
after-first	2	3	30	first-time
wrong-success	20	30	100	after-first
intended-failure	0	0	100	--
unintended-success	0	0	100	--
wait-a-turn	1	0	2	--
jump-a-turn	1	0	2	--

[This is a meta-test. impossible-flip, more-impossible, after-first, wrong-success, and unintended-success should fail. Sometimes more-impossible never gets tested because impossible-flip never gives it a chance... I think that's probably ok either way]

[Definition: outcome-behavior is enabled:
	decide on whether or not the number of filled rows in Table of Test Set Queue is 1. [only runs when it's the only test]

not sure how to do this now]

Testing effects of outcome-behavior: rule succeeds.
Testing effects of coin-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of easy-flip: rule succeeds.
Testing effects of third-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of new-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of after-new-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of insufficient-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of impossible-flip: rule fails.
Testing effects of more-impossible: rule succeeds.
Testing effects of first-time: if the attempt count of first-time is 0, rule succeeds.
Testing effects of after-first: rule succeeds.
Testing effects of wrong-success: if a random chance of 1 in 3 succeeds, rule succeeds.
Testing effects of intended-failure: rule fails.
Testing effects of unintended-success: rule succeeds.

Regular scheduling of wait-a-turn:
	transcribe "DEBUG: regular scheduling of wait-a-turn";
	compel the action of waiting;
	transcribe "DEBUG: compelled waiting";
	update event description;

Testing effects of wait-a-turn:
	if we assert result "Time passes", rule succeeds;
	otherwise say "No time passing in '[event description]'!";

Regular scheduling of jump-a-turn: compel the action of jumping.
Testing effects of jump-a-turn: if we assert result "You jump", rule succeeds.

]

Chapter - Sleep Effects

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	antecedent
sleep effects	0	1	restarting for tests

Scenario for sleep effects:
	ban wandering monsters;
	allow teleportation;
	prevent sleeping [unless I say otherwise!];
	now Temple of Nomos is testobject.
	
Initial scheduling of sleep effects: now every room is not rust-spored.
	
Section - Sneaking Around Sleepers

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts
robbing-wakeful-malygris	1	1
robbing-sleeping-malygris	1	1

[TODO: robbing from someone who is asleep in the dream with you?]

Initial scheduling of robbing-wakeful-malygris:
	now Malygris is not asleep;
	extract the player to the location of Malygris.
	
Regular scheduling of robbing-wakeful-malygris: compel the action of taking the dagger of draining.
Testing effects of robbing-wakeful-malygris: if we assert result "That seems to belong to Malygris", rule succeeds.

initial scheduling of robbing-sleeping-malygris:
	now Malygris is asleep;
	
Regular scheduling of robbing-sleeping-malygris: compel the action of taking the dagger of draining.
Testing effects of robbing-sleeping-malygris: if we assert result "You have a \d+% chance of successfully stealing the dagger of draining", rule succeeds.

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts
hiding-from-blind-and-sleeper	1	1
hiding-from-blind	1	1
hiding-from-sleeper	1	1
hiding-from-watchers	1	1

initial scheduling of hiding-from-blind-and-sleeper:
	prepare a test battle with the jumping bomb;
	extract the hound to the location;
	now the flash-grenade-timer of the hound is 5;
	now the jumping bomb is asleep;
	try sneaking.
	
initial scheduling of hiding-from-blind:
	now the jumping bomb is not asleep;
	now the flash-grenade-timer of the hound is 5.

initial scheduling of hiding-from-sleeper:
	now the jumping bomb is asleep;
	now the flash-grenade-timer of the hound is 0.
	
initial scheduling of hiding-from-watchers: now the jumping bomb is not asleep.

regular scheduling of an outcome (called event):
	if the event is at least hiding-from-blind-and-sleeper and the event is at most hiding-from-watchers, compel the action of waiting.

testing effects of hiding-from-blind-and-sleeper: if we assert absence of result "number of perceiving enemies", rule succeeds.
testing effects of hiding-from-blind: if we assert result " - 1 \(number of perceiving enemies\)", rule succeeds.
testing effects of hiding-from-sleeper: if we assert result " - 1 \(number of perceiving enemies\)", rule succeeds.
testing effects of hiding-from-watchers: if we assert result " - 2 \(number of perceiving enemies\)", rule succeeds.

Section - Waking People Up

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	label
waking-awake-self	1	1	--
sleeping-to-wake	1	1	"compel throwing"
waking-asleep-self	1	1	--
waking-asleep-enemy	1	1	--
waking-awake-enemy	1	1	--
dreaming-with-grenade	1	1	"compel throwing"
exploding-in-dream	1	1	"compel throwing"
waking-with-grenade	1	1	--
exploding-awake	1	1	"compel throwing"

[TODO: waking asleep enemy when dreaming? are allies any different?]

initial scheduling of waking-awake-self: try taking off the fuligin cloak;
regular scheduling of waking-awake-self: try awaking the player;
testing effects of waking-awake-self: if we assert result "Perhaps you are in a dream, but you are unable to wake yourself", rule succeeds.

initial scheduling of sleeping-to-wake:
	extract the player to the Temple of Nomos;
	extract the swarm of daggers to the Temple of Nomos;
	now the reusable item is a random morphean grenade.

testing effects of sleeping-to-wake: if we assert that dreamer-location is Temple of Nomos, rule succeeds.

regular scheduling of waking-asleep-self: try awaking the player;
testing effects of waking-asleep-self: if we assert result "Perhaps you are in a dream, but you are unable to wake yourself", rule succeeds.

initial scheduling of waking-asleep-enemy:
	wake the player up;
	now the swarm of daggers is asleep; [unnecessary currently, but not sure if it's supposed to be]
	update the combat status.
	
regular scheduling of waking-asleep-enemy: try awaking the swarm of daggers.
testing effects of waking-asleep-enemy: if we assert result "With a swift kick, you wake up the swarm of daggers\. Not very subtle, perhaps, but it is certainly effective", rule succeeds.

regular scheduling of waking-awake-enemy: try awaking the swarm of daggers.
testing effects of waking-awake-enemy: if we assert result "You can only awaken sleeping persons", rule succeeds.

initial scheduling of dreaming-with-grenade:
	now every dream is randomly included;
	now Dream of Briar Roses is testobject; [player keeps their body]
	
testing effects of dreaming-with-grenade: if yourself is asleep, rule succeeds.

initial scheduling of exploding-in-dream: now the reusable item is a random smoke grenade.
testing effects of exploding-in-dream: if yourself is asleep, rule succeeds.

initial scheduling of waking-with-grenade:
	try going up;
	select menu question answer 1.

testing effects of waking-with-grenade: if the swarm of daggers is asleep, rule succeeds.
	
testing effects of exploding-awake: if the swarm of daggers is not asleep, rule succeeds.

Section - Specific Monster Sleep Effects

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	label
sleeping-hound-unprepared	0	1	"provoke hound"
awake-hound-unprepared-for-hidden	0	1	"provoke hound"
awake-hound-prepared	1	1	"provoke hound"

initial scheduling of sleeping-hound-unprepared:
	prepare a test battle with the hound;
	now the hound is asleep;
	now the health of the player is 1000;
	now the melee of the hound is 100; [convince the hound's AI that attacking is best]
	now the defence of the hound is 50;
	now the melee of the player is 0.
	
initial scheduling of awake-hound-unprepared-for-hidden: try sneaking.

initial scheduling of awake-hound-prepared: try taking off the fuligin cloak.

regular scheduling of an outcome labeled "provoke hound":
	compel the action of attacking the hound;
	now suppress npc action is false.

testing effects of an outcome labeled "provoke hound": if we assert result "you do not overcome the hound's defence rating of 50\.\n\n<^\n>+ your attack, the hound jumps at you", rule succeeds.

Section - Nomos interventions and dreams

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	label
dreamy-nomos-worshipper	1	1	--
teleport-with-nomos-bonus	1	1	"compel reading"
nomos-peace-attack	1	1	--

Initial scheduling of dreamy-nomos-worshipper:
	extract the player to the temple of Nomos, making sure it is unoccupied;
	now the health of the player is 100;
	have the player worship Nomos with 1 favour;
	now the teleportation beacon is in Entrance Hall;
	now teleportation-beacon-on is true;
	now the reusable item is a random scroll of teleportation;
	extract the swarm of daggers to the temple of Nomos.
	
[We can use this to see when the reading a command activity runs:

Before reading a command when testing Nomos intervention effects: say "reading a command, nomos attacker=[nomos attacker] counter=[nomos counter], bonus=[nomos bonus]";]

First testing effects when testing sleep effects:
	transcribe "Player's health: [health of player]/[permanent health of player]";

Testing effects of dreamy-nomos-worshipper:
	if the number of people in Entrance Hall is 0, rule succeeds.
	
Initial scheduling of teleport-with-nomos-bonus: set the Nomos counter to 1.

Testing effects of teleport-with-nomos-bonus:
	assert that the combat status is peace with label "combat status";
	if we assert that the Nomos bonus is true, rule succeeds;
	[ TODO: have Automated Tests run the Before (and After?) reading a command rules - that' where this message appears:
	if we assert result "Remember: Nomos has told you to attack this turn", rule succeeds.]
	
Regular scheduling of nomos-peace-attack: compel the action of waiting.
Testing effects of nomos-peace-attack: if we assert result "You plan on waiting, but find your body attacking itself instead!", rule succeeds.

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	label
montyhall-with-nomos-counter	1	1	"nomos sleeping"
montyhall-with-nomos-bonus	1	2	--
nomos-montyhall-wake	1	0	"nomos waking"
nomos-bonus-after-montyhall	0	1	"nomos after dream"
tungausy-with-nomos-counter	1	1	"nomos sleeping"
tungausy-with-nomos-bonus	0	2	--
nomos-tungausy-wake	1	1	"nomos waking"
nomos-bonus-after-tungausy	1	1	"nomos after dream"
nomos-attack-after-tungausy	1	1	--

[TODO: In montyhall-with-nomos-bonus, the player has had an extra turn... I think because they were at-inactive, or because the nomos bonus was set at an unusual time. I'm marking it as success if the Nomos bonus happens in 2 turns, but we may want to revisit that. I'm also giving tungausy-with-nomos-bonus an extra turn to fail]

First initial scheduling of an outcome labeled "nomos sleeping":
	now every dream is randomly included;
	now the reusable item is a random morphean grenade;
	extract the player to Temple of Nomos;
	now the health of the swarm of daggers is 100;
	now the defence of the player is 50;
	now the melee of the player is 0;
	set the Nomos counter to 1.
	
Initial scheduling of montyhall-with-nomos-counter: now Dream of Monty Hall is testobject.

Initial scheduling of tungausy-with-nomos-counter: now Dream of Tungausy Shaman is testobject.

Regular scheduling of an outcome labeled "nomos sleeping": compel the action of throwing the reusable item;
testing effects of an outcome labeled "nomos sleeping": if the Nomos attacker is asleep, rule succeeds.

[For now we will allow the Nomos bonus to go off in a dream if the player is the Nomos attacker (not true in most dreams, but true in Monty Hall). We may change this later]

Regular scheduling of montyhall-with-nomos-bonus: compel the action of opening the pearl chest.
testing effects of montyhall-with-nomos-bonus: if we assert result "you do not overcome your defence", rule succeeds.

Regular scheduling of tungausy-with-nomos-bonus: compel the action of going inside.
testing effects of tungausy-with-nomos-bonus:
	assert absence of result "Yourself follows the rules";
	if we assert result "attacking itself", rule succeeds. [likelihood is 0, so this is actually a failure]

regular scheduling of nomos-tungausy-wake: select menu question answer 1.
regular scheduling of nomos-montyhall-wake: compel the action of opening the pearl chest.
testing effects of an outcome labeled "nomos waking": if we assert that dreaming is false, rule succeeds.

testing effects of an outcome labeled "nomos after dream": if we assert that the nomos bonus is true, rule succeeds.

regular scheduling of nomos-attack-after-tungausy: compel the action of waiting.
testing effects of nomos-attack-after-tungausy: if we assert result "You plan on waiting, but find yourself attacking the swarm of daggers instead", rule succeeds.

Chapter - Startling Phantasms Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	label	antecedent
startling phantasms	0	1	--	--	restarting for tests
phantasmagoria-event-blind	1	3	--	"startling phantasm"	--
blind-player-startled	0	10	--	"startle player"	phantasmagoria-event-blind
phantasmagoria-event-eyeless	1	3	--	"startling phantasm"	--
eyeless-player-startled	0	10	--	"startle player"	phantasmagoria-event-eyeless
phantasmagoria-event-sighted	1	3	100	"startling phantasm"	--
sighted-player-startled	4	5	30	"startle player"	phantasmagoria-event-sighted
eyeless-monster-startled	0	10	--	--	phantasmagoria-event-sighted

First independent action rule when testing an outcome labeled "startling phantasm": rule fails.
[Don't let wandering monsters in]

Initial scheduling of phantasmagoria-event-blind:
	extract the player to phantasmagoria, making sure it is unoccupied;
	extract the jumping bomb to phantasmagoria;
	equip the player with the blindfold.

Regular scheduling of an outcome labeled "startling phantasm":
	Repeat with guy running through people in the location:
		Now the concentration of guy is 1;
	Compel the action of waiting.

Testing effects of an outcome labeled "startling phantasm": if we assert result "Suddenly, <^\n>+ appears", rule succeeds.

Initial scheduling of phantasmagoria-event-eyeless:
	remove the blindfold from play;
	now eyeless vision is adapted.
	
Initial scheduling of phantasmagoria-event-sighted: now eyeless vision is not adapted.
	
Testing effects of an outcome labeled "startle player": if the concentration of the player is 0, rule succeeds.

Testing effects of eyeless-monster-startled: if the concentration of the jumping bomb is 0, rule succeeds.

Chapter - Simple Tests

[tests that don't require restart]

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	antecedent
Simple tests	0	1	restarting for tests

Scenario for simple tests:
	ban faculty modifiers.

Section - Reading Ability Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
blindness-goggles-work	1	1	--
blindfold-works	1	1	--
blind-reading	1	1	"illiteracy"
eyeless-reading	0	1	"illiteracy"
sighted-reading	0	1	"illiteracy"

Initial scheduling of blindness-goggles-work: equip the player with the goggles of blindness.
Testing effects of blindness-goggles-work: unless the player is perceptive, rule succeeds.

Initial scheduling of blindfold-works:
	remove the goggles of blindness from play;
	equip the player with the blindfold.
Testing effects of blindfold-works: unless the player is perceptive, rule succeeds.

Initial scheduling of an outcome labeled "illiteracy":
	Now the player skill bonus timer is 0;
	Now the reusable item is a random scroll of skill.

Regular scheduling of an outcome labeled "illiteracy": try reading the reusable item.
Testing effects of an outcome labeled "illiteracy": if we assert that the player skill bonus timer is 0, rule succeeds.

Initial scheduling of blind-reading: Now eyeless vision is not adapted.

Initial scheduling of eyeless-reading: Now eyeless vision is adapted.
	
Initial scheduling of sighted-reading:
	Now eyeless vision is not adapted;
	remove the blindfold from play.
	
Section - Looking while blind Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
you-can-feel	1	1
you-can-see	1	1
you-can-also-feel	1	1
you-can-also-see	1	1

Initial scheduling of you-can-feel: 
	extract the player to Entrance Hall, making sure it is unoccupied;
	Repeat with item running through portable things in Entrance Hall:
		remove item from play;
	Now the magical spade is in the location;
	Equip the player with the blindfold.
	
Regular scheduling of you-can-feel: try looking.
testing effects of you-can-feel: if we assert result "You can feel a magical spade here", rule succeeds.

Initial scheduling of you-can-see: remove the blindfold from play.
regular scheduling of you-can-see: try looking.
testing effects of you-can-see: if we assert result "You can see a magical spade here", rule succeeds.

Initial scheduling of you-can-also-feel:
	extract the player to Arcane Vault;
	Now the magical spade is in the location;
	equip the player with the blindfold.
	
regular scheduling of you-can-also-feel: try looking.
testing effects of you-can-also-feel: if we assert result "You can also feel a magical spade here", rule succeeds.
	
initial scheduling of you-can-also-see: remove the blindfold from play.
regular scheduling of you-can-also-see: try looking.
testing effects of you-can-also-see: if we assert result "You can also see a magical spade here", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
flash-blindfolded	0	1	"flash blinding"
flash-sighted-monster	1	1	--
flash-eyeless-monster	1	1	--
flash-eyeless-player	0	1	"flash blinding"
flash-sighted-player	1	1	"flash blinding"
blind-when-flashed	1	1	--

Definition: an outcome is flash-resetting if it is labeled "flash blinding" or it is the outcome after blind-when-flashed.

Initial scheduling of flash-blindfolded:
	now the reusable item is a random flash grenade;
	prepare a test battle with the jumping bomb;
	revive Miranda in the location;
	equip the player with the blindfold.
	
First initial scheduling of a flash-resetting outcome:
	Repeat with guy running through people:
		now the flash-grenade-timer of guy is 0;
	
Regular scheduling of an outcome labeled "flash blinding":
	Now the reusable item is not rusted;
	try throwing the reusable item.
	
testing effects of an outcome labeled "flash blinding": if the flash-grenade-timer of the player > 0, rule succeeds.

testing effects of flash-sighted-monster: if the flash-grenade-timer of Miranda > 0, rule succeeds.

testing effects of flash-eyeless-monster: if we assert that the flash-grenade-timer of the jumping bomb is 0, rule succeeds.

Initial scheduling of flash-eyeless-player:
	remove the blindfold from play;
	now eyeless vision is adapted.
	
Initial scheduling of flash-sighted-player: now eyeless vision is not adapted.

testing effects of blind-when-flashed: unless the player is perceptive, rule succeeds.

Section - Blindness Rules Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
player-blind	0	1	"perception"
player-blind-status	1	1	--
blind-player-vision	0	1	"vision"
blind-eyeless-player-perceptive	1	1	"perception"
blind-eyeless-player-vision	0	1	"vision"
eyeless-player-perceptive	1	1	"perception"
eyeless-player-vision	0	1	"vision"
eyeless-player-status	1	1	--
bat-player-perceptive	1	1	"perception"
bat-player-vision	0	1	"vision"
sighted-player-perceptive	1	1	"perception"
sighted-player-vision	1	1	"vision"
jumping-bomb-perceptive	1	1	--
jumping-bomb-not-eye-using	1	1	--
compassion-perceptive	1	1	--
compassion-eye-using	1	1	--

Initial scheduling of player-blind: now the flash-grenade-timer of the player is 5.

Testing effects of an outcome labeled "perception": if the player is perceptive, rule succeeds.
Testing effects of an outcome labeled "vision": if the player is using eyes, rule succeeds.

regular scheduling of player-blind-status: try asking status.
Testing effects of player-blind-status: if we assert result "You are blind", rule succeeds.

Initial scheduling of blind-eyeless-player-perceptive: now eyeless vision is adapted.

Initial scheduling of eyeless-player-perceptive: now the flash-grenade-timer of the player is 0.
initial scheduling of bat-player-perceptive:
	now eyeless vision is not adapted;
	now vampirebat-form is form-active;
	try turning bat.

Initial scheduling of sighted-player-perceptive:
	try turning human;
	now vampirebat-form is not form-active.

regular scheduling of eyeless-player-status: try asking status.
Testing effects of eyeless-player-status: if we assert result "Your altered body has eyeless vision", rule succeeds.

Testing effects of jumping-bomb-perceptive: if the jumping bomb is perceptive, rule succeeds.
Testing effects of jumping-bomb-not-eye-using: unless the jumping bomb is using eyes, rule succeeds.
Testing effects of compassion-perceptive: if the angel of compassion is perceptive, rule succeeds.
Testing effects of compassion-eye-using: if the angel of compassion is using eyes, rule succeeds.

[TODO: test for number of perceiving enemies]

Section - Goggle Effects Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	label
eyeless-x-bgoggles	0	1	"x bgoggles"
eyeless-wear-bgoggles	1	1	--
eyeless-x-bgoggles-known	1	1	"x bgoggles"
eyeless-player-bgoggles-p	1	1	"perception"
eyeless-player-bgoggles-v	0	1	"vision"
eyeless-player-bgoggles-b	1	1	"goggle bonus"
eyes-player-bgoggles-p	0	1	"perception"
eyes-player-bgoggles-v	0	1	"vision"
eyes-player-bgoggles-b	1	1	"no goggle bonus"
bgoggles-purification	1	1	"bgoggles drink"
bgoggles-uncursed	0	1	"bgoggles drink"
bgoggles-purification-nosurprise	1	1	"bgoggles drink"
eyeless-player-agoggles-p	1	1	"perception"
eyeless-player-agoggles-v	0	1	"vision"
eyeless-player-agoggles-b	1	1	"no goggle bonus"
blind-player-agoggles-b	1	1	"no goggle bonus"
eyes-player-agoggles-p	1	1	"perception"
eyes-player-agoggles-v	1	1	"vision"
eyes-player-agoggles-b	1	1	"goggle bonus"

initial scheduling of eyeless-x-bgoggles:
	extract the player to Test Arena; [no faculty effects]
	now eyeless vision is adapted;
	now the body score of the player is 3;
	now the mind score of the player is 5;
	now the spirit score of the player is 7;
	now the player skill bonus timer is 0;
	now the player carries the goggles of blindness;
	now blindness-goggles-secret-known is false;
	
regular scheduling of an outcome labeled "x bgoggles": try examining the goggles of blindness.
testing effects of an outcome labeled "x bgoggles": if we assert result "they grant a \+1 bonus to body, mind, and spirit if you can still see when you're wearing them", rule succeeds.

regular scheduling of eyeless-wear-bgoggles: try wearing the goggles of blindness.
testing effects of eyeless-wear-bgoggles: if we assert result "Your eyeless vision combines with the magic of the goggles to give you heightened senses! \(\+1 bonus to body, mind and spirit\.\)", rule succeeds.

testing effects of an outcome labeled "goggle bonus":
	assert that the final body of the player is 4 with label "final body";
	assert that the final mind of the player is 6 with label "final mind";
	if we assert that the final spirit of the player is 8, rule succeeds.

testing effects of an outcome labeled "no goggle bonus":
	assert that the final body of the player is 3 with label "final body";
	assert that the final mind of the player is 5 with label "final mind";
	if we assert that the final spirit of the player is 7, rule succeeds.

initial scheduling of eyes-player-bgoggles-p: now eyeless vision is not adapted.

initial scheduling of an outcome labeled "bgoggles drink":
	now eyeless vision is not adapted;
	now the player carries the vial of purification.

regular scheduling of an outcome labeled "bgoggles drink": try drinking the vial of purification.
last testing effects of an outcome labeled "bgoggles drink": if eyeless vision is adapted, rule succeeds.

initial scheduling of bgoggles-purification: now blindness-goggles-secret-known is false.

testing effects of bgoggles-purification:
	assert result "Although the waters cannot break the curse of the goggles, they give you the power to see without eyes!\n\nThe magic of the goggles combines with your eyeless vision to give you heightened senses";

initial scheduling of bgoggles-uncursed: now the goggles of blindness are not cursed.
testing effects of bgoggles-uncursed: assert absence of result "the waters cannot break the curse of the goggles".

initial scheduling of bgoggles-purification-nosurprise: now the goggles of blindness are cursed.
testing effects of bgoggles-purification-nosurprise:
	assert result "they give you the power to see without eyes";
	assert absence of result "magic of the goggles combines with your eyeless vision".
	
initial scheduling of eyeless-player-agoggles-p:
	now eyeless vision is adapted;
	equip the player with the goggles of acuity.
	
initial scheduling of blind-player-agoggles-b:
	now the flash-grenade-timer of the player is 5;
	now eyeless vision is not adapted.
	
initial scheduling of eyes-player-agoggles-p: now the flash-grenade-timer of the player is 0.

Section - Resizing salves Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
Resizing salves	1	1

To decide whether we assert that (item - a thing) is (size - a size):
	if the size of item is size, yes;
	now the failure report is "[the item] should be [size], but it is [size of item]";
	no.

Testing effects of resizing salves:
	Let object-list be {yourself, the spiked mace of the ape king, the gilded rapier, the wooden buckler, the bulwark of faith, the plate mail};
	Let the salve-list be a list of things;
	Add a random unguentum crescendi to the salve-list;
	Add a random unguentum diminuendi to the salve-list;
	Repeat with item running through the salve-list:
		now the player carries item;
		Repeat with target running through object-list:
			if target is not the player, now the player carries target;
			Let prev-size be medium;
			now target is medium;
			clear event description;
			try putting the item on the target;
			while prev-size is not the size of target:
				[TODO: how does size affect weapon stats? what about shield stats?]
				if prev-size is [still] the size of target:
					assert result "You carefully apply the salve to [if target is the player]yourself[otherwise][the target][end if], turning ";
				clear event description;
				now prev-size is the size of target;
				try putting the item on the target;
			if the target is the spiked mace of the ape king:
				assert result "Some magic seems to protect the spiked mace of the ape king from the salve\.";
				assert that the target is medium;
			otherwise if the target is the plate mail:
				assert result "The salve will only work on weapons, shields and persons\.";
				assert that the target is medium;
			otherwise if the item is an unguentum crescendi:
				assert result "You cannot make [if target is the player]yourself[otherwise][the target] any bigger\.";
				assert that the target is gargantuan;
			otherwise:
				assert result "You cannot make [if target is the player]yourself[otherwise][the target] any smaller\.";
				assert that the target is tiny;
	rule succeeds;

Section - Controlling pipes Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
open-pipes	1	1
x-open pipes	1	1
x-open wheel	1	1
x-closed pipes	1	1
x-closed wheel	1	1

Scenario for simple tests: now Hall of Vapours is testobject.
	
initial scheduling of open-pipes:
	extract the player to Hall of Vapours;
	now pipes-open is true;

Regular scheduling of open-pipes: try looking.
Testing effects of open-pipes: if we assert result "Several large pipes continuously spew forth vapours into this room\. A big wheel is attached", rule succeeds.

regular scheduling of x-open pipes: try examining the pipes.
testing effects of x-open pipes: if we assert result " They are currently spewing vapours into the room\.", rule succeeds.

regular scheduling of x-open wheel: try examining the wheel.
testing effects of x-open wheel: if we assert result "which are currently open\.", rule succeeds.

initial scheduling of x-closed pipes: try turning the wheel.
regular scheduling of x-closed pipes: try examining the pipes.
testing effects of x-closed pipes: if we assert result " They are currently shut off\.", rule succeeds.

regular scheduling of x-closed wheel: try examining the wheel.
testing effects of x-closed wheel: if we assert result "which are currently closed\.", rule succeeds.

Section - Bug 351 - scroll cloning Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
bug-351-find	1	1
bug-351-obsc-name	1	1
bug-351-true-name	1	1
bug-351-findable	1	1

regular scheduling of bug-351-find: find a healthy scroll.
testing effects of bug-351-find: if we assert result "You have found a scroll", rule succeeds.

testing effects of bug-351-obsc-name:
	Repeat with item running through scrolls enclosed by the player:
		unless we assert "The true name and obfuscated name of [item] should be different, but they are both '[true name of item]'" based on whether or not the true name of item is not the obfuscated name of item, rule fails;
	rule succeeds.

testing effects of bug-351-true-name:
	Repeat with item running through scrolls:
		let item-name be the true name of item;
		unless we assert "The true name of [item] should not be obfuscated, but it is [true name of item], which is an obfuscated name'" based on whether or not item-name is a not obfuscated scroll name, rule fails;
	rule succeeds.
	
testing effects of bug-351-findable:
	Repeat with item running through not obfuscated scroll names:
		Let should-be-findable be true;
		if item is delights:
			now should-be-findable is false;
		unless we assert that (whether or not item is findable) is should-be-findable with label "[item] is findable", rule fails;
	rule succeeds.

Section - Bug 352 - exploded property Simple Test

Table of Outcomes (continued)
outcome	likelihood	label	minimum attempts
throwing-352	1	"try throwing"	1

Initial scheduling of throwing-352: now the reusable item is a random smoke grenade.
Testing effects of throwing-352: if we assert absence of result "Run-time problem", rule succeeds.

Section - Died Counts Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
died-count-test	1	1

[I don't think this bug ever comes up in play, but it happens in test battles]

Initial scheduling of died-count-test:
	now the challenger's initial defeats is the died count of Israfel;
	move Isra to Entrance Hall;
	revive Israfel in Entrance Hall;
	prepare a test battle with israfel;

Regular scheduling of died-count-test: try smiting Israfel.

Testing effects of died-count-test: if we assert that the died count of israfel is the challenger's initial defeats + 1 with label "died count of Israfel", rule succeeds.


Section - Enemies should always start out awake in Arena of the Fallen Simple Test

Table of Outcomes (continued)
outcome	likelihood	label	minimum attempts
sleeping fallen	1	"try reading"	1
dead-fallen	1	--	1
awake-in-fallen-arena	1	--	1

Scenario for Simple Tests: now Entrance to the Arena is testobject.

initial scheduling of Sleeping Fallen:
	now the player worships nothing;
	now the favour of the player is 0;
	prepare a test battle with the blood ape;
	now the blood ape is asleep;
	Now the reusable item is a random scroll of death;
	now the health of the blood ape is 1;

Testing effects of sleeping fallen: if the blood ape is asleep, rule succeeds.
Testing effects of dead-fallen: if the blood ape is dead, rule succeeds.

initial scheduling of awake-in-fallen-arena: have the player and the blood ape fight in Arena of the Fallen.
testing effects of awake-in-fallen-arena: if the blood ape is not asleep, rule succeeds.

Section - Dream of Sleeping Simple Test

Table of Outcomes (continued)
outcome	likelihood	label	minimum attempts
sleeping-dream-dreaming	1	"compel throwing"	1
sleeping-dream-waking	1	--	1
malygris-missing-sleeper	1	--	1
still-sleepy	1	--	1
malygris-hitting-sleeper	1	--	1
slapped-awake	1	--	1

Initial scheduling of sleeping-dream-dreaming:
	now the dream of sleeping is testobject;
	now the reusable item is a random morphean grenade;
	Now Malygris is asleep;
	extract the player to Entrance Hall, making sure it is unoccupied.

testing effects of sleeping-dream-dreaming: if the player is the untroubled sleeper, rule succeeds.

regular scheduling of sleeping-dream-waking: compel the action of exiting.
testing effects of sleeping-dream-waking:
	assert result "Malygris standing over you";
	assert "Malygris should be awake" based on whether or not Malygris is not asleep;
	assert that the concentration of Malygris is 2 with label "concentration of Malygris";
	assert "the player should be just-woken" based on whether or not the player is just-woken;
	rule succeeds.

Initial scheduling of Malygris-missing-sleeper:
	now the health of the player is 1000;
	now the defence of the player is 50;
	now the melee of Malygris is 0;

regular scheduling of Malygris-missing-sleeper: compel the action of waiting as a reaction to Malygris.

testing effects of malygris-missing-sleeper: if we assert result "defender was asleep<^\n>+Malygris does not overcome your defence rating", rule succeeds.
testing effects of still-sleepy: if the player is just-woken, rule succeeds.

initial scheduling of Malygris-hitting-sleeper: now the melee of Malygris is 100.
regular scheduling of Malygris-hitting-sleeper: compel the action of waiting as a reaction to Malygris.
testing effects of Malygris-hitting-sleeper: if we assert result "Malygris deals<^\n>+ \+ 2 \(defender was asleep\)", rule succeeds.
testing effects of slapped-awake: if the player is not just-woken, rule succeeds.

Section - Healer of Aite Healing Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
healer-not-healing-player	20	20	--	--
healer-healing-defender	1	0	20	--
healer-still-injured	1	1	--	healer-healing-defender
healer-healing-self	1	0	20	--

Initial scheduling of healer-not-healing-player:
	prepare a test battle with the healer of Aite, inviting groups;
	Repeat with guy running through people in the location:
		now guy is not asleep;
		now the defence of guy is 50;
		now the melee of guy is 0;
		now the health of guy is the permanent health of guy;
	decrease the health of the player by 3;

regular scheduling of the scheduled event: [does not apply to dependents]
	if the scheduled event is at least healer-not-healing-player and the scheduled event is at most healer-healing-self:
		wait for the healer of Aite to act freely.

testing effects of healer-not-healing-player: if the injury of the player is at least 3, rule succeeds.

Initial scheduling of healer-healing-defender:
	decrease the health of the healer of aite by 3;
	decrease the health of the defender of aite by 4;

testing effects of healer-healing-defender: if the injury of defender of Aite is less than 4, rule succeeds.
testing effects of healer-still-injured: if the injury of healer of Aite is at least 3, rule succeeds.
testing effects of healer-healing-self: if the injury of healer of Aite is less than 3, rule succeeds.

Section - Hiding Penalites Simple Test

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bodmall-sneaking	1	1	--
anchored-to-malygris	1	1	bodmall-sneaking
malygris-robbing	1	1	--
still-with-beacon	1	1	malygris-robbing
still-with-malygris	1	1	malygris-robbing
still-with-bodmall	1	1	malygris-robbing
not-teleported	1	1	malygris-robbing

scenario for simple tests:	
	now bodmall is testobject.

the floor-item is an object that varies.

Initial scheduling of bodmall-sneaking:
	now the teleportation beacon is in the location of Malygris;
	now the dimensional anchor is in the location of Malygris;
	now teleportation-beacon-on is true;
	now the floor-item is a random teleportation grenade;
	extract the player to the location of Bodmall;
	force the fuligin cloak to work;

regular scheduling of bodmall-sneaking:
	now the floor-item is in the location;
	compel the action of throwing the floor-item.

Testing effects of bodmall-sneaking:
	assert result "first taking the teleportation grenade";
	assert result "Malygris, perhaps the greatest of all living sorcerers, is standing here";
	assert absence of result "picking stuff up";
	rule succeeds.

Testing effects of anchored-to-malygris:
	repeat with guy running through people in the location:
		assert "teleportation should be impossible for [guy]" based on whether or not teleportation is impossible for guy;
	rule succeeds.

regular scheduling of malygris-robbing:
	force the fuligin cloak to work;
	now the floor-item is in the location;
	compel the action of throwing the floor-item;

[if the player teleports away but reappears in the same room, their hiding penalty will be wiped out. This could be considered a bug, but I don't think it's worth fixing. Anyway, we can avoid it for testing purposes by using the dimensional anchor.]

Testing effects of malygris-robbing: if we assert result "picking stuff up", rule succeeds.
testing effects of still-with-beacon: if we assert that the location of the teleportation beacon is the location, rule succeeds.
testing effects of still-with-malygris: if we assert that the location of malygris is the location, rule succeeds.
testing effects of still-with-bodmall: if we assert that the location of Bodmall is the location, rule succeeds.
testing effects of not-teleported: if we assert result "Something has stopped you from teleporting", rule succeeds.

Test Sets ends here.
