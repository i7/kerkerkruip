Version 5/140908 of Inform ATTACK by Victor Gijsbers begins here.

"Inform ATTACK: the Inform Advanced Turn-based TActical Combat Kit"

"GPL 3 licenced"
 


Volume - Introduction

Include version 5/131204 of Inform ATTACK Core by Victor Gijsbers.
[Include Plurality by Emily Short.] [Deprecated with Inform 6L02.]

Section - Saying combat numbers

[ See manual section 2.1.2 ]

[ This variable determines whether we see numerical output. ]
The numbers boolean is a truth state variable. The numbers boolean is true.

Checking the numbers boolean is an action out of world. Understand "numbers" as checking the numbers boolean.
Carry out checking the numbers boolean (this is the standard checking the numbers boolean rule):
	say "Combat-related numbers will be [if the numbers boolean is true]displayed[otherwise]hidden[end if].".

Switching the numbers off is an action out of world. Understand "numbers off" as switching the numbers off.
Carry out switching the numbers off (this is the standard switching the numbers off rule):
	now the numbers boolean is false;
	say "You will no longer see combat-related numbers.".

Switching the numbers on is an action out of world. Understand "numbers on" as switching the numbers on.
Carry out switching the numbers on (this is the standard switching the numbers on rule):
	now the numbers boolean is true;
	say "You will now see combat-related numbers.".

Section - The After reporting rules

