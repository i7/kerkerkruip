Kerkerkruip ATTACK Additions by Victor Gijsbers begins here.

Use authorial modesty.

Section - No concentrating outside of combat

Check concentrating (this is the do not concentrate outside of combat rule):
	if combat status is peace:
		say "You can only concentrate in a combat situation." instead.

Section - Attacking when the combat status is peace (Nomos, slaves)

[Nomos. Attack slaves.]

This is the alternative do not kill yourself rule:
	if the noun is the player and Nomos bonus is false:
		take no time;
		say "You are not that desperate!" instead.
		
The alternative do not kill yourself rule is listed instead of the do not kill yourself rule in the check attacking rulebook.

Attacking-from-peace is a truth state that varies. Attacking-from-peace is false.

This is the alternative do not attack friendly people rule:
	if the faction of the player does not hate the faction of the noun:
		if the faction of the noun is player-enslaved:
			now the noun is betrayed;
			if combat status is peace:
				now attacking-from-peace is true;
			now faction of the noun is hostile;
		otherwise:
			if the Nomos bonus is true:
				if combat status is peace:
					now attacking-from-peace is true;
				now faction of the noun is hostile;
			otherwise:
				take no time;
				say "[The noun] is your friend, not your enemy!" instead.
				
The alternative do not attack friendly people rule is listed instead of the do not attack friendly people rule in the check attacking rulebook.

The do not attack neutral people rule is not listed in any rulebook.

