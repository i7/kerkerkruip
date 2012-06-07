Kerkerkruip Monsters by Victor Gijsbers begins here.

Use authorial modesty.






Chapter - Level 1 - Swarm of Daggers

Section - Definitions

The swarm of daggers is a monster. "A swarm of small daggers is flying through the air like a flock of birds, their sharp points eagerly seeking your flesh." The level of swarm of daggers is 1.

The swarm of daggers is eyeless.
The material of the swarm of daggers is iron.
The swarm of daggers is emotionless.
The swarm of daggers is flyer.

The health of the swarm of daggers is 12.
The melee of the swarm of daggers is 3.
The defence of the swarm of daggers is 4.
The dexterity of the swarm of daggers is 6.
The perception of the swarm of daggers is 4. 

When play begins:
	let X be a random natural weapon part of the swarm of daggers;
	now damage die of X is 4;
	now dodgability of X is 3;
	now passive parry max of X is 0;
	now active parry max of X is 0;
	now the printed name of X is "sharp points".

The description of the swarm of daggers is "Animated by some dark magic, these daggers purposefully seek to undo you.".

A standard AI action select rule (this is the daggers do not concentrate rule):
	if the global attacker is the swarm of daggers:
		choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
		decrease the Weight entry by 100.

Section - Scattering

Dagger-scattered is a truth state that varies. Dagger-scattered is false.

An aftereffects rule (this is the scatter the daggers rule):
	if the global defender is the swarm of daggers and the final damage is greater than 0 and the swarm of daggers is not killed:
		say "The impact of the blow [italic type]scatters[roman type] the swarm of daggers. They will need to spend one action regrouping themselves.";
		now dagger-scattered is true.

First standard AI action select rule (this is the daggers consider waiting rule):
	if the global attacker is the swarm of daggers and dagger-scattered is true:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker waiting;
		change the Weight entry to -1000.
		
A standard AI action select rule (this is the daggers must regroup after scattering rule):
	if the global attacker is the swarm of daggers and dagger-scattered is true:
		choose row with an Option of the action of the global attacker waiting in the Table of AI Combat Options;
		increase the Weight entry by 2000.

Check the swarm of daggers waiting (this is the daggers regroup rule):
	if dagger-scattered is true:
		now dagger-scattered is false;
		say "The swarm of daggers regroups." instead.


Section - Prose

A fatal flavour rule (this is the fatal swarm of daggers rule):
	if the global defender is the swarm of daggers:
		say "All life suddenly goes out of the daggers. For a moment they hang still in the air, but then the planet below pulls them inexorably downwards.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player swarm of daggers rule):
	if the global attacker is the swarm of daggers:
		say "You desperately attempt to fend off the flying daggers, but there are too many of them. One by one the daggers sink into your flesh, and your soul flees through a thousand mouths.";
		rule succeeds.

An attack move flavour rule (this is the swarm of daggers attacks rule):
	if the global attacker is the swarm of daggers:
		say "The swarm of daggers [one of]bears down upon[or]launches itself at[or]moves in to attack[at random] [the global defender].";
		rule succeeds.

Report an actor parrying (this is the report swarm of daggers parry rule):
	if the actor is the swarm of daggers:
		say "Several of the daggers float out to stop the attack.";
		rule succeeds.

Report an actor dodging (this is the report swarm of daggers dodge rule):
	if the actor is the swarm of daggers:
		say "The swarm of daggers attempts to outmaneuver the attack.";
		rule succeeds.

Section - Power

The power of the daggers is a power. Swarm of daggers grants power of the daggers.
The power level of power of the daggers is 1.
The command text of power of the daggers is "pierce".

Absorbing power of the daggers:
	increase melee of the player by 2;
	increase inherent damage modifier of the player by 2;
	decrease defence of the player by 1;
	increase permanent health of the player by 6;
	increase dexterity of the player by 1;
	say "As the daggers fall down, you feel the soul that animated them absorbed into your own body. You are sharp. You are deadly. ([bold type]Power of the daggers[roman type]: +2 attack, +1 damage, -1 defence, +6 health, +1 dexterity, and the [italic type]pierce[roman type] skill.)[paragraph break]".

Repelling power of the daggers:
	decrease melee of the player by 2;
	decrease inherent damage modifier of the player by 2;
	increase defence of the player by 1;
	decrease permanent health of the player by 6;
	decrease dexterity of the player by 1.

Status skill rule (this is the pierce status skill rule):
	if the power of daggers is granted:
		say "You can [bold type]pierce[roman type] an enemy, accepting one damage for a chance to deal one damage to the enemy. [italic type](Level 1)[roman type][line break][run paragraph on]";



Section - Piercing ability

Piercing is an action applying to one visible thing. Understand "pierce [thing]" as piercing.

Does the player mean piercing the player: it is unlikely.
Does the player mean piercing an alive person: it is very likely.

Check piercing:
	if power of daggers is not granted:
		take no time;
		say "You do not have that power." instead.

Check piercing:
	abide by the check attacking rules.

Carry out piercing:
	decrease the health of the player by 1;
	now the concentration of the player is 0;
	if player is not alive:
		say "With a final effort, you manage to form part of your body into a dagger -- but you succumb from the exertion";
		end the game saying "You committed suicide.";
	let n be 8;
	increase n by greatest power of the player;
	increase n by greatest power of the player;	
	say "You transform part of your own flesh into a magical dagger, which then speeds towards [the noun] of its own accord. [italic type][run paragraph on]";
	test the dexterity of the noun against n;
	say "[roman type] ";
	if test result is true:
		say "[The noun] manages to evade the dagger.";
	otherwise:
		decrease health of the noun by 1;
		say "The dagger hits, dealing 1 damage and reducing [no dead property][the noun][dead property] to [health of the noun] health.";
		now final damage is 1;
		now global attacker is the player;
		now global defender is the noun;
		consider the aftereffects rules;
		consider the take away until attack circumstances rules;
		consider the final blow report rules.
		
		
		
		
		



Chapter - Level 1 - Blood Ape

Section - Definitions

A blood ape is a monster. "A [if the size of the blood ape is not medium][size of the blood ape] [end if]simian creature aggressively [if player is not hidden][one of]shows you its teeth[or]displays its strength[or]screams at you[at random][otherwise]paces through the room[end if]." Understand "monkey" and "gorilla" and "simian" as the blood ape.

The description of the blood ape is "It looks like a gorilla, except that is has an intensely red fur and is perhaps even more muscular. [if the blood ape is small]Thankfully, the ape is somewhat smaller than you are[otherwise if the blood ape is medium]The blood ape has grown to the proportion of a very broad-chested human[otherwise if the blood ape is large]The blood ape now stands taller than you, and its fists have grown bigger than your head[otherwise if the blood ape is huge]The massive blood ape towers above you, having grown to the size of an elephant[otherwise if the blood ape is gargantuan]The blood ape has grown to colossal proportions, hardly fitting in the room. You fear it could easily crush you[end if]."

The level of the blood ape is 1.
The blood ape is small.

The health of the blood ape is 8.
The melee of the blood ape is 0.
The defence of the blood ape is 8.

When play begins:
	let X be a random natural weapon part of the blood ape;
	now damage die of X is 6;
	now dodgability of X is 1;
	now passive parry max of X is 3;
	now active parry max of X is 0;
	now printed name of X is "ape's [size of blood ape] fists".


Aftereffects rule (this is the blood ape grows in size when hit rule):
	if the global attacker is the blood ape and the final damage is greater than 0:
		if the blood ape is not gargantuan:
			now the blood ape is the size after the size of the blood ape;
			say "The ape immediately licks the blood of its enemy from its knuckles. Nourished by this substance, it grows to [size of the blood ape] size!";
			increase permanent health of blood ape by 3;
			increase health of blood ape by 3;
			if size of blood ape is large or size of blood ape is gargantuan:
				increase melee of blood ape by 1;
			let X be a random natural weapon part of the blood ape;
			if the blood ape is medium:
				now dodgability of X is 2;
				now passive parry max of X is 2;
			if the blood ape is large:
				now dodgability of X is 3;
				now passive parry max of X is 1;
			if the blood ape is huge:
				now dodgability of X is 4;
				now passive parry max of X is 0;
			if the blood ape is gargantuan:
				now dodgability of X is 5;
				now passive parry max of X is 0;
		otherwise:
			say "Sensing perhaps that it cannot grow further in its current confines, the ape does not lick of the blood.".
			
Damage modifiers rule:
	if the global attacker is the blood ape:
		if the blood ape is small:
			if the numbers boolean is true, say " - 1 (small size)[run paragraph on]";
			decrease the damage modifier by 1;
		if the blood ape is large:
			if the numbers boolean is true, say " + 2 (large size)[run paragraph on]";
			increase the damage modifier by 2;
		if the blood ape is huge:
			if the numbers boolean is true, say " + 4 (huge size)[run paragraph on]";
			increase the damage modifier by 4;
		if the blood ape is gargantuan:
			if the numbers boolean is true, say " + 8 (gargantuan size)[run paragraph on]";
			increase the damage modifier by 8.
			
Attack modifiers rule:
	if the global defender is the blood ape and the global defender is at dodge:
		if the blood ape is huge:
			if the numbers boolean is true, say " + 1 (huge ape)[run paragraph on]";
			increase the to-hit modifier by 1;
		if the blood ape is gargantuan:
			if the numbers boolean is true, say " + 2 (huge ape)[run paragraph on]";
			increase the to-hit modifier by 2.


Section - Prose

A fatal flavour rule (this is the fatal blood ape rule):
	if the global defender is the blood ape:
		say "[if the blood ape is small or the blood ape is medium]The blood ape topples over with a small grunt[otherwise]The blood ape crashes down with a huge smack[end if].";
		rule succeeds.

A fatal player flavour rule (this is the fatal player blood ape rule):
	if the global attacker is the blood ape:
		say "The blood ape pounds you into a pulp with its fists, then feasts on your body.";
		rule succeeds.

An attack move flavour rule (this is the blood ape attacks rule):
	if the global attacker is the blood ape:
		say "The blood ape [one of]swings at [possessive of the global defender] head[or]jumps at [global defender] with its fists ready to swing[at random].";
		rule succeeds.

Report an actor parrying (this is the report blood ape parry rule):
	if the actor is the blood ape:
		say "The blood ape attempts to stop the attack with its hairy forearms.";
		rule succeeds.

Report an actor dodging (this is the report blood ape dodge rule):
	if the actor is the blood ape:
		say "The blood ape tries to jump out of the way.";
		rule succeeds.

Section - Power

The power of the ape is a power. Blood ape grants power of the ape.
The power level of power of the ape is 1.
The command text of power of the ape is "+ [ape power damage] damage".

Absorbing power of the ape:
	let n be 0;
	let m be 1;
	if the blood ape is small:
		now n is 2;
	if the blood ape is medium:
		now n is 4;
	if the blood ape is large:
		now n is 6;
	if the blood ape is huge:
		now n is 8;
		now m is 2;
	if the blood ape is gargantuan:
		now n is 10;
		now m is 2;
	increase permanent health of the player by n;
	increase melee of the player by m;
	increase defence of the player by 1;
	increase inherent damage modifier of the player by 1;
	say "The blood-hungry soul that animated the ape is absorbed into your own body. You are strong. You hunger for blood. ([bold type]Power of the ape[roman type]: +[m] attack, +1 defence, +[n] health; when you score a hit, your damage will increase for a short time.)[paragraph break]".

Repelling power of the ape:
	let n be 0;
	let m be 1;
	if the blood ape is small:
		now n is 2;
	if the blood ape is medium:
		now n is 4;
	if the blood ape is large:
		now n is 6;
	if the blood ape is huge:
		now n is 8;
		now m is 2;
	if the blood ape is gargantuan:
		now n is 10;
		now m is 2;
	decrease permanent health of the player by n;
	decrease melee of the player by m;
	decrease defence of the player by 1;
	decrease inherent damage modifier of the player by 1;
	now ape power damage is 0.
	
The ape power damage is a number that varies. The ape power damage is 0.

A damage modifiers rule (this is the add ape power damage to damage rule):
	if the global attacker is the player and the ape power damage is not 0:
		if the numbers boolean is true, say " + [ape power damage] (power of the ape)[run paragraph on]";
		increase the damage modifier by ape power damage.		

Every turn when the main actor is the player (this is the decrease ape power damage over time rule):
	if the ape power damage is greater than 0:
		if a random chance of 1 in 3 succeeds or a random chance of ape power damage in 10 succeeds:
			decrease ape power damage by 1.

Aftereffects rule (this is the increase ape damage rule):
	if global attacker is the player and final damage is greater than 0:
		if power of the ape is granted:
			increase ape power damage by 3.

Status rule (this is the ape power damage status rule):
	if power of the ape is granted and ape power damage is greater than 0:
		say "[bold type]Power of the ape[roman type]: +[ape power damage] damage bonus.[line break][run paragraph on]".
		
Status skill rule (this is the ape power status skill rule):
	if power of the ape is granted:
		say "Since you are strengthened by [bold type]blood[roman type], hitting an enemy gives you a temporary damage bonus. [italic type](Level 1)[roman type][line break][run paragraph on]".
			




Chapter - Level 1 - Ravenous Armadillo

Section - Definitions

The ravenous armadillo is a monster. "A huge armadillo is here, searching for anything it can eat."

The level of ravenous armadillo is 1.
The difficulty level of ravenous armadillo is 1. [Too confusing for new players.]


The description of ravenous armadillo is "As their name suggests, ravenous armadillos will eat anything. They may seem slow and easy to hit, but their tough scales ensures that they can shrug off most damage, and their bony tail club packs a considerable punch.".

The health of the ravenous armadillo is 10.
The melee of the ravenous armadillo is -2.
The defence of the ravenous armadillo is 5.
The dexterity of the ravenous armadillo is 3.
The perception of the ravenous armadillo is 4. 

A damage modifiers rule (this is the ravenous armadillo takes less damage rule):
	if the global defender is the ravenous armadillo:
		if the numbers boolean is true, say " - 3 (tough scales)[run paragraph on]";
		decrease the damage modifier by 3.

The intrinsic heat resistance of the ravenous armadillo is 3.

A physical damage reduction rule (this is the armadillo physical damage reduction rule):
	if the test subject is the ravenous armadillo:
		increase the pdr by 3.
		
When play begins:
	let X be a random natural weapon part of the ravenous armadillo;
	now damage die of X is 4;
	now dodgability of X is 3;
	now passive parry max of X is 1;
	now active parry max of X is 3;
	now the printed name of X is "bony tail club".			

Section - Prose

A fatal flavour rule (this is the fatal ravenous armadillo rule):
	if the global defender is the ravenous armadillo:
		say "As the armadillo dies, its body splits open, revealing [if at least one thing is in the armadillo stomach][a list of things in the armadillo stomach][otherwise]no items at all[end if].";
		rule succeeds.

A fatal player flavour rule (this is the fatal player ravenous armadillo rule):
	if the global attacker is the ravenous armadillo:
		say "The ravenous armadillo smashes your head in with its tail club.";
		rule succeeds.

An attack move flavour rule (this is the ravenous armadillo attacks rule):
	if the global attacker is the ravenous armadillo:
		say "The armadillo raises its tail threateningly towards [the global defender].";
		rule succeeds.

Report an actor parrying (this is the report ravenous armadillo parry rule):
	if the actor is the ravenous armadillo:
		say "The armadillo tries to ward off the attack with its tail.";
		rule succeeds.

Report an actor dodging (this is the report ravenous armadillo dodge rule):
	if the actor is the ravenous armadillo:
		say "The armadillo lumbers aside.";
		rule succeeds.
		
Report an actor concentrating (this is the armadillo concentration prose rule):
	if the actor is the ravenous armadillo:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "The armadillo narrows its eyes. You assume it is concentrating." instead;
		if the concentration of the actor is 2, say "The armadillo makes a few thoughtful movements with its tail." instead;
		if the concentration of the actor is 3, say "A final sweep of its tail club seems to indicate that the armadillo has made up its mind." instead.	
		

Section - Armadillo-eating

Armadillo-eating is an action applying to nothing.

First standard AI action select rule (this is the consider ravenous armadillo eating rule):
	if the global attacker is the ravenous armadillo:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker armadillo-eating;
		change the Weight entry to 0.

A standard AI action select rule (this is the ravenous armadillo eating select rule):
	if the global attacker is the ravenous armadillo:
		choose row with an Option of the action of the global attacker armadillo-eating in the Table of AI Combat Options;
		if a random chance of 1 in 2 succeeds:
			if there is a good item for the armadillo to eat:
				increase Weight entry by 12;
			otherwise if a random chance of 1 in 10 succeeds:
				increase Weight entry by 10.

To decide whether there is a good item for the armadillo to eat:
	repeat with item running through things in the location of the ravenous armadillo:
		if item is not a person and item is not scenery and item is not fixed in place and item is not hot:
			decide yes;
	decide no.

To decide which thing is the armadillo food:
	let m be 20; [we try twenty times]
	let item be the ravenous armadillo;
	while m is greater than 0:
		now item is a random thing in the location of the ravenous armadillo;
		if item is not a person and item is not scenery and item is not fixed in place and item is not hot:
			now m is 0;
		otherwise:
			decrease m by 1;
			now item is the ravenous armadillo;
	decide on item.