[ The reporting rules are supposed to have the last word, but in Inform ATTACK sometimes that's just not acceptable. The After reporting rules allow us to get another word in. Like the After rules, they are shared for all (non out of world) actions. ]
The after reporting rules are a rulebook.

A specific action-processing rule (this is the after reporting stage rule):
	if action in world is true:
		abide by the after reporting rules.

Section - New verbs

To lunge is a verb.
To miss is a verb.


Volume - The Main System

[The Main System covers the basics of combat, and creates rulebooks for all other systems to fit into.]



Book - Dressing up the Person Class

[ These adjectives will make reporting attacks a lot easier! ]
Definition: a person is a pc rather than an npc if it is the player.

Chapter - Looting

[To make looting possible.]
The can't take people's possessions rule is not listed in any rulebook.

Check an actor taking (this is the can't take living people's possessions rule):
	let the local ceiling be the common ancestor of the actor with the noun;
	let H be the not-counting-parts holder of the noun;
	while H is not nothing and H is not the local ceiling:
		if H is an alive person:
			if the actor is the player:
				say "[regarding the noun][Those] [seem] to belong to [the H]." (A);
		let H be the not-counting-parts holder of H;

After examining a dead person (this is the give list of possession on dead person rule):
	if the number of things carried by the noun is at least one:
		say "On the [if the noun is plural-named]bodies[otherwise]body[end if] of [the noun] you also see [list of things carried by the noun with indefinite articles].".

Chapter - Health

A person has a number called permanent health. [The maximum you can regain with healing.]

When play begins (this is the set permanent health to initial health rule):
	repeat with the patient running through people:
		now the permanent health of the patient is the health of the patient;

[We set the permanent health of each individual to the health it has at the beginning of the game. If we wish any character to start the game wounded or super-healthy, we will have to manually override this process.]

To restore the health of (patient - a person):
	now the health of the patient is the permanent health of the patient. 

To fully heal (patient - a person):
	if the permanent health of the patient is greater than the health of the patient:
		restore the health of the patient.

[The healed amount is a number that varies. The healed amount is usually 0.]

To heal (patient - a person) for (health - a number) health:
	let the health dummy be the permanent health of the patient minus the health of the patient;
	if health is less than the health dummy:
		now the health dummy is health;
	if the health dummy is less than 0:
		now the health dummy is 0;
	increase the health of the patient by the health dummy;
	[now the healed amount is the health dummy.] [For storage.]

Chapter - Basic Combat Stats

[Melee is a measure of fighting prowess. Higher melee means higher chance to hit.]
A person has a number called melee. The melee of a person is usually 0. 

[Defence is a measure of fighting prowess. Higher defence means less chance to get hit.]
A person has a number called defence. The defence of a person is usually 7.



Book - Weapons

Chapter - The weapon kind

A weapon is a kind of thing.

[ A readied weapon is one that is not just carried by the actor, but actually in use. ]
A weapon can be readied. A weapon is usually not readied.

After printing the name of a readied weapon while taking inventory (this is the readied inventory listing rule):
	say " (readied)".

[ The damage die is the die size used to calculate damage. Base damage dealt by the weapon is 1d(damage die) + weapon damage bonus. So a standard weapon deals 1d6 damage; a weapon with a damage die of 0 and a weapon damage bonus of 5 always deals 5 damage, and so on. Negative damage die is counted as 0, but negative weapon damage bonus is possible. ]
A weapon has a number called the damage die. The damage die of a weapon is usually 6.
A weapon has a number called the weapon damage bonus. The weapon damage bonus of a weapon is usually 0.

A weapon has a number called the dodge bonus. The dodge bonus of a weapon is usually 0.

A weapon has a number called the parry-against bonus. The parry-against bonus is usually 0.

A weapon has a number called the parry-with bonus. The parry-with bonus is usually 0.

Section - Weapon attack bonus

A weapon has a number called the weapon attack bonus. The weapon attack bonus of a weapon is usually 0.

An attack modifier rule (this is the weapon attack bonus rule):
	let n be the weapon attack bonus of the global attacker weapon;
	if the numbers boolean is true:
		if n is greater than 0:
			say " + ", n, " ([the global attacker weapon] bonus)[run paragraph on]";
		if n is less than 0:
			say " - ", 0 minus n, " ([the global attacker weapon] penalty)[run paragraph on]";
	increase the attack strength by n.

Chance to win rule (this is the CTW attack bonus from weapon rule):
	increase the chance-to-win by the weapon attack bonus of the chosen weapon.

Section - Natural weapons

A natural weapon is a kind of weapon.
A natural weapon is part of every person.
A natural weapon is usually privately-named.

The description of a natural weapon is usually "Clenched fists, kicking feet--that kind of stuff."

The damage die of a natural weapon is usually 3. The dodge bonus of a natural weapon is usually 0. The parry-against bonus of a natural weapon is usually 0. The parry-with bonus of a natural weapon is usually -2.

Does the player mean readying a natural weapon:
	it is very unlikely.

Definition: a weapon is artificial if it is not a natural weapon.

Section - Making sure a weapon is always readied

To ready natural weapons:
	repeat with X running through all alive persons enclosed by the location:
		if X encloses no readied weapon:
			let item be a random natural weapon part of X;
			now item is readied.

To unready natural weapons:
	repeat with X running through all alive persons enclosed by the location:
		if X encloses at least two readied weapons:
			let item be a random natural weapon part of X;
			now item is not readied.

When play begins (this is the ready weapons for everyone rule):
	repeat with X running through all alive persons:
		if X encloses no readied weapon:
			if X carries at least one weapon:
				let item be a random weapon carried by X;
				now item is readied;
			otherwise:
				let item be a random natural weapon part of X;
				now item is readied.

A starting the combat round rule (this is the ready natural weapons rule):
	ready natural weapons;
	unready natural weapons.

Section - Unreadying weapons

After dropping a readied weapon (this is the unready on dropping rule):
	now the noun is not readied;
	continue the action.

After putting on a readied weapon (this is the unready on putting on rule):
	now the noun is not readied;
	continue the action.

After inserting into a readied weapon (this is the unready on inserting rule):
	now the noun is not readied;
	continue the action.





Book - Combat Round

Chapter - The hitting action

The global attacker is a person variable.
The global defender is a person variable.
The global attacker weapon is a weapon variable.
The global defender weapon is a weapon variable.

The attack strength is a number variable.
The attack damage is a number variable.

[ The old system has been converted into an action. Instead of the old entry point system we now have:
	1: does attacking begin?
		add check an actor hitting rules
	2: preliminary results of attacking
		add first carry out an actor hitting rules
	3-6: basic attack roll, apply the attack modifiers, calculate results of the attack roll, show results of the attack roll
		these have been combined into the attack modifier rules
	7: did the attack hit?
		changed to first contact rules
	8: immediate results of hitting
		add contact rules
	9-10: rolling the die for damage, modifying the damage
		these have been combined into the damage modifier rules
	11-12: calculating the final damage, showing the damage
		these have been combined into the damage multiplier rules
	13: pre-prose-generation effects
		add after an actor hitting rules
	14: reporting the results of the blow
		the flavour rules have been changed to report an actor hitting rules
	15: aftereffects
		unchanged
	16: remove temporary circumstances
		changed to after an actor hitting rules
	17: final report
		Gone. Could add last aftereffects or last after reporting rules
]

Hitting is an action applying to one visible thing.
The specification of the hitting action is "When you attack Inform ATTACK must wait for a reaction from the target. In order to handle the resulting combat event the attacking action actually stores a new hitting action in the Table of Delayed Actions.".

[ Reset the variables ]
Setting action variables for hitting (this is the reset hitting variables rule):
	now the global attacker is the actor;
	now the global defender is the noun;
	ready natural weapons;
	now the global attacker weapon is a random readied weapon enclosed by the actor;
	now the global defender weapon is a random readied weapon enclosed by the noun;
	have the actor start pressing the noun;
	now the attack strength is 0;
	now the attack damage is 0;



Section - Checking that the hit can still occur

[ As a result of various reactions, it may no longer be possible to hit ]

First check an actor hitting (this is the stop hitting if either combatant is missing rule):
	if the location of the global attacker is not the location or the location of the global defender is not the location:
		stop the action;

First check an actor hitting (this is the stop hitting if either combatant is dead rule):
	if the global attacker is dead or the global defender is dead:
		stop the action;



Section - Calculating the attack roll

The attack modifier rules are a rulebook.

Carry out an actor hitting (this is the consider the attack modifier rules rule):
	follow the attack modifier rules;

First attack modifier rule (this is the standard attack roll rule):
	now the attack strength is a random number between 1 and 10;
	if the numbers boolean is true:
		say "[italic type]Rolling ", the attack strength, "[run paragraph on]".

An attack modifier rule (this is the melee attack bonus rule):
	let the attacker's melee be the melee of the global attacker;
	if the numbers boolean is true and the attacker's melee is not 0:
		if the the attacker's melee is greater than 0:
			say " + ", the attacker's melee, " (inherent bonus)[run paragraph on]";
		otherwise:
			say " - ", 0 minus the attacker's melee, " (inherent penalty)[run paragraph on]";
	increase the attack strength by the attacker's melee;

Last attack modifier rule (this is the standard show results of the attack roll rule):
	if the numbers boolean is true:
		say " = ", the attack strength, ", [run paragraph on]";



Section - Whether the attack hits

The contact rules are a rulebook.

Carry out an actor hitting (this is the abide by the contact rules rule):
	abide by the contact rules.

To beat is a verb.

First contact rule (this is the standard whether the attack hit rule):
	if the attack strength is greater than the defence of the global defender:
		if the numbers boolean is true:
			say "[the global attacker] [beat] [regarding the global defender][possessive] defence rating of ", the defence of the global defender, ".";
	otherwise:
		if the numbers boolean is true:
			say "[the global attacker] [do] not overcome [regarding the global defender][possessive] defence rating of ", the defence of the global defender, "[roman type].";
		rule fails;



Section - Dealing damage

The damage modifier rules are a rulebook.
The damage multiplier rules are a rulebook.

Carry out an actor hitting (this is the consider the damage modifier rules rule):
	follow the damage modifier rules;

To deal is a verb.

First damage modifier rule (this is the standard damage roll rule):
	unless damage die of the global attacker weapon is less than 1:
		now the attack damage is a random number between 1 and the damage die of the global attacker weapon;
	increase the attack damage by weapon damage bonus of the global attacker weapon; [1d(damage die) + WDB]
	if the numbers boolean is true:
		say "[The global attacker] [deal] ", the attack damage, "[run paragraph on]".

Carry out an actor hitting (this is the consider the damage multiplier rules rule):
	follow the damage multiplier rules;

Last damage multiplier rule (this is the can't deal negative damage rule):
	if the attack damage is less than 0:
		now the attack damage is 0;

Last damage multiplier rule (this is the standard show the attack damage dealt rule):
	if the numbers boolean is true:
		say " = [bold type]", the attack damage, " damage[roman type][italic type], ";
		[no damage]
		if the the attack damage is less than 1:
			say "allowing [the global defender] to escape unscathed.[run paragraph on]";
		otherwise:
			[non-fatal]
			if the the total damage is less than the health of the global defender:
				say "wounding [the global defender] to ", health of the global defender minus the total damage, " health.[run paragraph on]" ;
			[fatal]
			otherwise:
				say "killing [the name of the global defender].[run paragraph on]";
		say "[roman type][paragraph break]";

Carry out an actor hitting (this is the subtract damage from health rule):
	decrease the health of the global defender by the total damage;



Section - Report hitting

To hit is a verb. To kill is a verb.

Report an actor hitting an alive person (this is the basic flavour rule):
	if the attack damage is greater than 0:
		say "[The global attacker] [hit] [the global defender].[run paragraph on]";
	otherwise:
		say "[The global attacker] [miss] [the global defender].[run paragraph on]";

Report an actor hitting a dead pc (this is the basic fatal player flavour rule):
	say "You are killed by [the global attacker].[run paragraph on]";

Report an actor hitting a dead npc (this is the basic fatal flavour rule):
	say "[The global attacker] [kill] [the name of the global defender].[run paragraph on]";

Report the player hitting a dead pc (this is the report player suicide rule):
	say "Your attack ends your own life.";
	rule succeeds;



Section - Aftereffects

The aftereffects rules is a rulebook.

After reporting an actor hitting (this is the consider the aftereffects rules rule):
	if the player is alive:
		follow the aftereffects rules;

An aftereffects rule when the global defender is dead (this is the unready weapons of dead person rule):
	now all readied weapons enclosed by the global defender are not readied;

An aftereffects rule (this is the modify initiative based on combat results rule):
	if the total damage is greater than 0:
		decrease the initiative of the global defender by 2;
	otherwise:
		decrease the initiative of the global attacker by 2;



Book - Flow

Chapter - Offensive and Defensive Flow

A person has a number called offensive flow. The offensive flow of a person is usually 0.

A person has a number called defensive flow. The defensive flow of a person is usually 0.

An attack modifier rule (this is the offensive flow attack modifier rule):
	let n be offensive flow of the global attacker;
	if the numbers boolean is true:
		unless n is 0:
			if n > 0:
				say " + ", n, " (offensive flow)[run paragraph on]";
			if n < 0:
				let m be (0 - n);
				say " - ", m, " (offensive flow)[run paragraph on]";
	increase the attack strength by n;

An attack modifier rule (this is the defensive flow attack modifier rule):
	let n be defensive flow of the global defender;
	if the numbers boolean is true:
		unless n is 0:
			if n > 0:
				say " - ", n, " (defensive flow)[run paragraph on]";
			if n < 0:
				let m be (0 - n);
				say " + ", m, " (defensive flow)[run paragraph on]";
	decrease the attack strength by n;

Rule for damage modifier (this is the offensive flow damage modifier rule):
	let bonus be offensive flow of the global attacker;
	if the numbers boolean is true:
		unless the bonus is 0:
			say " + ", the bonus, " (offensive flow)[run paragraph on]";
	increase the attack damage by the bonus.

[Rule for damage modifier (this is the defensive flow damage modifier rule):
	let bonus be defensive flow of the global defender;
	if the numbers boolean is true:
		unless the bonus is 0:
			say " - ", the bonus, " (defensive flow)[run paragraph on]";
	decrease the attack damage by the bonus.]

An aftereffects rule (this is the lose flow when hit rule):
	if the total damage is greater than 0 and the global defender is alive:
		now offensive flow of global defender is 0;
		now defensive flow of global defender is 0.

After an actor hitting (this is the lose flow after unsuccessfully attacking rule):
	unless the attack strength is greater than the defence of the global defender:
		now the offensive flow of the global attacker is 0;
		now the defensive flow of the global attacker is 0;
	continue the action;

To up the offensive flow of (guy - a person):
	unless offensive flow of guy is 3:
		increase offensive flow of guy by 1;
		let n be (3 - offensive flow of guy);
		if defensive flow of guy > n:
			now defensive flow of guy is n.

To up the defensive flow of (guy - a person):
	unless defensive flow of guy is 3:
		increase defensive flow of guy by 1;
		let n be (3 - defensive flow of guy);
		if offensive flow of guy > n:
			now offensive flow of guy is n.

Definition: a person (called the guy) is flowing if (offensive flow of guy > 0) or (defensive flow of guy > 0).

This is the everyone loses flow when combat status is peace rule:
	if combat status is peace:
		repeat with guy running through flowing people:
			now offensive flow of guy is 0;
			now defensive flow of guy is 0.
				
The everyone loses flow when combat status is peace rule is listed before the business as usual rule in the combat round rules.


Book - Standard Combat Actions

Chapter - Readying

Readying is an action applying to one visible thing.

Understand "ready [thing]" as readying. Understand "wield [thing]" and "use [weapon]" as readying.

Does the player mean readying a readied weapon: it is unlikely.

Check readying (this is the cannot ready what is already readied rule):
	if the noun is readied and the noun is enclosed by the player:
		take no time;
		say "You are already wielding [the noun]." instead.

Check readying (this is the cannot ready what is not a weapon rule):
	if the noun is not a weapon:
		take no time;
		say "You can only ready weapons." instead.

First carry out an actor readying (this is the implicit taking when readying rule):
	if the actor does not enclose the noun:
		try the actor taking the noun.

Carry out an actor readying (this is the carry out readying when enclosing rule):
	if the actor encloses the noun:
		now the noun is readied.

Last carry out an actor readying (this is the unready all other weapons rule):
	if the noun is readied:
		repeat with item running through things enclosed by the actor:
			if the item is not the noun and the item is readied:
				now the item is not readied.

To ready is a verb. To fool is a verb. To attempt is a verb. To fail is a verb.

Last report an actor readying (this is the standard report readying rule):
	if the noun is readied:
		say "[The actor] [ready] [the noun].";
	otherwise:
		if the actor encloses the noun:
			say "[The actor] [fool] around with [the noun], but [fail] to ready it.";
		otherwise:
			say "[The actor] [attempt] to ready [the noun], but [cannot] get a hold on it.".

Chapter - Unreadying

Unreadying is an action applying to one visible thing.

Understand "unready [thing]" as unreadying. Understand "unwield [thing]" as unreadying.

Does the player mean unreadying a readied weapon: it is very likely.

Check unreadying (this is the can only unready what is readied rule):
	unless the noun is a readied weapon enclosed by the actor:
		take no time;
		say "You are not wielding that." instead.
		
Carry out an actor unreadying:
	now the noun is not readied;
	say "You unwield [the noun].";
	if the player encloses no readied weapon:
		let item be a random natural weapon part of the player;
		now item is readied.

Chapter - Attacking

The block attacking rule is not listed in any rulebook.

Understand "a [thing]" as attacking.

Does the player mean attacking a dead person:
	it is unlikely.
Does the player mean attacking a person opposed by the player:
	it is very likely.

Check attacking when the noun is not a person (this is the only attack persons rule):
	take no time;
	say "Things are not your enemies." instead.

Check attacking a dead person (this is the only attack the living rule):
	take no time;	
	say "[The noun] is already dead." instead.

Check attacking the player (this is the do not kill yourself rule):
	take no time;
	say "You are not that desperate!" instead.

A check attacking rule (this is the do not attack friendly people rule):
	if the faction of the player is the faction of the noun:
		take no time;
		say "[The noun] is your friend, not your enemy!" instead.

A check attacking rule (this is the do not attack neutral people rule):
	if the player does not oppose the noun:
		take no time;
		say "[The noun] is not your enemy." instead.

Check attacking when the player is at-React (this is the cannot attack as reaction rule):
	take no time;
	say "Attacking is an action, not a reaction." instead.

Carry out an actor attacking (this is the standard carry out an actor attacking rule):
	choose a blank row in the Table of Delayed Actions;
	now the Action speed entry is 10;
	now the Action to take entry is the action of the actor hitting the noun;
	now the combat state of the noun is at-React;

Report an npc attacking (this is the standard report an actor attacking rule):
	say "[The actor] [lunge] towards [the noun].[paragraph break]".



Chapter - Concentrating

Concentrating is an action applying to nothing. Understand "concentrate" and "c" and "co" as concentrating.

A person has a number called concentration. The concentration of a person is usually 0.

Check concentrating when the concentration of the player is 3 (this is the do not concentrate when at maximum rule):
	take no time;
	say "You are already maximally concentrated." instead;

First carry out an actor concentrating (this is the standard concentrating improves initiative rule):
	increase the initiative of the actor by the concentration of the actor.
		
Carry out an actor concentrating (this is the standard carry out concentrating rule):	
	increase the concentration of the actor by 1;
	if the concentration of the actor is greater than 3:
		now the concentration of the actor is 3;

To concentrate is a verb.
	
Report an actor concentrating (this is the standard concentrating prose rule):
	say "[The actor] [concentrate], and [are]";
	if the concentration of the actor is:
		-- 1:
			say " now mildly concentrated.";
		-- 2:
			say " now quite concentrated.";
		-- 3:
			say " now maximally concentrated.";

An attack modifier rule (this is the concentration attack modifier rule):
	let the bonus be 0;
	if the concentration of the actor is:
		-- 0:
			make no decision;
		-- 1:
			now the bonus is 2;
		-- 2:
			now the bonus is 4;
		-- 3:
			now the bonus is 8;
	if the numbers boolean is true:
		say " + ", the bonus, " (concentration)[run paragraph on]";
	increase the attack strength by the bonus;

Rule for damage modifier (this is the concentration damage modifier rule):
	let the bonus be 0;
	if the concentration of the actor is:
		-- 2:
			now the bonus is 2;
		-- 3:
			now the bonus is 4;
		-- otherwise:
			make no decision;
	if the numbers boolean is true:
		say " + ", the bonus, " (concentration)[run paragraph on]";
	increase the attack damage by the bonus;

An aftereffects rule (this is the lose concentration when hit rule):
	if the total damage is greater than 0 and the global defender is alive:
		let the global defender lose concentration.

After an actor hitting (this is the lose concentration after attacking rule):
	now the concentration of the global attacker is 0;
	continue the action;

[ Losing concentration ]

To let (the defender - a person) lose concentration:
	if the concentration of the defender > 0:
		now the concentration of the defender is 0;
		follow the lose concentration prose rules for the defender;

The lose concentration prose rules are a person based rulebook.

To lose is a verb.

Last lose concentration prose rule for a person (called P) (this is the standard lose concentration prose rule):
	say "[The P] [lose] [bold type]concentration[roman type]!";

Chance to win rule (this is the CTW concentration bonus rule):
	if the concentration of the running AI is:
		-- 1:
			increase the chance-to-win by 2;
		-- 2:
			increase the chance-to-win by 4;
		-- 3:
			increase the chance-to-win by 8;
	
Carry out an actor going (this is the lose concentration on going rule):
	now the concentration of the actor is 0.


This is the everyone loses concentration when combat status is peace rule:
	if combat status is peace:
		if concentration of the player is not 0:
			now concentration of the player is 0;
			say "You relax your concentration.";
		repeat with guy running through alive people:
			now concentration of guy is 0.
			
The everyone loses concentration when combat status is peace rule is listed before the business as usual rule in the combat round rules.


Chapter - Parrying

Parrying is an action applying to nothing. Understand "parry" and "p" and "pa" as parrying.

A person can be at parry. A person is usually not at parry.

To parry is a verb.

Check parrying (this is the cannot parry when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [parry], but [there] [are] no attack." instead.

[Carry out an actor parrying (this is the parrying changes initiative rule):
	increase the initiative of the actor by 1.]
	
Carry out an actor parrying (this is the standard carry out parrying rule):	
	now the actor is at parry.

To strike is a verb.

Report an actor parrying (this is the standard parry prose rule):	
	say "[The actor] [strike] up a defensive pose.".

An attack modifier rule (this is the parry defence bonus rule):
	if the global defender is at parry:
		decrease attack strength by 2;
		if the numbers boolean is true:
			say " - 2 (defender parrying)[run paragraph on]";
		let n be parry-against bonus of the global attacker weapon;
		decrease attack strength by n;
		if the numbers boolean is true:
			if n is greater than 0:
				say " - ", n, " (parrying against [the global attacker weapon])[run paragraph on]";
			if n is less than 0:
				now n is (0 - n);
				say " + ", n, " (parrying against [the global attacker weapon])[run paragraph on]";
		now n is parry-with bonus of the global defender weapon;
		decrease attack strength by n;
		if the numbers boolean is true:
			if n is greater than 0:
				say " - ", n, " (parrying with [the global defender weapon])[run paragraph on]";
			if n is less than 0:
				now n is (0 - n);
				say " + ", n, " (parrying with [the global defender weapon])[run paragraph on]";

Last after reporting an actor hitting (this is the no longer at parry after the attack rule):
	now the global defender is not at parry;
	continue the action;

Chance to win rule (this is the CTW parry bonus rule):
	let n be the parry-against bonus of the chosen weapon;
	let item be a random readied weapon enclosed by the chosen target;
	increase n by parry-with bonus of item;
	increase n by 2;
	if the best defence is less than n:
		now the best defence is n.

An aftereffects rule (this is the gain offensive flow from parrying rule):
	if the total damage is 0 and the global defender is at parry:
		up the offensive flow of global defender.

Chapter - Dodging

Dodging is an action applying to nothing. Understand "dodge" and "do" as dodging.

A person can be at dodge. A person is usually not at dodge.

To dodge is a verb.

Check dodging (this is the cannot dodge when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [dodge], but [there] [are] no attack." instead.
	
Carry out an actor dodging (this is the standard carry out dodging rule):	
	now the actor is at dodge.

Report an actor dodging (this is the standard dodge prose rule):
	say "[The actor] [get] ready for quick evasive maneuvers.".

An attack modifier rule (this is the dodge defence bonus rule):
	if the global defender is at dodge:
		decrease attack strength by 2;
		if the numbers boolean is true:
			say " - 2 (defender dodging)[run paragraph on]";		
		let n be dodge bonus of global attacker weapon;
		decrease the attack strength by n;
		if the numbers boolean is true:
			if n is greater than 0:
				say " - ", n, " ([the global attacker weapon] dodge bonus)[run paragraph on]";
			if n is less than 0:
				now n is (0 - n);
				say " + ", n, " ([the global attacker weapon] dodge penalty)[run paragraph on]";

Chance to win rule (this is the CTW dodge bonus rule):
	let n be (2 + (dodge bonus of the chosen weapon));
	if the best defence is less than n:
		now the best defence is n.

After reading a command (this is the d might mean dodge rule):
	if the player is at-React and the player's command matches "d":
		say "[italic type](Perhaps you wanted to dodge? The abbreviation for that is 'do'.)[roman type][paragraph break]".

Last after reporting an actor hitting (this is the no longer at dodge after the attack rule):
	now the global defender is not at dodge;
	continue the action;

An aftereffects rule (this is the gain defensive flow from dodging rule):
	if the total damage is 0 and the global defender is at dodge:
		up the defensive flow of global defender.

Section - Rolling

Rolling is an action applying to nothing. Understand "roll" as rolling.

A person can be at-roll. A person is usually not at-roll.

To roll is a verb.

Check rolling (this is the cannot roll when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [roll], but [there] [are] no attack." instead.

Carry out an actor rolling:
	now the actor is at-roll.

Report an actor rolling (this is the standard roll prose rule):
	say "[The actor] [roll] into the thick of combat.".

[An attack modifier rule (this is the roll defence bonus rule):
	if the global defender is at-roll:
		let n be dodge bonus of global attacker weapon;
		decrease the attack strength by n;
		if the numbers boolean is true:
			if n is greater than 0:
				say " - ", n, " ([the global attacker weapon] dodge bonus)[run paragraph on]";
			if n is less than 0:
				now n is (0 - n);
				say " + ", n, " ([the global attacker weapon] dodge penalty)[run paragraph on]";]

Last after reporting an actor hitting (this is the no longer at roll after the attack rule):
	now the global defender is not at-roll;
	continue the action;

An aftereffects rule (this is the switch to offensive flow after rolling rule):
	if the total damage is 0 and the global defender is at-roll:
		now offensive flow of the global defender is (offensive flow of the global defender + defensive flow of the global defender);
		now defensive flow of the global defender is 0;
		up the offensive flow of global defender.

Section - Blocking

Blocking is an action applying to nothing. Understand "block" as blocking.

A person can be at-block. A person is usually not at-block.

To block is a verb.

Check blocking (this is the cannot block when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [block], but [there] [are] no attack." instead.

Carry out an actor blocking:
	now defensive flow of actor is (offensive flow of actor + defensive flow of actor);
	now offensive flow of actor is 0;
	now the actor is at-block.

Report an actor blocking (this is the standard block prose rule):
	say "[The actor] [attempt] to block the incoming attack.".
	
[No special defense bonus. Kerkerkruip adds a shield-related rule here.]	

Last after reporting an actor hitting (this is the no longer at block after the attack rule):
	now the global defender is not at-block;
	continue the action;

An aftereffects rule (this is the gain random flow from blocking rule):
	if the total damage is 0 and the global defender is at-block:
		if a random chance of 1 in 2 succeeds:
			if a random chance of 1 in 2 succeeds:
				up the defensive flow of global defender;
			otherwise:
				up the offensive flow of the global defender.


Section - Expose

Exposing is an action applying to nothing. Understand "expose" as exposing.

A person can be at-expose. A person is usually not at-expose.

To expose is a verb.

Check exposing (this is the cannot expose when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [expose] [ourselves], but [there] [are] no attack." instead.

Carry out an actor exposing:
	now the actor is at-expose.

To stand is a verb.

Report an actor exposing (this is the standard expose prose rule):
	say "[The actor] [stand] ready to receive the attack.".
	
An attack modifier rule (this is the expose defence penalty rule):
	if the global defender is at-expose:
		increase the attack strength by 20;
		if the numbers boolean is true:
			say " +  20 (defender exposing)[run paragraph on]";

Last after reporting an actor hitting (this is the no longer at expose after the attack rule):
	now the global defender is not at-expose;
	continue the action;





Book - Artificial Intelligence

[ Our standard AI works in three stages.
	First, we choose a person to attack--if we were to attack.
	In the second stage, we choose a weapon.
	In the third stage, we decide whether to attack or whether to do something else--like concentrating, dodging, readying a weapon, and so on.
	
These choices are made by a series of rulebooks which alter the weighting of each potential target/weapon/action.

Inform ATTACK Core has the base rules - we now add combat specific ones. ]

Section - Target selection rules

An AI target selection rule for a person (called target) (this is the prefer the severely wounded rule):
	if the health of the target times 2 is less than the permanent health of the target:
		increase the Weight by 2;
	if the health of the target times 4 is less than the permanent health of the target:
		increase the Weight by 5;

An AI target selection rule for a person (called target) (this is the prefer concentrated people rule):
	increase the Weight by the concentration of the target;
	if the concentration of the target is 3:
		increase the Weight by 2;

An AI target selection rule for a person (called target) (this is the prefer those with good weapons rule):
	let item be a random readied weapon enclosed by the target;
	increase the Weight by the damage die of the item divided by 2;

An AI target selection rule for a person (called target) (this is the do not prefer good parriers rule):
	let item be a random readied weapon enclosed by the running AI;
	let item2 be a random readied weapon enclosed by the target;
	let n be dodge bonus of item;
	let m be parry-against bonus of item + parry-with bonus of item2;
	if m > n:
		now n is m;
	decrease the Weight by n;

[The following rule makes the actor prefer people with low defence, unless he is concentrated, in which case he prefers people with high defence. Reason: if you managed to become concentrated, you should use that bonus against otherwise tough opponents.]

An AI target selection rule for a person (called target) (this is the do not prefer high defence unless concentrated rule):
	let n be the defence of the target minus the melee of the running AI;
	if n is less than 0:
		now n is 0;
	let m be the concentration of running AI minus 1;
	[Negative if concentration = 0; 0 is concentration is 1; positive if concentration is 2 or 3.]
	increase the Weight by n times m;



Section - Selecting a weapon

Table of AI Weapon Options
Weapon	Weapon weight
a weapon	a number
with 10 blank rows

The AI weapon selection rules are a weapon based rulebook producing a number.
The AI weapon selection rulebook has a number called the Weight.

The chosen weapon is a weapon variable.

A Standard AI rule for a person (called P) (this is the select a weapon rule):
	[ Only the natural weapon ]
	if exactly one weapon is enclosed by P:
		now the chosen weapon is a random weapon enclosed by P;
	[ If there is one non-natural weapon choose it ]
	otherwise if exactly two weapons are enclosed by P:
		now the chosen weapon is a random artificial weapon enclosed by P;
	otherwise:
		blank out the whole of the Table of AI Weapon Options;
		repeat with X running through all weapons enclosed by the P:
			let weight be the number produced by the AI weapon selection rules for X;
			choose a blank Row in the Table of AI Weapon Options;
			now the Weapon entry is X;
			now the Weapon weight entry is weight;
		sort the Table of AI Weapon Options in random order;
		sort the Table of AI Weapon Options in reverse Weapon weight order;
		#if debug and showing weightings;
		repeat through Table of AI Weapon Options:
			say "[Weapon weight entry]: [Weapon entry][line break]";
		#endif debug and showing weightings;
		choose row 1 in the Table of AI Weapon Options;
		now the chosen weapon is the Weapon entry;

Section - Standard weapon selection rules

[ These rules are dependent on the W, and not whether they are being run for the attacker or the defender. Use the running AI variable if you need to know whose weapon it is. ]

An AI weapon selection rule for a weapon (called W) (this is the prefer lots of damage rule):
	increase the Weight by the damage die of W;

An AI weapon selection rule for a weapon (called W) (this is the prefer low dodgability and passive parry rule):
	let n be the dodge bonus of the W;
	if the parry-against bonus of the W is greater than n:
		now n is the parry-against bonus of the W;
	decrease the Weight by n;

An AI weapon selection rule for a weapon (called W) (this is the prefer good active parry rule):
	increase the Weight by the parry-with bonus of the W;

An AI weapon selection rule for a weapon (called W) (this is the prefer good attack bonus rule):
	let n be the weapon attack bonus of the W times three;
	now n is (n + 1) divided by 2;
	increase the Weight by n.

[An AI weapon selection rule for a readied weapon (called W) (this is the prefer readied weapon rule):
	increase the Weight entry by 3;]

[ If you're almost dead then don't change weapons. TODO: is this bonus too much? ]
An AI weapon selection rule for a readied weapon (called W) (this is the prefer readied weapon if the end is near rule):
	if four times the health of the running AI is less than the permanent health of the running AI:
		increase the Weight by 4;

[An AI weapon selection rule (this is the randomise the weapon result rule):
	increase the Weight by a random number between 0 and 2.]

An AI weapon selection rule (this is the return the weapon weight rule):
	rule succeeds with result Weight;



Section - Action selection rules

[For every possible action, there MUST be a "first" rule adding it to the table.]

First AI action selection rule for an at-Act person (called P) (this is the consider attacking rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P attacking the chosen target;
	now the Action Weight entry is 5;

First AI action selection rule for a person (called P) (this is the consider concentrating rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P concentrating;
	now the Action Weight entry is 3;

First AI action selection rule for an at-React person (called P) (this is the consider dodging rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P dodging;
	now the Action Weight entry is 5;

First AI action selection rule for an at-React person (called P) (this is the consider parrying rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P parrying;
	now the Action Weight entry is 5;

First AI action selection rule for an at-React person (called P) (this is the consider rolling rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P rolling;
	now the Action Weight entry is 3;
	
First AI action selection rule for an at-React person (called P) (this is the consider blocking rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P blocking;
	now the Action Weight entry is 1;

First AI action selection rule for a person (called P) when the chosen weapon is not readied (this is the consider readying rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P readying the chosen weapon;
	now the Action Weight entry is 5;

Section - Calculating the chance to win

The chance to win rules is a rulebook producing a number.
The chance to win rulebook have a number called the chance-to-win.
The chance to win rulebook have a number called the best defence.

The AI action selection rulebook have a number called the chance-to-win.
The AI action selection rulebook have a number called the normalised chance-to-win.

First AI action selection rule (this is the calculate the chance to win rule):
	now the chance-to-win is the number produced by the chance to win rules;
	now the normalised chance-to-win is the chance-to-win;
	if the normalised chance-to-win is greater than 10:
		now the normalised chance-to-win is 10;
	if the normalised chance-to-win is less than 0:
		now the normalised chance-to-win is 0;

First chance to win rule (this is the CTW default rule):
	now the chance-to-win is 10.

Chance to win rule (this is the CTW melee bonus rule):
	increase the chance-to-win by the melee of the running AI;

Chance to win rule (this is the CTW defence bonus rule):
	decrease the chance-to-win by the defence of the running AI;
	
[Other rules are in the appropriate sections.]

Last chance to win rule (this is the account for the best defence and return the CTW rule):
	decrease the chance-to-win by the best defence;
	rule succeeds with result the chance-to-win;

Section - More action selection rules

An AI action selection rule for an at-Act person (called P) (this is the standard attack select rule):
	choose row with an Option of the action of the main actor attacking the chosen target in the Table of AI Action Options;
	if the normalised chance-to-win is 0:
		now the Action Weight entry is -100;
	decrease the Action Weight entry by 5;
	increase the Action Weight entry by the normalised chance-to-win;

An AI action selection rule for a person (called P) (this is the standard concentration select rule):
	choose row with an Option of the action of P concentrating in the Table of AI Action Options;
	increase the Action Weight entry by 5;
	decrease the Action Weight entry by the chance-to-win;
	if the concentration of P is 3:
		now the Action Weight entry is -100;

An AI action selection rule for an at-Act person (called P) (this is the concentration influences attacking rule):
	choose row with an Option of the action of the main actor attacking the chosen target in the Table of AI Action Options;
	increase the Action Weight entry by the concentration of the chosen target;
	if the concentration of the chosen target is 3:
		increase the Action Weight entry by 2;

An AI action selection rule for an at-React person (called P) (this is the standard defense against attack select rule):
	if the action name part of the main actor's action is the attacking action:
		let the attacker's weapon be a random readied weapon enclosed by the main actor;
		let the defendant's weapon be a random readied weapon enclosed by P;
		let dodgability be (2 + dodge bonus of the attacker's weapon);
		let parry rating be (2 + parry-against bonus of the attacker's weapon + parry-with bonus of the defendant's weapon);
		[ Adjust the weight of dodging ]
		choose row with an Option of the action of P dodging in the Table of AI Action Options;
		increase the Action Weight entry by dodgability;
		if dodgability is less than 1:
			decrease the Action Weight entry by 100;		
		if parry rating is greater than dodgability:
			decrease the Action Weight entry by 100;
		[ Adjust the weight of parrying ]
		choose row with an Option of the action of P parrying in the Table of AI Action Options;
		increase the Action Weight entry by parry rating;
		if parry rating is less than 1:
			decrease the Action Weight entry by 100;
		if dodgability is greater than parry rating:
			decrease the Action Weight entry by 100;
		choose row with an Option of the action of P rolling in the Table of AI Action Options;
		if defensive flow of P is less than 1:
			decrease Action Weight entry by 100;
		increase the Action Weight entry by dodgability;		
		if a random chance of 1 in 5 succeeds:
			increase Action Weight entry by (3 * (defensive flow of P));
		choose row with an Option of the action of P blocking in the Table of AI Action Options;
		if offensive flow of P is less than 1:
			decrease Action Weight entry by 100;
		if a random chance of 1 in 8 succeeds:
			increase Action Weight entry by (4 * (offensive flow of P)).

An AI action selection rule for a person (called P) when the chosen weapon is not readied (this is the don't attack or concentrate with an unreadied weapon rule):
	if P is at-Act:
		choose row with an Option of the action of P attacking the chosen target in the Table of AI Action Options;
		now the Action Weight entry is -1000;
	choose row with an Option of the action of P concentrating in the Table of AI Action Options;
	now the Action Weight entry is -100;





Volume - Plug-ins

Chapter - Reloadable Weapons (Standard Plug-in)

A weapon has a number called the maximum shots. The maximum shots of a weapon is usually 0.
A weapon has a number called the current shots. The current shots of a weapon is usually 0.
A weapon has a number called the maximum load time. The maximum load time of a weapon is usually 0. 
A weapon has a number called the current load time. The current load time of a weapon is usually 0.

Definition: a weapon is unloaded if its current shots is 0 and its maximum shots is greater than 0.
Definition: a weapon is waiting to be reloaded if its current shots is 0 and its maximum shots is greater than 0 and its maximum load time is greater than 0.

To reload is a verb.

A weapon has a text called the shots text. The shots text of a weapon is usually "shots".
A weapon has a verb called the reload verb. The reload verb of a weapon is usually the verb reload.
A weapon has a text called the out of ammo text. The out of ammo text of a weapon is usually "You pull the trigger, but nothing happens--you're out of ammo!".

[Maximum shots: number of rounds the weapon can be used when fully loaded. Current shots: number of shots still loaded. Maximum load time: number of rounds it takes to load the weapon. Current load time: number of rounds it still takes to load the weapon.]

[Set maximum shots to 0 for any weapon that shouldn't use these statistics. Set maximum load time to -1 in case a weapon cannot be reloaded. NEVER set maximum load time to 0 for a weapon with maximum shots not 0.]

[The basic system does NOT deal with ammo. Everyone is assumed to have infinite ammunition.]

After printing the name of a weapon (called item) when taking inventory (this is the show ammo in inventory rule):
	if the maximum shots of item is not 0:
		if the current shots of item is not 0:
			say " ([current shots of item] of [maximum shots of item] [shots text of item] left)";
		otherwise:
			if the maximum load time of item is not -1:
				say " (no [shots text of item] left; [current load time of item] round[if current load time of item is not 1]s[end if] [infinitive of reload verb of item])";
			otherwise:
				say " (no [shots text of item] left; cannot be [past participle of reload verb of item])".

After an actor hitting when the maximum shots of the global attacker weapon is greater than 0 (this is the decrease ammo rule):
	decrease the current shots of the global attacker weapon by 1;
	continue the action;

Check attacking (this is the cannot attack when out of ammo rule):
	let item be a random readied weapon enclosed by the player;
	if the maximum shots of item is greater than 0 and the current shots of item is not greater than 0:
		say "[out of ammo text of item][paragraph break]" instead.

Section - Reloading

Reloading is an action applying to one carried thing.

Understand "reload [held weapon]" as reloading.

Does the player mean reloading an unloaded readied weapon enclosed by the player: it is very likely.
Does the player mean reloading an unloaded weapon enclosed by the player: it is likely.

To use is a verb.

Check reloading when the maximum shots of the noun is 0 (this is the cannot reload weapons that use no ammo rule):
	take no time;
	say "[The noun] [do not use] ammunition." instead;
	
Check reloading when the maximum load time of the noun is -1 (this is the cannot reload unreloadable weapons rule):	
	take no time;
	say "[The noun] [cannot] be [past participle of reload verb of noun]." instead;
	
Check reloading when the current shots of the noun is the maximum shots of the noun (this is the cannot reload fully loaded weapons rule):	
	take no time;
	say "[The noun] [are] already loaded." instead.

Carry out an actor reloading a not readied weapon (this is the ready upon reloading rule):
	silently try readying the noun;

Carry out an actor reloading (this is the zero current ammo on reloading rule):
	now current shots of the noun is 0.
	
Carry out an actor reloading (this is the standard carry out reloading rule):
	decrease the current load time of the noun by 1;
	if the current load time of the noun is less than 1:
		now the current shots of the noun is the maximum shots of the noun;
		now the current load time of the noun is the maximum load time of the noun.

To finish is a verb. To start is a verb. To continue is a verb.

Report an actor reloading (this is the standard report reloading rule):
	if the current load time of the noun is the maximum load time of the noun:
		say "[The actor] [if the maximum load time of the noun is 1][adapt reload verb of the noun][otherwise][finish] [present participle of reload verb of the noun][end if] [the noun].";
	otherwise:
		say "[The actor] [if the current load time of the noun plus 1 is the maximum load time of the noun][start][otherwise][continue][end if] [present participle of reload verb of the noun] [the noun].".

Section - Reloading and choosing a weapon AI rules

[Weapons with high load times and limited ammo should not be given a penalty if they are already readied and full; some penalty if they are not readied; and a larger penalty if they are not readied and out of ammo.]

[ Move unloaded into the preample? ]
An AI weapon selection rule for an unloaded weapon (called W) (this is the do not choose an empty weapon that cannot be reloaded rule):
	if the maximum load time of W is -1:
		decrease the Weight by 1000;

An AI weapon selection rule for a weapon (called W) (this is the do not prefer weapons that need to be reloaded rule):
	if W is not readied or the current shots of W is 0:
		if the maximum shots of the W is not 0:
			if the maximum load time of the W is greater than 0:
				let m be the maximum shots of the W;
				let n be the maximum load time of the W;
				let x be m times 10;
				let y be m + n;
				now x is x divided by y; [Now x is roughly 10 times the fraction of time spent shooting in a shoot-reload cycle.]
				now x is 10 minus x; [Now x is roughly 10 times the fraction of time NOT spent shooting in a shoot-reload cycle.]
				if the current shots of the W is not 0: [This means that the weapon is (somewhat) loaded, but not ready. Using such a weapon can be done without ever reloading it: we ready it, shoot until empty, then ready a new weapon. This is AS IF we had to reload for two rounds in order to shoot as many shots as the weapon currently has. We now calculate this, and if it's better than the previous calculation, we substitute it for it.]
					now n is 2;
					now m is the current shots of the W;
					let z be m times 10;
					let y be m + n;
					now z is z divided by y;
					now z is 10 minus z;
					if z is less than x, now x is z;
				decrease the Weight by x;
	
[Example: a weapon that takes 1 turn to reload and gives you 1 shot gets a -5 penalty. A weapon that takes 3 turns to reload and gives you 1 shot gets a -8 penalty. A weapon that takes 1 turn to reload and gives you 5 shots gets a -2 penalty. ]

[Weapons with 0 ammo and a maximum load time of -1 should NOT be chosen.]

[ We will only load an unloaded weapon. ]
First AI action selection rule for a person (called P) when the chosen weapon is waiting to be reloaded (this is the consider reloading rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P reloading the chosen weapon;
	now the Action Weight entry is 5.

An AI action selection rule for a person (called P) when the chosen weapon is unloaded (this is the don't attack or concentrate with an unloaded weapon rule):
	if P is at-Act:
		choose row with an Option of the action of P attacking the chosen target in the Table of AI Action Options;
		now the Action Weight entry is -1000;
	choose row with an Option of the action of P concentrating in the Table of AI Action Options;
	now the Action Weight entry is -100;



Chapter - Tension (Standard Plug-in)

[Tension is a standard plug-in, since I believe almost any game will benefit from it. Tension is a kind of "drama manager" for combat: it makes sure that long periods in which no apparent progress is made--that is, in which no damage is done--are not experienced as boring, but rather as increasing the tension. The way it works is that every turn when no hit is scored, the tension (a number that varies) is increased by one. High tension gives everyone bonuses on the attack roll, thus increasing the likelihood that something will happen, and on the attack damage roll, thus increasing the stakes.

Tension also works as a check and balance on the combat system: if you have made it too hard for people to hit each other, tension will greatly alleviate this problem.]

The tension is a number that varies. The tension is usually 0.

Every turn (this is the standard increase or reset the tension rule):
	if the combat status is peace:
		now the tension is 0;
	otherwise:
		increase the tension by 1;
		if the tension is greater than 20:
			now the tension is 20.

This is the additional reset the tension rule:
	if combat status is peace:
		now tension is 0.
	
The additional reset the tension rule is listed before the business as usual rule in the combat round rules.	
	
An attack modifier rule (this is the standard tension attack modifier rule):
	let the tension bonus be the tension divided by 2;
	if the tension bonus is not 0:
		if the numbers boolean is true:
			say " + ", the tension bonus, " (tension)[run paragraph on]";
		increase the attack strength by the tension bonus;
		
A damage modifier rule (this is the standard tension damage modifier rule):
	let the bonus be the tension divided by 3;
	if the bonus is not 0:
		if the numbers boolean is true:
			say " + ", the bonus, " (tension)[run paragraph on]";
		increase the attack damage by the bonus.

An aftereffects rule when the total damage is greater than 0 (this is the standard reduce tension after hit rule):		
	now the tension is the tension minus 4;
	now the tension is the tension times 8;
	now the tension is the tension divided by 10;
	if the tension is less than 0:
		now the tension is 0;

[A hit must reduce the tension, but not necessarily completely down to 0. We want low tensions to be completely removed by a hit, but larger tension to be removed only partly. The standard rule leads to the following table:

0 -> 0
1 -> 0
2 -> 0
3 -> 0
4 -> 0
5 -> 0
6 -> 1
7 -> 2
8 -> 2
9 -> 3
10 -> 4
11 -> 4
12 -> 5
13 -> 6
14 -> 7
15 -> 7
16 -> 8
17 -> 9
18 -> 9
19 -> 10
20 -> 11

So if the current tension is 10, my attack will have an attack bonus of +5 and a damage bonus of +3. If I hit, the tension will drop to 4, will then be immediately raised to 5 by the every turn rule, and my opponent's attack the next round will be made at a +2 to attack and +1 to damage.

You can see that if the current tension is 10 and I am maximally concentrated, my attack is made at a gigantic +13 attack bonus, and will deliver a +7 damage bonus. ]
		
Chance to win rule (this is the CTW tension bonus rule):
	increase the chance-to-win by the tension divided by 2.

An AI action selection rule for an at-Act person (called P) (this is the tension influences attacking rule):
	choose row with an Option of the action of P attacking the chosen target in the Table of AI Action Options;
	increase the Action Weight entry by the tension divided by 4.



Inform ATTACK ends here.
