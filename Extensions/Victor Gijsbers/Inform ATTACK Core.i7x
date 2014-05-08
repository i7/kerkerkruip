Version 5/140220 of Inform ATTACK Core by Victor Gijsbers begins here.

"The core of the Inform ATTACK system, but without the combat specific code. Think of it as the Advanced Turn-based TActical *Conflict* Kit instead."

"GPL 3 licenced"



Volume - Introduction

Section - Authorial modesty (for use with Inform ATTACK by Victor Gijsbers)

[ If we're using the full Inform ATTACK extension then we don't need to be listed in the credits. ]
Use authorial modesty.

Section - Default texts

[ The author may want to change these texts, so they are collected here in one section. ]

[ Change these if you indicate in some other way how the player is acting, or if the Act/React cycle doesn't make sense for your situation. ]
The peaceful prompt is a text variable. The peaceful prompt is ">".
The action prompt is a text variable. The action prompt is "Act>".
The reaction prompt is a text variable. The reaction prompt is "React>".

Section - I6 variables

The meta flag is a truth state variable. The meta flag variable translates into I6 as "meta".
The yourself text is a text variable. The yourself text variable translates into I6 as "YOURSELF__TX".

[ Normally you can't set a person variable to no one, but you can like this! ]
The stand in for no one is a person variable. The stand in for no one variable translates into I6 as "nothing".

Section - Referring to the player

[ See manual section 2.1.3 ]

[ When we talk about the player in combat events, we do not want to say "yourself". ]
When play begins (this is the change the yourself text rule):
	now the yourself text is "you".

[ TODO: put back yourself where it is needed! ]
	


Volume - The main system

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

Before printing the name of a dead person (called body) (this is the improper print dead property rule):
	if the printing dead property is true and the body is improper-named:
		say "dead [run paragraph on]".

After printing the name of a dead person (called body) (this is the proper print dead property rule):
	if the printing dead property is true and the body is proper-named:
		say "'s [if body is plural-named]bodies[otherwise]body[end if]".

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
Action speed	Action
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
		try the Action entry;
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
	issue library message going action number 7.

Section - Going nowhere

The can't go that way rule is not listed in any rulebook.

Check an actor going (this is the can't go that way and take no time rule):
	if the room gone to is nothing:
		take no time;
		if the door gone through is nothing, stop the action with library
			message going action number 2 for the room gone from;
		stop the action with library message going action number 6 for the door gone through;

Section - Taking what is already carried

The can't take what's already taken rule is not listed in any rulebook.

Check an actor taking (this is the can't take what's already taken and take no time rule):
	if the actor is carrying the noun:
		take no time;
		stop the action with library message taking action number 5 for the noun;
	if the actor is wearing the noun:
		take no time;
		stop the action with library message taking action number 5 for the noun.



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



Inform ATTACK Core ends here.