Carry out the ravenous armadillo armadillo-eating:
	let item be the armadillo food;
	if item is the ravenous armadillo:
		if the armadillo is visible and the location of the armadillo is the location of the player:
			say "The armadillo sniffs along the ground, searching for food.";
	otherwise:
		if the armadillo is visible and the location of the armadillo is the location of the player:
			say "The armadillo gobbles up [the item].";
		otherwise:
			let way be best route from location of player to location of ravenous armadillo;
			if way is a direction:
				say "You hear a crunching noise [best route from location of player to location of ravenous armadillo].";
		move item to the armadillo stomach;
[		say "TEST CODE: eaten [item]."].


Section - The armadillo stomach

[Wacth out: if you write AI rules that allow the armadillo to use items it encloses, it may start using things it has eaten!]

The armadillo stomach is a closed opaque container. The armadillo stomach is part of the ravenous armadillo.

Dungeon interest rule (this is the fill the stomach rule):
	if ravenous armadillo is not off-stage:
		let item be a random off-stage minor thing;
		unless item is nothing:
			move item to the armadillo stomach;
			if generation info is true, say "* Moved [item] to the stomach of the armadillo.".

Every turn when at least one thing is in the armadillo stomach:
	repeat with item running through things in the armadillo stomach:
		corrode item.

To do the armadillo stomach trick:
	if at least one thing is in the armadillo stomach:
		repeat with item running through things in the armadillo stomach:
			move item to the location of the ravenous armadillo.

The armadillo stomach is privately-named.


Section - Armadillo also eats when the player is not around

Every turn when the armadillo is not off-stage (this is the armadillo eats when the player is not around rule):
	if the location of the player is not the location of the ravenous armadillo:
		if a random chance of 1 in 5 succeeds:
			try the ravenous armadillo armadillo-eating.

Section - Armadillo moves around

Every turn when the armadillo is not off-stage (this is the armadillo moves when the player is not around rule):
	if the location of the player is not the location of the ravenous armadillo or there is no perceived threat for the ravenous armadillo:
		if a random chance of 1 in 20 succeeds:
			if at least one room is adjacent to the location of the ravenous armadillo:
				let place2 be the location of the ravenous armadillo; [needed because of a bug in inform]
				let place be a random room which is adjacent to place2;
[				let place be a random room which is adjacent to the location of the ravenous armadillo;]
				let way be the direction from the location of the ravenous armadillo to place;
				[say "TEST CODE: trying the armadillo going [way].";]
				try the ravenous armadillo going way.

Section - Power of the Armadillo

The power of the armadillo is a power. Ravenous armadillo grants power of the armadillo.
The power level of power of the armadillo is 1.
The command text of power of the armadillo is "scales".

Absorbing power of the armadillo:
	do the armadillo stomach trick;
	increase melee of the player by 1;
	increase permanent health of the player by 5;
	decrease dexterity of the player by 1;
	say "As the armadillo succumbs, you feel its soul absorbed into your own body. ([bold type]Power of the armadillo[roman type]: +1 attack, +1 damage resistance, +5 health, -1 dexterity, and the [italic type]scales[roman type] skill, which gives you a temporary damage reduction that costs some health to use and expires as soon as you attack.)[paragraph break]".

A damage modifiers rule (this is the power of the armadillo gives damage resistance rule):
	if the global defender is the player and the power of the armadillo is granted:
		if the numbers boolean is true, say " - 1 (armadillo)[run paragraph on]";
		decrease the damage modifier by 1.

Repelling power of the armadillo:
	decrease melee of the player by 1;
	decrease permanent health of the player by 5;
	increase dexterity of the player by 1.

Section - The scales skill

The scales number is a number that varies. The scales number is usually 0.

A damage modifiers rule (this is the scales gives damage resistance rule):
	if the global defender is the player and the scales number is greater than 0:
		let n be the scales number;
		if the numbers boolean is true, say " - [n] (scales)[run paragraph on]";
		decrease the damage modifier by n.

A physical damage reduction rule (this is the scaling damage reduction rule):
	if the test subject is the player and the scales number is greater than 0:
		increase the pdr by scales number.

Scaling is an action applying to one number. Understand "scale [a number]" and "scales [a number]" as scaling.

Understand "scales" and "scale" as a mistake ("[take no time][italic type]You need to supply the level of scales you wish to attain by typing, for example, 'scales 2'. This would give you 2 damage reduction and would cost you 2 health. The maximum number you can choose is equal to the highest level monster you have defeated, which is currently [greatest power of the player][roman type].").

Check scaling:
	if power of the armadillo is not granted:
		take no time;
		say "You do not possess that power." instead.

Check scaling:
	if the number understood is less than 1:
		take no time;
		say "You must choose a positive number." instead.

Check scaling:
	if the number understood is greater than the greatest power of the player:
		take no time;
		say "You are not powerful enough for that; the maximum level of scales you can use is [greatest power of the player]." instead.

Carry out scaling:
	now the scales number is the number understood;
	let n be a random number between 1 and the number understood;
	decrease the health of the player by n;
	say "Hard scales appear all over your body; the power drains [n] of your health.";
	if the player is killed:
		end the story saying "That transformation was more than your body could handle.".

A take away until attack circumstances rule (this is the scales disappear after attacking rule):
	if the global attacker is the player and the scales number is not 0:
		now the scales number is 0;
		say "Your scales disappear.".

Status rule (this is the scales status rule):
	if scales number is greater than 0:
		say "You are covered in [bold type]scales[roman type]: +[scales number] damage reduction.[line break][run paragraph on]".

Status skill rule (this is the armadillo status skill rule):
	if the power of armadillo is granted:
		say "You have the [bold type]scales[roman type] power, which covers you in hard scales that reduce all damage done to you. Using this power costs you some health, and it expires when you attack. [italic type](Level 1)[roman type][line break][run paragraph on]".

A standard AI action select rule (this is the scales concentration select rule):
	choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
	if the global defender is the player:
		increase the Weight entry by scales number.



Chapter - Level 1 - Miranda

Section - Definitions

Miranda is a monster. "A stunning young woman in a simple monk's robe awaits you."

Miranda is proper-named. Miranda is female. Miranda is not neuter. Understand "woman" and "stunning" and "monk" as Miranda.

The level of the Miranda is 1.

The description of Miranda is "Although she is currently working as one of Malygris's guards, Miranda dreams about a bright future as a famous adventurer.".

The health of Miranda is 12.
The melee of Miranda is 0.
The defence of Miranda is 7.
The dexterity of Miranda is 7.
The perception of Miranda is 6.
The willpower of Miranda is 5.

Miranda is weapon user.

Section - Miranda's robe

The monk's robe is a shirt. The monk's robe is cloth.
Miranda wears monk's robe.
The description of monk's robe is "A plain and simple robe. You doubt it is useful for any purpose but modesty.".

Section - Nunchuck

The pair of nunchucks are a weapon. The pair of nunchucks is wood. Understand "nunchuck" and "nunchuk" and "nunchuks" as the pair of nunchucks.
The description of the pair of nunchucks is "These two pieces of wood with a metal chain between them can be surprisingly dangerous.".
The active parry max of the pair of nunchucks is 4.

Miranda carries the pair of nunchucks. The pair of nunchucks is readied.

Section - Stunning blow

Stunning is an action applying to one thing. Understand "stun [person]" as stunning.

Does the player mean stunning an alive person: it is very likely.
Does the player mean stunning the player: it is unlikely.

A person is either at-stun or not at-stun. A person is usually not at-stun.

A person can be sometime-stunned. [for the Stunning performance achievement]

First check stunning:
	if Power of Miranda is not granted:
		take no time;
		say "You do not have that power." instead.

Check stunning (this is the stun yourself rule):
	if the noun is the player:
		take no time;
		say "You can't bring yourself to do it." instead.

Check stunning:
	abide by the check attacking rules.

Carry out an actor stunning:
	now the actor is at-stun;
	try the actor attacking the noun instead.

A damage modifiers rule (this is the less damage when stunning rule):
	if the global attacker is at-stun:
		if the numbers boolean is true, say " - 2 (stunning)[run paragraph on]";
		decrease the damage modifier by 2.

Check Miranda attacking:
	if the stun count of the noun is 0 and Miranda is not at-stun:
		try Miranda stunning the noun instead.

Aftereffects rule (this is the stunning rule):
	if the global attacker is at-stun and the global defender is not killed:
		if the final damage is greater than 0:
			say "[if global defender is player]You are[otherwise][The global defender] is[end if] [bold type]stunned[roman type]!";
			if the global attacker is the player:
				now global defender is sometime-stunned; [for the Stunning performance achievement]
				if at least three people are sometime-stunned:
					award achievement stunning performance;
			let m be a random number between 1 and 2;
			if m is 2 and a random chance of 1 in 5 succeeds:
				now m is 3; [1: 50%, 2: 40%, 3: 10%; average 1.6 turns.]
			if the global attacker is the player:
				if a random chance of 1 in 3 succeeds:
					increase m by 1; [1: 33%, 2: 44%, 3: 20%, 4: 3%.]
			if stun count of the global defender is less than m:
				now the stun count of the global defender is m;
	now the global attacker is not at-stun.

Status rule (this is the stunned status rule):
	if the player is stunned:
		say "You are [bold type]stunned[roman type]: -2 to attack, cannot concentrate.[line break][run paragraph on]".


Section - Stunned

A person has a number called the stun count. The stun count of a person is usually 0.
Definition: a person is stunned if his stun count is greater than 0.

An attack modifiers rule:
	if the global attacker is stunned:
		let n be 2;
		if the global defender is the player and the global attacker is stunned:
			if the player is retreater or the player is runner:
				increase n by 3;
		if the numbers boolean is true, say " - [n] (stunned)[run paragraph on]";
		decrease the to-hit modifier by n.

Chance to win rule (this is the CTW stun penalty rule):
	if the global attacker is stunned:
		decrease the chance-to-win by 2.
		
Check concentrating:
	if the player is stunned:
		take no time;
		say "You feel too stunned for concentration." instead.

A standard AI action select rule (this is the do not concentrate when stunned rule):
	choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
	if the global attacker is stunned:
		decrease the Weight entry by 1000.	

Every turn (this is the stun wears off rule):
	if the main actor is stunned:
		decrease stun count of main actor by 1;
		if stun count of main actor is 0:
			if main actor is player:
				say "You are [bold type]no longer stunned[roman type].";
			otherwise if main actor is visible:
				say "[The main actor] [if the main actor is plural-named]are[otherwise]is[end if] [bold type]no longer stunned[roman type].".




Section - Miranda's Prose

A fatal flavour rule (this is the fatal Miranda rule):
	if the global defender is Miranda:
		say "'But... my adventure was only just beginning!' cries Miranda.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player Miranda rule):
	if the global attacker is the Miranda:
		say "Miranda dances on your corpse. 'This is my first step towards fame!'";
		rule succeeds.

An attack move flavour rule (this is the Miranda attacks rule):
	if the global attacker is Miranda:
		say "Miranda jumps towards [the global defender][if Miranda is at-stun], intent on stunning[end if].";
		rule succeeds.

Report an actor parrying (this is the report Miranda parry rule):
	if the actor is Miranda:
		say "Miranda attempts to ward off the attack.";
		rule succeeds.

Report an actor dodging (this is the report Miranda dodge rule):
	if the actor is Miranda:
		say "Miranda jumps aside.";
		rule succeeds.

Report an actor concentrating (this is the Miranda concentration prose rule):
	if the actor is Miranda:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "[CAP-actor] seeks the calm within." instead;
		if the concentration of the actor is 2, say "Chanting softly, Miranda aligns her spirit with the ambient energies." instead;
		if the concentration of the actor is 3, say "Miranda finishes her meditations." instead.	

Section - Power of Miranda

The power of Miranda is a power. Miranda grants power of Miranda.
The power level of power of Miranda is 1.
The command text of power of Miranda is "stun".

Absorbing power of Miranda:
	increase melee of the player by 1;
	increase defence of the player by 1;	
	increase permanent health of the player by 5;
	increase perception of the player by 1;	
	say "As Miranda dies, you feel her soul absorbed into your own body. ([bold type]Power of Miranda[roman type]: +1 attack, +1 defence, +5 health, +1 perception, and the [italic type]stun[roman type] skill.)[paragraph break]".

Repelling power of Miranda:
	decrease melee of the player by 1;
	decrease defence of the player by 1;
	decrease permanent health of the player by 5;
	decrease perception of the player by 1.

Status skill rule (this is the Miranda status skill rule):
	if the power of Miranda is granted:
		say "You have the [bold type]stun[roman type] skill: you can try to [italic type]stun[roman type] an enemy; this means you attack with a -2 damage penalty, but if you hit you will decrease the opponent's effectiveness for several rounds. [italic type](Level 1)[roman type][line break][run paragraph on]".





Chapter - Level 2 - Chain Golem

[Chain golem: when concentrating, surrounds itself with a whirling, slicing field of chains.] [Wounds inflicted by the chain golem continue to bleed?]

Section - Definitions

The chain golem is a monster. "The room is dominated by a chain golem, a moving mass of iron and copper chains, both thick and thin, that hulks in its center[if the concentration of the chain golem is not 0]. The golem is spinning [end if][if the concentration of the chain golem is 1]slowly[otherwise if the concentration of the chain golem is 2]wildly[otherwise if the concentration of the chain golem is 3]furiously[end if]."

The level of the chain golem is 2.

The chain golem is eyeless.
The chain golem is iron.
The chain golem is emotionless.

The description of the chain golem is "A hulking form made of metal chains and animated by a soul bound to it through dark magics.".


The health of the chain golem is 24.
The melee of the chain golem is 1.
The defence of the chain golem is 8.
The dexterity of the chain golem is 4.
The perception of the chain golem is 4. 

When play begins:
	let X be a random natural weapon part of the chain golem;
	now damage die of X is 2;
	now dodgability of X is 2;
	now passive parry max of X is 2;
	now active parry max of X is 3;
	now the printed name of X is "lashing chains";
	now X is ranged.
	
A whether attacking begins rule (this is the attack a spinning chain golem rule):
	if the global defender is the chain golem and the global attacker weapon is not ranged:
		if the concentration of the global defender is not 0:
			say "[if the global attacker is the player]You attempt[otherwise][The global attacker] attempts[end if] to duck under the whirling chains. ";
			let n be the concentration of the chain golem;
			increase n by 7;
			if a random chance of 1 in 2 succeeds:
				decrease n by 1;
			test the dexterity of the global attacker against n;
			if test result is false:
				let n be two times the concentration of the chain golem;
				calculate the pdr for global attacker;
				decrease n by pdr;
				if n is less than 0, now n is 0;
				unless n is 0:
					say " One of the chains catches [the global attacker] with a loud smack, dealing [bold type][n] damage[roman type][run paragraph on]";
					decrease the health of the global attacker by n;
					if the global attacker is alive:
						if the concentration of the global attacker is not zero:
							say " and breaking [possessive of the global attacker] concentration.";
							now concentration of the global attacker is 0;
						otherwise:
							say ".";
					otherwise:
						if the global attacker is the player:
							say " and killing you.";
							have an event of the chain golem killing the player;
							if the player is killed:
								end the game saying "You died valiantly, but in vain.";
							rule fails;
						otherwise:
							say ". [The global attacker] immediately dies.";
							have an event of the chain golem killing the global attacker;
							rule fails;
				otherwise:
					say " One of the chains catches [the global attacker] with a loud smack, but it deals no damage[roman type].";
			otherwise:
				say "[paragraph break]".

A damage modifiers rule (this is the chain golem damage depends on concentration rule):
	if the global attacker is the chain golem:
		if the concentration of the chain golem is not 0:
			let n be the concentration of the chain golem times 2;
			if the numbers boolean is true, say " + [n] (golem spinning)[run paragraph on]";
			increase the damage modifier by n.	

This is the new concentration damage modifier rule:
	unless global attacker is the chain golem:
		if the concentration of the global attacker is greater than 1:
			let the first dummy be 0;
			if the concentration of the global attacker is 2, now the first dummy is 2;
			if the concentration of the global attacker is 3, now the first dummy is 4;
			if the numbers boolean is true, say " + ", the first dummy, " (concentration)[run paragraph on]";
			increase the damage modifier by the first dummy.
		
The new concentration damage modifier rule is listed instead of the concentration damage modifier rule in the damage modifiers rulebook.
						
A standard AI action select rule (this is the chain golem concentration select rule):
	if the global attacker is the chain golem:
		choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
		unless a random chance of 1 in 10 succeeds:
			increase the Weight entry by 15.

[A standard AI action select rule (this is the chain golem attack select rule):
	if the global attacker is the chain golem:
		choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Combat Options;
		if concentration of the global attacker is 0:
			decrease the Weight entry by 15;
		if concentration of the global attacker is 1:
			decrease the Weight entry by 8.]


Section - Disarm power

Golem-disarming is an action applying to one thing.

First standard AI action select rule (this is the consider chain golem disarm rule):
	if the global attacker is the chain golem:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker golem-disarming the global defender;
		change the Weight entry to -1000.

Standard AI action select rule (this is the chain golem disarm rule):	
	if the global attacker is the chain golem and the global defender is the player:
		if the combat state of the global attacker is not at-React:
			if the global defender carries at least one readied weapon:
				choose row with an Option of the action of the global attacker golem-disarming the global defender in the Table of AI Combat Options;
				let X be a random readied weapon carried by the global defender;
				if X is not part of the global defender:
					increase Weight entry by 1000;
					if a random chance of 1 in 10 succeeds:
						increase Weight entry by 20.

