Kerkerkruip ATTACK by Victor Gijsbers begins here.

"Kerkerkruip ATTACK: Kerkerkruip's Advanced Turn-based TActical Combat Kit"

"GPL 3 licenced"

[Volumes Introduction, The main system, AI, and Standard Actions forked from Inform ATTACK Core]

Volume - Inform ATTACK Core Introduction

Section - Default texts

[ The author may want to change these texts, so they are collected here in one section. ]

[ Change these if you indicate in some other way how the player is acting, or if the Act/React cycle doesn't make sense for your situation. ]
The peaceful prompt is a text variable. The peaceful prompt is ">".
The action prompt is a text variable. The action prompt is "Act>".
The reaction prompt is a text variable. The reaction prompt is "React>".

Section - I6 variables

The meta flag is a truth state variable. The meta flag variable translates into I6 as "meta".
[The yourself text is a text variable. The yourself text variable translates into I6 as "YOURSELF__TX".]

[ Normally you can't set a person variable to no one, but you can like this! ]
The stand in for no one is a person variable. The stand in for no one variable translates into I6 as "nothing".

Section - Referring to the player

[ See manual section 2.1.3 ]

[ When we talk about the player in combat events, we do not want to say "yourself". ]
[When play begins (this is the change the yourself text rule):
	now the yourself text is "you".]

[ TODO: put back yourself where it is needed! ]

[UGLY. Can we do this better??]
[Does this automatically override the Standard Rules?]

The print protagonist internal rule translates into I6 as
	"PRINT_PROTAGONIST_INTERNAL_R" with
	"[We]" (A),
	"[us]" (B),
	"[our] former self" (C).

	


Volume - Inform ATTACK Core main system

Book - States

Section - Life and death

[ See manual section 2.2.2 ]

[ Many rules depend on whether someone is alive or not. You may not need a full health system, but it's easier just to put it all here. Ignore if you like. ]
A person has a number called health. The health of a person is usually 10.

[ Once health drops to zero, you are dead. This holds true for both the player and his enemies. ]
Definition: A person is alive rather than dead if its health is greater than 0.

[ This printing dead property is used to ensure that statements like "You were killed by the ogre" won't be broken if the ogre died at the same time. ]
The printing dead property is a truth state variable. The printing dead property is true.

To say no dead property (deprecated):
	now the printing dead property is false.

To say dead property (deprecated):
	now the printing dead property is true.
	
To say the name of (P - a person):
	now the printing dead property is false;
	say the P;
	now the printing dead property is true;

To say the names of (L - a list of people):
	now the printing dead property is false;
	say L with definite articles;
	now the printing dead property is true;

Understand "body/bodies" as a person.
Understand "body/bodies of" as a person.
Understand "dead/killed/corpse" as a person when the item described is dead.
Understand "alive/live/living" as a person when the item described is alive.
[Understand "[something related by equality]'s" as a person.] [Doesn't work, unfortunately.]

Section - Factions

[ See manual section 2.2.4 ]

[ Everyone should belong to a faction. You can add as many factions as you like! ]
Faction is a kind of value. The factions are friendly, passive and hostile.
The specification of a faction is "Factions are groups of people who are allied to each other, and may or may not be opposed to the other factions."

[ Now we define a relation between factions which indicates whether these factions will attack each other. ]
Hating relates various factions to various factions.
The verb to hate (he hates, they hate, he hated, it is hated, he is hating) implies the hating relation.

[ The opposing relationship makes it easier to see if two people are antagonists. ]
Opposing relates a person (called X) to a person (called Y) when the faction of X hates the faction of Y.
The verb to oppose (he opposes, they oppose, he opposed, it is opposed, he is opposing) implies the opposing relation.

The opposition test subject is a person that varies.
Definition: a person is opposer if it opposes opposition test subject. 

Friendly hates hostile. Hostile hates friendly.

A person has a faction. A person is usually passive.
The player is friendly.

[ We need a rulebook to decide whether people are going to battle each other in the current location. If not, we're not going to run all our ATTACK-machinery. ]
The hate rules are a rulebook.	

[ Depreciated - check the combat status instead ]
To decide whether hate is present (deprecated):
	follow the hate rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

Last hate rule (this is the standard hate rule):
	[ This is for speed. It is the most common case where we decide yes. ]
	if the player is a friendly alive person and friendly hates hostile and at least one hostile alive person is enclosed by the location:
		rule succeeds;
	repeat with X running through alive not passive persons enclosed by the location:
		repeat with Y running through alive persons enclosed by the location:
			if X opposes Y:
				rule succeeds;
	rule fails.

Section - Personal combat state

[ See manual section 2.3.1 ]

[ A person has one of three combat states: Inactive, Act and React.

Inactive: not doing anything in the current round.
Act: the one whose turn it is.
React: this person will be called on to react to the current action. ]

Combat state is a kind of value. The combat states are at-Inactive, at-Act and at-React.
The specification of a combat state is "Represents the state of a person in the current combat round. at-Inactive people are no involved, the at-Act person is the main actor, and the at-React person(s) are reacting to the main actor."

A person has a combat state. The combat state of a person is usually at-Inactive.

Section - Combat status

A combat round state is a kind of value. The combat round states are peace, combat, player choosing, reactions, concluding.
The specification of a combat round state is "Represents the state of the current combat round. This value kind is stored by the combat status global variable, which determines what happens when the combat round rulebook is run."

To update the combat status:
	follow the hate rules;
	if rule succeeded:
		now the combat status is combat;
	otherwise:
		now the combat status is peace;



Book - The combat round

The combat status is a combat round state variable. The combat status is peace.

[ The main actor is the person with the highest initiative, or the player if not engaged in combat. ]
The main actor is a person that varies.

The main actor's action is a stored action variable.

The player did something is a truth state variable.

[ The list of current participants, and a phrase to shift the next one. ]
The participants list is a list of people that varies.

To decide which person is the next participant:
	let P be entry 1 of the participants list;
	remove entry 1 from the participants list;
	decide on P;



Chapter - The combat round rules

The combat round rules is a rulebook.

The starting the combat round rules are a rulebook.

Table of Delayed Actions
Action speed	Action to take
a number	a stored action
with 10 blank rows

Section - Altering the turn sequence rules

[ We replace the beginning of the turn sequence rules with the combat round rules. We abide by the rulebook so that fast actions can pass a signal all the way up to make the turn sequence rules stop after the combat round rules. ]
This is the abide by the combat round rules rule:
	abide by the combat round rules.
The abide by the combat round rules rule is listed instead of the parse command rule in the turn sequence rules.
The generate action rule is not listed in the turn sequence rules.

[ The turn count should be incremented only if the player faced the command prompt. The time of day however will change regardless. ]
A turn sequence rule when the combat status is combat (this is the inactive players don't increment the turn count rule):
	if the player did something is true:
		now the player did something is false;
	otherwise:
		decrement the turn count.
The inactive players don't increment the turn count rule is listed after the advance time rule in the turn sequence rules.

Section - Non-combat rules

A first combat round rule (this is the update the combat status rule):
	if the combat status is peace or the combat status is combat:
		update the combat status;

A combat round rule when the combat status is peace (this is the business as usual rule):
	now the main actor is the player;
	now the command prompt is the peaceful prompt;
	carry out the taking a player action activity;


Section - Combat rules

A combat round rule when the combat status is combat (this is the determine the main actor rule):
	rank participants by initiative;
	now the main actor is the next participant;
	now the combat state of the main actor is at-Act;

A combat round rule when the combat status is combat (this is the consider the starting the combat round rules rule):
	follow the starting the combat round rules.

A combat round rule when the combat status is combat (this is the main actor chooses an action rule):
	if the main actor is the player:
		now the command prompt is the action prompt;
		now the combat status is player choosing;
	otherwise:
		run the AI rules for the main actor;
		now the combat status is reactions;

[ The player now gets to choose an action. This rule is also used for choosing reactions, as the next combat status is the same: reactions.
This rule will loop until an appropriate action is chosen. ]
A combat round rule when the combat status is player choosing (this is the player chooses an action or reaction rule):
	carry out the taking a player action activity;
	if take no time boolean is false:
		if the combat state of the player is at-Act:
			now the main actor's action is the current action;
		now the combat status is reactions;
		now the player did something is true;
		make no decision;

A combat round rule when the combat status is reactions (this is the reactors choose reactions rule):
	while the number of entries in the participants list is greater than 0:
		let P be the next participant;
		[ We must check that the participant is still alive as they could have been killed by an action that didn't wait for a reaction. ]
		if P is an alive at-React person:
			if P is the player:
				now the command prompt is the reaction prompt;
				now the combat status is player choosing;
				rule succeeds;
			otherwise:
				run the AI rules for P;
	now the combat status is concluding;

A combat round rule when the combat status is concluding (this is the run delayed actions rule):
	sort the Table of Delayed Actions in random order;
	sort the Table of Delayed Actions in Action speed order;
	repeat through the Table of Delayed Actions:
		try the Action to take entry;
		blank out the whole row;

A combat round rule when the combat status is concluding (this is the conclude the combat round rule):
	[ Reset everyone to Inactive so that they'll have the right state in the next turn whether it's peace or combat. ]
	repeat with X running through all alive persons enclosed by the location:
		now the combat state of X is at-Inactive;
	update the combat status;

[ And if we get this far then we actually get to run the every turn rules! ]



Chapter - Reporting the main action again

[ It is useful to be able to report an action twice. For example if you open a menu when the player is reacting, the main actor's action should be re-reported when the menu is closed. This turns out to be quick tricky. ]
Reporting again is a truth state variable.

The report an action again rule is listed before the before stage rule in the action-processing rules.
This is the report an action again rule:
	if reporting again is true:
		follow the descend to specific action-processing rule;
		stop the action;

The report an action again part two rule is listed before the investigate player's awareness before action rule in the specific action-processing rules.
This is the report an action again part two rule:
	if reporting again is true:
		follow the specific report rulebook;
		now reporting again is false;
		stop the action;

[ Our helper phrase to report again the main action ]
To report the main action again:
	if the player is at-React:
		say "[italic type][run paragraph on]";
		now the meta flag is false;
		now reporting again is true;
		try the main actor's action;
		say "[roman type][run paragraph on]";



Chapter - Taking a player action

[ Taking a player action will keep requesting commands until a successful (non-out of world) command is obtained. ]
Taking a player action is an activity.

For taking a player action:
	follow the take-a-player-action rules.

The take-a-player-action rules are an action name based rulebook.

The parse command rule is listed first in the take-a-player-action rules.
The generate action rule is listed last in the take-a-player-action rules.



Chapter - Initiative

[ Initiative determines whose turn it is, and if an action puts several people at-React, the order in which they will react.

By default the initiative of the main actor will be reset each round, so that the participants will take turns, though occassionally you will get two turns in a row because of the random initiative rule. ]

A person has a number called the initiative.

[ Must rename because of an I7 bug where the rulebook name conflicts with the property name in the sort call below. ]
The initiative update rules are a rulebook.

Section - Standard initiative rules

First initiative update rule (this is the no low initiative trap rule):
	repeat with X running through all alive persons enclosed by the location:				
		if the initiative of X is less than -2:
			now the initiative of X is -2.
		
Initiative update rule (this is the increase initiative every round rule):
	repeat with X running through all alive persons enclosed by the location:
		increase the initiative of X by 2.
	
Initiative update rule (this is the random initiative rule):
	repeat with X running through all alive persons enclosed by the location:				
		increase the initiative of X by a random number between 0 and 2.

A starting the combat round rule (this is the reset the initiative of the main actor rule):
	now the initiative of the main actor is 0;

Section - Rebuilding the participants list

To rank participants by initiative:
	follow the initiative update rules;
	[ Passive people neither act nor react, so are not placed in the list. ]
	now the participants list is the list of alive not passive persons enclosed by the location;
	[ Sort everyone by current initiative, but if multiple people have the same initiative then randomise their relative order. ]
	sort the participants list in random order;
	sort the participants list in reverse initiative order;



Chapter - Fast actions

[ See manual section 2.1.4 ]

[ Some actions should take no time; we wish to ensure that examining, smelling, and so on do not take a turn. This will allow the player to look around during combat, which is to be encouraged. The variable is checked in the player chooses an action or reaction rule. ]

[ There are two ways to set the take no time boolean: by declaring an action acting fast, or by hand, by saying "take no time". ]
The take no time boolean is a truth state that varies. The take no time boolean is false.

To take no time:
	now the take no time boolean is true.

To say take no time:
	take no time.
	
[ Before taking a player action we must reset the boolean. ]
Before taking a player action (this is the reset take no time boolean rule):
	now the take no time boolean is false.

[ Set the boolean when trying a fast action. ]
Rule for setting action variables when acting fast (this is the acting fast actions are fast rule):
	now the take no time boolean is true.

[ All out of world actions are fast. ]
After taking a player action (this is the all out of world actions are fast rule):
	if the meta flag is true:
		now the take no time boolean is true.

This is the acting fast rule: [Stops the turn sequence rules before we reach the every turn rules.]
	if the take no time boolean is true:
		rule succeeds.
The acting fast rule is listed before the every turn stage rule in the turn sequence rules.	

Section - Examining is fast

Examining something is acting fast.

Section - Taking inventory is fast

Taking inventory is acting fast.

Section - Smelling is fast

Smelling is acting fast.

Section - Smelling something is fast

Smelling something is acting fast.

Section - Looking is fast

Looking is acting fast.

[ Except for the first time we look... ]
Last startup rule (this is the looking at the beginning of the game is not acting fast rule):
	now the take no time boolean is false;

Section - Looking under is fast

Looking under something is acting fast.

Section - Listening is fast

Listening is acting fast.

Section - Listening to is fast

Listening to something is acting fast.

Section - Thinking is fast

Thinking is acting fast.
	
Section - Going is slow unindexed

[ The automatic look that happens after movement would make going fast, which we don't want! ]

The just moved boolean is a truth state that varies. The just moved boolean is false.

After going (this is the first make sure that going is not acting fast rule):
	now the just moved boolean is true;
	continue the action.

After looking (this is the second make sure that going is not acting fast rule):
	if the just moved boolean is true:	
		now the take no time boolean is false;
		now the just moved boolean is false;
	continue the action.

Section - Vaguely going

The block vaguely going rule is not listed in any rulebook.

Rule for supplying a missing noun while an actor going (this is the block vaguely going and take no time rule):
	take no time;
	say "You'll have to say which compass direction to go in." (A).

Section - Going nowhere

The can't go that way rule is not listed in any rulebook.

Check an actor going (this is the can't go that way and take no time rule):
	if the room gone to is nothing:
		take no time;
		if the door gone through is nothing:
			if the actor is the player:
				say "[We] [can't go] that way." (A);
			stop the action;
		if the actor is the player:
			say "[We] [can't], since [the door gone through] [lead] nowhere." (B);
		stop the action.

Section - Taking what is already carried

The can't take what's already taken rule is not listed in any rulebook.

Check an actor taking (this is the can't take what's already taken and take no time rule):
	if the actor is carrying the noun or the actor is wearing the noun:
		if the actor is the player:
			take no time;
			say "[We] already [have] [regarding the noun][those]." (A);
		stop the action.


Volume - AI

[ Each person has an activity which controls what they do. It is person based so that the person themself is fed back into it. ]
A person has a person based rulebook called the AI rules.
The Standard AI rules is a person based rulebook.
The AI rules of a person is usually the Standard AI rules.

[ The AI rules can run for both actors and reactors, so store whose AI rules are currently running. ]
The running AI is a person variable.

[ Who the AI is choses to target ]
The chosen target is a person variable.

To run the AI rules for (P - a person):
	follow AI rules of P for P;

[ Our standard AI works in three stages.
	First, we choose a person to attack--if we were to attack.
	In the second stage, we choose a weapon. (Found in the ATTACK extension)
	In the third stage, we decide whether to attack or whether to do something else--like concentrating, dodging, readying a weapon, and so on.
	
These choices are made by a series of rulebooks which alter the weighting of each potential target/weapon/action. ]

Section - Showing AI weightings unindexed

Show AI weightings is a truth state variable.

To #if debug and showing weightings: (- #ifdef DEBUG; if ( (+ Show AI weightings +) ) { -).
To #endif debug and showing weightings: (- } #endif; -).

Section - Switching weightings on and off - not for release

Switching weightings on is an action out of world. Understand "weightings on" as switching weightings on.
Carry out switching weightings on (this is the standard switching weightings on rule):
	now show AI weightings is true;
	say "You will now see the AI weightings.".

Switching weightings off is an action out of world. Understand "weightings off" as switching weightings off.
Carry out switching weightings off (this is the standard switching weightings off rule):
	now show AI weightings is false;
	say "You will no longer see the AI weightings.".

Chapter - The pressing relation

[ Pressing is mostly just a way to remember who had been attacking whom. The AI prefers continuing to attack the same person. It would be possible for someone to press multiple targets, but the phrase below will normally ensure that does not happen. ]
Pressing relates various people to various people. The verb to press (he presses, they press, he pressed, it is pressed, he is pressing) implies the pressing relation.

[ This phrase takes care of the pressing relationship ]
To have (A - a person) start pressing (B - a person):
	now A presses no one;
	now A presses B;



Chapter - Selecting a target

Table of AI Target Options
Person	Target weight
a person	a number
with 10 blank rows

The AI target selection rules are a person based rulebook producing a number.
The AI target selection rulebook has a number called the Weight.

A first Standard AI rule for a person (called P) (this is the select a target rule):
	[ If we already have a target (see the next rule) don't try to choose one again ]
	if the chosen target is not the stand in for no one:
		make no decision;
	let target count be the number of (alive people enclosed by the location) who are opposed by P;
	if P opposes P:
		decrease target count by 1;
	[ Don't consider further stages if we don't have a target. This won't happen unless you add new factions with uneven hate relationships. ]
	if target count is 0:
		rule succeeds;
	[ If there's only one potential target the choice is easy ]
	if target count is 1:
		now the chosen target is a random (alive people enclosed by the location) who is opposed by P;
		while chosen target is P:
			now the chosen target is a random (alive people enclosed by the location) who is opposed by P;
		make no decision;
	[ We have many potential targets to consider the AI target selection rules ]
	blank out the whole of the Table of AI Target Options;
	repeat with target running through (alive people enclosed by the location) who are opposed by P:
		unless target is P:
			let weight be the number produced by the AI target selection rules for target;
			choose a blank Row in the Table of AI Target Options;
			now the Person entry is target;
			now the Target weight entry is weight;
	sort the Table of AI Target Options in random order;
	sort the Table of AI Target Options in reverse Target weight order;
	#if debug and showing weightings;
	repeat through Table of AI Target Options:
		say "[Target weight entry]: [Person entry][line break]";
	#endif debug and showing weightings;
	choose row 1 in the Table of AI Target Options;
	now the chosen target is the Person entry;

[ Reactors can only choose the main actor. Unlist this rule if you want them to choose someone else. ]
A first Standard AI rule for an at-React person (called P) (this is the reactors target the main actor rule):
	now the chosen target is the main actor;

A first Standard AI rule for a person (called P) (this is the reset AI variables rule):
	now the running AI is P;
	now the chosen target is the stand in for no one;

An AI target selection rule for a passive person (this is the do not prefer passive targets rule):
	decrease the Weight by 5;

An AI target selection rule for a person (called target) (this is the prefer targets you press rule):
	if the running AI presses the target:
		increase the Weight by 3;

An AI target selection rule for a person (called target) (this is the prefer those who press you rule):
	if the target presses the running AI:
		increase the Weight by 1;

An AI target selection rule for the player (this is the prefer the player rule):
	increase the Weight by 1;

An AI target selection rule (this is the randomise the target result rule):
	increase the Weight by a random number between 0 and 4;

An AI target selection rule (this is the randomise the target result more rule):
	increase the Weight by a random number between 0 and 3;

A last AI target selection rule (this is the return the target weight rule):
	rule succeeds with result Weight;

Chapter - Selecting an action

Table of AI Action Options
Option	Action Weight
a stored action	a number
with 20 blank rows

The AI action selection rules are a person based rulebook.

A last Standard AI rule for a person (called P) (this is the select an action and do it rule):
	blank out the whole of the Table of AI Action Options;
	follow the AI action selection rules for P;
	sort the Table of AI Action Options in random order;
	sort the Table of AI Action Options in reverse Action Weight order;
	#if debug and showing weightings;
	repeat through Table of AI Action Options:
		say "[Action weight entry]: [Option entry][line break]";
	#endif debug and showing weightings;
	choose row one in the Table of AI Action Options;
	[ Don't forget to do it! ]
	try the Option entry;
	[ Store it for reactions ]
	if P is at-Act:
		now the main actor's action is the Option entry;

[ Each potential action should have a First rule which will add the action to the Table of AI Combat Options.  Subsequent rules can then modify the Action Weight.

Actions which are limited to the Actor/Reactor should specify an at-Act/at-React person in the rule preamble. ]

Last AI action selection rule (this is the randomise the action result rule):
	repeat through the Table of AI Action Options:
		increase the Action Weight entry by a random number between 0 and 5;



Volume - Standard actions

Chapter - Waiting

Carry out an actor waiting (this is the waiting lets someone else go first rule):
	if the combat state of the actor is at-Act:
		let Y be 0;
		repeat with X running through all alive not passive persons enclosed by the location:
			if X is not the actor and the initiative of X is greater than Y:
				now Y is the initiative of X;
		now the initiative of the actor is Y - 2;
		if concentration of the actor > 1:
			decrease initiative of the actor by 1;
		if concentration of the actor > 2:
			decrease initiative of the actor by 1.

[Last report an actor waiting:
	if the actor is not the player:
		say "[CAP-actor] wait[s].".]

First AI action selection rule for a person (called P) (this is the consider waiting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P waiting;
	now the Action Weight entry is -20;
	[ Could definitely do with some more logic here! ]

Volume - Damage

[We will make the simplification that no source of damage will consist of multiple materials. So something can deal "physical damage", and then the material might be silver or iron or whatever; but we don't need to define different damage types for all materials.]

Chapter - Materials

Material is a kind of value. A thing has a material. 

[A material has a number called the corrosion resistance. [Percentile chance, because we are working with some small probabilities here -- they come up every turn, and get large quickly.]]
Heat-behaviour is a kind of value. The heat-behaviours are burner and melter. [A material has a heat-behaviour.]

The materials are defined by the Table of Materials.

Table of Materials
material	material-adjective	destroying heat	heat-behaviour	corrosion resistance
other-material	"nondescript"	5	burner	950					

Chapter - Damage types

Damage type is a kind.

Physical damage is a damage type.
Heat damage is a damage type.
Acid damage is a damage type.
Necromantic damage is a damage type.
Divine damage is a damage type.

Damage-source is a thing that varies.
Damage-material is a material that varies.
No-source is a thing. The material of no-source is other-material.


Section - Grouping damage types

[We do it here so we don't forget to update when adding a damage type.]

To decide whether (type - a damage type) is physical-body-only: [Immune when ethereal.]
	if type is physical damage and damage-material is radiance, decide no;
	if type is necromantic damage, decide no;
	if type is divine damage, decide no;
	decide yes.

Chapter - Damage Mechanics

Section - Rulebooks and globals

[We need a whole bunch of rulebooks.

1. Add damage of specific types.
2. Remove damage of specific types. (Can't go below 0, which is why we must add first.
3. Multiply specific types as appropriate. (E.g., "double heat damage".)

We then count al specific damage types, and get the total damage.

4. Add general damage. -- This should be used sparingly or not at all, because damage ought to be of a specific type.
5. Remove general damage.
6. Multiply general damage.

Deal damage!]

The before damage rules are a rulebook. [Probably used sparingly.]
The add specific damage rules are a rulebook. [For rules pertaining to specific types of damage.]
The remove specific damage rules are a rulebook. [For rules pertaining to specific types of damage.]
The specific damage multiplier rules are a rulebook. [Idem, but rules that multiply the damage by a constant.]
The add general damage rules are a rulebook. [Next three rulebooks idem, but for general damage.]
The remove general damage rules are a rulebook.
The general damage multiplier rules are a rulebook.
The after damage rules are a rulebook. [For things like losing concentration.]

The victim is a person that varies.
The total damage is a number that varies.

Damage comment is a truth state that varies.
Damage silence is a truth state that varies.

Damage-by-hitting is a truth state that varies. [Set to true when dealing damage from an attack, so rules know that global attacker/defender and weapon properties are available.]

Section - The damage profile

[Every damage type has a number. When we wish to deal harm, we first add harm of the appropriate damage type(s), and then we inflict the damage.]

A damage type has a number called the harm.

Section - Resetting damage profile

[We don't need to invoke this ourselves, since it is automatically invoked when damage is inflicted.]

To reset the damage profile:
	repeat with q running through damage types:
		now the harm of q is 0.

Section - Dealing damage

[Invoke with phrases like "deal 2 points of fire damage".]

To deal (n - a number) points of (type - a damage type):
	increase the harm of type by n.

Section - Adding specific damage

[Effects that add damage to an already established damage profile should do so using this phrase. You can add damage normally, which means the damage is always added; or conditional on damage of that type already being dealt. Heat vulnerability -- which adds 2 damage when heat damage is being dealt -- should add 2 points of heat damage conditionally; while a curse that adds 2 heat damage to any damage you get from any source should add the damage normally.]

To add (n - a number) points of (type - a damage type) with reason (reason - some text), conditionally:
	if not conditionally or harm of type is greater than 0:
		increase harm of type by n;
		unless n is 0:
			unless damage silence is true:
				say " + [n] ([reason])[run paragraph on]";
				now damage comment is true.


Section - Removing specific damage

[Any effect that removes, say, 2 fire damage, should do so using this phrase. It makes sure that the damage type doesn't drop below 0. "Removed damage" returns the total damage done, if needed. The reason is shown between brackets.]

Removed damage is a number that varies.

To remove (n - a number) points of (type - a damage type) with reason (reason - some text):
	if harm of type is less than n:
		now n is harm of type;
	decrease harm of type by n;
	now removed damage is n;
	unless removed damage is 0:
		unless damage silence is true:
			say " - [removed damage] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Multiplying specific damage

[Any effect that, say, doubles fire damage should do so using this phrase.]

[We're using Glulx, so we should never meet the limit of the naturals -- about 2 billion -- even if we multiply by 100. But we do want to be in the situation that  x 50% x 200% = x 100%, which we cannot completely guarantuee without using reals. We could add the full fixed point math extension, but I'm happy with an easy hack here.]

A damage type has a number called the rounding error.

To multiply (type - a damage type) by (percentage - a number) percent with reason (reason - some text):
	if harm of type is not 0:
		let n be harm of type;
		now n is n times percentage;
		increase n by ((percentage times rounding error of type) divided by 100);
		let m be n divided by 100;
		let p be m times 100;
		now rounding error of type is (n - p);
		let change be (harm of type minus m);
		now harm of type is m;
		unless damage silence is true:
			if change is less than 0:
				now change is (0 - change);
				say " - [change] ([reason])[run paragraph on]";
			otherwise:
				say " + [change] ([reason])[run paragraph on]";
			now damage comment is true.

First specific damage multiplier rule (this is the reset rounding error rule):
	reset rounding errors.
	
To reset rounding errors:
	repeat with type running through damage types:
		now rounding error of type is 0.

[Example caculation. Heat damage is 7. Percentage is 50.
n = 7
n = 350
n = 350 + 0 = 350
m = 3
p = 300
rounding error = 50
heat damage = 3

Percentage is 200.
n = 3
n = 600
n = 600 + ((50 * 200)/100) = 700
m = 7
p = 700
rounding error = 0
heat damage = 7

As expected, since 0.5 x 2 = 1.]

[What we do not compensate for is this. Suppose I get 5 heat damage and 5 physical damage. Both are halved. I will then get 2 + 2 = 4 damage, rather than 5. We could add up remaining rounding errors and see that another point of damage ought to be dealt; but what type is it supposed to have, and how are we to indicate to the player what is happening? Better just ignore it. It's a feature, not a bug.]

Section - Adding total damage

To add (n - a number) points of general damage with reason (reason - some text):
	increase total damage by n;
	unless n is 0:
		unless damage silence is true:
			say " + [n] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Removing total damage

To remove (n - a number) points of general damage with reason (reason - some text):
	if total damage is less than n:
		now n is total damage;
	decrease total damage by n;
	now removed damage is n;
	unless removed damage is 0:
		unless damage silence is true:
			say " - [removed damage] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Multiplying total damage

The general damage rounding error is a number that varies.

To multiply general damage by (percentage - a number) percent with reason (reason - some text):
	if total damage is not 0:
		let n be total damage;
		now n is n times percentage;
		increase n by ((percentage times general damage rounding error) divided by 100);
		let m be n divided by 100;
		let p be m times 100;
		now general damage rounding error is (n - p);
		now total damage is m;
		unless damage silence is true:
			say " x [percentage]% ([reason])[run paragraph on]";
			now damage comment is true.

First general damage multiplier rule (this is the reset general rounding error rule):
	now general damage rounding error is 0.
	



Section - Inflicting damage

[Always call this when you're inflicting damage!]

To have (source - a thing) inflict damage on (guy - a person), silently:
	now the victim is guy;
	now damage-source is source;
	now damage-material is material of source;
	now damage comment is false;
	if silently:
		now damage silence is true;
	otherwise:
		now damage silence is false;
	now total damage is 0;
	follow the before damage rules; [this is where immunities should be taken care of]
	let n be 0;
	repeat with type running through damage types:
		increase n by harm of type;
	if n is 0:  [totally immune to our damage]
		now total damage is 0;
	otherwise:
		follow the add specific damage rules;
		follow the remove specific damage rules;	
		follow the specific damage multiplier rules;
		now total damage is 0;
		repeat with type running through damage types:
			unless harm of type is less than 0:
				increase total damage by harm of type;
		follow the add general damage rules;
		follow the remove general damage rules;	
		follow the general damage multiplier rules;
		if total damage is less than 0:
			now total damage is 0;
	unless silently:
		if damage comment is true or (damage-by-hitting is true and override-normal-attack-damage-rule is false):
			say " = [bold type]", total damage, " damage[roman type][run paragraph on]";
		otherwise:
			say " [bold type]", total damage, " damage[roman type][run paragraph on]";
	decrease health of the victim by total damage;
	follow the after damage rules;
	reset the damage profile;
	now damage-by-hitting is false.


Chapter - Testing Damage

Testdamaging is an action applying to nothing. Understand "testdamage" as testdamaging.

Carry out testdamaging:
	deal 2 points of physical damage;
	deal 3 points of divine damage;
	have no-source inflict damage on player.

[Volumes Introduction, The Main System, and Plug-ins forked from Inform ATTACK]

Volume - Inform ATTACK Introduction

Section - Saying combat numbers

[ See manual section 2.1.2 ]

[TODO: enable this for Kerkerkruip or eliminate all references to the numbers boolean]

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

Check switching the numbers off:
	say "The numerical representation of combat cannot be switched off in this game." instead.

Section - The After reporting rules

[ The reporting rules are supposed to have the last word, but in Inform ATTACK sometimes that's just not acceptable. The After reporting rules allow us to get another word in. Like the After rules, they are shared for all (non out of world) actions. ]
The after reporting rules are a rulebook.

A specific action-processing rule (this is the after reporting stage rule):
	if action in world is true:
		abide by the after reporting rules.

Section - New verbs

To lunge is a verb.
To miss is a verb.
To beat is a verb.
To deal is a verb.
To hit is a verb.
To kill is a verb.
To ready is a verb.
To fool is a verb.
To attempt is a verb.
To fail is a verb.
To concentrate is a verb.
To lose is a verb.
To parry is a verb.
To strike is a verb.
To dodge is a verb.
To roll is a verb.
To block is a verb.
To expose is a verb.
To stand is a verb.
To reload is a verb.
To use is a verb.
To finish is a verb.
To start is a verb.
To continue is a verb.
To relax is a verb.
To remain is a verb.

Volume - Inform ATTACK Main System

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
Setting action variables for hitting (this is the new reset hitting variables rule):
	now the global attacker is the actor;
	now the global defender is the noun;
	ready natural weapons;
	now the global attacker weapon is a random readied weapon enclosed by the actor;
	now the global defender weapon is a random readied weapon enclosed by the noun;
	have the actor start pressing the noun;
	now the attack strength is 0;
	now the attack damage is 0;
	now the total damage is 0;

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

[This roll creates a number between 1 and 10, but biased towards the middle values. This makes combat somewhat less random, which benefits the player and makes penalties and bonuses more important. However, we also allow a 10 to turn into a 20, so that everyone has a chance to hit everyone.

Instead of the standard 1d10 of ATTACK, we roll 1d7 + 1d4 - 1.]

The roller is a person that varies. [The guy who is rolling the dice. Used in the natural twenty rules.]
The special set attack strength rules are a rulebook. [Used for periapt of prophecy]

First attack modifier rule (this is the alternative attack roll rule):
	now roller is the global attacker;
	now the attack strength is 0;
	follow the special set attack strength rules;
	if attack strength is 0: [nothing intervened]
		now the attack strength is a roll of the dice;
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

The natural twenty chance is a number that varies.
The natural twenty rules are a rulebook.

To decide which number is a roll of the dice:
	let n be a random number between 1 and 7;
	let m be a random number between 0 and 3;
	let x be n + m;
	now natural twenty chance is 0;
	follow the natural twenty rules;
	if a random chance of natural twenty chance in 100 succeeds:
		now x is 20;
	decide on x.

[1: 1/28
2: 2/28
3: 3/28
4-7: 4/28
8: 3/28
9: 2/28
10: 1/28]

Section - Whether the attack hits

Whether the attack hit is a truth state variable.

To decide whether the attack hit:
	decide on whether the attack hit.
	
To decide whether the attack missed:
	decide on whether or not (whether the attack hit) is false.
	
The contact rules are a rulebook.

Carry out an actor hitting (this is the abide by the contact rules rule):
	now whether the attack hit is false;
	abide by the contact rules;
	now whether the attack hit is true;

First contact rule (this is the standard whether the attack hit rule):
	if the attack strength is greater than the defence of the global defender:
		if the numbers boolean is true:
			say "[the global attacker] [beat] [regarding the global defender][possessive] defence rating of ", the defence of the global defender, ".";
	otherwise:
		if the numbers boolean is true:
			say "[the global attacker] [do] not overcome [regarding the global defender][possessive] defence rating of ", the defence of the global defender, "[roman type].";
		rule fails;



Section - Dealing damage

Override-normal-attack-damage-rule is a truth state that varies. Override-normal-attack-damage-rule is false.

Carry out an actor hitting (this is the set up attack damage rule):
	if override-normal-attack-damage-rule is false:
		unless damage die of the global attacker weapon is less than 1:
			now the attack damage is a random number between 1 and the damage die of the global attacker weapon;
		increase the attack damage by weapon damage bonus of the global attacker weapon; [1d(damage die) + WDB]
		if the numbers boolean is true:
			say "[roman type][The global attacker] [deal] ", the attack damage, "[run paragraph on]";
		now harm of physical damage is attack damage;
		now damage-by-hitting is true;	
		have global attacker weapon inflict damage on the global defender;  [The crucial line.]
		if the total damage is less than 1:
			say ", allowing [the global defender] to escape unscathed.[run paragraph on]";
		otherwise:
			[non-fatal]
			if the health of the global defender is greater than 0:
				say ", wounding [the global defender] to ", health of the global defender, " health.[run paragraph on]" ;
			[fatal]
			otherwise:
				say ", killing [the name of the global defender].[run paragraph on]";
		say "[roman type][paragraph break]";
	otherwise:
		now override-normal-attack-damage-rule is false.


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

Section - Weapon interactions during aftereffects

To decide what object is whatever (item - a thing) struck:
	if the attack hit:
		if item is the global attacker weapon, decide on the global defender;
		if item is the global defender, decide on the global attacker weapon;
		[what about clothing?]
		decide on nothing;
	if item is the global attacker weapon:
		if the global defender is at parry, decide on the global defender weapon;
		if the global defender is at-block, decide on a random shield worn by the global defender;
		decide on nothing;
	[The next line makes this phrase asymmetrical -
	 the global attacker weapon can hit weapons and shields if it is projectile, but they can't hit it]
	if the global attacker weapon is projectile, decide on nothing;
	if item is the global defender weapon and the global defender is at parry, decide on the global attacker weapon;
	if item is a shield worn by the global defender and the global defender is at-block, decide on the global attacker weapon;
	decide on nothing.

[This is for Israfel's fires, lion's shield, etc]
To decide whether (guy - a person) came too close to (item - a thing):
	unless guy is the global attacker, no;
	if the global attacker weapon is projectile, no;
	if the global attacker weapon is tethered and the global attacker weapon is not a natural weapon, no;
	if item is the global defender, yes;
	if item is not proximity-triggered, no;
	decide on whether or not the global defender encloses item;
	
Definition: a thing is proximity-triggered: no. [maybe there's a better name for this, and if so, maybe it can be applied to parrying weapons and stuff]

Definition: a shield is proximity-triggered:
	unless the global defender wears it, no;
	decide on whether or not the global defender is at-block;
	
Definition: clothing is proximity-triggered if it is worn;

Section - Killing

[Most killing reports are defined with the individual monster's code]

Report the player hitting a dead pc (this is the report player suicide rule):
	say "Your attack ends your own life.";
	rule succeeds;

Last after reporting an actor hitting (this is the killing after attack rule):
	if the global defender is dead:
		have an event of the global attacker killing the global defender.

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

An add specific damage rule (this is the new offensive flow damage modifier rule):
	if damage-by-hitting is true:
		let bonus be offensive flow of the global attacker;
		add bonus points of physical damage with reason "offensive flow".

An aftereffects rule (this is the lose flow when hit rule):
	if the total damage is greater than 0 and the global defender is alive:
		now offensive flow of global defender is 0;
		now defensive flow of global defender is 0.

After an actor hitting (this is the lose flow after attacking rule):
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

First check readying (this is the do not ready weapons on the ground rule):
	unless the player encloses the noun:
		take no time;
		say "[We] will [have] to get [the noun] first." instead.

Check readying (this is the cannot ready what is already readied rule):
	if the noun is readied and the noun is enclosed by the player:
		take no time;
		say "[We] [are] already wielding [the noun]." instead.

Check readying (this is the cannot ready what is not a weapon rule):
	if the noun is not a weapon:
		take no time;
		say "[We] [can] only ready weapons." instead.

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

Section - Understanding

The block attacking rule is not listed in any rulebook.

Understand "a [thing]" as attacking.

Does the player mean attacking a dead person:
	it is unlikely.
Does the player mean attacking a person opposed by the player:
	it is very likely.

Section - Only attack living persons

Check attacking when the noun is not a person (this is the only attack persons rule):
	take no time;
	say "Things are not [our] enemies." instead.

Check attacking a dead person (this is the only attack the living rule):
	take no time;	
	say "[The noun] [are] already dead." instead.

Section - Don't attack yourself

Check attacking the player (this is the alternative do not kill yourself rule):
	if the noun is the player and Nomos bonus is false:
		take no time;
		say "[We] [are] not that desperate!" instead.

Section - Attacking when the combat status is peace (Nomos, slaves)

Attacking-from-peace is a truth state that varies. Attacking-from-peace is false.

First check attacking:
	now attacking-from-peace is false. [If it didn't get reset for some reason.]

A check attacking rule (this is the alternative do not attack friendly people rule):
	if the faction of the player does not hate the faction of the noun:
		if the faction of the noun is player-enslaved:
			now the noun is betrayed;
			if combat status is peace:
				now attacking-from-peace is true;
			now faction of the noun is hostile;
		otherwise:
			if the Nomos bonus is true:
				unless the noun is the player:
					if combat status is peace:
						now attacking-from-peace is true;
					now faction of the noun is hostile;
			otherwise:
				take no time;
				say "[The noun] [are] [our] friend, not [our] enemy!" instead.
				
Last report attacking:
	if attacking-from-peace is true:
		now attacking-from-peace is false;
		now combat state of the noun is at-React;
		run the AI rules for the noun;
		now the combat status is concluding;
		follow the run delayed actions rule;
		follow the conclude the combat round rule.

[As I write this, this is only possible when the player attacks himself when commanded by Nomos.]
First carry out attacking the player when the combat status is peace (this is the attack self when not in combat rule):
	try the actor hitting the noun instead;

Section - Don't attack as a reaction

Check attacking when the player is at-React (this is the cannot attack as reaction rule):
	take no time;
	say "Attacking is an action, not a reaction." instead.

Section - Carry out and report

Carry out an actor attacking (this is the standard carry out an actor attacking rule):
	choose a blank row in the Table of Delayed Actions;
	now the Action speed entry is 10;
	now the Action to take entry is the action of the actor hitting the noun;
	now the combat state of the noun is at-React;

Report an npc attacking (this is the standard report an actor attacking rule):
	say "[The actor] [lunge] towards [the noun].[paragraph break]".

Chapter - Concentrating

Section - The Concentrating action

Concentrating is an action applying to nothing. Understand "concentrate" and "c" and "co" as concentrating.

A person has a number called concentration. The concentration of a person is usually 0.

Check concentrating when the concentration of the player is 3 (this is the do not concentrate when at maximum rule):
	take no time;
	say "[We] [are] already maximally concentrated." instead;

Check concentrating (this is the do not concentrate outside of combat rule):
	if combat status is peace:
		say "[We] [can] only concentrate in a combat situation." instead.

First carry out an actor concentrating (this is the standard concentrating improves initiative rule):
	increase the initiative of the actor by the concentration of the actor.
		
Carry out an actor concentrating (this is the standard carry out concentrating rule):	
	increase the concentration of the actor by 1;
	if the concentration of the actor is greater than 3:
		now the concentration of the actor is 3;
	
Report an actor concentrating (this is the standard concentrating prose rule):
	say "[The actor] [concentrate], and [are]";
	if the concentration of the actor is:
		-- 1:
			say " now mildly concentrated.";
		-- 2:
			say " now quite concentrated.";
		-- 3:
			say " now maximally concentrated.";

Section - Concentration improves attack strength

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

Section - Concentration improves attack damage for normal-concentrating people

A person can be normal-concentrating or abnormal-concentrating. A person is usually normal-concentrating.

An add specific damage rule (this is the new concentration damage modifier rule):
	if damage-by-hitting is true:
		if global attacker is normal-concentrating:
			if the concentration of the global attacker is greater than 1:
				let the first dummy be 0;
				if the concentration of the global attacker is 2, now the first dummy is 2;
				if the concentration of the global attacker is 3, now the first dummy is 4;
				add first dummy points of physical damage with reason "concentration".

Section - Losing Concentration

The remain concentrated chance is a number that varies.
The remain concentrated rules are a rulebook.

An aftereffects rule (this is the alternative lose concentration when hit rule):
	if the total damage is greater than 0 and the global defender is alive and the concentration of the global defender is not 0:
		now the remain concentrated chance is 0;
		follow the remain concentrated rules;
		unless a random chance of remain concentrated chance in 100 succeeds:
			let the global defender lose concentration;
		otherwise:
			say "[The global defender] [bold type][remain] concentrated[roman type].";.

A remain concentrated rule (this is the damage penalty for remaining concentrated rule):
	decrease remain concentrated chance by total damage.

After an actor hitting (this is the lose concentration after attacking rule):
	now the concentration of the global attacker is 0;
	continue the action;

To let (the defender - a person) lose concentration:
	if the concentration of the defender > 0:
		now the concentration of the defender is 0;
		follow the lose concentration prose rules for the defender;

The lose concentration prose rules are a person based rulebook.

Last lose concentration prose rule for a person (called P) (this is the standard lose concentration prose rule):
	say "[The P] [lose] [bold type]concentration[roman type]!";

Carry out an actor going (this is the lose concentration on going rule):
	now the concentration of the actor is 0.

This is the new everyone loses concentration when combat status is peace rule:
	if combat status is peace:
		if concentration of the player is not 0:
			now concentration of the player is 0;
			say "[We] [relax] [our] concentration.";
		now world test subject is the player;
		repeat with guy running through alive worldsharer people:
			now concentration of guy is 0.
			
new everyone loses concentration when combat status is peace rule is listed before the business as usual rule in the combat round rules.

Section - Concentration improves AI chance to win

Chance to win rule (this is the CTW concentration bonus rule):
	if the concentration of the running AI is:
		-- 1:
			increase the chance-to-win by 2;
		-- 2:
			increase the chance-to-win by 4;
		-- 3:
			increase the chance-to-win by 8;
	
Chapter - Parrying

Parrying is an action applying to nothing. Understand "parry" and "p" and "pa" as parrying.

A person can be at parry. A person is usually not at parry.

Check parrying (this is the cannot parry when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [parry], but [there] [are] no attack." instead.

[Carry out an actor parrying (this is the parrying changes initiative rule):
	increase the initiative of the actor by 1.]
	
Carry out an actor parrying (this is the standard carry out parrying rule):	
	now the actor is at parry.

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
		now offensive flow of the global defender is (offensive flow of the global defender + defensive flow of the global defender);
		now defensive flow of the global defender is 0;
		up the offensive flow of global defender.

Chapter - Dodging

Dodging is an action applying to nothing. Understand "dodge" and "do" as dodging.

A person can be at dodge. A person is usually not at dodge.

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
		now defensive flow of the global defender is (offensive flow of the global defender + defensive flow of the global defender);
		now offensive flow of the global defender is 0;
		up the defensive flow of global defender.

Section - No More Rolling

Understand "roll" as a mistake ("Rolling is no longer an available reaction in Kerkerkruip.").

Section - Blocking

Blocking is an action applying to nothing. Understand "block" as blocking.

A person can be at-block. A person is usually not at-block.

[In Kerkerkruip, blocking is only available if you are wearing a shield!]

Check blocking (this is the cannot block when not wearing a shield rule):
	if the player is not wearing a shield:
		take no time;
		say "[We] [cannot block] when [we]['re not] wearing a shield." instead.

Check blocking (this is the cannot block when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [block], but [there] [are] no attack." instead.

Carry out an actor blocking:
	now the actor is at-block.

Report an actor blocking (this is the standard block prose rule):
	say "[The actor] [attempt] to block the incoming attack.".
	
[No special defense bonus. Kerkerkruip adds a shield-related rule here.]	

Last after reporting an actor hitting (this is the no longer at block after the attack rule):
	now the global defender is not at-block;
	continue the action;

An AI action selection rule for an at-React person (called P) (this is the AI block without shields rule):
	choose row with an Option of the action of P blocking in the Table of AI Action Options;
	if P does not wear a shield:
		decrease Action Weight entry by 1000.

An attack modifier rule (this is the block defence bonus rule):
	if the global defender is at-block:
		if the global defender encloses a worn shield:
			decrease the attack strength by 2;
			if the numbers boolean is true:
				say " - 2 (blocking)[run paragraph on]";
			let item be a random shield worn by the global defender;
			let n be block bonus of item;
			decrease the attack strength by n;
			if the numbers boolean is true:
				if n is greater than 0:
					say " - ", n, " (block bonus)[run paragraph on]";
				if n is less than 0:
					now n is (0 - n);
					say " + ", n, " (block penalty)[run paragraph on]";

Section - Expose

Exposing is an action applying to nothing. Understand "expose" as exposing.

A person can be at-expose. A person is usually not at-expose.

Check exposing (this is the cannot expose when not reacting rule):
	if the combat state of the player is not at-React:
		take no time;
		say "[We] [expose] [ourselves], but [there] [are] no attack." instead.

Carry out an actor exposing:
	now the actor is at-expose.

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

[Since there's always a small chance of rolling 20, attacking is never useless.]

An AI action selection rule for an at-Act person (called P) (this is the new standard attack select rule):
	choose row with an Option of the action of the main actor attacking the chosen target in the Table of AI Action Options;
	if the normalised chance-to-win is 0:
		now the Action Weight entry is -20;
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
		choose row with an Option of the action of P blocking in the Table of AI Action Options;
		[TODO: only do this if P wears a shield?]
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
		
An add general damage rule (this is the new tension damage modifier rule):
	if damage-by-hitting is true:
		let the bonus be the tension divided by 3;
		if the bonus is not 0:
			add bonus points of general damage with reason "tension".

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




Volume - Kerkerkruip Additions

		
Section - No wearing what you don't have

First check wearing (this is the do not wear things on the ground rule):
	unless the player encloses the noun:
		take no time;
		say "[We] will [have] to get [the noun] first." instead.
		
Section - No reading what you don't have

First check reading (this is the do not read things on the ground rule):
	unless the player encloses the noun:
		unless the noun is a tome:
			take no time;
			say "[We] will [have] to get [the noun] first." instead.
		
Section - No snorting what you don't have

First check snorting (this is the do not snort things on the ground rule):
	unless the player encloses the noun:
		take no time;
		say "[We] will [have] to get [the noun] first." instead.
						

Section - Using question prompts

[A combat round rule when the combat status is peace (this is the not quite business as usual rule):
	now the main actor is the player;
	unless closed question mode is true:
		now the command prompt is the peaceful prompt;
	carry out the taking a player action activity;

The not quite business as usual rule is listed instead of the business as usual rule in the combat round rules.]

Before taking a player action:
	if closed question mode is true and menu question mode is true:
		now the command prompt is the saved question prompt;
		if repeat-question is true:
			ask a closed question, in menu mode.

Section - Other stuff

Understand "creature" as a person.

[This could be fun, but it needs to be an option that can be set to: none, short, medium, long.]
[The non-standard attack roll rule is listed instead of the standard attack roll rule in the basic attack roll rules.

This is the non-standard attack roll rule:
	if the numbers boolean is true, say "[italic type]Rolling [run paragraph on]";
	wait 500 milliseconds before continuing, strictly;
	change the to-hit roll to a random number between 1 and 10;
	if the numbers boolean is true, say the to-hit roll, "[run paragraph on]";
	wait 500 milliseconds before continuing, strictly;.
]

Chapter - Faculties

[Up to version 5, Kerkerkruip used Perception, Dexterity and Willpower. From version 6 on, we will use Body, Mind and Spirit instead. These will also be much more interesting.]

A person has a number called body score. The body score of a person is usually 5.
A person has a number called mind score. The mind score of a person is usually 5.
A person has a number called spirit score. The spirit score of a person is usually 5.

A faculty is a kind of object. body, mind and spirit are faculties.

Section - Faculty bonuses

The body bonus rules are a rulebook.
The mind bonus rules are a rulebook.
The spirit bonus rules are a rulebook.
The faculty bonus rules are a rulebook.

To process (RL - a rule): (- FollowRulebook({RL}, 0, true); -).

Faculty bonus score is a number that varies.

To decide which number is the body bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	process the body bonus rules;
	say "[run paragraph on]";	
	process the faculty bonus rules;
	say "[run paragraph on]";
	decide on faculty bonus score.
	
To decide which number is the final body of (guy - a person):
	let n be body score of the guy plus body bonus of the guy;
	say "[run paragraph on]";	
	decide on n.

To decide which number is the mind bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	process the mind bonus rules;
	say "[run paragraph on]";
	process the faculty bonus rules;
	say "[run paragraph on]";	
	decide on faculty bonus score.
	
To decide which number is the final mind of (guy - a person):
	let n be mind score of the guy plus mind bonus of the guy;
	say "[run paragraph on]";	
	decide on n.
	
To decide which number is the spirit bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	process the spirit bonus rules;
	say "[run paragraph on]";	
	process the faculty bonus rules;
	say "[run paragraph on]";
	decide on faculty bonus score.
	
To decide which number is the final spirit of (guy - a person):
	let n be spirit score of the guy plus spirit bonus of the guy;
	say "[run paragraph on]";	
	decide on n.

Section - Testing faculties

The tested faculty is a faculty that varies.

To test the body of (guy - a person) against (n - a number) described as (target description - some text):
	now tested faculty is body;
	test the faculty of guy against n described as the target description.

To test the mind of (guy - a person) against (n - a number) described as (target description - some text):
	now tested faculty is mind;
	test the faculty of guy against n described as the target description.

To test the spirit of (guy - a person) against (n - a number) described as (target description - some text):
	now tested faculty is spirit;
	test the faculty of guy against n described as the target description.

To test the faculty of (guy - a person) against (n - a number) described as (target description - some text):
	now test subject is guy;
	now roller is the guy;
	now test score is a roll of the dice;
	say "[The guy] [roll] ", test score, " + [run paragraph on]";
	if tested faculty is body:
		let k be final body of the guy;
		say "[k] (body)[run paragraph on]";
		increase test score by k;
	if tested faculty is mind:
		let k be final mind of guy;
		say "[k] (mind)[run paragraph on]";
		increase test score by k;
	if tested faculty is spirit:
		let k be final spirit of guy;
		say "[k] (spirit)[run paragraph on]";
		increase test score by k;		
	say " = [test score] against a target number of ", n, "[unless the target description is empty] ([the target description])[end unless][run paragraph on]";
	if test score is less than n:
		say ", failing the [tested faculty] check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the [tested faculty] check.[run paragraph on]";
		now test result is true.

To test the body of (guy - a person) against (n - a number):
	now tested faculty is body;
	test the faculty of guy against n described as "".

To test the mind of (guy - a person) against (n - a number):
	now tested faculty is mind;
	test the faculty of guy against n described as "".

To test the spirit of (guy - a person) against (n - a number):
	now tested faculty is spirit;
	test the faculty of guy against n described as "".

To test the faculty of (guy - a person) against (n - a number):
	test the faculty of guy against n described as "":

Section - Faculty increase

Unallocated faculty is a number that varies. Unallocated faculty is 0.

[The grant routine is called by power transferral in Kerkerkruip Systems.]

To grant a faculty increase of (n - a number):
	increase unallocated faculty by n;
	say "[We] [can] now increase one of [our] faculties by [bold type][unallocated faculty] point[if unallocated faculty is not 1]s[end if][roman type]. (Type 'body', 'mind', or 'spirit', depending on [our] choice.) [run paragraph on]".
	
Last status skill rule (this is the unallocated faculty rule):
	if unallocated faculty is greater than 0:
		say "[italic type][We] [can] increase one of [our] faculties by [bold type][unallocated faculty] point[if unallocated faculty is not 1]s[end if][italic type]. (Type 'body', 'mind', or 'spirit', depending on [our] choice. This action takes no time.)[roman type][line break][run paragraph on]".

Increasing body is an action out of world. Understand "body" as increasing body.
Increasing mind is an action out of world. Understand "mind" as increasing mind.
Increasing spirit is an action out of world. Understand "spirit" as increasing spirit.

Check increasing body:
	if unallocated faculty is less than 1:
		say "[We] [do not have] any points left!" instead.

Check increasing mind:
	if unallocated faculty is less than 1:
		say "[We] [do not have] any points left!" instead.

Check increasing spirit:
	if unallocated faculty is less than 1:
		say "[We] [do not have] any points left!" instead.

[Okay, this is where I draw the line. My obsession with adaptive text may be extreme, but this would be ridiculous to implement as adaptive - Mike]

Carry out increasing body:
	increase body score of the player by unallocated faculty;
	say "[Our] basic body increases to [body score of the player]; [our] effective body is now [run paragraph on][final body of the player].[line break][paragraph break]";
	now unallocated faculty is 0.

Carry out increasing mind:
	increase mind score of the player by unallocated faculty;
	say "[Our] basic mind increases to [mind score of the player][run paragraph on][if mind score of player is not final mind of player]; [our] effective mind is now [run paragraph on][final mind of the player][end if].[line break][paragraph break]";
	now unallocated faculty is 0.
	
Carry out increasing spirit:
	increase spirit score of the player by unallocated faculty;
	say "[Our] basic spirit increases to [spirit score of the player]; [our] effective spirit is now [run paragraph on][final spirit of the player].[line break][paragraph break]";
	now unallocated faculty is 0.

Section - Direct benefits of faculties

An attack modifier rule (this is the body defence bonus rule):
	let n be the final body of the global defender;
	if a random chance of n in 50 succeeds:
		say " - 3 (random body bonus)[run paragraph on]";
		decrease the attack strength by 3.
	
A remain concentrated rule (this is the mind bonus for remaining concentrated rule):
	increase remain concentrated chance by 2 times final mind of the global defender.

Initiative update rule (this is the increase initiative based on spirit rule):
	repeat with X running through all alive persons enclosed by the location:
		let n be the final spirit of X;
		if a random chance of n in 40 succeeds:
			increase the initiative of X by a random number between 1 and 3.

[Critical hit chance is determined by the lowest of [our] three attributes.]
A natural twenty rule (this is the faculties natural twenty rule):
	let n be final body of the roller;
	let o be final mind of the roller;
	let p be final spirit of the roller;
	if o is less than n:
		now n is o;
	if p is less than n:
		now n is p;
	increase natural twenty chance by n.







Section - Inherent damage modifier 

A person has a number called the inherent damage modifier. The inherent damage modifier of a person is usually 0.

[ TODO: Should this be a standard part of ATTACK? ]
An add specific damage rule (this is the inherent damage modifier rule):
	if damage-by-hitting is true:
		if the inherent damage modifier of the global attacker is not 0:
			add (inherent damage modifier of the global attacker) points of physical damage with reason "inherent bonus".


Section - Weapon descriptions

Last report examining a weapon (this is the extra weapon info rule):
	say "[italic type]Combat statistics: 1d[damage die of the noun] + [weapon damage bonus of the noun] damage; [if weapon attack bonus of the noun is less than 0]-[otherwise]+[end if][absolute value of weapon attack bonus of the noun to the nearest whole number] attack modifier[if the noun is ranged]; ranged[end if][parry and dodge info of the noun][if the noun is silver]; good against undead and demons[end if][special weapon info of the noun][roman type].[run paragraph on][line break][paragraph break]"
			
To say parry and dodge info of (item - a weapon):
	say "; the wielder gets a [parry-with bonus of item] bonus when parrying with [regarding the item][them]; others get a [parry-against bonus of item] bonus when parrying and a [dodge bonus of item] bonus when dodging against [them][run paragraph on]".

A weapon has some text called the special weapon info. The special weapon info of a weapon is usually "".


Section - Cleaning the Table of Delayed Actions

To clean the table of delayed actions for (guy - a person):
	repeat through the table of delayed actions:
		let this action be the action to take entry;
		if the actor part of this action is the guy or the noun part of this action is the guy:
			blank out the whole row.

A killing rule (this is the reset killed-guy rule):
	follow the sudden combat reset rules for killed-guy.




Kerkerkruip ATTACK ends here.