First check attacking:
	now attacking-from-peace is false. [If it didn't get reset for some reason.]

Last report attacking:
	if attacking-from-peace is true:
		now attacking-from-peace is false;
		now combat state of the noun is at-React;
		run the AI rules for the noun;
		now the combat status is concluding;
		consider the run delayed actions rule;
		consider the conclude the combat round rule.



Section - New rolling mechanism

[This roll creates a number between 1 and 10, but biased towards the middle values. This makes combat somewhat less random, which benefits the player and makes penalties and bonuses more important. However, we also allow a 10 to turn into a 20, so that everyone has a chance to hit everyone.

Instead of the standard 1d10 of ATTACK, we roll 1d7 + 1d4 - 1.]

The roller is a person that varies. [The guy who is rolling the dice. Used in the natural twenty rules.]
The special set attack strength rules are a rulebook. [Used for periapt of prophecy]

An attack modifier rule (this is the alternative attack roll rule):
	now roller is the global attacker;
	now the attack strength is 0;
	consider the special set attack strength rules;
	if attack strength is 0: [nothing intervened]
		now the attack strength is a roll of the dice;
	say "[italic type]Rolling ", the attack strength, "[run paragraph on]".
	
The alternative attack roll rule is listed instead of the standard attack roll rule in the attack modifier rules.

The natural twenty chance is a number that varies.
The natural twenty rules are a rulebook.

To decide which number is a roll of the dice:
	let n be a random number between 1 and 7;
	let m be a random number between 0 and 3;
	let x be n + m;
	now natural twenty chance is 0;
	consider the natural twenty rules;
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


[ Kerkerkruip has no reloadable weapons ]
Chapter - No reloadable weapons (in place of Chapter - Reloadable Weapons (Standard Plug-in) in Inform ATTACK by Victor Gijsbers)



Section - Losing concentration

The alternative lose concentration when hit rule is listed instead of the lose concentration when hit rule in the aftereffects rules.

The remain concentrated chance is a number that varies.
The remain concentrated rules are a rulebook.

An aftereffects rule (this is the alternative lose concentration when hit rule):
	if the the attack damage is greater than 0 and the global defender is alive and the concentration of the global defender is not 0:
		now the remain concentrated chance is 0;
		consider the remain concentrated rules;
		unless a random chance of remain concentrated chance in 100 succeeds:
			let the global defender lose concentration;
		otherwise:
			say "[The global defender] [bold type]remain[s] concentrated[roman type].";.

A remain concentrated rule (this is the damage penalty for remaining concentrated rule):
	decrease remain concentrated chance by attack damage.

Section - Killing

Last after reporting an actor hitting (this is the killing after attack rule):
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

A faculty is a kind of object. body, mind and spirit are faculties.

Section - Faculty bonuses

The body bonus rules are a rulebook.
The mind bonus rules are a rulebook.
The spirit bonus rules are a rulebook.
The faculty bonus rules are a rulebook.

To process (RL - a rule): (- ProcessRulebook({RL}, 0, true); -).

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
	now roller is the guy;
	now test score is a roll of the dice;
	say "[The guy] roll[s] ", test score, " + [run paragraph on]";
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
	say " = [test score] against a target number of ", n, "[run paragraph on]";
	if test score is less than n:
		say ", failing the [tested faculty] check.[run paragraph on]";
		now test result is false;
	otherwise:
		say ", succeeding at the [tested faculty] check.[run paragraph on]";
		now test result is true.


Section - Faculty increase

Unallocated faculty is a number that varies. Unallocated faculty is 0.

[The grant routine is called by power transferral in Kerkerkruip Systems.]

To grant a faculty increase of (n - a number):
	increase unallocated faculty by n;
	say "You can now increase one of your faculties by [bold type][unallocated faculty] point[if unallocated faculty is not 1]s[end if][roman type]. (Type 'body', 'mind', or 'spirit', depending on your choice.) [run paragraph on]".
	
Last status skill rule (this is the unallocated faculty rule):
	if unallocated faculty is greater than 0:
		say "[italic type]You can increase one of your faculties by [bold type][unallocated faculty] point[if unallocated faculty is not 1]s[end if][italic type]. (Type 'body', 'mind', or 'spirit', depending on your choice. This action takes no time.)[roman type][line break][run paragraph on]".

Increasing body is an action out of world. Understand "body" as increasing body.
Increasing mind is an action out of world. Understand "mind" as increasing mind.
Increasing spirit is an action out of world. Understand "spirit" as increasing spirit.

Check increasing body:
	if unallocated faculty is less than 1:
		say "You do not have any points left!" instead.

Check increasing mind:
	if unallocated faculty is less than 1:
		say "You do not have any points left!" instead.

Check increasing spirit:
	if unallocated faculty is less than 1:
		say "You do not have any points left!" instead.

Carry out increasing body:
	increase body score of the player by unallocated faculty;
	say "Your basic body increases to [body score of the player]; your effective body is now [run paragraph on][final body of the player].[line break][paragraph break]";
	now unallocated faculty is 0.

Carry out increasing mind:
	increase mind score of the player by unallocated faculty;
	say "Your basic mind increases to [mind score of the player][run paragraph on][if mind score of player is not final mind of player]; your effective mind is now [run paragraph on][final mind of the player][end if].[line break][paragraph break]";
	now unallocated faculty is 0.
	
Carry out increasing spirit:
	increase spirit score of the player by unallocated faculty;
	say "Your basic spirit increases to [spirit score of the player]; your effective spirit is now [run paragraph on][final spirit of the player].[line break][paragraph break]";
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

[Critical hit chance is determined by the lowest of your three attributes.]
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
A damage modifier rule (this is the inherent damage modifier rule):
	if the inherent damage modifier of the global attacker is not 0:
		say " + ", inherent damage modifier of the global attacker, " (inherent bonus)[run paragraph on]";
		increase the attack damage by the inherent damage modifier of the global attacker;


Section - Weapon descriptions

Last report examining a weapon (this is the extra weapon info rule):
	say "[italic type]Combat statistics: 1d[damage die of the noun] + [weapon damage bonus of the noun] damage; [if weapon attack bonus of the noun is less than 0]-[otherwise]+[end if][absolute value of weapon attack bonus of the noun] attack modifier[if the noun is ranged]; ranged[end if][parry and dodge info of the noun][if the noun is silver]; good against undead and demons[end if][special weapon info of the noun][roman type].[run paragraph on][line break][paragraph break]"
			
To say parry and dodge info of (item - a weapon):
	say "; can be parried for [passive parry max of item]; can parry for [active parry max of item]; can be dodged for [dodgability of item][run paragraph on]".
[	if passive parry max of item is less than 2:
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
		say "; easy to dodge[run paragraph on]".]

A weapon has some text called the special weapon info. The special weapon info of a weapon is usually "".


Section - Cleaning the Table of Delayed Actions

To clean the table of delayed actions for (guy - a person):
	repeat through the table of delayed actions:
		if the actor part of the action entry is the guy or the noun part of the action entry is the guy:
			blank out the whole row.

A killing rule (this is the don't do delayed action with killed guy rule):
	clean the table of delayed actions for killed-guy.






Chapter - New Combat Actions

Section - Rolling

Rolling is an action applying to nothing. Understand "roll" as rolling.

A person can be at-roll. A person is usually not at-roll.
A person can be just-rolled. A person is usually not just-rolled.
A person has a person called the rolled-at-guy.

Carry out an actor rolling:
	now the actor is at-roll;
	try the actor dodging.

A damage modifier rule (this is the rolling damage modifier rule):
	if the global defender is at-roll:
		say " + 3 (defender rolling)[run paragraph on]";
		increase the attack damage by 3.

Aftereffects rule (this is the set rolling variables rule):
	if the attack strength is not greater than the defence of the global defender and the global defender is at-roll:
		now global defender is just-rolled;
		now rolled-at-guy of the global defender is the global attacker;
		now global defender is not at-roll.

An attack modifier rule (this is the rolling bonus rule):
	if the global attacker is just-rolled:
		if the rolled-at-guy of the global attacker is the global defender:
			say " + 1 (rolled to attack)[run paragraph on]";
			increase the attack strength by 1.

A damage modifier rule (this is the rolling damage bonus rule):
	if the global attacker is just-rolled:
		if the rolled-at-guy of the global attacker is the global defender:
			say " + 1 (rolled to attack)[run paragraph on]";
			increase the attack damage by 1.

Before reading a command (this is the rolling notification rule):
	if the main actor is the player and the player is just-rolled:
		say "(If you attack [the rolled-at-guy of the player] right now, you will get your rolling bonus.)".

Every turn when main actor is just-rolled:
	now main actor is not just-rolled.

Every turn when main actor is at-roll:
	now main actor is not at-roll.

Section - Blocking

Blocking is an action applying to nothing. Understand "block" as blocking.

A person can be at-block. A person is usually not at-block.
A person has a number called the block modifier.

Check blocking:
	if the concentration of the player is 0:
		take no time;
		say "You can only block when you are concentrated." instead.

Carry out an actor blocking:
	now the actor is at-block;
	try the actor parrying.

First carry out an actor parrying:
	if the actor is at-block:
		now block modifier of the actor is concentration of the actor;
		now concentration of the actor is 0.

An attack modifier rule (this is the blocking defence bonus rule):
	if the block modifier of the global defender is not 0:
		let n be block modifier of the global defender;
		if passive parry max of the global attacker weapon is less than n:
			now n is passive parry max of the global attacker weapon;
		if n is 0:
			say " - [n] (cannot block)[run paragraph on]";
		otherwise:
			say " - [n] (block bonus)[run paragraph on]";
		decrease the attack strength by n;
		now the actor is not at-block.

Every turn when block modifier of main actor is not 0:
	now block modifier of main actor is 0.

Every turn when main actor is at-block:
	now main actor is not at-block.

Kerkerkruip ATTACK Additions ends here.