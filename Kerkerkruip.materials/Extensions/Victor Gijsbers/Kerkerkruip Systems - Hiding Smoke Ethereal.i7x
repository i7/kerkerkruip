Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers begins here.

Use authorial modesty.

Part - Hiding

Chapter - Hidden

A person can be hidden. A person is usually not hidden.
A person can be on-the-lookout. A person is usually not on-the-lookout. [Once they have seen you appear from the shadows once, they'll be better at detecting you later.]
A person can be unnaturally aware. [The unnaturally aware always detect you.]
A person can be unnaturally aware follower. [An unnaturally aware follower may not detect you, but does know where you are in the dungeon.]

Status attribute rule (this is the hidden status rule):
	if the player is hidden:
		if long status is true:
			say "You are [bold type]hidden[roman type].[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]hidden[run paragraph on]";

An attack modifier rule (this is the hidden gives a small attack bonus rule):
	if the global attacker is hidden and the global defender is not asleep: [you'll already get the asleep bonus]
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
		if P is unnaturally aware:
			say "[The P] slowly turns in your direction.";
		otherwise:
			say "[The P] [one of]remains unaware of your presence[or]does not notice you[or]does not detect your presence[at random].";
		rule succeeds.
	
An AI target selection rule for a hidden person (this is the do not prefer hidden people rule):
	decrease the Weight by 1000.
	
First check an actor hitting (this is the stop hitting if the defender is hidden rule):
	if the global defender is hidden:
		stop the action.
	

Hiding roll is a number that varies.
The detection rules are a rulebook.

Every turn when the player is hidden (this is the possible detection rule):
	if main actor is the player:
		if at least one person enclosed by the location opposes the player:
			unless all enemies are asleep:
				now hiding roll is a roll of the dice;
				say "[italic type]You roll a hiding check of [hiding roll] [run paragraph on]";
				follow the detection rules;
				say " = [hiding roll], which must be positive.[roman type] [run paragraph on]";
				if hiding roll > 0:
					say "You [bold type]remain hidden[roman type].";
				otherwise:
					say "You are [bold type]detected[roman type]!";
					now the player is not hidden;
					repeat with guy running through visible persons:
						if the faction of guy hates the faction of the player:
							now guy is on-the-lookout.

Section - Detection rules
	
A detection rule (this is the tension increases probability of detection rule):
	let n be ((tension + 1) / 2);
	say " - ", n, " (tension)[run paragraph on]";
	decrease hiding roll by n.

A detection rule (this is the number of enemies increases probability of detection rule):
	let n be 0;
	repeat with guy running through people in the location:
		if guy opposes the player:
			unless guy is blind:
				unless guy is asleep:
					increase n by 1;
	if n is not 0:
		say " - [n] (number of perceiving enemies)[run paragraph on]";
		decrease the hiding roll by n.

A detection rule (this is the on-the-lookout increases probability of detection rule):
	let boolean be false;
	repeat with guy running through people in the location:
		if guy opposes the player and guy is on-the-lookout:
			now boolean is true;
	if boolean is true:
		say " - 1 (enemies on the lookout)[run paragraph on]";
		decrease the hiding roll by 1.

A detection rule (this is the unnatural awareness detection rule):
	repeat with guy running through people in the location:
		if guy opposes the player and guy is unnaturally aware:
			say " - 100 ([the guy] supernaturally detects you)[run paragraph on]";
			decrease hiding roll by 100.


Section - Action rules

Hiding action penalty is a number that varies.
Hiding action penalty text is a text that varies.

A detection rule (this is the action detection rule):
	if hiding action penalty is not 0:
		say " - [hiding action penalty] ([hiding action penalty text])[run paragraph on]";
		decrease hiding roll by hiding action penalty;
		now hiding action penalty is 0.

Last every turn (this is the remove hiding action penalty rule):
	now hiding action penalty is 0.

Carry out attacking:
	now hiding action penalty is 5;
	now hiding action penalty text is "attacking".

An aftereffects rule (this is the be detected after successful attack rule):
	if the global attacker is the player and the attack damage is greater than 0:
		now hiding action penalty is 10;
		now hiding action penalty text is "successfully attacking";
		now global defender is on-the-lookout.

Carry out concentrating:
	now hiding action penalty is 3;
	now hiding action penalty text is "concentrating";
	if the player is hidden:
		say "You shift your attention away from remaining hidden. [run paragraph on]".

Carry out reading a scroll:
	now hiding action penalty is 5;
	now hiding action penalty text is "reading out loud".

Carry out dropping:
	now hiding action penalty is 2;
	now hiding action penalty text is "dropping stuff".

Carry out taking:
	now hiding action penalty is 2;
	now hiding action penalty text is "picking stuff up".

Carry out singing:
	now hiding action penalty is 10;
	now hiding action penalty text is "singing".

Carry out searching:
	now hiding action penalty is 2;
	now hiding action penalty text is "searching".	
	
Sudden combat reset rule (this is the reset hiding penalties when leaving the room rule):
	now hiding action penalty is 0.

Section - No perceived threat

To decide whether there is no perceived threat for (guy - a person):
	repeat with guy2 running through persons enclosed by the location of guy:
		if the faction of guy hates the faction of guy2:
			if guy2 is not hidden or guy is unnaturally aware:
				decide no;
	decide yes.

Section - Hiding

To hide:
	["hate is present" is deprecated, but I don't think it's safe to update the combat status here, because this can happen when combat status needs to be concluding]
	if hate is present:
		say "You fail to hide.";
	otherwise:
		say "You blend into the shadows.";
		now the player is hidden

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
			follow the smoke rules;
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
	follow the smoke rules;
	follow the smoke rules;
	follow the smoke rules;
	follow the smoke rules.		


Section - The backdrop

Clouds of smoke is a backdrop. Clouds of smoke is everywhere. Clouds of smoke is plural-named. Understand "cloud" and "fog" and "vapour" and "vaopurs" and "vapor" and "vapors" as clouds of smoke.

Definition: clouds of smoke are denizen:
	Repeat with place running through placed rooms:
		if the smoke timer of place is at least 1, yes;
	no.

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
	follow the smoke immunity rules;
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
	let n be smoke penalty of the location;
	if n > 0:
		let boolean be false;
		repeat with guy running through people in the location:
			if guy opposes the player and guy is smoke immune:
				now boolean is true;
		if boolean is false:
			say " + [n] (smoke)[run paragraph on]";
			increase the hiding roll by n.

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

Status attribute rule (this is the ethereal status rule):
	if player is ethereal:
		if long status is true:
			say "You are [bold type]ethereal[roman type]: you cannot interact with most physical objects.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]ethereal[run paragraph on]";

[Being ethereal protects against ]

A specific damage multiplier rule (this is the ethereal damage immunity rule):
	if the victim is ethereal or (damage-by-hitting is true and global attacker is ethereal):
		let n be 0;
		repeat with type running through damage types:
			if type is physical-body-only:
				increase n by harm of type;
				now harm of type is 0;
		if n is greater than 0:
			unless damage silence is true:
				say " - [n] ([if victim is not ethereal]attacker[end if] ethereal)[run paragraph on]";
				now damage comment is true.
		
First impeded movement rule (this is the can always move when ethereal rule):
	if test subject is ethereal:
		rule succeeds.
		
A detection rule (this is the ethereal makes hiding easier rule):
	if player is ethereal:
		say " + 2 (ethereal)[run paragraph on]";
		increase the hiding roll by 2.

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