Carry out a person golem-disarming:
	now global actor is the actor;
	say "[CAP-Actor] suddenly launches several of its chains in an attempt to grab [possessive of the noun] weapon. [italic type]";
	test the perception of the noun against 10;
	if test result is true:
		say "[roman type] [if the noun is the player]You see[otherwise][CAP-noun] sees[end if] it coming in time, and manage[if the noun is not the player]s[end if] to keep the weapon out of the golem's reach.";
	otherwise:
		let X be a random readied weapon carried by the global defender;
		say "[roman type] [if the noun is the player]You realise[otherwise][CAP-noun] realises[end if] what is happening only when it is too late, and a chain has already wrapped itself around [possessive of the noun] [X], pulls sharply, and sends the weapon flying across the room.";
		now X is not readied;
		now a random natural weapon part of the noun is readied;
		move X to the location.


Section - Prose

A fatal flavour rule (this is the fatal chain golem rule):
	if the global defender is the chain golem:
		say "The chains lash out one final time, blindly seeking prey -- but fall down limply before they can hit anyone. With thousands of hard metal clicks they start falling asunder.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player chain golem rule):
	if the global attacker is the chain golem:
		say "Smashed by the chains, your broken body is slowly dragged towards the core of the golem -- where an unmentionable fate awaits it.";
		rule succeeds.

An attack move flavour rule (this is the chain golem attack rule):
	if the global attacker is the chain golem:
		say "Several of the [if concentration of the chain golem is 1]slowly spinning [otherwise if concentration of the chain golem is 2]spinning [otherwise if concentration of the chain golem is 3]wildly spinning [end if]chains [one of]direct themselves towards[or]lash out at[or]attempt to smash themselves into[at random] [the global defender].";
		rule succeeds.

Report an actor parrying (this is the report chain golem parry rule):
	if the actor is the chain golem:
		say "The chain golem lashes out with a heavy iron chain, trying to stop the attack.";
		rule succeeds.

Report an actor dodging (this is the report chain golem dodge rule):
	if the actor is the chain golem:
		say "The chain golem attempts to squirm out of the way.";
		rule succeeds.

Report an actor concentrating (this is the chain golem concentration prose rule):
	if the actor is the chain golem:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "[CAP-actor] starts rotating slowly, spinning its chains around its core." instead;
		if the concentration of the actor is 2, say "[CAP-actor] speeds up, its chains whirling through the air." instead;
		if the concentration of the actor is 3, say "[CAP-actor] spins even faster, audibly slashing the air with its whip-like metal appendages." instead.	

Lose concentration prose rule (this is the chain golem lose concentration prose rule):
	if the concentration loser is the chain golem:
		say "Unbalanced by the hit, the chain golem [bold type]stops spinning[roman type]." instead.


Section - Power


The power of the chains is a power. Chain golem grants power of the chains.
The power level of power of the chains is 2.
The command text of power of the chains is "lash".

Absorbing power of the chains:
	increase melee of the player by 2;
	increase inherent damage modifier of the player by 2;
	increase defence of the player by 1;
	increase permanent health of the player by 12;
	say "As the chain golem bursts apart into its constituent links, you feel the soul that animated it absorbed into your own body. ([bold type]Power of the chains[roman type]: +2 attack, +2 damage, +1 defence, +12 health, and the [italic type]lash[roman type] skill.)[paragraph break]".

Repelling power of the chains:
	decrease melee of the player by 2;
	decrease inherent damage modifier of the player by 2;
	decrease defence of the player by 1;
	decrease permanent health of the player by 12.
	
Chapter - Ability - Lashing

Lashing is an action applying to nothing. Understand "lash" and "lash out" as lashing.

Check lashing:
	if power of the chains is not granted:
		take no time;
		say "You do not possess that power." instead.

Check lashing:
	if the combat state of the actor is not at-React:
		take no time;
		say "You can only lash as a reaction to an attack." instead.

Carry out lashing:
	choose a blank row in the Table of Stored Combat actions;
	now the Combat Speed entry is a random number between 8 and 14;
	now the Combat Action entry is the action of the actor attacking the provoker of the actor;
	say "You will attempt to strike swiftly, before you are hit.".


Status skill rule (this is the chain golem power status skill rule):
	if power of the chains is granted:
		say "You can [bold type]lash out[roman type] as a reaction. This counterattack will sometimes, but not always, happen before the enemy hits you. [italic type](Level 2)[roman type][line break][run paragraph on]".







Chapter - Level 2 - Jumping Bomb

Section - Definitions

A jumping bomb is a monster. "A skull-sized ball of gooish, undulating flesh jumps up and down [if concentration of the jumping bomb is 0]ponderously[otherwise if concentration of the jumping bomb is 1]slowly[otherwise if concentration of the jumping bomb is 2]quickly[otherwise if concentration of the jumping bomb is 3]frantically[end if]. It is a jumping bomb, [unless concentration of the jumping bomb is 3]gathering speed and[end if] preparing to launch itself at one of its enemies."

Understand "ball" and "flesh" and "meat" as the jumping bomb.

The level of jumping Bomb is 2.

The jumping bomb is eyeless.
The jumping bomb is emotionless.

The description of the jumping bomb is "Connoisseurs consider these jumping balls of red meat to be among the most exciting spectacles of Yahvinna's annual Feast of Flesh. To the slaves and convicts down in the arena, whose limbs the spectators hope to have blown into their lap, the jumping bombs also bring excitement, though of a wholly different type.".

The health of the jumping bomb is 18.
The melee of the jumping bomb is -1.
The defence of the jumping bomb is 8.
The dexterity of the jumping bomb is 6.
The perception of the jumping bomb is 4. 
The willpower of the jumping bomb is 6.

When play begins:
	if difficulty is 0:
		decrease melee of the jumping bomb by 1. [Too hard for new players.]

When play begins:
	let X be a random natural weapon part of the jumping bomb;
	now dodgability of X is 3;
	now passive parry max of X is 0;
	now active parry max of X is 0;
	now printed name of X is "bomb's detonating surface".

Initiative rule (this is the jumping bomb slightly less initiative rule):
	if the jumping bomb is enclosed by the location:
		if a random chance of 1 in 5 succeeds:
			decrease the initiative of the jumping bomb by 1.

A standard AI action select rule (this is the jumping bomb attack select rule):
	if the global attacker is the jumping bomb:
		choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Combat Options;
		if concentration of the global attacker is less than 2:
			decrease the Weight entry by 100;
		if concentration of the global attacker is 2:
			decrease the Weight entry by 5.

A standard AI action select rule (this is the jumping bomb concentration select rule):
	if the global attacker is the jumping bomb:
		choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
		increase the Weight entry by 5;
		if the combat state of the jumping bomb is at-React:
			decrease Weight entry by 500.
		
A standard AI action select rule (this is the jumping bomb parrying select rule):
	if the global attacker is the jumping bomb:
		choose row with an Option of the action of the global attacker parrying in the Table of AI Combat Options;
		decrease the Weight entry by 100.

An immediate results of hitting rule (this is the jumping bomb kamikaze rule):
	if the global attacker is the jumping bomb:
		say "[roman type]When the jumping bomb hits [the global defender], it explodes with a terrible bang. [if the global defender is the player]Not all the king's horses nor all the king's men will be able to put the thousand pieces of your body back together[otherwise][The global defender] is killed instantly[end if][italic type].";
		now the health of the global attacker is -10;
		now the health of the global defender is -10;
		have an event of the global attacker killing the global defender;		
		if the player is not alive:
			end the game saying "You exploded.";
			rule fails.

An attack modifiers rule (this is the jumping bomb concentration attack modifier rule):
	if the global attacker is the jumping bomb:
		if the concentration of the global attacker is greater than 0:
			let n be 2 times the concentration of the global attacker;
			if the numbers boolean is true, say " - ", n, " (lower concentration bonus for jumping bomb)[run paragraph on]";
			decrease the to-hit modifier by n.
			
An attack modifiers rule (this is the jumping bomb concentration defence modifier rule):
	if the global defender is the jumping bomb:
		if the concentration of the global defender is greater than 0:
			let n be the concentration of the global defender;
			if the numbers boolean is true, say " - ", n, " (speed of the jumping bomb)[run paragraph on]";
			decrease the to-hit modifier by n.	

Chance to win rule (this is the CTW bomb penalty rule):
	if the global defender is the jumping bomb:
		if the concentration of the global defender is greater than 0:
			decrease the chance-to-win by the concentration of the global defender.


Section - Prose


A fatal flavour rule (this is the fatal jumping bomb rule):
	if the global defender is the jumping bomb:
		say "As the last of its blood flows out of the jumping bomb, it goes limp and falls to the floor like a punctured balloon.";
		rule succeeds.

An attack move flavour rule (this is the jumping bomb attack rule):
	if the global attacker is the jumping bomb:
		say "Suddenly changing its direction, the jumping bomb launches itself towards [the global defender] -- threatening instant death upon contact.";
		rule succeeds.


Report an actor dodging (this is the report jumping bomb dodge rule):
	if the actor is the jumping bomb:
		say "The jumping bomb attempts to bump out of the way.";
		rule succeeds.

Report an actor concentrating (this is the jumping bomb concentration prose rule):
	if the actor is the jumping bomb:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "[CAP-actor] jumps up and down a little bit faster." instead;
		if the concentration of the actor is 2, say "[CAP-actor] speeds up, and is now bumping around energetically." instead;
		if the concentration of the actor is 3, say "[CAP-actor] accelerates yet further, your image of it dissolving almost into a blur." instead.	

Lose concentration prose rule (this is the jumping bomb lose concentration prose rule):
	if the concentration loser is the jumping bomb:
		say "Knocked back by the hit, the jumping bomb [bold type]loses most of its speed[roman type]." instead.


Section - Power


The power of the bomb is a power. Jumping bomb grants power of the bomb.
The power level of power of the bomb is 2.
The command text of power of the bomb is "explode on death".

Absorbing power of the bomb:
	increase melee of the player by 2;
	increase defence of the player by 2;
	increase permanent health of the player by 10;
	say "As the bomb deflates, you feel its insane, beastly soul absorbed into your own body. ([bold type]Power of the bomb[roman type]: +2 attack, +2 defence, +10 health, and you will now [italic type]explode[roman type] when killed, giving you a last chance to defeat your enemy and perhaps absorb his soul in the process.)[paragraph break]".

Repelling power of the bomb:
	decrease melee of the player by 2;
	decrease defence of the player by 2;
	decrease permanent health of the player by 10.



Section - Explode

Killing rule (this is the explode after death rule):
	if the killed-guy is the player:
		if the killer-guy is not killed:
			if power of the bomb is granted:
				let n be level of the killer-guy;
				now n is n times 2;
				increase n by a random number between 0 and 4;
				if health of the killer-guy is not greater than n:
					say "Your body explodes vehemently, killing [the killer-guy][if the level of the killer-guy is 0]. Unfortunately, [the killer-guy] is levelless and cannot heal you[otherwise if the level of the killer-guy is 5]. Your soul attempts to swallow that of your enemy, but [the killer-guy] is quicker and far more powerful, swallowing yours and thus coming back to life. You, however, are destroyed for all eternity[otherwise]! As your soul swallows that of your enemy whole, you feel your body reconstituting itself[end if].[paragraph break]";
					if the level of the killer-guy is not 0 and the level of the killer-guy is not 5:
						now the health of the player is 1;
						now the health of the killer-guy is -1;
						have an event of the player killing killer-guy;
				otherwise:
 					say "Your body explodes vehemently, but [the killer-guy] survives the blast.[paragraph break]".
		
Status skill rule (this is the jumping bomb power status skill rule):
	if power of the bomb is granted:
		say "When you die, you [bold type]explode[roman type], dealing as much damage to your enemy as the enemy dealt to you. This gives you a last chance to kill your enemy, and perhaps absorb his soul and come back to life in the process. [italic type](Level 2)[roman type][line break][run paragraph on]".







Chapter - Level 2 - The reaper


Section - Definitions

The Reaper is a male monster. The reaper is not neuter. "A pale man in dark robes[if the reaper carries a readied scythe], wielding a huge scythe,[end if] stands here. It is the Reaper, a serial killer who believes he is Death himself."

Understand "pale" and "man" and "dark" and "robes" and "serial" and "killer" and "him" as the Reaper.

The level of the Reaper is 2.

The description of the reaper is "He once used to be a man like any other, but his vocation has left him unnaturally pale and gaunt.".

The health of the Reaper is 24.
The melee of the Reaper is 1.
The defence of the Reaper is 8.

When play begins:
	let X be a random natural weapon part of the Reaper;
	now printed name of X is "Reaper's knuckles".

The reaper is weapon user.


Section - Reaper's scythes of flame, slaying and oxidation

The scythe of flaming is a scythe. The description of the scythe of flaming is "Enchanted with a spell of heat, this scythe always remains unnaturally hot.".
The internal heat of scythe of flaming is 3.

The scythe of slaying is a scythe. The scythe of slaying is silver. The description of the scythe of slaying is "Ages ago, the monks of Averoigne forged these weapons, imbuing them with powerful enchantments against the living dead.".

A damage modifiers rule (this is the scythe of slaying deals great damage to undead rule):
	if global attacker weapon is the scythe of slaying and global defender is undead:
		if the numbers boolean is true, say " + 5 (slaying undead)[run paragraph on]";
		increase the damage modifier by 5.

The special weapon info of the scythe of slaying is "; massive damage against undead[run paragraph on]".

The scythe of oxidation is a scythe. The scythe of oxidation is iron. The scythe of oxidation is rusted. The description of the scythe of oxidation is "Some entropic demon or deity has given this scythe the ability to rust the opponent's weapons in combat.".

The special weapon info of the scythe of oxidation is "; rusts weapons[run paragraph on]".

An aftereffects rule (this is the scythe of oxidation rusts stuff rule):
	if the global attacker weapon is the scythe of oxidation:
		if the global defender is at parry and the final damage is 0:
			if the global defender weapon is iron and the global defender weapon is not rusted:
				say "Having been in contact with the scythe of oxidation, [the global defender weapon] [bold type]rusts[roman type].";
				now the global defender weapon is rusted;
	if the global defender weapon is the scythe of oxidation:
		if the global defender is at parry and the final damage is 0:
			if the global attacker weapon is iron and the global attacker weapon is not rusted and the passive parry max of the global attacker weapon is not 0:
				if the global attacker weapon is not a part of the global attacker:
					say "Having been in contact with the scythe of oxidation, [the global attacker weapon] [bold type]rusts[roman type].";
					now the global attacker weapon is rusted;
				otherwise:
					if the global defender is not rusted and the global defender is alive:
						say "Having hit the scythe of oxidation, [the global defender] [bold type]rusts[roman type]!";			
						now the global defender is rusted;
	if the global attacker weapon is the scythe of oxidation:
		if the global defender is iron and the final damage is greater than 0:
			if the global defender is not rusted and the global defender is alive:
				say "Having been hit with the scythe of oxidation, [the global defender] [bold type]rusts[roman type]!";			
				now the global defender is rusted.

First when play begins (this is the Reaper carries a random scythe rule): [first, to stop game from readying another weapon]
	let m be a random number between 1 and 3;
	if m is 1:
		move the scythe of flaming to the Reaper;
		now the scythe of flaming is readied;
	if m is 2:
		move the scythe of slaying to the Reaper;
		now the scythe of slaying is readied;
	if m is 3:
		move the scythe of oxidation to the Reaper;
		now the scythe of oxidation is readied.

Section - The Reaper follows you!

Every turn when the Reaper is in the location and the Reaper is not follower (this is the Reaper starts following rule):
	if the player is not hidden:
		say "'Do not be afraid, for I will end your suffering!' the Reaper exclaims.";
		now Reaper is follower.
	
Follower percentile chance of the Reaper is 5.

When play begins:
	if difficulty is 0:
		now follower percentile chance of the Reaper is 0. [Too confusing for new players.]

Section - Prose

A fatal flavour rule (this is the fatal Reaper rule):
	if the global defender is the Reaper:
		say "'This -- but this is impossible! Death is me!' the Reaper shouts as the bony hands of disillusion pull him to the underworld.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player Reaper rule):
	if the global attacker is the Reaper:
		say "'Now go to sleep, my child,' says the Reaper. 'You have suffered enough.'";
		rule succeeds.

An attack move flavour rule (this is the Reaper attack rule):
	if the global attacker is the Reaper:
		say "The Reaper advances towards [the global defender][one of][or], with a skulllike grin[or], saying 'Et in Arcadia ego!' in a booming voice[as decreasingly likely outcomes].";
		rule succeeds.

Report an actor dodging (this is the report Reaper dodge rule):
	if the actor is the Reaper:
		say "'Nobody can touch Death!' says the Reaper as he ducks away.";
		rule succeeds.

Report an actor concentrating (this is the Reaper concentration prose rule):
	if the actor is the Reaper:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "[CAP-actor] contemplates the meaning of Death." instead;
		if the concentration of the actor is 2, say "[CAP-actor] immerses himself further into his meditations on mortality." instead;
		if the concentration of the actor is 3, say "'I see your end!' the Reaper announces as he finishes his contemplations." instead.	


