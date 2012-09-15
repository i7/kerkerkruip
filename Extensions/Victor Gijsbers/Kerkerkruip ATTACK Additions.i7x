Kerkerkruip ATTACK Additions by Victor Gijsbers begins here.

Use authorial modesty.

[ Kerkerkruip has no reloadable weapons ]
Chapter - No reloadable weapons (in place of Chapter - Reloadable Weapons (Standard Plug-in) in Inform ATTACK by Victor Gijsbers)

Section - Killing

An aftereffects rule (this is the killing after attack rule):
	if the global defender is dead:
		have an event of the global attacker killing the global defender.

Section - Some ATTACK prose rules	
	
[Last final blow report rule (this is the new end reporting blow with paragraph break rule):
	if global defender is alive, say "[paragraph break]".]

The basic fatal player flavour rule is not listed in any rulebook.
The basic fatal flavour rule is not listed in any rulebook.
The basic flavour rule is not listed in any rulebook.

The standard lose concentration prose rule is not listed in any rulebook.

Last lose concentration prose rule for a person (called P) (this is the new lose concentration prose rule):
	if P is the player:
		say "You lose your [bold type]concentration[roman type]!";
	otherwise:
		say "[The P] loses [bold type]concentration[roman type]!".
	
Report the player hitting a dead pc (this is the report player suicide rule):
	say "Your attack ends your own life.";
	rule succeeds;



Section - Other stuff

An AI target selection rule (this is the randomise the target result more rule):
	increase the Weight by a random number between 0 and 3;

Understand "creature" as a person.

Check switching the numbers off:
	say "The numerical representation of combat cannot be switched off in this game." instead.

After reading a command (this is the d might mean dodge rule):
	if the player's command matches "d" and the player is at-React:
		say "[italic type](Perhaps you wanted to dodge? The abbreviation for that is 'do'.)[roman type][paragraph break]".



Section - Because we have teleporting creatures

Check an actor hitting (this is the stop hitting if the target has teleported rule):
	unless the location of the actor is the location of the noun:
		stop the action;


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
First carry out attacking the player when the combat status is peace (this is the attack self when not in combat rule):
	try the actor hitting the noun instead;
	


Chapter - More actions that take no time

Section - Vaguely going

The block vaguely going rule is not listed in any rulebook.

Rule for supplying a missing noun while an actor going (this is the alternative block vaguely going rule):
	take no time;
	issue library message going action number 7.

Section - Going nowhere

The can't go that way rule is not listed in any rulebook.

Check an actor going when the room gone to is nothing (this is the alternative can't go that way rule):
	take no time;
	if the door gone through is nothing:
		stop the action with library message going action number 2 for the room gone from;
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



Chapter - Faculties

[Up to version 5, Kerkerkruip used Perception, Dexterity and Willpower. From version 6 on, we will use Body, Mind and Spirit instead. These will also be much more interesting.]

A person has a number called body score. The body score of a person is usually 5.
A person has a number called mind score. The mind score of a person is usually 5.
A person has a number called spirit score. The spirit score of a person is usually 5.

A faculty is a kind of object. Body, mind and spirit are faculties.

Section - Faculty bonuses

The body bonus rules are a rulebook.
The mind bonus rules are a rulebook.
The spirit bonus rules are a rulebook.
The faculty bonus rules are a rulebook.

Faculty bonus score is a number that varies.

To decide which number is the body bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	consider the body bonus rules;
	say "[run paragraph on]";	
	consider the faculty bonus rules;
	say "[run paragraph on]";
	decide on faculty bonus score.
	
To decide which number is the final body of (guy - a person):
	let n be body score of the guy plus body bonus of the guy;
	say "[run paragraph on]";	
	decide on n.

To decide which number is the mind bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	consider the mind bonus rules;
	say "[run paragraph on]";	
	consider the faculty bonus rules;
	say "[run paragraph on]";	
	decide on faculty bonus score.
	
To decide which number is the final mind of (guy - a person):
	let n be mind score of the guy plus mind bonus of the guy;
	say "[run paragraph on]";	
	decide on n.
	
To decide which number is the spirit bonus of (guy - a person):
	now test subject is guy;
	now faculty bonus score is 0;
	consider the spirit bonus rules;
	say "[run paragraph on]";	
	consider the faculty bonus rules;
	say "[run paragraph on]";
	decide on faculty bonus score.
	
To decide which number is the final spirit of (guy - a person):
	let n be spirit score of the guy plus spirit bonus of the guy;
	say "[run paragraph on]";	
	decide on n.

Section - Testing faculties

The tested faculty is a faculty that varies.

To test the body of (guy - a person) against (n - a number):
	now tested faculty is body;
	test the faculty of guy against n.

To test the mind of (guy - a person) against (n - a number):
	now tested faculty is mind;
	test the faculty of guy against n.

To test the spirit of (guy - a person) against (n - a number):
	now tested faculty is spirit;
	test the faculty of guy against n.

To test the faculty of (guy - a person) against (n - a number):
	now test subject is guy;
	now test score is a roll of the dice;
	say "[The guy] roll[s] ", test score, " + [run paragraph on]";
	if tested faculty is body:
		say "[final body of guy] (body)[run paragraph on]";
		increase test score by final body of the guy;
	if tested faculty is mind:
		say "[final mind of guy] (mind)[run paragraph on]";
		increase test score by final mind of the guy;
	if tested faculty is spirit:
		say "[final spirit of guy] (spirit)[run paragraph on]";
		increase test score by final spirit of the guy;		
	say " = [test score] against a target number of ", n, "[run paragraph on]";
	if test score is less than n:
		say ", failing the [tested faculty] check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the [tested faculty] check.[run paragraph on]";
		now test result is true.


Section - Direct benefits of faculties

An attack modifier rule (this is the body defence bonus rule):
	let n be the final body of the global defender;
	if a random chance of n in 40 succeeds:
		say " - 2 (successful defensive move)[run paragraph on]";
		decrease the attack strength by 2.
	
[Concentration stuff for mind.]

Initiative update rule (this is the increase initiative based on spirit rule):
	repeat with X running through all alive persons enclosed by the location:
		let n be the final spirit of X;
		if a random chance of n in 40 succeeds:
			increase the initiative of X by a random number between 1 and 3.

[Critical hit chance for balance.]



Section - Inherent damage modifier 

A person has a number called the inherent damage modifier. The inherent damage modifier of a person is usually 0.

[ TODO: Should this be a standard part of ATTACK? ]
A damage modifier rule (this is the inherent damage modifier rule):
	if the inherent damage modifier of the global attacker is not 0:
		say " + ", inherent damage modifier of the global attacker, " (inherent bonus)[run paragraph on]";
		increase the attack damage by the inherent damage modifier of the global attacker;


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

An attack modifier rule (this is the alternative attack roll rule):
	now the attack strength is a roll of the dice;
	say "[italic type]Rolling ", the attack strength, "[run paragraph on]".
The alternative attack roll rule is listed instead of the standard attack roll rule in the attack modifier rules.

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