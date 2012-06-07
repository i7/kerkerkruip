Kerkerkruip ATTACK Additions by Victor Gijsbers begins here.

Use authorial modesty.

Section - Killing

An aftereffects rule (this is the killing after attack rule):
	if the global defender is killed:
		have an event of the global attacker killing the global defender.

Section - Some ATTACK prose rules	
	
The end reporting blow with paragraph break rule is not listed in any rulebook.
	
[Last final blow report rule (this is the new end reporting blow with paragraph break rule):
	if global defender is alive, say "[paragraph break]".]

First flavour rule:
	rule succeeds.

The standard lose concentration prose rule is not listed in any rulebook.

Last lose concentration prose rule (this is the new lose concentration prose rule):
	if the concentration loser is the player, say "You lose your [bold type]concentration[roman type]!";
	if the concentration loser is not the player, say "[The concentration loser] loses [bold type]concentration[roman type]!".
	
A fatal player flavour rule (this is the fatal player kills player rule):
	if the global defender is the player:
		say "Your attack ends your own life.";
		rule succeeds.


Section - Other stuff

A standard AI target select rule (this is the randomise the target result more rule):
	choose row stored_row in Table of AI Combat Person Options;
	increase the Weight entry by a random number between 0 and 3.

Understand "creature" as a person.

Check switching the numbers off:
	say "The numerical representation of combat cannot be switched off in this game." instead.

After reading a command (this is the d might mean dodge rule):
	if the player's command matches "d":
		if the combat state of the player is at-React:
			say "[italic type](Perhaps you wanted to dodge? The abbreviation for that is 'do'.)[roman type][paragraph break]".


Section - Because we have teleporting creatures

The standard attacking second phase rule is not listed in any rulebook.

Carry out an actor attacking when the fight consequences variable is true (this is the alternative attacking second phase rule):
	if the actor is alive and the noun is alive:
		if the location of the actor is the location of the noun:
			make the actor strike a blow against the noun.


[This could be fun, but it needs to be an option that can be set to: none, short, medium, long.]
[The non-standard attack roll rule is listed instead of the standard attack roll rule in the basic attack roll rules.

This is the non-standard attack roll rule:
	if the numbers boolean is true, say "[italic type]Rolling [run paragraph on]";
	wait 500 milliseconds before continuing, strictly;
	change the to-hit roll to a random number between 1 and 10;
	if the numbers boolean is true, say the to-hit roll, "[run paragraph on]";
	wait 500 milliseconds before continuing, strictly;.
]

Section - Because sometimes one can attack outside combat

[As I write this, this is only possible when the player attacks himself when commanded by Nomos.]

First carry out attacking:
	if not hate is present:
		make the actor strike a blow against the noun instead.

Chapter - More actions that take no time

Section - Vaguely going

The block vaguely going rule is not listed in any rulebook.

Rule for supplying a missing noun while an actor going (this is the alternative block vaguely going rule):
	take no time;
	issue library message going action number 7.

Section - Going nowhere

The can't go that way rule is not listed in any rulebook.