Section - Power


The power of the Reaper is a power. Reaper grants power of the Reaper.
The power level of power of the Reaper is 2.
The command text of power of the Reaper is "reap".

Absorbing power of the Reaper:
	increase melee of the player by 2;
	increase defence of the player by 2;
	increase permanent health of the player by 10;
	say "As the Reaper dies, his twisted mind becomes one with yours. ([bold type]Power of the Reaper[roman type]: +2 attack, +2 defence, +10 health; and since Death attends on us all, you can now [italic type]reap[roman type] any non-undead person you have seen, instantly teleporting to their location.)[paragraph break]".

Repelling power of the Reaper:
	decrease melee of the player by 2;
	decrease defence of the player by 2;
	decrease permanent health of the player by 10.

Status skill rule (this is the Reaper power status skill rule):
	if power of the Reaper is granted:
		say "You partake of the omnipresence of Death. You can [bold type]reap[roman type] anyone you have seen, which will instantly teleport you to their location -- although Death will assert his power over you in the process. [italic type](Level 2)[roman type][line break][run paragraph on]".	

Section - Reaping

Reaping is an action applying to one thing. Understand "reap [any person]" as reaping.

[Thanks Aaron A. Reed, for the following two bits code -- Stolen from Remembering]

The allow reaping faraway things rule is listed instead of the basic accessibility rule in the action-processing rules.

This is the allow reaping faraway things rule:
    unless reaping, abide by the basic accessibility rule.

[End stealing from Aaron.]

Does the player mean reaping an alive person: it is likely.
Does the player mean reaping a seen person: it is likely.

Check reaping (this is the need the Power of the Reaper rule):
	unless Power of the Reaper is granted:
		take no time;
		say "You do not have that power." instead.

Check reaping (this is the cannot reap the unseen rule):
	if the noun is not seen:
		take no time;
		say "You have not yet seen [the noun]." instead.

Check reaping (this is the cannot reap the undead rule):
	if the faction of the noun is undead:
		take no time;
		say "The undead are no longer haunted by Death, so you cannot reap them." instead.

Check reaping (this is the cannot reap yourself rule):
	if the noun is the player:
		take no time;
		say "You cannot do that to yourself." instead.

Check reaping (this is the reaping a dead person rule):
	if the noun is killed:
		end the story saying "Your dedication to Death went too far.";
		say "You are instantly transported to the Land of the Dead, where [no dead property][the noun][dead property] currently resides." instead.

Check reaping (this is the reaping with one health rule):
	if the health of the player is 1:
		end the story saying "Your dedication to Death went too far.";
		say "You attempt to reap [the noun], but the strain is too much for your weak body." instead.

Carry out reaping:
	repeat with guy running through persons in the location:
		now concentration of guy is 0;
	decrease health of the player by greatest power of the player;
	decrease permanent health of the player by greatest power of the player;
	unless teleportation is impossible for the player:
		let destination be the location of the noun;
		say "You live in the aging cells of an infant's face, and your voice can be heard in the silence after each heartbeat. Death attends on us always, and in his guise you find yourself poised to reap [the noun] --[paragraph break]";
		now retreat location is destination;
		move player to destination;
		now the take no time boolean is false;
	otherwise:
		say "Something prevents you from teleporting.".





Chapter - Level 3 - Mindslug

A mindslug is a monster. "A vast slug covered in green ooze has positioned itself in this room."

Understand "slug" and "master" and "ooze" as the mindslug.

The level of the mindslug is 3.

The description of the mindslug is "It is of the dreaded race of mindslugs, abominations that use their telepathic powers to enslave others.".

The health of the mindslug is 27.
The melee of the mindslug is 2.
The defence of the mindslug is 7.
The dexterity of the mindslug is 3.
The perception of the mindslug is 7. 
The willpower of the mindslug is 11.

When play begins:
	let X be a random natural weapon part of the mindslug;
	now dodgability of X is 3;
	now passive parry max of X is 2;
	now active parry max of X is 0;
	now printed name of X is "slug's crushing body".

Section - Mind blast action

Mindblasting is an action applying to one thing.

enslaved is a faction.

[After printing the name of a enslaved person:
	say " (enslaved)".]

When play begins:
	now enslaved hates friendly;
	now friendly hates enslaved.

First standard AI action select rule (this is the consider mindblasting rule):
	choose a blank Row in the Table of AI Combat Options;
	change the Option entry to the action of the global attacker mindblasting the global defender;
	change the Weight entry to -1000.
		
Standard AI action select rule (this is the only the mindslug considers mindblasting rule):
	choose row with an Option of the action of the global attacker mindblasting the global defender in the Table of AI Combat Options;
	if the global attacker is the mindslug:
		if the combat state of the global attacker is not at-React:
			change the Weight entry to 12;
		otherwise:
			change the Weight entry to -1000.

Standard AI action select rule (this is the mindslug dislikes attacking rule):
	choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Combat Options;
	if the global attacker is the mindslug:
		decrease the Weight entry by 3.
		
Standard AI action select rule (this is the mindslug doesnt dodge rule):
	choose row with an Option of the action of the global attacker dodging in the Table of AI Combat Options;
	if the global attacker is the mindslug:
		decrease the Weight entry by 100.		

Standard AI action select rule (this is the mindslug does not always mindblast rule):
	choose row with an Option of the action of the global attacker mindblasting the global defender in the Table of AI Combat Options;
	if the global attacker is the mindslug:
		if a random chance of 3 in 5 succeeds:
			decrease the Weight entry by 100.
		
Carry out the mindslug mindblasting:
	say "The mindslug blasts [the global defender] with psionic energy. [italic type]";
	let n be 10;
	increase n by concentration of the mindslug;
	test the willpower of the global defender against n; 
	say "[roman type]";
	if test result is true:
		say " [if the global defender is the player]You resist[otherwise][The global defender] resists[end if] the mindslug's influence!";
	otherwise:
		decrease willpower of the global defender by 1;
		say " [if the global defender is the player]You fail[otherwise][The global defender] fails[end if] to resist the mindslug's mental blast, and [possessive of the global defender] willpower decreases to [willpower of the global defender].";
		if willpower of the global defender is less than 1:
			if the global defender is the player:
				end the game saying "You will live on as the unquestioning slave of a giant slug.";
			otherwise:
				now the faction of the global defender is enslaved;
				say "[The global defender] is now under the control of the mindslug.";
		otherwise:
			if the concentration of the global defender is greater than 0:
				let the global defender lose concentration;
	now the concentration of the mindslug is 0.
		
A standard AI target select rule (this is the mindslug prefers low willpower rule):
	choose row stored_row in Table of AI Combat Person Options;
	if the global attacker is the mindslug:
		decrease the Weight entry by the willpower of stored_person.

Section - Prose


A fatal flavour rule (this is the fatal mindslug rule):
	if the global defender is the mindslug:
		say "A mental oppression falls from your mind as the mindslug succumbs to its injuries, its evil intelligence snuffed.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player mindslug rule):
	if the global attacker is the mindslug:
		say "The mindslug crashes on top of you, burying your body under tons of oozing gastropod flesh.";
		rule succeeds.

An attack move flavour rule (this is the mindslug attack rule):
	if the global attacker is the mindslug:
		say "Raising its hideous body, the mindslug bears down on [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report mindslug dodge rule):
	if the actor is the mindslug:
		say "The mindslug oozes out of the way.";
		rule succeeds.

Section - Slaves

Fafhrd is a enslaved man. The description of Fafhrd is "This male barbarian is strong and muscular. He looks like an able and shrewd fighter.".

Health of Fafhrd is 13.
Melee of Fafhrd is 1.

When play begins:
	let X be a random natural weapon part of Fafhrd;
	now printed name of X is "Fafhrd's fists".

Fafhrd carries a sword called Fafhrd's sword. The description of Fafhrd's sword is "It looks like a normal sword that has seen a lot of use."

Follower percentile chance of Fafhrd is 75.
Fafhrd is weapon user.

Mouser is a enslaved man. The description of Mouser is "Mouser is a small, fast man. You know his type from the alleys and alehouses of Montenoir.".

Mouser carries a sword called Mouser's sword. The description of Mouser's sword is "A relatively short sword."

Health of Mouser is 8.
Defence of Mouser is 9.

When play begins:
	let X be a random natural weapon part of Mouser;
	now printed name of X is "Mouser's fists".

Follower percentile chance of Mouser is 85.
Mouser is weapon user.

When play begins:
	if mindslug is not off-stage:
		move Fafhrd to the location of mindslug;
		move Mouser to the location of mindslug.

An attack modifiers rule (this is the mindslug defended by the enslaved rule):
	if the global defender is the mindslug and the global attacker is not hidden:
		let n be the number of enslaved persons in the location;
		if n greater than 0:
			let m be n + 1;
			let m be n times m;
			if the numbers boolean is true, say " - ", m, " (defended by slaves)[run paragraph on]";
			decrease the to-hit modifier by m.

Chance to win rule (this is the CTW mindslug enslaved penalty rule):
	if the global defender is the mindslug:
		let n be the number of enslaved persons in the location;
		if n greater than 0:
			let m be n + 1;
			let m be n times m;		
			decrease the chance-to-win by m.

An attack modifiers rule (this is the enslaved have bad defence rule):
	if the global defender is enslaved:
		if the numbers boolean is true, say " + 2 (defender uninterested in own safety)[run paragraph on]";
		increase the to-hit modifier by 2.

Chance to win rule (this is the CTW enslaved bonus rule):
	if the global defender is enslaved:
		increase the chance-to-win by 2.

Every turn (this is the free slaves of the mindslug when it is killed rule):
	if the number of enslaved alive persons in the location is greater than 0 and the mindslug is killed:
		repeat with guy running through enslaved alive persons in the location:
			now guy is friendly;
			if player is not undead:
				if guy is Fafhrd:
					say "'Thanks, man,' says Fafhrd. 'I guess you have earned yourself some help.'[paragraph break]";
				if guy is Mouser:
					say "'I knew we shouldn't have trusted Ningauble,' Mouser states. 'Let's get out of here as quickly as possible.'[paragraph break]";
				if guy is not Fafhrd and guy is not Mouser:
					say "[The guy] is freed from the mindslug's influence.[paragraph break]"

Check an actor attacking when the fight consequences variable is true (this is the slaves may be freed from mindslug rule):
	if the actor is enslaved:
		consider the free slaves of the mindslug when it is killed rule;
		if actor is not enslaved:
			do nothing instead.
		

Section - Prose for Fafhrd and Mouser

A fatal flavour rule (this is the fatal Fafhrd rule):
	if the global defender is the Fafhrd:
		say "Cursing his fate, Fafhrd falls down[if Mouser is alive and the faction of Mouser is not enslaved and Mouser is in the location]. 'Fafhrd!' screams Mouser[do the mouser rage][end if].";
		rule succeeds.

To say do the mouser rage:
	increase melee of Mouser by 2;
	decrease defence of Mouser by 1;
	if global attacker is the player:
		now faction of Mouser is hostile.

A fatal player flavour rule (this is the fatal player Fafhrd rule):
	if the global attacker is the Fafhrd:
		say "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face.";
		rule succeeds.

An attack move flavour rule (this is the Fafhrd attack rule):
	if the global attacker is the Fafhrd:
		say "Fafhrd rushes towards [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report Fafhrd dodge rule):
	if the actor is the Fafhrd:
		say "Fafhrd ducks aside.";
		rule succeeds.

Report an actor parrying (this is the report Fafhrd parry rule):
	if the actor is the Fafhrd:
		say "Fafhrd raises his weapon to stop the blow.";
		rule succeeds.

A fatal flavour rule (this is the fatal Mouser rule):
	if the global defender is the Mouser:
		say "Mouser staggers backwards, mortally wounded. He tries to say something, but no sound ever passes his lips again[if Fafhrd is alive and the faction of Fafhrd is not enslaved and Fafhrd is in the location]. 'Vengeance!' screams Fafhrd[do the fafhrd rage][end if].";
		rule succeeds.

To say do the Fafhrd rage:
	increase melee of Fafhrd by 2;
	decrease defence of Fafhrd by 1;
	if global attacker is the player:
		now faction of Fafhrd is hostile.

A fatal player flavour rule (this is the fatal player Mouser rule):
	if the global attacker is the Mouser:
		say "As you fall down, Mouser shrugs somewhat apologetically.";
		rule succeeds.

An attack move flavour rule (this is the Mouser attack rule):
	if the global attacker is the Mouser:
		say "Fast as a snake, Mouser lashes out at [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report Mouser dodge rule):
	if the actor is the Mouser:
		say "Deftly, Mouser rolls aside to avoid the attack.";
		rule succeeds.

Report an actor parrying (this is the report Mouser parry rule):
	if the actor is the Mouser:
		say "Mouser tries to parry the blow.";
		rule succeeds.

Last report talking to Fafhrd when Fafhrd is friendly:
		say "Fafhrd shrugs.".
		
Last report talking to Mouser when Mouser is friendly:
		say "Mouser raises one his eyebrows.".
		

Section - Power of the Mindslug


The power of the mindslug is a power. Mindslug grants power of the mindslug.
The power level of power of the mindslug is 3.
The command text of power of the mindslug is "dominate".

Absorbing power of the mindslug:
	increase melee of the player by 3;
	increase defence of the player by 3;
	increase permanent health of the player by 15;
	increase willpower of the player by 4;
	say "As the mindslug dies, you feel its powerful intelligence absorbed into your own body. ([bold type]Power of the mindslug[roman type]: +3 attack, +3 defence, +15 health, +4 willpower, and you can attempt to [italic type]dominate[roman type] an enemy.)[paragraph break]";
	make slaves followers.

Repelling power of the mindslug:
	decrease melee of the player by 3;
	decrease defence of the player by 3;
	decrease permanent health of the player by 15;
	decrease willpower of the player by 4;
	unmake slaves followers.

To make slaves followers:
	now Fafhrd is follower;
	now Mouser is follower.

To unmake slaves followers:
	now Fafhrd is not follower;
	now Mouser is not follower.

Section - Dominating

Domination relates various people to various people.

The verb to dominate (he dominates, they dominate, he dominated, it is dominated, he is dominating) implies the domination relation.

Dominating is an action applying to one thing. Understand "dominate [something]" and "dom [something]" as dominating.

Does the player mean dominating an alive person: it is very likely.
Does the player mean dominating the player: it is unlikely.

Check dominating (this is the need the Power of the Mindslug rule):
	unless Power of the Mindslug is granted:
		take no time;
		say "You do not have that power." instead.

Check dominating (this is the only dominate people rule):
	if the noun is not a person:
		say "You spend some time trying to impress an inanimate object." instead.

Check dominating (this is the only dominate enemies rule):
	if the faction of the player does not hate the faction of the noun:
		take no time;
		say "You can only dominate enemies." instead.

Check dominating (this is the already dominating rule):
	if the player dominates the noun:
		take no time;
		say "You already dominate [the noun]." instead.

Check dominating (this is the cannot dominate the emotionless rule):
	if the noun is emotionless:
		say "You attempt to impress [the noun], but provoke no reaction at all." instead.

Check dominating (this is the dominated rule):
	if the noun dominates the player:
		take no time;
		say "You are too afraid of [the noun] to try that!" instead.

Carry out dominating:
	let n be 50 times the health of the noun; [50 * HN]
	now n is n divided by the health of the player; [(50 * HN) / HP]
	increase n by 5 times willpower of the noun;
	decrease n by 5 times willpower of the player; [((50 * HN) / HP) + 5 * (WN - WP)] [= 50 when everything is identical.]
	if n is less than 10, now n is 10;
	if n is greater than 90, now n is 90;
	let m be a random number between 1 and 100;
	if m is greater than n:
		say "[The noun] cower[unless noun is plural-named]s[end if] before your imposing presence.";
		now player dominates the noun;
	otherwise:
		say "You attempt to dominate [the noun], but suddenly feel very afraid!";
		now noun dominates the player.

An attack modifiers rule (this is the domination attack modifier rule):
	if the global defender dominates the global attacker:
		if the numbers boolean is true, say " - 2 (afraid of [the global defender])[run paragraph on]";
		decrease the to-hit modifier by 2.

Chance to win rule (this is the CTW domination penalty rule):
	if the global defender dominates the global attacker:
		decrease the chance-to-win by 2.

An aftereffects rule (this is the domination stops after a hit rule):
	if the global defender dominates the global attacker and the final damage is greater than 0:
		now the global defender does not dominate the global attacker;
		say "[CAP-attacker] no longer fear[unless global attacker is plural-named or the global attacker is the player]s[end if] [the global defender].".

Status rule (this is the domination status rule):
	if at least one alive person is dominated by the player:
		say "You [bold type]dominate[roman type]: [list of alive persons dominated by the player with definite articles].[line break][run paragraph on]";
	if at least one alive person dominates the player:
		say "You are [bold type]dominated[roman type] by: [list of alive persons dominating the player with definite articles].[line break][run paragraph on]".

Status skill rule (this is the domination status skill rule):
	if the power of mindslug is granted:
		say "You can attempt to [bold type]dominate[roman type] enemies, which will give them an attack penalty against you that only disappears when they successfully hit you. If the attempt fails, the enemy dominates you instead. Weaker enemies are easier to dominate. [italic type](Level 3)[roman type][line break][run paragraph on]".




