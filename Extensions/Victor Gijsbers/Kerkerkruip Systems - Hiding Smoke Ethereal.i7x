Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers begins here.

Use authorial modesty.

Part - Hiding

Chapter - Hidden

A person can be hidden. A person is usually not hidden.
A person can be on-the-lookout. A person is usually not on-the-lookout. [Once they have seen you appear from the shadows once, they'll be better at detecting you later.]
A person can be unnaturally aware. [The unnaturally aware always detect you.]
A person can be unnaturally aware follower. [An unnaturally aware follower may not detect you, but does know where you are in the dungeon.]

Status rule (this is the hidden status rule):
	if the player is hidden:
		say "You are [bold type]hidden[roman type].[line break][run paragraph on]"

An attack modifier rule (this is the hidden gives a small attack bonus rule):
	if the global attacker is hidden:
		say " + 2 (hidden)[run paragraph on]";
		increase attack strength by 2.

First Standard AI rule for a person (called P) (this is the do nothing when all enemies hidden rule):
	let conflict be false;
	let detected be false;
	repeat with X running through all alive persons enclosed by the location:
		unless P is X:
			if P opposes X:
				now conflict is true;
				if X is not hidden:
					now detected is true;
	if conflict is true and detected is false:
		say "[The P] [one of]remains unaware of your presence[or]does not notice you[or]does not detect your presence[at random].";
		rule succeeds.
	
An AI target selection rule for a hidden person (this is the do not prefer hidden people rule):
	decrease the Weight by 1000.
	
First check an actor hitting (this is the stop hitting if the defender is hidden rule):
	if the global defender is hidden:
		stop the action.
	

[
An aftereffects rule (this is the attacking breaks hidden rule):
	if the global attacker is the player:
		now the player is not hidden.]

The detection probability is a number that varies. The detection probability is 0.
The detection rules are a rulebook.

This is the possibly detected rule:   [TODO: turn into a starting the combat round rule?]
 [allies don't increase probability of detection]
	consider the detection rules;
	let n be a random number between 1 and 100;
[	say "Roll: [n] against [detection probability]."; [TEST]]
	if the detection probability is greater than n:
		now the player is not hidden;
		if the main actor is not the player:
			say "[The main actor] [if main actor is plural-named]have[otherwise]has[end if] detected you!";
		otherwise:
			say "You have been revealed!";
		repeat with guy running through visible persons:
			if the faction of guy hates the faction of the player:
				now guy is on-the-lookout;
	now detection probability is 0.

Starting the combat round rule:
	if the player is hidden:
		if the faction of the main actor hates the faction of the player:	
			follow the possibly detected rule.
	
[Every turn when the player is hidden:
	if the combat status is not peace and the player is the main actor:
		consider the possibly detected rule;
	now detection probability is 0.]

[

A starting the combat round rule (this is the possible detection rule):
	if the player is hidden and the player is not the main actor and the faction of the main actor hates the faction of the player:
		now the detection probability is 3; [base chance]
		consider the detection rules;
[		say "TEST: [detection probability].";]
		let n be a random number between 1 and 100;
		if the detection probability is greater than n or the main actor is unnaturally aware:
			now the player is not hidden;
			say "[The main actor] [if main actor is plural-named]have[otherwise]has[end if] detected you!";
			repeat with guy running through visible persons:
				if the faction of guy hates the faction of the player:
					now guy is on-the-lookout.
	]

Section - Detection rules

A detection rule (this is the base probability of detection rule):
	increase the detection probability by 3.
	
A detection rule (this is the tension increases probability of detection rule):
	increase the detection probability by the tension.

A detection rule (this is the spirit probability of detection rule):
	unless the main actor is the player:
		let n be spirit score of the main actor / 2;
		increase the detection probability by n.

A detection rule (this is the on-the-lookout increases probability of detection rule):
	unless the main actor is the player:
		if the main actor is on-the-lookout:
			increase the detection probability by 5.

A detection rule (this is the blindness decreases probability of detection rule):
	unless the main actor is the player:
		if the main actor is blind:
			decrease the detection probability by 3.

A detection rule (this is the unnatural awareness detection rule):
	unless the main actor is the player:
		if the main actor is unnaturally aware:
			increase the detection probability by 1000.

Section - Action rules

Carry out attacking:
	increase detection probability by 70.

An aftereffects rule (this is the be detected after successful attack rule):
	if the global attacker is the player and the attack damage is greater than 0:
		increase detection probability by 250.

Carry out concentrating:
	increase detection probability by 50;
	if the player is hidden:
		say "You shift your attention away from remaining hidden. [run paragraph on]".

Carry out reading a scroll:
	increase detection probability by 50.

Carry out dropping:
	increase detection probability by 20.

Carry out taking:
	increase detection probability by 20.

Carry out singing:
	increase detection probability by 100.
	

Section - No perceived threat

To decide whether there is no perceived threat for (guy - a person):
	repeat with guy2 running through persons enclosed by the location of guy:
		if the faction of guy hates the faction of guy2:
			if guy2 is not hidden or guy is unnaturally aware:
				decide no;
	decide yes.
[
Section - Action restrictions when hidden

Check concentrating (this is the cannot concentrate while hidden rule):
	if the player is hidden:
		take no time;
		say "You need all your concentration just to stay hidden." instead.]


Section - Hiding

To hide:
	if the combat status is peace:
		say "You blend into the shadows.";
		now the player is hidden;
[	otherwise:
		consider the detection rules;
		increase detection probability by 50;
		let n be a random number between 1 and 100;
[		say "Roll: [n] against [detection probability]."; [TEST]]
		unless the detection probability is greater than n:
			say "You blend into the shadows.";
			now the player is hidden;]
	otherwise:
		say "You fail to hide."



Part - Smoke

Chapter - Smoke

[From just a simple attack penalty in Kerkerkruip 1, we are going to expand smoke into a major game system in Kerkerkruip 2.]

Section - The basics of smoke

A room has a number called the smoke timer.
The temporary smoke timer is a number that varies.
The smoke rules are a rulebook.

To decide what number is the smoke penalty of (place - a room):
	let n be the smoke timer of place;
	increase n by 3;
	now n is n divided by 4;
	if n is greater than 3, now n is 3;
	decide on n.

[0 smoke: 0 penalty
1-4 smoke: -1
5-8 smoke: -2
9+ smoke: -3  because it cannot get worse than blindness]

Every turn (this is the reduce smoke timer rule):
	if the main actor is the player:
		repeat with place running through rooms:
			now test room is place;
			now temporary smoke timer is smoke timer of place;
			consider the smoke rules;
			let n be smoke penalty of place;
			now smoke timer of place is temporary smoke timer;
			let m be smoke penalty of place;
			if place is the location:
				if m is not n:
					if m is greater than n:
						if n is 0:
							say "The room fills with [bold type]smoke[roman type].";
						otherwise:
							say  "The [bold type]smoke[roman type] becomes thicker.";
					otherwise:
						if m is 0:
							say "The [bold type]smoke[roman type] disappears completely.";
						otherwise:
							say "The [bold type]smoke[roman type] becomes less thick.".

Section - General smoke rules

Last smoke rule (this is the smoke slowly dissipates rule):
	if temporary smoke timer is greater than 0:
		decrease temporary smoke timer by 1.

Smoke rule (this is the smoke may drift in from another room rule):
	repeat with way running through cardinal directions:
		let place be the room way of test room;
		if place is a room:
			let n be smoke timer of place minus temporary smoke timer;
			if n is greater than 5:
				increase temporary smoke timer by 2;
			otherwise if n is 5:
				increase temporary smoke timer by 1.
				
[This means that smoke can temporarily increase in the dungeon even if there is no source, but smoke will decrease and disappear over time if there are no sources.]

[Now we want to set up the dungeon properly, that is, we want to establish something like an equilibrium situation.]

Last when play begins:
	consider the smoke rules;
	consider the smoke rules;
	consider the smoke rules;
	consider the smoke rules.		


Section - The backdrop

Clouds of smoke is a backdrop. Clouds of smoke is everywhere. Clouds of smoke is plural-named. Understand "cloud" and "fog" and "vapour" and "vaopurs" and "vapor" and "vapors" as clouds of smoke.

Instead of doing anything with clouds of smoke when the smoke timer of the location is less than 1:
		say "This place is free of smoke.".

Instead of touching clouds of smoke:
	say "They are insubstantial.".
	
Instead of taking clouds of smoke:
	say "They are insubstantial.".

Instead of examining clouds of smoke when the smoke timer of the location is greater than 0:
	say "The smoke makes it harder to see clearly. (All sighted creatures receive a -[smoke penalty of the location] penalty on their attacks.)".


Section - Smoke immunity

[Some characters do not receive penalties for being in a room with smoke. Those who are eyeless, for instance, and those who are naturally immune to smoke. ]

The smoke immunity rules are a rulebook.

To decide whether (guy - a person) is smoke immune:
	now test subject is guy;
	consider the smoke immunity rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

A person can be smoke attuned. A person is usually not smoke attuned. [Smoke attuned people do not receive smoke penalties.]

A smoke immunity rule (this is the smoke immune if smoke attuned rule):
	if test subject is smoke attuned:
		rule succeeds.

A smoke immunity rule (this is the smoke immune if eyeless rule):
	if test subject is blind:
		rule succeeds.


Section - Effects of smoke

To decide if the attacker is affected by smoke:
	if the smoke penalty of the location is less than 1 or the global attacker is smoke immune:
		no;
	yes;

A detection rule (this is the smoke lessens probability of detection rule):
	unless main actor is smoke immune:
		decrease the detection probability by smoke penalty of the location.

An attack modifier rule (this is the thick smoke makes attacking a little harder rule):
	if the attacker is affected by smoke:
		say " - [smoke penalty of the location] (smoke)[run paragraph on]";
		decrease the attack strength by smoke penalty of the location.	

Chance to win rule when the attacker is affected by smoke (this is the CTW smoke penalty rule):
	decrease the chance-to-win by smoke penalty of the location.
			
An attack modifier rule (this is the running is less risky with smoke rule):
	if the global defender is the player and the player is runner and the attacker is affected by smoke:
		let n be smoke penalty of the location;
		say " - [n] (running covered by smoke)[run paragraph on]";
		decrease the attack strength by n.
			
An attack modifier rule (this is the retreating is less risky with smoke rule):
	if the global defender is the player and the player is retreater and the attacker is affected by smoke:
		let n be smoke penalty of the location;
		say " - [n] (retreat covered by smoke)[run paragraph on]";
		decrease the attack strength by n.




Part - Etherealness

Chapter - Etherealness

A person can be ethereal. A person is usually not ethereal.

A person has a number called the ethereal timer. The ethereal timer of a person is usually 0. [-1 means infinite]

Last dungeon interest rule (this is the set ethereal timer for ethereal people rule):
	repeat with guy running through ethereal persons:
		if ethereal timer of guy is 0:
			now ethereal timer of guy is -1.

Every turn (this is the decrease etherealness rule):
	if the ethereal timer of the main actor is greater than 0:
		decrease ethereal timer of the main actor by 1;
		if main actor is the player and ethereal timer of the main actor is 5:
			say "Your [bold type]etherealness[roman type] will wear off in five turns.";
		if main actor is the player and ethereal timer of the main actor is 1:
			say "Your [bold type]etherealness[roman type] will wear off next turn.";
		if ethereal timer of the main actor is 0:
			now main actor is not ethereal;
			if the main actor is the player:
				say "You become [bold type]solid[roman type].";
			otherwise:
				say "[The main actor] becomes [bold type]solid[roman type].".

To make (guy - a person) ethereal:
	now guy is ethereal;
	let X be location of the guy;
	repeat with item running through things had by guy:
		unless item is radiant:
			move item to X;
			if item is a weapon:
				now item is not readied;
	repeat with item running through things worn by guy:
		unless item is radiant:
			move item to X.

Before ethereal-forbidden when the player is ethereal:
	unless the noun is radiance:
		take no time;
		say "You cannot do that while you are ethereal." instead.

Before ethereal-forbidden-second when the player is ethereal:
	unless the second noun is radiance:
		take no time;
		say "You cannot do that while you are ethereal." instead.

A damage multiplier rule (this is the ethereal damage multiplier rule):
	if the global defender is ethereal and the global attacker is not ethereal:
		say " - 100% (defender ethereal)[run paragraph on]";
		now the attack damage is 0;
		decrease hit protection of the global defender by 1;
	otherwise if the global attacker is ethereal:
		say " - 100% (attacker ethereal)[run paragraph on]";
		now the attack damage is 0;
		decrease hit protection of the global defender by 1.

Status rule (this is the ethereal status rule):
	if player is ethereal:
		say "You are [bold type]ethereal[roman type]: you cannot interact with most physical objects.[line break][run paragraph on]".

A physical damage reduction rule (this is the no physical damage when ethereal rule):
	if test subject is ethereal:
		increase pdr by 100.
		
First impeded movement rule (this is the can always move when ethereal rule):
	if test subject is ethereal:
		rule succeeds.
		
A detection rule (this is the ethereal makes hiding easier rule):
	if player is ethereal:
		decrease the detection probability by 25.

Section - Moving through rock

[Playes can lock themselves up!]

Moving through solid rock is a room. "The sensation of you ethereal body coexisting with solid rock is rather unpleasant. You can see nothing."
Moving through solid rock is not placeable.
Moving through solid rock is not habitable.
[More.]

[Feeling the rock.]

Before going when the player is ethereal:
	if the player can move:
		unless x-coordinate of location is 100: [Unplaced rooms are at 100, 100, 100, and should handle etherealness in some other way if they wish to. E.g, the maze, the elemental plane of smoke.]
			let x be the x noun of location;
			let y be the y noun of location;
			let z be the z noun of location;
			if the space at x by y by z is free: [no room there -> move to solid rock]
				say "You walk through rock.";
				unless player is in moving through solid rock:
					move player to moving through solid rock;
				now x-coordinate of moving through solid rock is x;
				now y-coordinate of moving through solid rock is y;
				now z-coordinate of moving through solid rock is z;
				stop the action;			
			otherwise: [room there -> just move the player]
				let item be the room at x by y by z;
				if item is the room noun from the location: 
					continue the action; [this is the case of normal movement]
				otherwise:
					say "You walk through the walls.";
					move player to item;
					stop the action.

Every turn when the player is not in moving through solid rock (this is the destroy solid rock coordinates rule):
	now x-coordinate of moving through solid rock is 1000;
	now y-coordinate of moving through solid rock is 1000;
	now z-coordinate of moving through solid rock is 1000.
	
Every turn when the player is in moving through solid rock (this is the player dies in solid rock if not ethereal rule):
	if the player is not ethereal:
		say "Your body, having regained its material solidity, cannot coexist in one place with solid rock.";
		end the story saying "Rock is stronger than flesh".

Kerkerkruip Systems - Hiding Smoke Ethereal ends here.