Check an actor going (this is the alternative can't go that way rule):
	if the room gone to is nothing:
		take no time;
		if the door gone through is nothing, stop the action with library
			message going action number 2 for the room gone from;
		stop the action with library message going action number 6 for the door gone through;

Section - Taking what is already carried

The can't take what's already taken rule is not listed in any rulebook.

Check an actor taking (this is the alternative can't take what's already taken rule):
	if the actor is carrying the noun:
		take no time;
		stop the action with library message taking action number 5 for the noun;
	if the actor is wearing the noun:
		take no time;
		stop the action with library message taking action number 5 for the noun.



Chapter - Statistics

[We already have:
* Melee
* Defence
* Health

Now we will add some more.]

The ability test rules are a rulebook.

Section - Perception 

A person has a number called Perception. The Perception of a person is usually 5.

To test the perception of (guy - a person) against (n - a number):
	now test subject is guy;
	now test score is a roll of the dice;
	say "[if guy is the player]You roll[otherwise][The guy] rolls[end if] ", test score, " + [perception of guy] (perception score)[run paragraph on]";
	increase test score by perception of guy;
	consider the perception test rules;
	consider the ability test rules;
	say " = [test score] against a target number of ", n, "[run paragraph on]";
	if test score is less than n:
		say ", failing the perception check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the perception check.[run paragraph on]";
		now test result is true.

The perception test rules are a rulebook.


Section - Dexterity

A person has a number called Dexterity. The Dexterity of a person is usually 5.

To test the dexterity of (guy - a person) against (n - a number):
	now test subject is guy;
	now test score is a roll of the dice;
	say "[if guy is the player]You roll[otherwise][The guy] rolls[end if] ", test score, " + [dexterity of guy] (dexterity score)[run paragraph on]";
	increase test score by dexterity of guy;
	consider the dexterity test rules;
	consider the ability test rules;
	say " = [test score] against a target number of ", n, "[run paragraph on]";
	if test score is less than n:
		say ", failing the dexterity check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the dexterity check.[run paragraph on]";
		now test result is true.

The dexterity test rules are a rulebook.



Section - Willpower

A person has a number called Willpower. The Willpower of a person is usually 5.

To test the willpower of (guy - a person) against (n - a number):
	now test subject is guy;
	now test score is a roll of the dice;
	say "[if guy is the player]You roll[otherwise][The guy] rolls[end if] ", test score, " + [willpower of guy] (willpower score)[run paragraph on]";
	increase test score by willpower of guy;
	consider the willpower test rules;
	consider the ability test rules;
	say " = [test score] against a target number of ", n, "[run paragraph on]";
	if test score is less than n:
		say ", failing the willpower check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the willpower check.[run paragraph on]";
		now test result is true.

The willpower test rules are a rulebook.


Section - Inherent damage modifier 

A person has a number called the inherent damage modifier. The inherent damage modifier of a person is usually 0.

A damage modifiers rule (this is the inherent damage modifier rule):
	if inherent damage modifier of the global attacker is not 0:
		if the numbers boolean is true, say " + ", inherent damage modifier of the global attacker, " (inherent bonus)[run paragraph on]";
		increase the damage modifier by the inherent damage modifier of the global attacker.


Section - Weapon descriptions

Last report examining a weapon (this is the extra weapon info rule):
	say "[italic type]Combat statistics: 1d[damage die of the noun] + [weapon damage bonus of the noun] damage; [if weapon attack bonus of the noun is less than 0]-[otherwise]+[end if][absolute value of weapon attack bonus of the noun] attack modifier[if the noun is ranged]; ranged[end if][parry and dodge info of the noun][if the noun is silver]; good against undead[end if][special weapon info of the noun][roman type].[run paragraph on][line break][paragraph break]"
			
To say parry and dodge info of (item - a weapon):
	if passive parry max of item is less than 2:
		say "; hard to parry[run paragraph on]";
	if passive parry max of item is greater than 3:
		say "; easy to parry[run paragraph on]";
	if active parry max of item is less than 2:
		say "; bad at parrying[run paragraph on]";
	if active parry max of item is greater than 3:
		say "; good at parrying[run paragraph on]";
	if dodgability of item is less than 2:
		say "; hard to dodge[run paragraph on]";
	if dodgability of item is greater than 3:
		say "; easy to dodge[run paragraph on]".

A weapon has some text called the special weapon info. The special weapon info of a weapon is usually "".

Section - New rolling mechanism

[This roll creates a number between 1 and 10, but biased towards the middle values. This makes combat somewhat less random, which benefits the player and makes penalties and bonuses more important. However, we also allow a 10 to turn into a 20, so that everyone has a chance to hit everyone.

Instead of the standard 1d10 of ATTACK, we roll 1d7 + 1d4 - 1.]

The standard attack roll rule is not listed in any rulebook.

The current roll is a number that varies.

A basic attack roll rule (this is the alternative attack roll rule):
	if the numbers boolean is true, say "[italic type]Rolling ";
	now the to-hit roll is a roll of the dice;
	if the numbers boolean is true, say the to-hit roll, "[run paragraph on]".

To decide which number is a roll of the dice:
	let n be a random number between 1 and 7;
	let m be a random number between 0 and 3;
	let x be n + m;
	if x is 10:
		if a random chance of 1 in 2 succeeds:
			now x is 20;
	decide on x.

[1: 1/28
2: 2/28
3: 3/28
4-7: 4/28
8: 3/28
9: 2/28
10: 1/28]


Kerkerkruip ATTACK Additions ends here.