Chapter - Level 3 - Giant tentacle

The giant tentacle is a monster. "A single giant tentacle guards against intruders."

The description of the giant tentacle is "Aeons ago, the Knight of the Dawn fought and killed a great tentacled horror known as Tooloo. So great was Tooloo's tenacity, however, that each of his tentacles continued to live on separately -- and this is one of them.".

The level of giant tentacle is 3.

The health of giant tentacle is 35.
The melee of giant tentacle is 4.
The defence of giant tentacle is 10.
The dexterity of giant tentacle is 10.
The perception of giant tentacle is 6. 
The willpower of giant tentacle is 6.

When play begins:
	let X be a random natural weapon part of giant;
	now printed name of X is "tentacle";
	now the damage die of X is 0.

The giant tentacle is eyeless.

Section - The tentacle grapples

Grappling relates one person to another. The verb to grapple (he grapples, they grapple, he grappled, it is grappled, he is grappling) implies the grappling relation. 

An immediate results of hitting rule (this is the tentacle grapples rule):
	if the global attacker is the giant tentacle:
		say "The giant tentacle [bold type]wraps itself around[italic type] [the global defender]!";
		now giant tentacle grapples the global defender.

Standard AI action select rule (this is the tentacle attacks only when not grappling rule):
	choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Combat Options;
	if the global attacker is the giant tentacle:
		if the giant tentacle grapples the global defender:
			decrease the Weight entry by 1000;
		otherwise:
			increase the Weight entry by 3.

A standard AI target select rule (this is the tentacle prefers the grappled person rule):
	choose row stored_row in Table of AI Combat Person Options;
	if the global attacker is the giant tentacle:
		if the giant tentacle grapples stored_person:
			increase the Weight entry by 1000.

Check going (this is the cannot go when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to run away!" instead.

Check wearing (this is the cannot wear when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to fiddle with your clothing." instead.

Check taking off (this is the cannot take off when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to fiddle with your clothing." instead.

Check taking (this is the cannot take when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to reach [the noun]." instead.

Check entering (this is the cannot enter when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to move." instead.

Check exiting (this is the cannot exit when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to move." instead.

Check taking inventory (this is the cannot take inventory when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		take no time;
		say "Caught in [the X], you are unable to get a good look at your possessions!" instead.
		
Check attacking (this is the cannot attack when grappled rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		unless the noun is X:
			take no time;
			say "Caught in [the X], you are unable to attack anyone else." instead.
	
An aftereffects rule (this is the tentacle lets go when damaged rule):
	if the global defender is the giant tentacle and the final damage is greater than 0:
		if the giant tentacle grapples someone and the giant tentacle is alive:
			let X be a random person grappled by the giant tentacle;
			say "Recoiling in pain, the giant tentacle [bold type]lets go[roman type] of [the X].";
			now giant tentacle does not grapple X;
			now constriction level is 0.

Every turn (this is the reset grappling after going rule):
	if the location of the player is not the location of the giant tentacle:
		now constriction level is 0;
		if the giant tentacle grapples someone:
			let X be a random person grappled by the giant tentacle;
			now giant tentacle does not grapple X.

Status rule (this is the grappled status rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		say "You are [bold type]grappled[roman type] by [the X].[line break][run paragraph on]".
		
A sudden combat reset rule (this is the sudden grapple reset rule):
	repeat with guy running through alive persons in the location:
		while someone grapples guy:
			let X be a random person grappling guy;
			now X does not grapple guy.

An impeded movement rule (this is the being grappled impedes movement rule):
	if someone grapples the test subject:
		rule fails.

Section - and the tentacle constricts

Tentacle-constricting is an action applying to nothing.

Constriction level is a number that varies. Constriction level is 0.

First standard AI action select rule (this is the consider tentacle-constricting rule):
	if the global attacker is the giant tentacle:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker tentacle-constricting;
		if the combat state of giant tentacle is at-Act:
			change the Weight entry to 0;
		otherwise:
			change the weight entry to -100.
		
Standard AI action select rule (this is the tentacle constricts when grappling rule):
	if the global attacker is the giant tentacle:
		choose row with an Option of the action of the global attacker tentacle-constricting in the Table of AI Combat Options;
		unless the giant tentacle grapples the global defender:
			decrease the Weight entry by 1000;
		otherwise:
			increase the Weight entry by 15.

Clothing has a number called the constriction prevention. The constriction prevention of clothing is usually 0.

Definition: clothing (called item) is constriction-preventing if the constriction prevention of item is greater than 0.


Carry out the giant tentacle tentacle-constricting:
	increase constriction level by 1; [constricts tighter]
	let n be constriction level;
	let m be 0;	
	let preventer be a random clothing;
	if global defender wears at least one constriction-preventing clothing:
		let i be 0;
		repeat with item running through clothing worn by global defender:
			increase m by constriction prevention of item;
			unless i is greater than constriction prevention of item:
				now preventer is item;
			now i is constriction prevention of item; [at the end of the repeat, preventer is the item with the largest constriction prevention]
	if n is greater than m: [constriction prevention < constriction level: normal damage]
		decrease health of global defender by constriction level;
		if m is greater than 0:
			remove preventer from play; [and the preventing item gets smashed]
		say "[no dead property]The giant tentacle tightens its muscles, dealing [bold type][constriction level] damage[roman type] to [the global defender][dead property][if m is greater than 0]. [The preventer] get[end if][if m is greater than 0 and preventer is not plural-named]s[end if][if m is greater than 0] smashed in the process[end if].";
		if the global defender is killed:
			have an event of the giant tentacle killing the global defender;
		if the player is killed, end the story saying "You suffocate in the tentacle's deadly embrace.";
	otherwise: [constriction prevention >= constriction level: no damage]
		say "The giant tentacle tightens its muscles, but the [preventer] protect[unless preventer is plural-named]s[end if] [the global defender] against the pressure.".

Section - and the tentacle shakes

Tentacle-shaking is an action applying to nothing.

First standard AI action select rule (this is the consider tentacle-shaking rule):
	if the global attacker is the giant tentacle:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker tentacle-shaking;
		if the combat state of giant tentacle is at-React:
			change the Weight entry to 15;
		otherwise:
			change the weight entry to -100.
		
Standard AI action select rule (this is the tentacle shakes when attacked and grappling rule):
	if the global attacker is the giant tentacle:
		choose row with an Option of the action of the global attacker tentacle-shaking in the Table of AI Combat Options;
		if the giant tentacle grapples the provoker of the giant tentacle and the combat state of the giant tentacle is at-React:
			increase the Weight entry by 5 times the concentration of the provoker of the giant tentacle;
		otherwise:
			decrease the Weight entry by 1000.

Carry out the giant tentacle tentacle-shaking:
	let guy be the provoker of the giant tentacle;
	say "The giant tentacle vigourously shakes [the guy], aiming to confuse and confound.[italic type] ";
	let n be 9 + concentration of the giant tentacle;
	test the willpower of the guy against n; 
	say "[roman type]";
	if test result is true:
		say " [if the guy is the player]You remain[otherwise][The guy] remains[end if] [if concentration of guy is greater than 0]concentrated[otherwise]sharp[end if].";
	otherwise:
		say " [if the guy is the player]You are[otherwise][The guy] is[end if] confused.";
		now guy is tentacle-confused;
		if the concentration of the guy is greater than 0:
			let the guy lose concentration.

A person can be tentacle-confused. A person is usually not tentacle-confused.

Attack modifiers rule (this is the tentacle-confused attack modifier rule):
	if the global attacker is tentacle-confused:
		if the numbers boolean is true, say " - 2 (confused)[run paragraph on]";
		decrease the to-hit modifier by 2.	

Chance to win rule (this is the CTW confusion penalty rule):
	if the global attacker is tentacle-confused:
		decrease the chance-to-win by 2.

Aftereffects rule (this is the no longer tentacle-confused after attacking rule):
	if the global attacker is tentacle-confused:
		say "[if the global attacker is the player]You are[otherwise if the global attacker is plural-named][The global attacker] are[otherwise][The global attacker] is[end if] no longer confused.";
		now the global attacker is not tentacle-confused.

Status rule (this is the tentacle-confused status rule):
	if the player is tentacle-confused:
		say "You are [bold type]confused[roman type] by the giant tentacle, which gives you a -2 attack penalty on your next attack.[line break][run paragraph on]".

Section - Tentacle prose

A fatal flavour rule (this is the fatal giant tentacle rule):
	if the global defender is the giant tentacle:
		say "The giant tentacle crashes down, never to rise again.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player giant tentacle rule):
	if the global attacker is the giant tentacle:
		say "Even though Tooloo was slain in times immemorial, his appendages still claim victims today.";
		rule succeeds.

An attack move flavour rule (this is the giant tentacle attack rule):
	if the global attacker is the giant tentacle:
		say "The giant tentacle moves in to grab [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report giant tentacle dodge rule):
	if the actor is the giant tentacle:
		say "The giant tentacle tries to avoid the blow.";
		rule succeeds.

Show the final damage rule (this is the tentacle report result of blow in numbers mode rule):
	if the numbers boolean is true and the global attacker is the giant tentacle:
		if the final damage is less than 1: [no damage]
			unless the giant tentacle grapples the global defender:
				if the global defender is not the player, say "allowing [the global defender] to escape unscathed.[run paragraph on]";
				if the global defender is the player, say "allowing you to escape unscathed.[run paragraph on]";
			otherwise:
				if the global defender is not the player, say "but holds on to [the global defender].[run paragraph on]";
				if the global defender is the player, say "but holds on to you.[run paragraph on]";
		otherwise:
			if the final damage is less than the health of the global defender: [non-fatal]
				if the global defender is not the player, say "wounding [the global defender] to ", health of the global defender minus final damage, " health.[run paragraph on]" ;
				if the global defender is the player, say "wounding you to ", health of the global defender minus final damage, " health.[run paragraph on]";
			otherwise: [fatal]
				if the global defender is not the player:
					if the numbers boolean is true, say "killing [no dead property][the global defender][dead property].[run paragraph on]";
				otherwise:
					if the numbers boolean is true, say "killing you.";
		say "[roman type][paragraph break]";
		rule succeeds.

Section - Power of the Tentacle

The power of the tentacle is a power. Giant tentacle grants power of the tentacle.
The power level of power of the tentacle is 3.
The command text of power of the tentacle is "confuse".

Absorbing power of the tentacle:
	increase melee of the player by 3;
	increase defence of the player by 3;
	increase permanent health of the player by 15;
	say "As the giant tentacle dies, you feel its soul absorbed into your own body. ([bold type]Power of the tentacle[roman type]: +3 attack, +3 defence, +15 health, and you can attempt to [italic type]confuse[roman type] an enemy when you are attacked.)[paragraph break]".

Repelling power of the tentacle:
	decrease melee of the player by 3;
	decrease defence of the player by 3;
	decrease permanent health of the player by 15.

Section - Confusing

Confusing is an action applying to nothing. Understand "confuse" as confusing.

Check confusing:
	if power of the tentacle is not granted:
		take no time;
		say "You do not possess that power." instead.

Check confusing:
	if the combat state of the actor is not at-React:
		take no time;
		say "You can only confuse as a reaction to an attack." instead.

Carry out confusing:
	let guy be the provoker of the player;
	say "A tentacle suddenly leaps out of your body and shakes [the guy], aiming to confuse and confound.[italic type] ";
	let n be a random number between 7 and 12;
	if a random chance of 1 in 7 succeeds:
		increase n by 3;	
	if a random chance of 1 in 10 succeeds:
		increase n by 10;
	test the willpower of guy against n; 
	say "[roman type]";
	if test result is true:
		say " [if guy is the player]You remain[otherwise][The guy] remains[end if] [if concentration of guy is greater than 0]concentrated[otherwise]sharp[end if].";
	otherwise:
		say " [if guy is the player]You are[otherwise][The guy] is[end if] confused.";
		now guy is tentacle-confused;
		if the concentration of the guy is greater than 0:
			let the guy lose concentration.

Status skill rule (this is the tentacle power status skill rule):
	if power of the tentacle is granted:
		say "You can [bold type]confuse[roman type] as a reaction; the attacker may lose concentration and become confused. [italic type](Level 3)[roman type][line break][run paragraph on]".












Chapter - Level 4 - Fanatics of Aite 

The fanatics-of-Aite-package is a monster. The level of the fanatics-of-Aite-package is 4.

Final monster placement rule (this is the place fanatics of Aite rule):
	if fanatics-of-Aite-package is not off-stage:
		let X be the location of fanatics-of-Aite-package;
		move healer of Aite to X;
		move tormentor of Aite to X;
		move defender of Aite to X;
		remove fanatics-of-Aite-package from play. 

Section - Healer of Aite

A healer of Aite is a male monster. The healer of Aite is not neuter. "A white-robed healer of Aite is chanting in praise of his goddess."
Understand "white-robed" as the Healer of Aite.
The description of the healer of Aite is "This white-robed priest is a healer of Aite. Their task is to support the other fanatics in their never-ending crusade.".

The health of the Healer of Aite is 20.
The melee of the Healer of Aite is 1.
The defence of the Healer of Aite is 8.

The group level of the Healer of Aite is 4.

Heal power of the healer of Aite is 5.
The healer of Aite is Aite-loved.
The healer's sword is a readied sword. The healer of Aite carries the healer's sword. The description of the healer's sword is "Just a plain sword.".

Healer of Aite is weapon user.


When play begins:
	let X be a random natural weapon part of healer of Aite;
	now printed name of X is "healer's fists".

A fatal flavour rule (this is the fatal healer of Aite rule):
	if the global defender is the healer of Aite:
		say "The healer stares in disbelief at his fatal wounds before he topples over.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player healer of Aite rule):
	if the global attacker is the healer of Aite:
		say "'Aite be praised!' These are the last words you hear as the healer's sword penetrates your heart.";
		rule succeeds.

An attack move flavour rule (this is the healer of Aite attack rule):
	if the global attacker is the healer of Aite:
		say "The healer pokes his sword at [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report healer of Aite dodge rule):
	if the actor is the healer of Aite:
		say "'Save me, great Aite!' the healer exclaims as he attempts to duck away.";
		rule succeeds.

Section - Tormentor of Aite

A tormentor of Aite is a female monster. The tormentor of Aite is not neuter. "A black-robed mage stalks through the room."
Understand "black-robed" and "mage" as the Tormentor of Aite.
The description of the tormentor of Aite is "You immediately recognise the black-robed mage as a tormentor of Aite, savage priests who specialise in inflicting pain on all who oppose their faith.".

The health of the Tormentor of Aite is 16.
The melee of the Tormentor of Aite is 3.
The defence of the Tormentor of Aite is 9.

The group level of the Tormentor of Aite is 4.

The tormentor of Aite is Aite-loved.
The tormentor's staff is a readied staff of pain. The tormentor of Aite carries the tormentor's staff. The description of the tormentor's staff is "This staff of pain wounds with magic that can be neither parried nor dodged.".

Tormentor of Aite is weapon user.

When play begins:
	let X be a random natural weapon part of tormentor of Aite;
	now printed name of X is "tormentor's fists".

A fatal flavour rule (this is the fatal tormentor of Aite rule):
	if the global defender is the tormentor of Aite:
		say "The tormentor cries in pain and rage as her body's vital functions fail.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player tormentor of Aite rule):
	if the global attacker is the tormentor of Aite:
		say "'Aite be praised!' These are the last words you hear as magical pain racks your body.";
		rule succeeds.

An attack move flavour rule (this is the tormentor of Aite attack rule):
	if the global attacker is the tormentor of Aite:
		say "The tormentor raises her staff towards [the global defender], preparing a magical attack.";
		rule succeeds.

Report an actor dodging (this is the report tormentor of Aite dodge rule):
	if the actor is the tormentor of Aite:
		say "'You will never get me!' the tormentor exclaims as she attempts to duck away.";
		rule succeeds.

Section - Defender of Aite

A defender of Aite is a male monster. The defender of Aite is not neuter. "Equipped with a small sword and a huge shield, a heavily armoured man awaits any attacks."
Understand "armoured" and "man" as the defender of Aite.
The description of the defender of Aite is "This heavily armoured priest is a defender of Aite, one of the front-line troops of the armies of this horrible faith.".

The health of the Defender of Aite is 23.
The melee of the Defender of Aite is 1.
The defence of the Defender of Aite is 12.

The group level of the Defender of Aite is 4.

The defender of Aite is Aite-loved.
The defender's sword is a readied sword. The defender of Aite carries the defender's sword. The description of the defender's sword is "Just a plain sword.".

Defender of Aite is weapon user.

When play begins:
	let X be a random natural weapon part of defender of Aite;
	now printed name of X is "defender's fists".

A fatal flavour rule (this is the fatal defender of Aite rule):
	if the global defender is the defender of Aite:
		say "The defender falls to the ground with a smash, never to stand up again.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player defender of Aite rule):
	if the global attacker is the defender of Aite:
		say "'Aite be praised!' These are the last words you hear as the defender hacks you apart.";
		rule succeeds.

An attack move flavour rule (this is the defender of Aite attack rule):
	if the global attacker is the defender of Aite:
		say "The defender starts lumbering towards [the global defender].";
		rule succeeds.

Report an actor parrying (this is the report defender of Aite parry rule):
	if the actor is the defender of Aite:
		say "The soldier raises his shield to stop the attack.";
		rule succeeds.

Report an actor dodging (this is the report defender of Aite dodge rule):
	if the actor is the defender of Aite:
		say "The soldier attempts to jump away, using his shield for additional cover.";
		rule succeeds.

Section - Power of the Fanatics of Aite

The power of the Fanatics of Aite is a power. fanatics-of-Aite-package grants power of Fanatics of Aite.
The power level of power of the Fanatics of Aite is 4.
The command text of power of the fanatics of Aite is "pray".

The fanatics power boolean is a truth state that varies. The fanatics power boolean is false.

Every turn (this is the grant fanatics of power boolean rule):
	if healer of Aite is killed and Tormentor of Aite is killed and Defender of Aite is killed:
		if fanatics power boolean is false:
			now fanatics power boolean is true;
			say "Impressed with your prowess in combat, Aite grants you her favour! ([bold type]Power of the fanatics of Aite[roman type]: +4 attack, +4 defence, +20 health, +2 willpower, pray to Aite anywhere.)[paragraph break]";
			gain the power of the fanatics of Aite. 

To gain the power of the Fanatics of Aite:
	increase score by 4;
	now test subject is fanatics-of-Aite-package;
	unless absorption is stopped:
		do power transferral with fanatics-of-Aite-package;
		heal fully because fanatics-of-Aite-package is slain;
	do achievement awarding for the fanatics-of-Aite-package.
	
Absorbing power of the Fanatics of Aite:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	increase willpower of the player by 2.

Repelling power of the Fanatics of Aite:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20;
	decrease willpower of the player by 2.

Status skill rule (this is the fanatics of aite status skill rule):
	if power of the fanatics of aite is granted:
		say "You have the power of the fanatics of Aite, which allows you to [bold type]pray[roman type] to the goddess even when you are not in her temple. This power does not work in the temples of other gods. [italic type](Level 4)[roman type][line break][run paragraph on]".

Section - Praying when Aite power is granted

A beloved of Aite rule (this is the aite loves the bearer of her power rule):
	if test subject is the player and power of the fanatics of aite is granted:
		rule succeeds.

First check praying:
	if the power of the fanatics of aite is granted:
		if the location is not consecrated:
			do the Aite prayer instead.

[			if the Aite counter is 0:
				now the Aite counter is a random number between 2 and 12;
			say "You ask Aite for help in battle, and anxiously await the consequences." instead.]






Chapter - Level 4 - Bodmall

Bodmall is a monster. Bodmall is proper-named. Bodmall is female and not neuter. "A pale druidess stands here, murmuring to herself in a language you have never heard." The description of Bodmall is "Why the great druidess Bodmall has chosen to work together with Malygris is a subject of much speculation among scholars of the occult -- but here she is, standing between you and victory. She is a very powerful foe.".

Understand "druid" and "druidess" and "witch" as Bodmall.

The level of Bodmall is 4.

The health of Bodmall is 35.
The melee of Bodmall is 5.
The defence of Bodmall is 12.
The dexterity of Bodmall is 8.
The perception of Bodmall is 8. 
The willpower of Bodmall is 9.

When play begins:
	let X be a random natural weapon part of Bodmall;
	now X is ranged;
	now X is not armour-stoppable;
	now damage die of X is 10;
	now the passive parry max of X is 0;
	now the active parry max of X is 0;
	now the dodgability of X is 3;
	now printed name of X is "lightning bolt".


Section - Bodmall's lightning attack

[Mostly this is just prose, except --]

An attack modifiers rule (this is the do not parry with metal weapons against Bodmall's lightning attack rule):
	if the global attacker is Bodmall and the global defender is at parry:
		if the global defender weapon is iron:
			if the numbers boolean is true, say " + 3 ([global defender weapon] acts as a lightning rod)[run paragraph on]";
			increase the to-hit modifier by 3;
		if the global defender weapon is silver:
			if the numbers boolean is true, say " + 5 ([global defender weapon] acts as a lightning rod)[run paragraph on]";
			increase the to-hit modifier by 5.

A damage modifiers rule (this is the iron or silver suit acts as a faraday cage rule):
	if the global attacker is Bodmall:
		if the global defender wears an iron suit or the global defender wears a silver suit:
			let X be a random suit worn by the global defender;
			if the numbers boolean is true, say " - 3 ([the X] acts as a Faraday cage)[run paragraph on]";
			decrease the damage modifier by 3.


Section - Bodmall power - Raise fog

Bodmall-fogging is an action applying to nothing.

First standard AI action select rule (this is the Bodmall considers fogging rule):
	if the global attacker is Bodmall:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker Bodmall-fogging;
		if smoke timer of the location of Bodmall is 0:
			change the Weight entry to a random number between -5 and 15;
		otherwise:
			change the weight entry to -1000.

Carry out Bodmall Bodmall-fogging:
	say "Bodmall chants softly, and great [bold type]clouds of fog[roman type] or smoke rise up from the ground.";
	now smoke timer of the location of Bodmall is a random number between 5 and 12.


Section - Bodmall power - Transmute metal to wood

Bodmall-transmuting is an action applying to nothing.

First standard AI action select rule (this is the Bodmall considers transmuting rule):
	if the global attacker is Bodmall:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker Bodmall-transmuting;
		let X be a random readied weapon enclosed by the global defender;
		if X is iron or X is silver:
			change the Weight entry to a random number between -50 and 20;
		otherwise:
			change the weight entry to -1000.

Carry out Bodmall Bodmall-transmuting:
	let X be a random readied weapon enclosed by the global defender;
	if X is iron or X is silver:
		if X resists Bodmall transmutation:
			say "Bodmall screams several harsh syllables and points at [the X]. Nothing happens.";
		otherwise:
			say "Bodmall screams several harsh syllables and points at [the X]. It immediately [bold type]turns to wood[roman type]!";
			now X is wood;
			now X is not rusted;
			now damage die of X is damage die of X divided by 2;
			decrease weapon attack bonus of X by 2;
	otherwise:
		say "Bodmall chants softly.".

To decide whether (item - a weapon) resists Bodmall transmutation:
	let m be 20;
	if item is major:
		increase m by 10;
	if item is epic:
		increase m by 20;
	if a random chance of 10 in m succeeds:
		decide no;
	otherwise:
		decide yes.


Section - Bodmall power - Barkskin

Bodmall-barkskinning is an action applying to nothing.

First standard AI action select rule (this is the Bodmall considers barkskinning rule):
	if the global attacker is Bodmall:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker Bodmall-barkskinning;
		if Bodmall is not barkskinned:
			change the Weight entry to a random number between -10 and 20;
		otherwise:
			change the weight entry to -1000.

Carry out Bodmall Bodmall-barkskinning:
	say "Bodmall chants loudly, and her [bold type]skin[roman type] transforms and toughens. It now looks like the bark of a tree.";
	now Bodmall is barkskinned.

A person is either barkskinned or not barkskinned. A person is usually not barkskinned.

A damage modifiers rule (this is the barkskin decreases damage rule):
	if the global defender is barkskinned:
		unless the global attacker weapon is an axe:
			if the numbers boolean is true, say " - 1 (barkskin)[run paragraph on]";
			decrease the damage modifier by 1.

Barkskin is a part of Bodmall. Understand "skin" and "bark" as barkskin.

The description of barkskin is "Bodmall's skin looks [if Bodmall is barkskinned]tough and tree-like[otherwise]perfectly normal[end if].".

Section - Bodmall power - Thorns

The thorny bushes are a thing. "Huge bushes, apparently dead but full of large and extremely sharp thorns, are everywhere." The  thorny bushes are plural-named and fixed in place. Understand "bush" and "thorn" and "thorns" and "huge" as the thorny bushes.

The description of the thorny bushes is "Moving through these bushes is possible, but it is certainly going to hurt. Neither attacking nor dodging will be truly safe.".

Instead of climbing the thorny bushes:
	try entering the thorny bushes.

Instead of entering the thorny bushes:
	say "You jump into the thorns, receiving [bold type]10 damage[roman type] before you can crawl out again.";
	decrease health of the player by 10;
	if the player is killed:
		end the story saying "I'd love to give you a barbed compliment.".

Instead of taking the thorny bushes:
	say "They seem to be rooted to the spot.".

A whether attacking begins rule (this is the attack with thorns in the location rule):
	if the thorny bushes are in the location:
		unless the global attacker weapon is ranged:
			unless the global attacker is flying:
				unless the global attacker is Bodmall:
					unless the global attacker is the player and the power of Bodmall is granted:
						say "[if the global attacker is the player]You [otherwise][The global attacker] [end if]must move through the thorny bushes to reach [the global defender]. [italic type]";
						test the perception of the global attacker against 12;
						if test result is true:
							say " ";
							test the dexterity of the global attacker against 12;
						if test result is true:
							say "[roman type] The thorns deal [bold type]no damage[roman type].";
						otherwise:
							let n be 3;
							calculate the pdr for global attacker;
							decrease n by pdr;
							if n is less than 0, now n is 0;
							if n is 0:
								say " [roman type]Because of damage reduction, the thorns deal [bold type]no damage[roman type] to [the global attacker].";
							otherwise:
								say " [roman type]The thorns deal [bold type][n] damage[roman type] to [the global attacker].";
								decrease the health of the global attacker by n;
								unless the global attacker is alive:
									if the global attacker is the player:
										say "Your weakened body could not handle this!";
										end the game saying "A thorn kills a man, not by force, but by pricking often.";
										rule fails;
									otherwise:
										say "[no dead property][The global attacker][dead property] is killed by the thorns!";
										rule fails.

Last report an actor dodging (this is the thorns hurt the dodger rule):
	if the thorny bushes are in the location:
		unless the actor is flying:
			unless the actor is Bodmall:
				unless the actor is the player and the power of Bodmall is granted:
					let n be 1;
					calculate the pdr for the actor;
					decrease n by pdr;
					if n is less than 0, now n is 0;
					unless n is 0:
						say "Dodging is dangerous with so many thorns around; the bushes deal [bold type]1 damage[roman type] to [the actor].";
						decrease the health of the actor by 1;
						unless the actor is alive:
							if the actor is the player:
								say "Your weakened body could not handle this!";
								end the game saying "A thorn kills a man, not by force, but by continuously pricking.";
								rule fails;
							otherwise:
								say "[no dead property][The actor][dead property] is killed by the thorns!";
								rule fails.

An attack modifiers rule (this is the thorns running rule):
	if the global defender is the player and the thorny bushes are in the location:
		if the player is retreater or the player is runner:		
			unless the power of Bodmall is granted:
				say " + 3 (you are slowed down by the thorny bushes)[run paragraph on]";
				increase the to-hit modifier by 3;
			otherwise:
				unless the global attacker weapon is ranged:
					say " - 2 (your retreat covered by the thorny bushes)[run paragraph on]";
					decrease the to-hit modifier by 2.


Bodmall-summoning is an action applying to nothing.

First standard AI action select rule (this is the Bodmall considers summoning rule):
	if the global attacker is Bodmall and thorny bushes are not in the location:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker Bodmall-summoning;
		change the Weight entry to a random number between -100 and 35.

Carry out Bodmall Bodmall-summoning:
	say "Bodmall makes several complicated gestures, and [bold type]huge thorny bushes[roman type] come out of the ground everywhere around you!";
	move thorny bushes to the location.


Section - Bodmall prose

A fatal flavour rule (this is the fatal Bodmall rule):
	if the global defender is Bodmall:
		say "'I will haunt you come Samhain!', whispers Bodmall as her body returns to the earth.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player Bodmall rule):
	if the global attacker is Bodmall:
		unless the player is undead:
			say "Bodmall kneels over your corpse. 'Death is but a stage in the cycle of Nature,' she says.";
		otherwise:
			say "Bodmall kneels over your corpse. 'The undead are a blight on this world, and they will be destroyed,' she says.";
		rule succeeds.

An attack move flavour rule (this is the Bodmall attack rule):
	if the global attacker is Bodmall:
		say "Bodmall throws her hands forward, casting a lightning bolt at [the global defender].";
		rule succeeds.

Report an actor dodging (this is the report Bodmall dodge rule):
	if the actor is Bodmall:
		say "Gracefully, Bodmall attempts to glide out of the way.";
		rule succeeds.

Section - Power of Bodmall

The power of Bodmall is a power. Bodmall grants power of Bodmall.
The power level of power of Bodmall is 4.
The command text of power of Bodmall is "thorns".
	
Absorbing power of Bodmall:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	increase willpower of the player by 1;
	increase perception of the player by 1;
	increase dexterity of the player by 1;
	say "As Bodmall dies, you feel her soul absorbed into your own body. ([bold type]Power of Bodmall[roman type]: +4 attack, +4 defence, +20 health, +1 to all attributes, and you can summon [italic type]thorns[roman type].)[paragraph break]".

Repelling power of Bodmall:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20;
	decrease willpower of the player by 1;
	decrease perception of the player by 1;
	decrease dexterity of the player by 1.

Status skill rule (this is the Bodmall status skill rule):
	if power of Bodmall is granted:
		say "You have the power of Bodmall, which allows you to summon [bold type]thorns[roman type] that will impede most enemies. [italic type](Level 4)[roman type][line break][run paragraph on]".

Section - Summoning thorns

Summoning thorns is an action applying to nothing. Understand "thorns" and "thorn" and "summon thorns" as summoning thorns.

Check summoning thorns:
	if power of Bodmall is not granted:
		take no time;
		say "You do not possess that power." instead.

Check summoning thorns:
	if the thorny bushes are in the location:
		take no time;
		say "The thorny bushes are already here." instead.

Carry out summoning thorns:
	say "You speak the ancient syllables, and bushes full of thorns grow out of the ground!";
	move thorny bushes to the location.




Chapter - Level 5 - Malygris

Malygris is a monster. Malygris is proper-named. Malygris is male and not neuter. "Malygris, perhaps the greatest of all living sorcerers, is standing here." The description of Malygris is "His white eyebrows are contracted to a single line on the umber parchment of his face, and beneath them his eyes are cold and green as the ice of ancient floes; his beard, half white, half of a black with glaucous gleams, falls nearly to his knees and hides many of the writhing serpentine characters inscribed in woven silver athwart the bosom of his violet robe. -- Clark Ashton Smith, [italic type]The Last Incantation[roman type].".

Understand "sorcerer" and "mage" and "wizard" and "him" as the Malygris.

The level of Malygris is 5.

The health of Malygris is 55.
The melee of Malygris is 7.
The defence of Malygris is 16.
The dexterity of Malygris is 9.
The perception of Malygris is 9. 
The willpower of Malygris is 12.

When play begins:
	let X be a random natural weapon part of Malygris;
	now printed name of X is "Malygris's innate magical powers".

Malygris is weapon user.

Section - Weapon

The dagger of draining is a dagger.

Malygris carries the dagger of draining. The dagger of draining is a weapon. The description of the dagger of draining is "This magical dagger saps the powers of any enemy it hits, and transfers it to the wielder.".
The damage die of the dagger of draining is 8.

The special weapon info of the dagger of draining is "; drains statistics[run paragraph on]".

An aftereffects rule (this is the dagger of draining aftereffects rule):
	if the global attacker weapon is the dagger of draining and the final damage is greater than 0:
		if a random chance of 1 in 3 succeeds:
			decrease defence of the global defender by 1;
			increase defence of the global attacker by 1;
			say "The magical dagger saps [no dead property][possessive of the global defender][dead property] defensive reflexes, transferring them to [the global attacker].";
		otherwise:
			if a random chance of 1 in 3 succeeds:
				decrease willpower of the global defender by 1;
				increase willpower of the global attacker by 1;
				say "The magical dagger saps [no dead property][possessive of the global defender][dead property] willpower, transferring it to [the global attacker].";
			otherwise:
				if a random chance of 1 in 2 succeeds:
					decrease dexterity of the global defender by 1;
					increase dexterity of the global attacker by 1;
					say "The magical dagger saps [no dead property][possessive of the global defender][dead property] dexterity, transferring it to [the global attacker].";
				otherwise:
					decrease perception of the global defender by 1;
					increase perception of the global attacker by 1;
					say "The magical dagger saps [no dead property][possessive of the global defender][dead property] perception, transferring it to [the global attacker].";.

A standard AI weapon select rule (this is the prefer dagger of draining rule):
	choose row stored_row in Table of AI Combat Weapon Options;
	if the Weapon Option Entry is the dagger of draining:
		increase the Weight entry by 10.
				

Section - Special powers

[Teleportation.]

The teleport amount of Malygris is 2.
The teleport eagerness of Malygris is 8.

Malygris-summon-countdown is a number that varies. Malygris-summon-countdown is 0.

Last carry out Malygris teleporting:
	if teleportation-destination is not the location of the player:
		if the teleport amount of Malygris is 1:
			now Malygris-summon-countdown is a random number between 5 and 7;
		if the teleport amount of Malygris is 0:
			if demonic assassin is alive and demonic assassin is off-stage: [failed to summon last time]
				now Malygris-summon-countdown is a random number between 4 and 5. [and this time he is faster]

[summoning]

Every turn when Malygris-summon-countdown is not 0:
	if the location of Malygris is the location of the player and the player is not hidden:
		unless the player is hidden:
			say "Your arrival interrupts [if teleport amount of Malygris is 1]an intricate[otherwise]a hasty[end if] summoning ritual that Malygris was attempting to perform.";
			now Malygris-summon-countdown is 0; [his attempt at summoning has failed because the player has interrupted it]
	otherwise:
		decrease Malygris-summon-countdown by 1;
		if Malygris-summon-countdown is 0:
			move demonic assassin to the location of Malygris;
			if the location of Malygris is the location of the player:
				say "A [bold type]demonic being[roman type] suddenly appears!";
		otherwise:
			if the location of Malygris is the location of the player:
				say "Malygris speaks the words of a long and complicated spell.".
		
[Item destruction.]

Disintegrate power of Malygris is 10.


Section - Special power - unghoul

[Unghoul. This is to counter any abyss-of-the-soul-play.]

Unghouling is an action applying to nothing.

First standard AI action select rule (this is the consider unghouling rule):
	if the global attacker is Malygris and the faction of Malygris hates the faction of the player:
		if the player form of the player is ghoul and at least two undead persons are in the location:
			choose a blank Row in the Table of AI Combat Options;
			change the Option entry to the action of the global attacker unghouling;
			change the Weight entry to a random number between 0 and 30.

Carry out Malygris unghouling:
	say "As Malygris casts a complex spell, and you feel your flesh [bold type]returning to normal[roman type]!";
	unghoulify the player.


Book - Other Monsters

Chapter - Demonic assassin

The demonic assassin is a monster. "A horned figure stalks through the room." Understand "horned" and "figure" as the demonic assassin. The description of the demonic assassin is "A being summoned by Malygris from the depths of Hell, this demon has only one purpose: to stop you from reaching its master.".

The level of demonic assassin is 0.
The demonic assassin is demonic.

The health of demonic assassin is 25.
The melee of demonic assassin is 4.
The defence of demonic assassin is 12.
The dexterity of demonic assassin is 8.
The perception of demonic assassin is 8. 
The willpower of demonic assassin is 8.

The demonic assassin is follower.
Follower percentile chance of demonic assassin is 100.
The demonic assassin is unnaturally aware.

When play begins:
	let X be a random natural weapon part of the demonic assassin;
	now the printed name of X is "claws".
	
Demonic assassin is weapon user.

The demonic assassin carries the demon blade.

The demon blade is a sword. The description of the demon blade is "A jagged sword covered in evil-looking runes. It was never meant to be used by humans.".

The demon blade is cursed.
The internal heat of the demon blade is 4.

Check attacking (this is the attacking with the demon blade is a bad idea rule):
	if the player carries the demon blade and the demon blade is readied:
		if a random chance of 3 in 5 succeeds:
			say "The [bold type]demonic blade[roman type] turns on you!";
			make the player strike a blow against the player instead.

Section - Demonic assassin prose

A fatal flavour rule (this is the fatal demonic assassin rule):
	if the global defender is demonic assassin:
		say "With a thunderous explosion, the demonic assassin is pulled back to Hell.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player demonic assassin rule):
	if the global attacker is demonic assassin:
		say "The assassin's laugh as you fall down is the most evil thing you have ever heard. It is also the last.";
		rule succeeds.




Chapter - Nameless Horror

The Nameless Horror is a horrific monster. "Screams rip from your throat as soon as you become aware of the mindbogglingly hideous monster that resides here, an abomination referred to only as the Nameless Horror." The indefinite article of the nameless horror is "the". The description of the Nameless Horror is "A vast dark mass sprouting teeth and claws at random -- you cannot force yourself to look at it.".

A final monster placement rule (this is the Nameless Horror in Eternal Prison rule):
	now Nameless horror is in eternal prison.

The level of Nameless Horror is 10.

The health of Nameless Horror is 1000.
The melee of Nameless Horror is 50.

The Nameless Horror is eyeless.
The Nameless Horror is unnaturally aware.
The Nameless Horror is emotionless.

When play begins:
	let X be a random natural weapon part of the nameless horror;
	now damage die of X is 50;
	now dodgability of X is 2;
	now passive parry max of X is 0;
	now active parry max of X is 0;
	now printed name of X is "countless teeth and claws".

Follower percentile chance of Nameless Horror is 60.

Every turn when Nameless Horror is not follower (this is the wake the Nameless Horror rule):
	let the way be the best route from the location of Nameless to the location of the player;
	if way is a direction:
		say "An overwhelming scream seems to rip the world apart. An [bold type]evil intelligence has awakened[roman type] so vast as to be beyond comprehension.";
		award achievement Durin's bane;
		wake the Nameless Horror.

To wake the Nameless Horror:
	now Nameless Horror is follower.

Followers rule (this is the Nameless Horror stops to kill rule):
	if test subject is Nameless Horror:
		if the location of the Nameless Horror encloses more than one alive person:
			rule fails.

Every turn (this is the Nameless Horror kills all rule):
	if the Nameless Horror is follower and the location of the Nameless Horror is not the location of the player:
		if the location of the Nameless Horror encloses more than one alive person:
			let guy be Nameless Horror;
			while guy is Nameless Horror:
				let guy be a random alive person enclosed by the location of Nameless Horror;
			decrease health of guy by 100;
			if guy is killed, remove guy from play.


Every turn when Nameless Horror is follower (this is the increase hunger of Nameless Horror rule):
	increase follower percentile chance of Nameless Horror by 1. 

Every turn when follower percentile chance of Nameless Horror is greater than 100 (this is the speed up Nameless Horror rule):
	let the way be the best route from the location of Nameless Horror to the location of the player;
	if way is a direction, try Nameless Horror going the way.
	
A standard AI action select rule (this is the Nameless Horror does not concentrate rule):
	if the global attacker is the Nameless Horror:
		choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
		decrease the Weight entry by 1000.

A standard AI action select rule (this is the Nameless Horror does not parry rule):
	if the global attacker is the Nameless Horror:
		choose row with an Option of the action of the global attacker parrying in the Table of AI Combat Options;
		decrease the Weight entry by 1000.
		
A standard AI action select rule (this is the Nameless Horror does not dodge rule):
	if the global attacker is the Nameless Horror:
		choose row with an Option of the action of the global attacker dodging in the Table of AI Combat Options;
		decrease the Weight entry by 1000.		

First standard AI action select rule (this is the Nameless Horror considers waiting rule):
	if the global attacker is the Nameless Horror:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker waiting;
		change the Weight entry to 0.


Instead of the Nameless Horror waiting:
	say "[one of]The Nameless Horror emits a maddening shriek[or]Darkness coalesces around the Nameless Horror[or]The world shakes as the Nameless Horror roars in defiance[at random].".


Chapter - Rotting corpse

The rotting corpse is an undead monster. "An animated corpse shambles around. Its smell is absolutely disgusting."

The rotting corpse is emotionless.
The rotting corpse is eyeless.

The level of rotting corpse is 0.

The health of rotting corpse is 30.
The melee of rotting corpse is 3.
The defence of rotting corpse is 8.
The dexterity of rotting corpse is 3.
The perception of rotting corpse is 6. 
The willpower of rotting corpse is 4.

When play begins:
	let X be a random natural weapon part of the rotting corpse;
	now damage die of X is 7;
	now dodgability of X is 3;
	now passive parry max of X is 3;
	now active parry max of X is 0;	
	now the printed name of X is "rotting appendages".

A rotting limb is a kind of thing.
The material of a rotting limb is usually flesh.

The rotting left leg is part of the rotting corpse. It is a rotting limb. The description of the rotting left leg is "It [if the rotting left leg is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting right leg is part of the rotting corpse. It is a rotting limb. The description of the rotting right leg is "It [if the rotting right leg is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting left arm is part of the rotting corpse. It is a rotting limb. The description of the rotting left arm is "It [if the rotting left arm is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting right arm is part of the rotting corpse. It is a rotting limb. The description of the rotting right arm is "It [if the rotting right arm is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting head is part of the rotting corpse. It is a rotting limb. The description of the rotting head is "It [if the rotting head is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".

Instead of eating a rotting limb:
	take no time;
	say "The smell makes you gag.".

Instead of taking a rotting limb:
	take no time;
	say "You will not touch that. You will touch a lot of things, but not that.".

To decide what number is the limbs of the rotting corpse:
	let m be 0;
	repeat with item running through rotting limbs:
		if item is part of the rotting corpse:
			increase m by 1;
	decide on m.
	
To decide what number is the legs of the rotting corpse:
	let m be 0;
	if rotting left leg is part of the rotting corpse:
		increase m by 1;
	if rotting right leg is part of the rotting corpse:
		increase m by 1;
	decide on m.
	
To decide what number is the arms of the rotting corpse:
	let m be 0;
	if rotting left arm is part of the rotting corpse:
		increase m by 1;
	if rotting right arm is part of the rotting corpse:
		increase m by 1;
	decide on m.

The description of the rotting corpse is "This corpse has definitely seen better times[unless limbs of the rotting corpse is 5]:[end if] [if the rotting head is not part of the rotting corpse]it has no head, [end if][if the legs of the rotting corpse is 1]it misses a leg, [end if][if the legs of the rotting corpse is 0]it misses both legs, [end if][if the arms of the rotting corpse is 1]one of its arms has fallen off, [end if][if the arms of the rotting corpse is 0]both of its arms have fallen off, [end if]and it smells awful."

Instead of smelling when the rotting corpse is in the location:
	say "The smell of rotting meat fills your nostrils.".

Every turn when a rotting limb is enclosed by the location (this is the rotting limbs decay rule):
	repeat with item running through rotting limbs enclosed by the location:
		unless item is part of the rotting corpse:
			if a random chance of 1 in 7 succeeds:
				if item is visible:
					say "[The item] decays completely.";
					remove item from play.

An aftereffects rule (this is the rotting corpse loses limbs rule):
	if the global defender is alive and final damage is greater than 0:
		if the global defender is the rotting corpse and limbs of the rotting corpse is not 0:
			let item be a random rotting limb part of the rotting corpse;
			say "As the corpse reels back from the blow, his [item] falls off.";
			move item to the location of the rotting corpse;
			let X be a random natural weapon part of the rotting corpse;
			decrease damage die of X by 1;
			if item is rotting left arm or item is rotting right arm:
				decrease damage die of X by 1;
			if item is rotting left leg or item is rotting right leg:
				decrease follower percentile chance of rotting corpse by 40.

A standard AI action select rule (this is the rotting corpse without a head does not concentrate rule):
	if the global attacker is the rotting corpse and the rotting head is not part of the rotting corpse:
		choose row with an Option of the action of the global attacker concentrating in the Table of AI Combat Options;
		decrease the Weight entry by 1000.

An attack modifiers rule (this is the rotting corpse attack modifier rule):
	if the global attacker is the rotting corpse:
		let m be arms of the rotting corpse + legs of the rotting corpse;
		let m be 4 minus m;
		unless m is 0:
			if the numbers boolean is true, say " - [m] (missing limbs)[run paragraph on]";
			decrease the to-hit modifier by m.

An attack modifiers rule (this is the rotting corpse defense modifier rule):
	if the global defender is the rotting corpse:
		if legs of the rotting corpse is 1:
			if the numbers boolean is true, say " + 2 (corpse misses a leg)[run paragraph on]";
			increase the to-hit modifier by 2;
		if legs of the rotting corpse is 0:
			if the numbers boolean is true, say " + 4 (corpse misses both legs)[run paragraph on]";
			increase the to-hit modifier by 4.

Last calculate the final damage rule (this is the rotting corpse without limbs rule):
	if global attacker is the rotting corpse:
		if limbs of the rotting corpse is 0:
			say " - 100% (no means of attack)[run paragraph on]";
			now final damage is 0.

Section - Rotting corpse prose

A fatal flavour rule (this is the fatal rotting corpse rule):
	if the global defender is the rotting corpse:
		say "The rotting corpse disintegrates slimily.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player rotting corpse rule):
	if the global attacker is the rotting corpse:
		say "Your last sensation is the rotting corpse falling on top of you and oozing its way into your nostrils.";
		rule succeeds.

An attack move flavour rule (this is the rotting corpse attack rule):
	if the global attacker is the rotting corpse:
		say "The rotting corpse [if legs of the rotting corpse is 2]walks[otherwise if legs of the rotting corpse is 1]hops[otherwise]crawls[end if] towards [the global defender], [if arms of the rotting corpse is 2]its arms raised[otherwise if arms of the rotting corpse is 1]its single arm raised[otherwise if the rotting head is part of the rotting corpse]its teeth at the ready[otherwise if legs of the rotting corpse is greater than 0]hoping to land a good kick[otherwise]with no other weapon than its smell[end if].";
		rule succeeds.

Report an actor dodging (this is the report rotting corpse dodge rule):
	if the actor is the rotting corpse:
		say "The corpse [if legs of the rotting corpse is 2]walks[otherwise if legs of the rotting corpse is 1]hops[otherwise]crawls[end if] out of the way.";
		rule succeeds.






Chapter - Aswang

[Because everyone wants a shape-shifting undead witch, right? That turns into a bird and flies away, only to return later with more health.]

As-shape is a kind of value. The as-shapes are as-witch, as-bird and as-dog.
The aswang has an as-shape. The as-shape of the aswang is as-witch.

The aswang is an undead monster. "An aswang is here, having taken the shape of [if as-shape of aswang is as-witch]an ugly old woman[otherwise if as-shape of aswang is as-bird]a huge owl-like bird[otherwise]a ferocious black dog[end if]."
Understand "witch" and "dog" and "hound" and "bird" and "owl" and "woman" and "ugly" and "old" as the aswang.

The description of the aswang is "The undead monster has currently taken the form of [if as-shape of aswang is as-witch]an ugly old woman with long, dirty hair and completely white eyes[otherwise if as-shape of aswang is as-bird]a huge owl-like bird with leathery wings[otherwise]a ferocious black dog with blood-shot eyes[end if].".

The level of the aswang is 0.

The health of the aswang is 22.
The melee of the aswang is 2.
The defence of the aswang is 9.
The dexterity of the aswang is 6.
The perception of the aswang is 5. 
The willpower of the aswang is 7.

When play begins:
	let X be a random natural weapon part of the aswang;
	now damage die of X is 6;
	now dodgability of X is 2;
	now passive parry max of X is 2;
	now active parry max of X is 0;	
	now the printed name of X is "[if as-shape of aswang is as-witch]razor-sharp fingernails[otherwise if as-shape of aswang is as-bird]beak[otherwise]teeth[end if]".

Section - Shape-shifting

Aswang-shifting is an action applying to nothing.
Considered-shape is an as-shape that varies.

First standard AI action select rule (this is the consider aswang-shifting rule):
	if the global attacker is the aswang:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker aswang-shifting;
		change the Weight entry to 0;
		now considered-shape is as-witch.

A standard AI action select rule (this is the aswang aswang-shifting select rule):
	if the global attacker is the aswang:
		choose row with an Option of the action of the global attacker aswang-shifting in the Table of AI Combat Options;
		if the as-shape of the aswang is as-witch and the health of the aswang is less than 15:
			now considered-shape is as-dog;
			increase Weight entry by 10;
		if the as-shape of the aswang is as-witch and the health of the aswang is less than 7:
			now considered-shape is as-bird;
			increase Weight entry by 5;
		if the as-shape of the aswang is as-dog and the health of the aswang is less than 7:
			now considered-shape is as-bird;
			increase Weight entry by 12;
		if the as-shape of the aswang is as-bird and the health of the aswang is greater than 12:
			now considered-shape is as-witch;
			increase Weight entry by 10;
[		if a random chance of 1 in 30 succeeds: [and just to spice things up a bit]
			now considered-shape is a random as-shape;
			now Weight entry is a random number between 1 and 30].

Carry out the aswang aswang-shifting:
	while considered-shape is as-shape of the aswang:
		now considered-shape is a random as-shape;
	say "The aswang suddenly transforms into [bold type][if considered-shape is as-witch]an ugly witch[otherwise if considered-shape is as-dog]a bloodthirsty dog[otherwise]an owl-like bird with devilish wings[end if][roman type]!";
	if the as-shape of aswang is as-dog:
		transform away from dog;
	if the as-shape of aswang is as-bird:
		transform away from bird;
	if the considered-shape is as-dog:
		transform to dog;
	if the considered-shape is as-bird:
		transform to bird;
	now as-shape of aswang is considered-shape.		

To transform to dog:
	increase melee of aswang by 2;
	decrease defence of aswang by 1.

To transform away from dog:
	decrease melee of aswang by 2;
	increase defence of aswang by 1.	

To transform to bird:
	decrease melee of aswang by 2;
	increase defence of aswang by 1.

To transform away from bird:
	increase melee of aswang by 2;
	decrease defence of aswang by 1.

Section - The witch can hex you

Aswang-hexing is an action applying to nothing.
A person is either hexed or not hexed. A person is usually not hexed.

First standard AI action select rule (this is the consider aswang-hexing rule):
	if the global attacker is the aswang and the as-shape of the aswang is as-witch:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker aswang-hexing;
		change the Weight entry to 0.

A standard AI action select rule (this is the aswang aswang-hexing select rule):
	if the global attacker is the aswang and the as-shape of the aswang is as-witch:
		choose row with an Option of the action of the global attacker aswang-hexing in the Table of AI Combat Options;
		if the global defender is not hexed:
			increase Weight entry by 10;
		otherwise:
			decrease Weight entry by 1000.

Carry out the aswang aswang-hexing:
	say "The aswang attempts to hex [the global defender]. [italic type]";
	let n be 11 + concentration of the aswang;
	test the willpower of the global defender against n;
	if test result is false:
		say " [roman type][CAP-defender] [if global defender is the player or global defender is plural-named]are[otherwise]is[end if] now [bold type]hexed[roman type].";
		now global defender is hexed;
	otherwise:
		say " [roman type][CAP-defender] [bold type]resist[if global defender is the player or global defender is plural-named][otherwise]s[end if] the hex[roman type].";

Initiative rule (this is the decrease initiative when hexed rule):
	repeat with X running through all alive persons enclosed by the location:
		if X is hexed:
			if a random chance of 2 in 3 succeeds:
				decrease the initiative of X by a random number between 0 and 2.

Status rule (this is the hexed status rule):
	if the player is hexed:
		say "You have been [bold type]hexed[roman type] by the aswang, which gives you an initiative penalty.[line break][run paragraph on]".

Every turn when at least one alive person is hexed (this is the remove hexes when aswang is dead rule):
	if aswang is killed:
		repeat with guy running through alive hexed persons:
			now guy is not hexed;
			if guy is player:
				say "You are [bold type]no longer hexed[roman type].".

Section - The dog simply attacks a lot

A standard AI action select rule (this is the aswang as dog attack select rule):
	if the global attacker is the aswang and the as-shape of the aswang is as-dog:
		choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Combat Options;
		increase Weight entry by 3.

Section - The bird attempts to flee and regenerate

Aswang-fleeing is an action applying to nothing.

First standard AI action select rule (this is the consider aswang-fleeing rule):
	if the global attacker is the aswang and the as-shape of the aswang is as-bird:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker aswang-fleeing;
		change the Weight entry to 0.

A standard AI action select rule (this is the aswang aswang-fleeing select rule):
	if the global attacker is the aswang and the as-shape of the aswang is as-bird:
		choose row with an Option of the action of the global attacker aswang-fleeing in the Table of AI Combat Options;
		if a random chance of 1 in 3 succeeds and health of the aswang is less than 10:
			if a random chance of 1 in 2 succeeds or aswang is follower:
				increase Weight entry by 20;
		otherwise:
			decrease Weight entry by 1000.

Carry out the aswang aswang-fleeing:
	if at least one room is adjacent to the location:
		let place be a random room adjacent to the location;
		if place is retreat location:
			let place be a random room adjacent to the location; [Additional chance of choosing another place then the one we just came from]
		let way be the direction from the location of the aswang to place;
		say "The aswang flies up in the air and flees [way].";
		move aswang to place;
		now aswang is not follower;
	otherwise:
		say "The aswang searches for a way to flee, but finds none.".

Every turn (this is the aswang in bird-shape regenerates rule):
	if as-shape of aswang is as-bird:
		if the location of the aswang is not the location of the player:
			heal the aswang for 1 health;
			if health of the aswang is greater than 15:
				now aswang is follower.

Section - And the bird flies

A flying rule (this is the aswang as bird flies rule):
	if test subject is the aswang and the as-shape of the aswang is as-bird:
		rule succeeds.

				
Section - Prose				

A fatal flavour rule (this is the fatal aswang rule):
	if the global defender is the aswang:
		say "The aswang [if as-shape of aswang is as-witch]dies screaming[otherwise if as-shape of aswang is as-bird]dies screeching[otherwise]dies howling[end if].";
		rule succeeds.

A fatal player flavour rule (this is the fatal player aswang rule):
	if the global attacker is the aswang:
		say "You are torn apart by the [if as-shape of aswang is as-witch]witch[otherwise if as-shape of aswang is as-bird]bird[otherwise]hound[end if].";
		rule succeeds.

An attack move flavour rule (this is the aswang attack rule):
	if the global attacker is the aswang:
		say "The aswang rushes at [the global defender], with [if as-shape of aswang is as-witch]sharp fingernails ready[otherwise if as-shape of aswang is as-bird]talons and beak outstretched[otherwise]slavering fangs ready[end if].";
		rule succeeds.

Report an actor dodging (this is the report aswang dodge rule):
	if the actor is the aswang:
		say "The aswang [if as-shape of aswang is as-witch]jumps[otherwise if as-shape of aswang is as-bird]flies[otherwise]jumps[end if] aside.";
		rule succeeds.	
				




Chapter - Abyss of the Soul

[Like the blood ape, except it grows MUCH stronger whenever a creature in the dungeon dies; and the player cannot absorb the soul!]
[But Malygris must have the power to un-undead the player.]

The abyss of the soul is an undead monster. "Before you floats an abyss of the soul; it looks like a [size of the abyss of the soul] sphere of utter darkness."
The abyss of the soul is small.

The description of the Abyss of the Soul is "This [size of the abyss of the soul] sphere of utter darkness is an abyss of the soul, one of the most fearsome of undead monsters. Not only does it sap the strength of all nearby living creatures, it also feeds on the souls of the recently departed.".

The level of the abyss of the soul is 0.

The health of the abyss of the soul is 40.
The melee of the abyss of the soul is 0.
The defence of the abyss of the soul is 8.
The dexterity of the abyss of the soul is 5.
The perception of the abyss of the soul is 5. 
The willpower of the abyss of the soul is 20.

The abyss of the soul is eyeless.
The abyss of the soul is emotionless.
The abyss of the soul is non-attacker.
The abyss of the soul is flyer.

The abyss of the soul strength is a number that varies. The abyss of the soul strength is 2.

Section - AI

[Its AI is so nonstandard that we just override everything else.]

First standard AI action select rule (this is the abyss of the soul AI rule):
	if the global attacker is the abyss of the soul:
		if combat state of the global attacker is at-Act:
			choose a blank Row in the Table of AI Combat Options;
			change the Option entry to the action of the global attacker pulsating;
			change the Weight entry to 1000;
		if combat state of the global attacker is at-React:
			choose a blank Row in the Table of AI Combat Options;
			change the Option entry to the action of the global attacker waiting;
			change the Weight entry to 1000.

Check the abyss of the soul waiting:
	say "The abyss of the soul hovers in the air, nearly motionless." instead.

Pulsating is an action applying to nothing.

Carry out the abyss of the soul pulsating:
	let n be a random number between 1 and the abyss of the soul strength;
	let lijst be a list of person;
	let dodenlijst be a list of persons;
	let achieve-temp be 0;
	repeat with guy running through alive persons in the location:
		unless guy is undead:
			add guy to lijst;
			decrease health of guy by n;
			if guy is killed:
				add guy to dodenlijst;
				if the player is undead:
					now achieve-temp is 1;
	say "[no dead property]The abyss of the soul pulsates, [unless lijst is empty]sending out a wave of negative energy that deals [bold type][n] damage[roman type] to [lijst with definite articles][otherwise]but its negative energy dissipates harmlessly[end if][unless dodenlijst is empty], killing [dodenlijst with definite articles][end if][dead property].";
	unless dodenlijst is empty:
		repeat with guy running through dodenlijst:
			have an event of the abyss of the soul killing guy;
	if the player is killed, end the story saying "Your soul descends into the darkest abyss.";
	if achieve-temp is 1:
		award achievement I return to serve.



Section - Growing

An absorption stopping rule (this is the abyss of the soul absorbs all souls rule):
	if the abyss of the soul is alive and the abyss of the soul is not off-stage:
		if the level of test subject is not 0 and the level of test subject is not 10:
			if the abyss of the soul is not gargantuan:
				now the abyss of the soul is the size after the size of the abyss of the soul;
			increase health of the abyss of the soul by 15;
			increase abyss of the soul strength by 1;
			say "You attempt to absorb the soul of [the test subject], but feel how it disappears into the [bold type]deadly abyss[roman type][if test subject is Malygris]. The abyss of the soul immediately grows to gigantic proportions, obliterating the entire dungeon[end if].";
			if the level of test subject is 5:
				end the game saying "Malygris is dead, and so are you. Technically, that counts as a victory.";
			rule succeeds;
		if the level of test subject is 10:
			say "When the soul of [the test subject] disappears into the deadly abyss, the world of the living is shattered.";
			end the story saying "You have set off a cataclysm that destroys galaxies.";
			rule succeeds.

Section - Prose

A fatal flavour rule (this is the fatal abyss of the soul rule):
	if the global defender is the abyss of the soul:
		say "The abyss of the soul collapses in on itself and disappears with a soft 'plop'.";
		rule succeeds.



Chapter - Smoke demons

[The smoke demon is a bit special. It is immortal, and can only be killed by removing smoke. Multiple smoke demons can exist in different rooms; we just move them to any room where they should be.]

Section - Statistics

A smoke demon is a monster. 

The description of the smoke demon is "It is hard to say exactly which features of the smoky form show it to be sentient, but there is not the slightest doubt in your mind that it is.".

The smoke demon is horrific. The level of the smoke demon is 0.
The smoke demon is smoke attuned.
The smoke demon is flyer.
The smoke demon is emotionless.
The smoke demon is eyeless.

The health of the smoke demon is 10.
The melee of the smoke demon is 2.
The defence of the smoke demon is 5.
The dexterity of the smoke demon is 6.
The perception of the smoke demon is 6. 
The willpower of the smoke demon is 8.

When play begins:
	let X be a random natural weapon part of the smoke demon;
	now damage die of X is 5;
	now dodgability of X is 2;
	now passive parry max of X is 2;
	now active parry max of X is 0;	
	now the printed name of X is "tendrils".

Understand "tendrils" as the smoke demon.


Section - Making it appear and disappear

A room is either smoke-demoned or not smoke-demoned. A room is usually not smoke-demoned.

Every turn (this is the smoke demon appears and disappears rule):
	repeat with place running through smoke-demoned rooms:
		if the smoke timer of place is 0:
			now place is not smoke-demoned;
			if the smoke demon is enclosed by place:
				have the smoke demon disappear from place;
	if the smoke timer of location is greater than 0:
		unless the location is smoke-demoned:
			let n be the smoke timer of the location;
			if n is greater than 5:
				if a random chance of n in 500 succeeds:
					now the location is smoke-demoned;
		if the location is smoke-demoned:
			unless the smoke demon is enclosed by the location:
				if a random chance of 1 in 4 succeeds:
					have the smoke demon appear.

Every turn (this is the tweak smoke demon rule):
	if the smoke demon is enclosed by the location:
		let n be smoke timer of the location divided by 3;
		decrease n by 3;
		now melee of the smoke demon is n;
		increase n by 6;
		now defence of the smoke demon is n.

To have the smoke demon disappear from (place - a room):
	remove smoke demon from play;
	if place is the location:
		say "With an eery cry, the [bold type]smoke demon dissipates[roman type]!".

To have the smoke demon appear:
	now health of the smoke demon is 10;
	move smoke demon to the location;
	say "The smoke coalesces to [bold type]form a smoke demon[roman type]!".


Section - Prose

A fatal flavour rule (this is the fatal smoke demon rule):
	if the global defender is smoke demon:
		say "The smoke demon drifts apart[if the smoke timer of the location is greater than 0]. Though there are still clouds of smoke here, they no longer seem to be sentient[end if].";
		rule succeeds.

A fatal player flavour rule (this is the fatal player smoke demon rule):
	if the global attacker is the smoke demon:
		say "You attempt to breathe, but your lungs are only filled with smoke and more smoke. The murderous vapours seem to become as thick as wool as you desperately try to exhale, inhale, anything -- all in vain. As you suffocate, tendrils of smoke softly close your eyelids.";
		rule succeeds.

An attack move flavour rule (this is the smoke demon attacks rule):
	if the global attacker is smoke demon:
		say "The smoke demon casts his vaporous tendrils towards [the global defender].";
		rule succeeds.

Report an actor parrying (this is the report smoke demon parry rule):
	if the actor is smoke demon:
		say "Protective layers of smoke appear in front of the smoke demon.";
		rule succeeds.

Report an actor dodging (this is the report smoke demon dodge rule):
	if the actor is smoke demon:
		say "The smoke demon gently floats out of the way.";
		rule succeeds.

Report an actor concentrating (this is the smoke demon concentration prose rule):
	if the actor is smoke demon:
		now the global actor is the actor;
		if the concentration of the actor is 1, say "The smoke demon seems to become denser." instead;
		if the concentration of the actor is 2, say "Even more smoke is drawn into the smoke demon's form." instead;
		if the concentration of the actor is 3, say "The smoke demon becomes even denser and now seems almost material." instead.	

Last calculate the final damage rule (this is the smoke demon denseness rule):
	if global defender is the smoke demon:
		if concentration of the global defender is greater than 0:
			if concentration of the global defender is 1:
				say " + 25% (smoke demon is somewhat dense)[run paragraph on]";
				increase final damage by final damage divided by 4;
			if concentration of the global defender is 2:
				say " +50% (smoke demon is quite dense)[run paragraph on]";
				increase final damage by final damage divided by 2;		
			if concentration of the global defender is 3:
				say " + 75% (smoke demon is very dense)[run paragraph on]";
				let n be final damage divided by 4;
				now final damage is final damage times 2;
				decrease final damage by n;
			if concentration of the global defender is 4:
				say " + 100% (smoke demon is extremely dense)[run paragraph on]";
				now final damage is final damage times 2.


Chapter - Imp

Section - Statistics

There is a monster called an imp.

The description of the imp is "Imps are minor demons with unnaturally small wings. They rarely engage in combat, prefering to teleport or fly away from danger.".

The imp is demonic. The level of the imp is 0.
The imp is flyer.

The health of the imp is 10.
The melee of the imp is -2.
The defence of the imp is 9.
The dexterity of the imp is 9.
The perception of the imp is 6. 
The willpower of the imp is 4.

When play begins:
	let X be a random natural weapon part of the imp;
	now damage die of X is 3;
	now dodgability of X is 2;
	now passive parry max of X is 2;
	now active parry max of X is 0;	
	now the printed name of X is "claws".

Understand "claws" as the imp.



Section - AI

A standard AI action select rule (this is the imp ready select rule):
	if the global attacker is the imp:
		choose row with an Option of the action of the global attacker readying the stored_weapon in the Table of AI Combat Options;
		now the Weight entry is -1000.

Imping is an action applying to nothing.
Imp-grabbing is an action applying to nothing.

First standard AI action select rule (this is the consider imping rule):
	if the global attacker is the imp:
		choose a blank Row in the Table of AI Combat Options;
		change the Option entry to the action of the global attacker imping;
		change the Weight entry to a random number between 0 and 80.

Carry out the imp imping:
	say "TEST: [combat state of the imp].";
	if the combat state of the imp is at-React:
		if a random chance of 1 in 2 succeeds:
			try the imp teleporting instead;
		otherwise:
			try the imp dodging instead;
	if the combat state of the imp is at-Act:
		let n be a random number between 1 and 3;
		if n is 1:
			try the imp teleporting instead;
		if n is 2:
			try the imp imp-grabbing instead;
		if n is 3:
			if the location of the imp is the location of the player:
				say "The imp cackles in a loud, shrieking voice.".

Carry out the imp imp-grabbing:
	let lijst be a list of things;
	repeat with item running through things carried by the player:
		if item is not readied and item is not worn:
			add item to lijst;
	repeat with item running through things in the location:
		if item is not a person and item is not fixed in place and item is not scenery and item is not readied and item is not worn:
			add item to lijst;
	unless lijst is empty:
		sort lijst in random order;
		let item be entry 1 in lijst;
		say "The imp [bold type]grabs [the item][roman type] with its thieving little claws.";
		move item to imp;
	if lijst is empty:
		try the imp teleporting instead.

Special teleportation destination rule (this is the imp teleporting rule):
	if the teleportation-guy is the imp:
		if the location of the imp is the Lair of the Imp:
			now teleportation-destination is location of the player;
		otherwise:
			now teleportation-destination is Lair of the Imp.

Every turn when the imp is on-stage (this is the imp not absent AI rule):
	if main actor is the player:
		if location of the imp is not location of the player:
			if location of the imp is not Lair of the Imp:
				try the imp teleporting;
			otherwise:
				repeat with item running through things carried by the imp:
					move item to location of the imp;
				if a random chance of 1 in 5 succeeds:
					let lijst be a list of things; [Don't teleport if there is nothing to steal!]
					repeat with item running through things carried by the player:
						if item is not readied and item is not worn:
							add item to lijst;
					repeat with item running through things in the location:
						if item is not a person and item is not fixed in place and item is not scenery and item is not readied and item is not worn:
							add item to lijst;
					unless lijst is empty:
						try the imp teleporting.
			

Section - Prose				

A fatal flavour rule (this is the fatal imp rule):
	if the global defender is the imp:
		say "The imp dies with a sad screech.";
		rule succeeds.

A fatal player flavour rule (this is the fatal player imp rule):
	if the global attacker is the imp:
		say "The imp's claws open your jugular vein, and hot blood spurts all around.";
		rule succeeds.

An attack move flavour rule (this is the imp attack rule):
	if the global attacker is the imp:
		say "The imp dives at you, his tiny claws ready to strike.";
		rule succeeds.

Report an actor dodging (this is the report imp dodge rule):
	if the actor is the imp:
		say "The imp tries to fly away.";
		rule succeeds.	


[Chapter - Duskwing
A huge skeletal moth with a concentration-stealing ability?]




Kerkerkruip Monsters ends here.
