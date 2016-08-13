Kerkerkruip Monsters by Victor Gijsbers begins here.

Use authorial modesty.


Chapter - Definition of other

Definition: a person is other if it is not the player.

Chapter - Groups of enemies

[ Sometimes enemies are grouped together. We will use a relationship to link a leading enemy with its companions, and properties of each leader will describe the nature of each grouping. ]

Accompaniment relates various people to one person (called the leader).
The verb to accompany (he accompanies, they accompany, he accompanied, it is accompanied, he is accompanying) implies the accompaniment relation. 

Definition: a person is a grouper if it relates to a person by the accompaniment relation.

A person can be group leading.
A person can be initially accompanied. A group leading person is usually initially accompanied.
A person can be kills claiming. A group leading person is usually kills claiming.
A person can be defeated individually.

[This phrase applies even if the guy is dead - in which case, he WAS the sole survivor...]

Definition: a person (called guy) is sole survivor:
	let the leader be the guy;
	if the guy is grouper:
		now the leader is the leader of guy;
		if the leader is alive and the leader is on-stage:
			decide no;
	otherwise:
		if the guy is defeated individually or the guy is not group leading:
			decide yes;
	repeat with follower running through people who accompany the leader:
		if the follower is alive and the follower is on-stage and the follower is not guy:
			decide no;
	yes.
		
[ Place all the groupers with their leaders ]
Final monster placement rule (this is the place accompanying enemies with their leader rule):
	repeat with X running through on-stage group leading people:
		if X is initially accompanied:
			now all the people who accompany X are in the location of X.



Chapter - Monster statistics

A person has a number called ID.
A person can be encountered.
A person has a number called died count. [ The number of times the person has been killed by the player. Also includes kills by player allies. ]
A person has a number called kill count. [ The number of times the person has killed the player. ]

Table of Monster Statistics
ColID (a number)	ColSeen [encountered] (a truth state)	died (a number)	kill (a number)
--	--	--	--
with 50 blank rows [ Don't forget to update this when monsters are added! We include a buffer incase the player goes back to an older version. ]

Section - File of Monster Statistics

The File Of Monster Statistics is called "KerkerkruipStats".

Before showing the title screen (this is the load monster statistics rule):
	if File of Monster Statistics exists:
		read File Of Monster Statistics into the Table of Monster Statistics;
	repeat with X running through npc people:
		if the ID of X is not 0:
			if there is a ColID of ID of X in the Table of Monster Statistics:
				choose row with a ColID of ID of X in the Table of Monster Statistics;
				if there is a ColSeen entry and the ColSeen entry is true:
					now X is encountered;
				if there is a died entry:
					now the died count of X is the died entry;
				if there is a kill entry:
					now the kill count of X is the kill entry;
			otherwise:
				choose a blank row in the Table of Monster Statistics;
				now the ColID entry is the ID of X;

To update the monster statistics:
	repeat with X running through npc people:
		if the ID of X is not 0:
			choose row with a ColID of ID of X in the Table of Monster Statistics;
			if X is encountered:
				now the ColSeen entry is true;
			otherwise:
				blank out the ColSeen entry;
			now the died entry is the died count of X;
			now the kill entry is the kill count of X;
	write File of Monster Statistics from Table of Monster Statistics;

Section - Encountered

Every turn (this is the mark people as encountered rule):
	let update be 0;
	repeat with X running through npc people that are enclosed by the location:
		if X is not encountered:
			now X is encountered;
			now update is 1;
	if update is 1:
		update the monster statistics;

Section - Died and Kill counts

Killing rule (this is the increment died and kill stats rule):
	if killed-guy is the player:
		increment the kill count of the killer-guy;
		#if DEBUG say "[italic type](Kill recorded for [the killer-guy].)[roman type][line break]";
		[ Award a kill to the leader of a group ]
		if the killer-guy is a grouper:
			if the leader of the killer-guy is kills claiming:
				increment the kill count of the leader of the killer-guy;
				#if DEBUG say "[italic type](Kill recorded for [the leader of the killer-guy].)[roman type][line break]";
	otherwise:
		[ Mark a defeat only if the person stands alone or the whole group has been defeated ]
		if the killed-guy is a sole survivor:
			increment the died count of the killed-guy;
			#if DEBUG say "[italic type](Defeat recorded for [the name of killed-guy].)[roman type][line break]";
			[ If a leader was killed before all their groupers then their died count will need to be incremented when the last grouper dies ]
			if the killed-guy is a grouper:
				increment the died count of the leader of the killed-guy;
				#if DEBUG say "[italic type](Defeat recorded for [the name of leader of the killed-guy].)[roman type][line break]";
	update the monster statistics.

Section - Monster avatars for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

A person has a figure name called the avatar. The avatar of a person is usually Figure of Null.
A person has a figure name called the legend-label. The legend-label of a person is usually Figure of Null.

Section - Soul Descriptions for Sensing with Psycholocation

A person has a text called the soul description. The soul description of a person is usually "an unfamiliar presence".

Section - Table of Enemy Powers

Table of Enemy Powers
power (a power)	faculty1 (a faculty)	faculty2 (a faculty)
--	--	--


Chapter - Natural Weapons and Starting Kits

Natural weapon setup of something is an activity on objects.

The natural weapon described is an object that varies.

Before natural weapon setup of a person (called guy) (this is the set the natural weapon described rule):
	Now the natural weapon described is a random natural weapon part of guy;
	now the material of the natural weapon described is the material of the guy;

When play begins (this is the set up natural weapons rule):
	repeat with guy running through people:
   		carry out the natural weapon setup activity with guy.
			
A last reviving rule for a person (called guy) (this is the re-equip when reviving rule):
	Repeat with item running through things had by guy:
		unless the original owner of item is guy, remove item from play;
	set up a kit for guy.
	
Chapter - Ability Cooldowns

To decide what number is a/the/-- cooldown with max (m - a number) scaled by (k - a number):
	Let n be m - (final spirit of the player / k);
	if n < 0, decide on 0;
	decide on n.
	
Chapter - Level 1 - Swarm of Daggers

Section - Definitions

The swarm of daggers is a monster. "A swarm of small daggers is flying through the air like a flock of birds, their sharp points eagerly seeking flesh." The level of swarm of daggers is 1.
The ID of the swarm of daggers is 1.
The swarm of daggers is small.

The swarm of daggers is ambiguously plural.

The swarm of daggers is eyeless.
The material of the swarm of daggers is iron.
The swarm of daggers is emotionless.
The swarm of daggers is flyer.
The swarm of daggers is not talker.
The swarm of daggers is thrower.

The health of the swarm of daggers is 15.
The melee of the swarm of daggers is 4.
The defence of the swarm of daggers is 6.
The body score of the swarm of daggers is 6.
The mind score of the swarm of daggers is 3.
The spirit score of the swarm of daggers is 6. 

For natural weapon setup of the swarm of daggers (this is the daggers' sharp points rule):
	let X be the natural weapon described;
	now damage die of X is 5;
	now dodge bonus of X is 1;
	now parry-with bonus of X is -2;
	now parry-against bonus of X is -2;
	now the printed name of X is "sharp points";
	now X is plural-named.

The description of the swarm of daggers is "Animated by some dark magic, these daggers purposefully seek to undo [if faction of the swarm of daggers hates faction of the player]you[otherwise]their enemies[end if].".

The soul description of the swarm of daggers is "an aura like sharpened steel".

An AI action selection rule for the swarm of daggers (this is the daggers do not concentrate rule):
	choose row with an Option of the action of the swarm of daggers concentrating in the Table of AI Action Options;
	decrease the Action Weight entry by 100.

Section - Dagger images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of swarm of daggers is Figure of map_monster_swarm_of_daggers.
The legend-label of swarm of daggers is Figure of map_legend_swarm_of_daggers.


Section - Scattering

Dagger-scattered is a number that varies. Dagger-scattered is 0.

An aftereffects rule (this is the scatter the daggers rule):
	if the global defender is the swarm of daggers and the total damage is greater than 0 and the swarm of daggers is not dead:
		let n be a random number between 1 and 2;
		if dagger-scattered is 2:
			now n is 2;
		now dagger-scattered is n;
		say "The impact of the blow [italic type]scatters[roman type] the swarm of daggers. They will need to spend [if dagger-scattered is 1]one action[otherwise]two actions[end if] regrouping themselves.".

An AI action selection rule for the swarm of daggers when dagger-scattered is not 0 (this is the daggers must wait if scattered rule):
	choose row with an Option of the action of the swarm of daggers waiting in the Table of AI Action Options;
	now the Action Weight entry is 1000.

Check the swarm of daggers waiting when dagger-scattered is not 0 (this is the daggers regroup rule):
	if dagger-scattered > 1:
		now dagger-scattered is 1;
		say "The swarm of daggers starts to regroup." instead;
	otherwise:
		now dagger-scattered is 0;
		say "The swarm of daggers regroups." instead.

Check the swarm of daggers hitting when dagger-scattered is not 0:
	stop the action;


Section - Prose

Report an actor hitting the dead swarm of daggers:
	say "All life suddenly goes out of the daggers. For a moment they hang still in the air, but then the planet below pulls them inexorably downwards.";
	rule succeeds.

Report the swarm of daggers hitting a dead pc:
	say "You desperately attempt to fend off the flying daggers, but there are too many of them. One by one the daggers sink into your flesh, and your soul flees through a thousand mouths.";
	rule succeeds.

Report the swarm of daggers attacking:
	unless the noun is the actor:
		say "The swarm of daggers [one of]bears down upon[or]launches itself at[or]moves in to attack[at random] [the noun].";
	otherwise:
		say "The daggers start savagely attacking each other!";
	rule succeeds.

Report the swarm of daggers parrying:
	say "Several of the daggers float out to stop the attack.";
	rule succeeds.

Report the swarm of daggers dodging:
	say "The swarm of daggers attempts to outmaneuver the attack.";
	rule succeeds.

Report the swarm of daggers waiting when the swarm of daggers is insane:
	say "The daggers form [one of]a big heart, including the text 'WE LOVE YOU'[or]a screaming face[or]a cute pony[or]the letters 'REDRUM'[or]a hand giving the one finger salute[at random], then quickly go back to their original constellation.";
	rule succeeds.
	

Section - Power

The power of the daggers is a power. Swarm of daggers grants power of the daggers.
The power level of power of the daggers is 1.
The command text of power of the daggers is "pierce[if pierce-cooldown is not 0] ([pierce-cooldown])[end if]".
The description of power of the daggers is "Type: active combat ability.[paragraph break]Command: pierce [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 2 + body/5 extra damage. This ability has a cooldown of 12 - spirit/3 turns."
The power-name of power of the daggers is "power of the daggers".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the daggers	spirit	body

Absorbing power of the daggers:
	increase melee of the player by 2;
	increase inherent damage modifier of the player by 2;
	decrease defence of the player by 1;
	increase permanent health of the player by 6;
	say "As the daggers fall down, you feel the soul that animated them absorbed into your own body. You are sharp. You are deadly. ([bold type]Power of the daggers[roman type]: +2 attack, +2 damage, -1 defence, +6 health, and the [italic type]pierce[roman type] skill.)[paragraph break]".

Repelling power of the daggers:
	decrease melee of the player by 2;
	decrease inherent damage modifier of the player by 2;
	increase defence of the player by 1;
	decrease permanent health of the player by 6.

Status skill rule (this is the pierce status skill rule):
	if the power of daggers is granted:
		say "You can [bold type]pierce[roman type] an enemy, dealing extra damage if your attack hits. This ability has a cooldown. [italic type](Level 1)[roman type][line break][run paragraph on]";



Section - Piercing ability

Piercing is an action applying to one visible thing. Understand "pierce [thing]" as piercing.

Piercing is attacklike behaviour.

Does the player mean piercing the player: it is unlikely.
Does the player mean piercing an alive person: it is very likely.

A person can be at-pierce. A person is usually not at-pierce.

Pierce-cooldown is a number that varies. Pierce-cooldown is 0.

Every turn when main actor is the player (this is the pierce cooldown rule):
	if pierce-cooldown is greater than 0:
		decrease pierce-cooldown by 1;
		if combat status is peace:
			now pierce-cooldown is 0.

Aftereffects rule (this is the remove at-pierce rule):
	now the global attacker is not at-pierce.

Check piercing:
	if power of daggers is not granted:
		take no time;
		say "You do not have that power." instead.

Check piercing:
	if pierce-cooldown is not 0:
		take no time;
		say "You must wait [pierce-cooldown] turn[unless pierce-cooldown is 1]s[end if] before you can use your piercing ability again." instead.

Check piercing:
	abide by the check attacking rules.

Carry out piercing:
	now the player is at-pierce;
	now pierce-cooldown is a cooldown with max 12 scaled by 3;
	try the actor attacking the noun instead.

An add specific damage rule (this is the more damage when piercing rule):
	if damage-by-hitting is true and primary damage is physical damage:
		if the global attacker is at-pierce:
			let n be the final body of the global attacker divided by 5;
			increase n by 2;
			add n points of physical damage with reason "piercing".



Chapter - Level 1 - Blood Ape

Section - Definitions

A blood ape is a monster. "A [if the size of the blood ape is not medium][size of the blood ape] [end if]simian creature aggressively [if player is not hidden][one of]shows you its teeth[or]displays its strength[or]screams at you[at random][otherwise]paces through the room[end if]." Understand "monkey" and "gorilla" and "simian" as the blood ape.

The description of the blood ape is "It looks like a gorilla, except that is has an intensely red fur and is perhaps even more muscular. [if the blood ape is small]Thankfully, the ape is somewhat smaller than you are[otherwise if the blood ape is medium]The blood ape has grown to the proportion of a very broad-chested human[otherwise if the blood ape is large]The blood ape now stands taller than you, and its fists have grown bigger than your head[otherwise if the blood ape is huge]The massive blood ape towers above you, having grown to the size of an elephant[otherwise if the blood ape is gargantuan]The blood ape has grown to colossal proportions, hardly fitting in the room. You fear it could easily crush you[end if]."

The soul description of the blood ape is "a zone of tautened, reddened air".

The level of the blood ape is 1.
The ID of the blood ape is 2.
The blood ape is small.
The blood ape is not talker.
The blood ape is thrower.

The health of the blood ape is 10.
The melee of the blood ape is 0.
The defence of the blood ape is 7.

The body score of the blood ape is 4.
The mind score of the blood ape is 5.
The spirit score of the blood ape is 4. 

For natural weapon setup of the blood ape (this is the blood apes' fists rule):
	let X be the natural weapon described;
	now damage die of X is 6;
	now dodge bonus of X is -1;
	now parry-against bonus of X is 1;
	now parry-with bonus of X is -2;
	now printed name of X is "ape's [size of blood ape] fists";
	now X is plural-named.
	
Starting kit setup for the blood ape (this is the always reset ape's fists rule):
	carry out the natural weapon setup activity with the blood ape.

Aftereffects rule (this is the blood ape grows in size when hit rule):
	if the global attacker is the blood ape and the total damage is greater than 0:
		if the blood ape is not gargantuan:
			now the blood ape is the size after the size of the blood ape;
			say "The ape immediately licks the blood of its enemy from its knuckles. Nourished by this substance, it grows to [bold type][size of the blood ape][roman type] size!";
			increase permanent health of blood ape by 3;
			increase health of blood ape by 3;
			increase body score of the blood ape by 1;
			if size of blood ape is large or size of blood ape is gargantuan:
				increase melee of blood ape by 1;
			let X be a random natural weapon part of the blood ape;
			if the blood ape is medium:
				now dodge bonus of X is 0;
				now parry-against bonus of X is 0;
			if the blood ape is large:
				now dodge bonus of X is 1;
				now parry-against bonus of X is -1;
			if the blood ape is huge:
				now dodge bonus of X is 2;
				now parry-against bonus of X is -2;
			if the blood ape is gargantuan:
				now dodge bonus of X is 3;
				now parry-against bonus of X is -3;
		otherwise:
			say "Sensing perhaps that it cannot grow further in its current confines, the ape does not lick of the blood.".
			

Section - Blood Ape images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of blood ape is Figure of map_monster_blood_ape.
The legend-label of blood ape is Figure of map_legend_blood_ape.


Section - Prose

Report an actor hitting the dead blood ape:
	say "[if the blood ape is small or the blood ape is medium]The blood ape topples over with a small grunt[otherwise]The blood ape crashes down with a huge smack[end if].";
	rule succeeds.

Report the blood ape hitting a dead pc:
	say "The blood ape pounds you into a pulp with its fists, then feasts on your body.";
	rule succeeds.

Report the blood ape attacking:
	unless the noun is the actor:
		say "The blood ape [one of]swings at [regarding the noun][possessive] head[or]jumps at [the noun] with its fists ready to swing[at random].";
	otherwise:
		say "The blood ape swings its fists at its own head!";
	rule succeeds.

Report the blood ape parrying:
	say "The blood ape attempts to stop the attack with its hairy forearms.";
	rule succeeds.

Report the blood ape dodging:
	say "The blood ape tries to jump out of the way.";
	rule succeeds.
	
Report the blood ape waiting when the blood ape is insane:
	say "The blood ape maniacally thumps its chest.";
	rule succeeds.


Section - Power

[We assume that onle the power of the ape can change the size of the player. If this is ever changed, the code below needs to change as well! We'll also need to think about how these things interact.]

The power of the ape is a power. Blood ape grants power of the ape.
The power level of power of the ape is 1.
The maximum ape power is a size that varies.
The command text of power of the ape is "[if maximum ape power is not tiny and maximum ape power is not small and maximum ape power is not medium]ape power[end if]".
The description of power of the ape is "Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: Whenever one of your attacks deals damage, you grow. This growth lasts until the end of combat, and you can never grow bigger than the blood ape was when you killed it. In addition to the usual benefits and penalties of growing, you regain 1 + body/3 points of health whenever you grow."
The power-name of power of the ape is "power of the ape".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the ape		body	--

Absorbing power of the ape:
	now maximum ape power is size of the blood ape;
	let n be 0;
	let m be 1;
	if maximum ape power is small:
		now n is 2;
	if maximum ape power is medium:
		now n is 4;
	if maximum ape power is large:
		now n is 6;
	if maximum ape power is huge:
		now n is 8;
		now m is 2;
	if maximum ape power is gargantuan:
		now n is 10;
		now m is 2;
	increase permanent health of the player by n;
	increase melee of the player by m;
	increase defence of the player by 1;
	increase inherent damage modifier of the player by 1;
	say "The blood-hungry soul that animated the ape is absorbed into your own body. You are strong. You hunger for blood. ([bold type]Power of the ape[roman type]: +[m] attack, +1 defence, +[n] health; [if maximum ape power is not tiny and maximum ape power is not small and maximum ape power is not medium]by scoring hits, you may grow up to [maximum ape power] size[otherwise]the ape was too small to grant you any special powers[end if].)[paragraph break]";
	if maximum ape power is tiny or maximum ape power is small or maximum ape power is medium:
		now command text of power of the ape is "".

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
	decrease inherent damage modifier of the player by 1.
	
Aftereffects rule (this is the increase ape damage rule):
	if global attacker is the player and the total damage is greater than 0:
		if power of the ape is granted:
			if size of the player < maximum ape power:
				["hate is present" is deprecated, but it's not safe to update the combat status here, because this can happen when combat status needs to be concluding]
				if hate is present:
					now the size of the player is the size after the size of the player;
					let n be 0;
					if health of the player < permanent health of the player:
						now n is permanent health of the player minus health of the player;
						let m be 1 + final body of the player / 3;
						if n is greater than m:
							now n is m;
						heal the player for n health;
					say "You grow to [bold type][size of the player][roman type] size[if n is not 0], regaining [n] health in the process[end if]!".

Status attribute rule (this is the ape power damage status rule):
	if power of the ape is granted and player is not medium:
		if long status is true:
			say "[bold type]Power of the ape[roman type]: you are currently [size of the player].[line break][run paragraph on]".
		
Status skill rule (this is the ape power status skill rule):
	if power of the ape is granted:
		say "[if maximum ape power is not tiny and maximum ape power is not small and maximum ape power is not medium]Whenever you damage an enemy, you will grow -- up to [maximum ape power] size[otherwise]The ape was too small to give you a special power[end if]. [italic type](Level 1)[roman type][line break][run paragraph on]".
			
Every turn when the size of the player is not the base size of the player (this is the revert back to normal rule):
	if combat status is peace:
		say "As the combat is over, you revert back to [bold type][base size of the player] size[roman type].";
		now the size of the player is the base size of the player.








Chapter - Level 1 - Ravenous Armadillo

Section - Definitions

The ravenous armadillo is a monster. "A big armadillo is here, searching for anything it can eat."

The level of ravenous armadillo is 1.
The ID of the ravenous armadillo is 3.
The ravenous armadillo is medium.
The ravenous armadillo is not talker.
The ravenous armadillo is thrower.
Material of ravenous armadillo is bone. [Other objects will interact primarily with its bone scales.]

The ravenous armadillo is advanced.

The description of ravenous armadillo is "As their name suggests, ravenous armadillos will eat anything. They may seem slow and easy to hit, but their tough scales ensure that they can shrug off most damage, and their bony tail club packs a considerable punch.".

The soul description of the ravenous armadillo is "energy like a screen of scales".

The health of the ravenous armadillo is 10.
The melee of the ravenous armadillo is 0.
The defence of the ravenous armadillo is 6.

The body score of the ravenous armadillo is 6.
The mind score of the ravenous armadillo is 4.
The spirit score of the ravenous armadillo is 5. 

The intrinsic heat resistance of the ravenous armadillo is 3.

A remove specific damage rule (this is the armadillo physical damage reduction rule):
	if the victim is the ravenous armadillo:
		remove 4 points of physical damage with reason "tough scales".
		
For natural weapon setup of the armadillo (this is the armadillo's bony tail club rule):
	let X be the natural weapon described;
	now damage die of X is 4;
	now dodge bonus of X is 1;
	now parry-against bonus of X is -1;
	now parry-with bonus of X is 1;
	now the printed name of X is "bony tail club".		


Section - Armadillo images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)	

The avatar of ravenous armadillo is Figure of map_monster_ravenous_armadillo.
The legend-label of ravenous armadillo is Figure of map_legend_ravenous_armadillo.


Section - Prose

Report an actor hitting the dead ravenous armadillo:
	say "As the armadillo dies, its body splits open, revealing [if at least one thing is in the armadillo stomach][a list of things in the armadillo stomach][otherwise]nothing at all[end if].";
	rule succeeds.

Report the ravenous armadillo hitting a dead pc:
	say "The ravenous armadillo smashes your head in with its tail club.";
	rule succeeds.

Report the ravenous armadillo attacking:
	unless the actor is the noun:
		say "The armadillo raises its tail threateningly towards [the noun].";
	otherwise:
		say "The armadillo swings its tail towards its own head.";
	rule succeeds.

Report the ravenous armadillo parrying:
	say "The armadillo tries to ward off the attack with its tail.";
	rule succeeds.

Report the ravenous armadillo dodging:
	say "The armadillo lumbers aside.";
	rule succeeds.
		
Report the ravenous armadillo concentrating:
	if the concentration of the ravenous armadillo is:
		-- 1:
			say "The armadillo narrows its eyes. You assume it is concentrating.";
		-- 2:
			say "The armadillo makes a few thoughtful movements with its tail.";
		-- 3:
			say "A final sweep of its tail club seems to indicate that the armadillo has made up its mind.";
	rule succeeds.

Report the ravenous armadillo waiting when the ravenous armadillo is insane:
	say "The armadillo tries to eat its own feet.";
	rule succeeds.
		

Section - Armadillo-eating

Armadillo-eating is an action applying to nothing.

An AI action selection rule for the ravenous armadillo (this is the ravenous armadillo considers eating rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the ravenous armadillo armadillo-eating;
	now the Action Weight entry is -100;
	if a random chance of 1 in 2 succeeds:
		if there is a good item for the armadillo to eat:
			now Action Weight entry is 12;
		otherwise if a random chance of 1 in 10 succeeds:
			now Action Weight entry is 10.

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


Section - The armadillo stomach

[Wacth out: if you write AI rules that allow the armadillo to use items it encloses, it may start using things it has eaten!]

The armadillo stomach is a closed opaque container. The armadillo stomach is part of the ravenous armadillo.

Starting kit setup for the armadillo (this is the fill the stomach rule):
	let item be a random off-stage minor thing;
	unless item is nothing:
		move item to the armadillo stomach;
		if generation info is true, say "* Moved [item] to the stomach of the armadillo.".

Every turn when at least one thing is in the armadillo stomach:
	repeat with item running through things in the armadillo stomach:
		corrode item.

Disappearing the ravenous armadillo:
	while at least one thing is in the armadillo stomach:
		let item be a random thing in the armadillo stomach;
		move item to the location of the ravenous armadillo.

The armadillo stomach is privately-named.


Section - Armadillo also eats when the player is not around

Independent action rule when test subject is the ravenous armadillo (this is the armadillo acts when it can't see the player rule):
	if there is no perceived threat for the ravenous armadillo, rule succeeds;

Every turn when the ravenous armadillo is acting independently (this is the armadillo eats when the player is not around rule):
	if the ravenous armadillo can move:
		if the ravenous armadillo is elsewhere:
			if a random chance of 1 in 5 succeeds:
				try the ravenous armadillo armadillo-eating.

Section - Armadillo moves around

Every turn when the ravenous armadillo is acting independently (this is the armadillo moves when the player is not around rule):
	if the ravenous armadillo can move:
		if a random chance of 1 in 20 succeeds:
			if at least one room is adjacent to the location of the ravenous armadillo:
				let place2 be the location of the ravenous armadillo; [needed because of a bug in inform]
				let place be a random room which is adjacent to place2;
		[		let place be a random room which is adjacent to the location of the ravenous armadillo;]
				let way be the direction from the location of the ravenous armadillo to place;
				[say "TEST CODE: trying the armadillo going [way].";]
				try the ravenous armadillo going way.

Section - Power of the Armadillo

The power of the armadillo is a power. Ravenous armadillo grants power of the armadillo.
The power level of power of the armadillo is 1.
The command text of power of the armadillo is "scales[if scales-cooldown is not 0] ([scales-cooldown])[end if]".
The description of power of the armadillo is "Type: reactive combat ability.[paragraph break]Command: scales.[paragraph break]Effect: As a reaction, you can use the scales skill to cover yourself in damage absorbing scales. The damage of the current attack will be reduced by 5 + body/3 points. This ability has a cooldown of 10 - spirit/4 turns."
The power-name of power of the armadillo is "power of the armadillo".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the armadillo	body	spirit

Absorbing power of the armadillo:
	increase melee of the player by 1;
	increase permanent health of the player by 5;
	say "As the armadillo succumbs, you feel its soul absorbed into your own body. ([bold type]Power of the armadillo[roman type]: +1 attack, +1 damage resistance, +5 health, and the [italic type]scales[roman type] skill, which allows you to cover yourself in hard scales.)[paragraph break]".

A remove general damage rule (this is the power of the armadillo gives damage resistance rule):
	if the victim is the player and the power of the armadillo is granted:
		remove 1 points of general damage with reason "armadillo".

Repelling power of the armadillo:
	decrease melee of the player by 1;
	decrease permanent health of the player by 5.

Section - The scales skill

A person can be at-scale. A person is usually not at-scale.

A remove general damage rule (this is the scales gives damage resistance rule):
	if victim is at-scale:
		let n be the final body of the victim divided by 3;
		increase n by 5;
		remove n points of general damage with reason "scales".

Scaling is an action applying to nothing. Understand "scale" and "scales" as scaling.

Check scaling:
	if power of the armadillo is not granted:
		take no time;
		say "You do not possess that power." instead.

Check scaling:
	if the combat state of the player is not at-React:
		take no time;
		say "You can only use the scales ability as a reaction." instead.

Scales-cooldown is a number that varies. Scales-cooldown is 0.

Every turn when main actor is the player (this is the scales cooldown rule):
	if scales-cooldown is greater than 0:
		decrease scales-cooldown by 1;
		if combat status is peace:
			now scales-cooldown is 0.
		
Check scaling:
	if scales-cooldown is not 0:
		take no time;
		say "You must wait [scales-cooldown] turn[unless scales-cooldown is 1]s[end if] before you can use your scaling ability again." instead.		

Carry out scaling:
	say "Hard scales appear all over your body.[paragraph break]";
	now the player is at-scale;
	now scales-cooldown is a cooldown with max 10 scaled by 4.
	
Aftereffects rule (this is the remove at-scale rule):
	now the global defender is not at-scale.

Status skill rule (this is the armadillo status skill rule):
	if the power of armadillo is granted:
		say "You can react by using your [bold type]scales[roman type] power, which covers you in hard scales that reduce the damage done to you. This ability has a cooldown. [italic type](Level 1)[roman type][line break][run paragraph on]".



Chapter - Level 1 - Miranda

Section - Definitions

Miranda is a monster. "A stunning young woman in a simple monk's robe awaits you."

Miranda is proper-named. Miranda is female. Miranda is not neuter. Understand "young" and "woman" and "stunning" and "monk" as Miranda.

The level of Miranda is 1.
The ID of Miranda is 4.
Miranda is medium.
Miranda is talker.
Miranda is thrower.
Material of Miranda is flesh.

The description of Miranda is "Although she is currently working as one of Malygris's guards, Miranda dreams about a bright future as a famous adventurer.".

The soul description of Miranda is "a cloud of staggering purple".

The health of Miranda is 14.
The melee of Miranda is 0.
The defence of Miranda is 7.
The body score of Miranda is 5.
The mind score of Miranda is 7.
The spirit score of Miranda is 5.

Miranda is weapon user.

For natural weapon setup of Miranda (this is the Miranda's fists rule):
	let X be the natural weapon described;
	now damage die of X is 5;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now the printed name of X is "fists";
	now X is plural-named.	


Section - Miranda images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)	

The avatar of Miranda is Figure of map_monster_Miranda.
The legend-label of Miranda is Figure of map_legend_Miranda.

Section - Setting up Miranda's power and equipment

nunchucks-kit is a starting kit. The recipient is Miranda. nunchucks-kit contains the pair of nunchucks.

double-strike-kit is a starting kit. The rarity is 2. The recipient is Miranda. double-strike-kit contains the dagger of the double strike.

miranda-fists is a starting kit. The rarity is 2. The recipient is Miranda.

Starting kit setup when selecting nunchucks-kit:
	now the pair of nunchucks is wood;
	if a random chance of 1 in 20 succeeds:
		now the pair of nunchucks is adamant;
	
[nothing to do for miranda-fists or double-strike-kit]

Starting kit setup for Miranda (this is the setting up Miranda rule):
	now stun probability of Miranda is 100;
	if a random chance of 1 in 2 succeeds:
		now Miranda is not concentration-breaking reactor;
		now Miranda is disarmer;
		now disarm strength of Miranda is 9;
	otherwise:
		now Miranda is not Disarmer;
		now Miranda is concentration-breaking reactor;
		now cbr strength of Miranda is 9;
	equip Miranda with the monk's robe;
	if a random chance of 1 in 5 succeeds:
		equip Miranda with Miranda's amulet.
		
Section - Miranda's shuriken attack

First cbr text of Miranda is "Miranda quickly throws a shuriken, attempting to break [regarding the noun][possessive] concentration. [italic type][run paragraph on]".
Cbr fail text of Miranda is "[roman type] The shuriken misses, and [regarding the noun][possessive] attack continues unhampered.[paragraph break]".
Cbr success text of Miranda is "[roman type] The shuriken hits, making [bold type][the noun] lose concentration[roman type]![paragraph break]".

Section - Miranda's Prose

Report an actor hitting the dead Miranda:
	say "'But... my adventure was only just beginning!' cries Miranda.";
	rule succeeds.

Report Miranda hitting a dead pc:
	say "Miranda dances on your corpse. 'This is my first step towards fame!'";
	rule succeeds.

Report Miranda attacking:
	unless the actor is the noun:
		say "Miranda jumps towards [the noun][if Miranda is at-stun], intent on stunning[end if].";
	otherwise:
		say "'I just can't go on,' Miranda sobs as she attempts to end her own life.";
	rule succeeds.

Report Miranda parrying:
	say "Miranda attempts to ward off the attack.";
	rule succeeds.

Report Miranda dodging:
	say "Miranda jumps aside.";
	rule succeeds.

Report Miranda concentrating:
	if the concentration of the actor is:
		-- 1:
			say "Miranda seeks the calm within.";
		-- 2:
			say "Chanting softly, Miranda aligns her spirit with the ambient energies.";
		-- 3:
			say "Miranda finishes her meditations.";
	rule succeeds.

Report Miranda waiting when Miranda is insane:
	say "Miranda waves her hands around in a magical pattern that you do not recognise. 'Wax on, wax off,' she announces.";
	rule succeeds.

Section - Power of Miranda


[For stunning, see Kerkerkruip Monster Abilities]

The power of Miranda is a power. Miranda grants power of Miranda.
The power level of power of Miranda is 1.
The command text of power of Miranda is "stun".
The description of power of Miranda is "Type: active combat ability.[paragraph break]Command: stun [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 1 less damage, but it stuns the target for a number of turns equal to your mind score. A stunned person has a -1 attack penalty, and a penalty on body, mind and spirit equal to your mind/2."
The power-name of power of Miranda is "power of Miranda".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of Miranda		mind	--


Absorbing power of Miranda:
	increase melee of the player by 1;
	increase defence of the player by 1;	
	increase permanent health of the player by 5;
	say "As Miranda dies, you feel her soul absorbed into your own body. ([bold type]Power of Miranda[roman type]: +1 attack, +1 defence, +5 health, and the [italic type]stun[roman type] skill.)[paragraph break]".

Repelling power of Miranda:
	decrease melee of the player by 1;
	decrease defence of the player by 1;
	decrease permanent health of the player by 5.

Status skill rule (this is the Miranda status skill rule):
	if the power of Miranda is granted:
		say "You have the [bold type]stun[roman type] skill: you can try to [italic type]stun[roman type] an enemy; this means you attack with a -1 damage penalty, but if you hit you will decrease the opponent's effectiveness for several rounds. [italic type](Level 1)[roman type][line break][run paragraph on]".



Chapter - Level 1 - Wisps of pain

Section - Definitions

The wisps of pain are a monster. "Wisps of pain hover in the air[if the wisp-target is not the wisps of pain and wisp-target is alive and location of wisp-target is location of wisps of pain], close around [the wisp-target][end if]."

The wisps of pain are plural-named. Understand "wisp" as the wisps of pain.

The level of the wisps of pain is 1.
The ID of the wisps of pain is 30.
The wisps of pain are tiny.
The wisps of pain are not talker.
The wisps of pain are not thrower.
The wisps of pain are flyer.
The material of the wisps of pain is darkness.

The description of the wisps of pain is "Dark spots of necromantic magic move through the air. They deal pain and torment, and can permanently cripple anyone foolish enough to oppose them.".

The soul description of the wisps of pain is "dark stains of tormented energy".

The health of the wisps of pain is 14.
The melee of the wisps of pain is 0.
The defence of the wisps of pain is 5.
The body score of the wisps of pain is 3.
The mind score of the wisps of pain is 6.
The spirit score of the wisps of pain is 9.

The wisps of pain is advanced.

A remove general damage rule (this is the wisps of pain take less damage rule):
	if victim is the wisps of pain:
		remove 5 points of general damage with reason "hard to damage".

For natural weapon setup of the wisps of pain (this is the wisps of pain's magic weapon rule):
	let X be the natural weapon described;
	now damage die of X is 0;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now the printed name of X is "necromantic magic";

Section - Wisps of pain images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)	

The avatar of wisps of pain is Figure of map_monster_wisps_of_pain.
The legend-label of wisps of pain is Figure of map_legend_wisps_of_pain.


Section - States

[The wisps of pain are either at large in the room, or circling around someone. They can only use their torment power when at large, and can only hurt someone when circling around a person. ]

[If the wisps are circling around someone, that person is the wisp-target. Otherwise, they themselves are the wisp-target.]

The wisp-target is a person that varies. The wisp-target is the wisps of pain.

Section - AI Rules

Chance to win rule when the global attacker is the wisps of pain (this is the CTW wisps of pain rule):
	increase the chance-to-win by 20. [Always successful.]

An AI action selection rule for the wisps of pain (this is the special wisps AI rule):
	choose row with an Option of the action of the wisps of pain concentrating in the Table of AI Action Options;
	decrease the Action Weight entry by 100;
	if the wisps of pain is at-React:
		choose row with an Option of the action of the wisps of pain parrying in the Table of AI Action Options;
		decrease the Action Weight entry by 100.
	
[An AI action selection rule for the wisps of pain (this is the wisps of pain consider wisphurting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the wisps of pain wisphurting the chosen target;
	increase Action Weight entry by 20.]

An AI action selection rule for the wisps of pain (this is the wisps of pain consider tormenting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the wisps of pain tormenting;
	now the Action Weight entry is 0;
	if the wisp-target is the wisps of pain:
		let n be 0;
		repeat with guy running through people in location of the wisps of pain:
			if faction of guy hates faction of wisps of pain:
				increase n by concentration of guy;
				if guy is chosen target:
					increase n by concentration of guy;
		if n is 0:
			decrease Action Weight entry by 100;
		otherwise:
			increase Action Weight entry by (2 * n);
	otherwise:
		decrease Action Weight entry by 100.

Section - Resetting wisp-target

A sudden combat reset rule for a person (called guy) (this is the reset wisps rule):
	if guy is the wisps of pain or guy is the wisp-target:
		now the wisp-target is the wisps of pain;

[sometimes this rule will get invoked an extra time if everybody in the room gets reset. Oh well.]

Section - Redirecting attacking + changing wisp-target

Check the wisps of pain attacking:
	if the wisp-target is the noun:
		try the wisps of pain wisphurting the noun instead;
	otherwise:
		now wisp-target is the noun;
		say "The wisps of pain float through the air, positioning themselves around [the noun]." instead.

Check the wisps of pain hitting:
	do nothing instead.

Section - Redirecting dodging

Instead of the wisps of pain dodging:
	if the wisp-target is the wisps of pain:
		try the wisps of pain tormenting;
	otherwise:
		do nothing.

Section - Causing pain

Wisphurting is an action applying to one thing.

Carry out the wisps of pain wisphurting:
	let n be a random number between 1 and 3;
	say "The wisps of pain launch themselves at [if the noun is not the player][the noun][otherwise]you[end if], passing right through [if the noun is not the player][regarding the noun][possessive][otherwise]your[end if] body and dealing 1 point of permanent [bold type][if n is 1]body[otherwise if n is 2]mind[otherwise]spirit[end if] damage[roman type]. They then spread out through the room.";
	if n is 1:
		decrease body score of the noun by 1;
	if n is 2:
		decrease mind score of the noun by 1;	
	if n is 3:
		decrease spirit score of the noun by 1;
	now wisp-target is wisps of pain.

Section - Tormenting power

Tormenting is an action applying to nothing. Understand "torment" as tormenting.

Carry out an actor tormenting:
	if actor is the player:
		now torment-cooldown is a cooldown with max 12 scaled by 3;
	let lijst be a list of persons;
	repeat with guy running through alive persons enclosed by the location:
		if concentration of guy is greater than 0:
			let n be final mind of guy;
			unless a random chance of n in 50 succeeds:
				add guy to lijst;
				now concentration of guy is 0;
	say "[if the actor is the player]You project[otherwise if the actor is the wisps of pain]The wisps of pain suddenly release[otherwise][The actor] releases[end if] a wave of tormenting energy, [if number of entries in lijst is 1 and the player is listed in lijst]breaking [bold type]your concentration[roman type][otherwise if number of entries in lijst is not 0]breaking the [bold type]concentration[roman type] of [lijst with definite articles][otherwise]which doesn't seem to do anything[end if]."

Check tormenting:
	if power of the wisps is not granted:
		take no time;
		say "You do not possess that power." instead.

Torment-cooldown is a number that varies. Torment-cooldown is 0.

Every turn when main actor is the player (this is the torment cooldown rule):
	if torment-cooldown is greater than 0:
		decrease torment-cooldown by 1;
		if combat status is peace:
			now torment-cooldown is 0.
		
Check tormenting:
	if torment-cooldown is not 0:
		take no time;
		say "You must wait [torment-cooldown] turn[unless torment-cooldown is 1]s[end if] before you can use your tormenting ability again." instead.		



Section - Prose

Report an actor hitting the dead wisps of pain:
	say "With a sudden flash of blueish light, the wisps of pain disintegrate.";
	rule succeeds.

Report the wisps of pain hitting a dead pc:
	say "The wisps of pain feast on your body. 'I didn't even know we could deal damage?' one of them whispers. 'No, it must be a bug. But let's enjoy it while we may,' another answers.";
	rule succeeds.

Report the wisps of pain waiting when the wisps of pain are insane:
	say "The wisps of pain bounce around the room.";
	now the wisp-target is wisps of pain;
	rule succeeds.

Section - Power

The power of the wisps is a power. Wisps of pain grants power of the wisps.
The power level of power of the wisps is 1.
The command text of power of the wisps is "torment[if torment-cooldown is not 0] ([torment-cooldown])[end if]".

The description of power of the wisps is "Type: active ability.[paragraph break]Command: torment.[paragraph break]Effect: A wave of torment will pass through the room, breaking everyone's concentration. (A person has a 2% chance of resisting this effect per point of mind.) This ability has a cooldown of 12 - spirit/3 turns."
The power-name of power of the wisps is "power of the wisps".
The power of the wisps is not sacrificable.

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the wisps		spirit	--

Wisp-strength is a number that varies. Wisp-strength is 0.

Absorbing power of the wisps:
	now wisp-strength is greatest power of the player;
	if wisp-strength is less than 1:
		now wisp-strength is 1;
	increase melee of the player by 1;
	increase defence of the player by 1;
	increase permanent health of the player by 6;
	say "As the wisps of pain are destroyed, you feel the soul that animated it absorbed into your own body. This causes you immediate and seemingly permanent [bold type]pain[roman type]! ([bold type]Power of the wisps[roman type]: +1 attack, +1 defence, +6 health, the [italic type]torment[roman type] skill, and pain.)[paragraph break]".

Repelling power of the wisps:
	decrease melee of the player by 1;
	decrease defence of the player by 1;
	decrease permanent health of the player by 6;
	[say "The pain that didn't kill you, [bold type]made you stronger[roman type]! (Repelling the power of the wisps has given you a permanent +[wisp-strength] bonus to body, mind and spirit.)".]

A faculty bonus rule (this is the wisps faculty penalty or bonus rule):
	if wisp-strength is not 0:
		if power of the wisps is granted:
			decrease faculty bonus score by wisp-strength;
		otherwise:
			increase faculty bonus score by wisp-strength.

Status skill rule (this is the wisps status skill rule):
	if the power of wisps is granted:
		say "You have the [bold type]torment[roman type] skill: you can [italic type]torment[roman type] everyone in the room, breaking their concentration. [italic type](Level 1)[roman type][line break][run paragraph on]".

Status attribute rule (this is the wisps status rule):
	if wisp-strength is not 0:
		if long status is true:
			if power of the wisps is granted:
				say "You are [bold type]in pain[roman type]: -[wisp-strength] to body, mind and spirit.[line break][run paragraph on]";
			otherwise:
				say "Pain has made you [bold type]stronger[roman type]: +[wisp-strength] to body, mind and spirit.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute][if power of the wisps is granted]in pain[otherwise]pain-hardened[end if][run paragraph on]";



Chapter - Level 2 - Chain Golem

[Chain golem: when concentrating, surrounds itself with a whirling, slicing field of chains.] [Wounds inflicted by the chain golem continue to bleed?]

Section - Definitions

The chain golem is a monster. "Hulking in the centre of the room is a chain golem, a moving mass of [if chain golem is iron]iron and copper[otherwise][material-adjective of material of chain golem][end if] chains, both thick and thin[if the concentration of the chain golem is not 0]. The golem is spinning [end if][if the concentration of the chain golem is 1]slowly[otherwise if the concentration of the chain golem is 2]wildly[otherwise if the concentration of the chain golem is 3]furiously[end if]."

The level of the chain golem is 2.
The ID of the chain golem is 5.
The chain golem is large.
The chain golem is not talker.
The chain golem is thrower.

The chain golem is eyeless.
Material of the chain golem is iron.
The chain golem is emotionless.

The description of the chain golem is "A hulking form made of [if chain golem is iron]metal[otherwise][material-adjective of material of chain golem][end if] chains and animated by a soul bound to it through dark magics.".

The soul description of the chain golem is "lashings of steel".

The health of the chain golem is 28.
The melee of the chain golem is 1.
The defence of the chain golem is 8.

The body score of the chain golem is 7.
The mind score of the chain golem is 4.
The spirit score of the chain golem is 7.

For natural weapon setup of the chain golem (this is the lashing chains rule):
	let X be the natural weapon described;
	now damage die of X is 2;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is 1;
	now the printed name of X is "lashing chains";
	now X is tethered;
	now X is plural-named;

To attempt is a verb. To die is a verb.

First carry out an actor attacking the chain golem (this is the attack a spinning chain golem rule):
	if the chain golem is conscious in this world:
		let W be the current weapon of the actor;
		unless W is ranged:
			say "[The actor] [attempt] to duck under the whirling chains. [run paragraph on]";
			let n be 6;
			repeat with die roll running from 1 to concentration of the chain golem:
				increase n by a random number from 1 to 3;
			test the body of the actor against n;
			if test result is false:
				let n be two times the concentration of the chain golem;
				unless n is 0:
					say " One of the chains catches [the actor] with a loud smack, dealing [run paragraph on]";
					deal n points of physical damage;
					let X be a random natural weapon part of the chain golem;
					have X inflict damage on the actor;
					if the actor is alive:
						if the concentration of the actor is not zero:
							say " and breaking [regarding the actor][possessive] concentration.";
							now concentration of the actor is 0;
						otherwise:
							say ".";
					otherwise:
						say "[if the actor is the player] and killing you.[otherwise] [The actor] immediately [die].[end if]";
						have an event of the chain golem killing the actor;
						if the player is dead:
							end the story saying "You died valiantly, but in vain";
						rule fails;
				otherwise:
					say " One of the chains catches [the actor] with a loud smack, but it deals no damage[roman type].";
			otherwise:
				say "[paragraph break]".		

The chain golem is abnormal-concentrating.

An add specific damage rule (this is the chain golem damage depends on concentration rule):
	if damage-by-hitting is true and primary damage is physical damage:
		if the global attacker is the chain golem and the concentration of the chain golem is not 0:
			let n be the concentration of the chain golem times 2;
			add n points of physical damage with reason "golem spinning".

An AI action selection rule for the chain golem (this is the chain golem likes to concentrate rule):
	unless a random chance of 1 in 10 succeeds:
		choose row with an Option of the action of the chain golem concentrating in the Table of AI Action Options;
		increase the Action Weight entry by 15.

[An AI action selection rule (this is the chain golem attack select rule):
	if the global attacker is the chain golem:
		choose row with an Option of the action of the global attacker attacking the global defender in the Table of AI Action Options;
		if concentration of the global attacker is 0:
			decrease the Weight entry by 15;
		if concentration of the global attacker is 1:
			decrease the Weight entry by 8.]

Section - Chain Golem images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of chain golem is Figure of map_monster_chain_golem.
The legend-label of chain golem is Figure of map_legend_chain_golem.

Section - Disarming

The chain golem is disarmer.
Disarm strength of chain golem is 13.

First disarm text of the chain golem is "[chain-disarm-1]".
To say chain-disarm-1: say "[The chain golem] suddenly launches several of its chains in an attempt to grab [regarding the noun][possessive] weapon. [italic type][run paragraph on]".

To realise is a verb.

Second disarm text of the chain golem is "[chain-disarm-2]".
To say chain-disarm-2: say "[roman type] [The noun] [realise] what is happening only when it is too late, and a chain has already wrapped itself around [regarding the noun][possessive] [disarm-weapon], pulls sharply, and [bold type]sends the weapon flying[roman type] across the room.".

Section - Prose

Report an actor hitting the dead chain golem:
	say "The chains lash out one final time, blindly seeking prey -- but fall down limply before they can hit anyone. With thousands of [if chain golem is iron]hard metal [end if]clicks they start falling asunder.";
	rule succeeds.

Report the chain golem hitting a dead pc:
	say "Smashed by the chains, your broken body is slowly dragged towards the core of the golem -- where an unmentionable fate awaits it.";
	rule succeeds.

Report the chain golem attacking:
	unless the actor is the noun:
		say "Several of the [if concentration of the chain golem is 1]slowly spinning [otherwise if concentration of the chain golem is 2]spinning [otherwise if concentration of the chain golem is 3]wildly spinning [end if]chains [one of]direct themselves towards[or]lash out at[or]attempt to smash themselves into[at random] [the noun].";
	otherwise:
		say "The chain golem's chains get all entangled, and seem to want to rip each other apart.";
	rule succeeds.

Report the chain golem parrying:
	say "The chain golem lashes out with a heavy [material-adjective of material of chain golem] chain, trying to stop the attack.";
	rule succeeds.

Report the chain golem dodging:
	say "The chain golem attempts to squirm out of the way.";
	rule succeeds.

Report the chain golem concentrating:
	if the concentration of the chain golem is:
		-- 1:
			say "The chain golem starts rotating slowly, spinning its chains around its core.";
		-- 2:
			say "The chain golem speeds up, its chains whirling through the air.";
		-- 3:
			say "The chain golem spins even faster, audibly slashing the air with its whip-like [if chain golem is iron]metal[otherwise][material-adjective of material of chain golem][end if] appendages.";
	rule succeeds.

Lose concentration prose rule for the chain golem:
	say "Unbalanced by the hit, the chain golem [bold type]stops spinning[roman type]." instead.

Report the chain golem waiting when the chain golem is insane:
	say "The chain golem dances what appears to be a [one of]wild tango[or]passable waltz[or]pretty insane jumpstyle[or]romantic merengue[at random].";
	rule succeeds.

Section - Power

The power of the chains is a power. Chain golem grants power of the chains.
The power level of power of the chains is 2.
The command text of power of the chains is "lash[if lash-cooldown is not 0] ([lash-cooldown])[end if]".
The description of power of the chains is "Type: reactive combat ability.[paragraph break]Command: lash.[paragraph break]Effect: As a reaction, you attack your attacker. Whether you get to strike first is determined randomly, but the probability increases with your spirit score. (It is 50% at a spirit score of 8.) This ability has a cooldown of 10 - spirit/5 turns."
The power-name of power of the chains is "power of the chains".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the chains	spirit	--

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

Lashing is attacklike behaviour.

Before lashing when Nomos counter is greater than 0:
	take no time;
	say "You cannot lash out, since that would break the command of Nomos.".

Check lashing:
	if power of the chains is not granted:
		take no time;
		say "You do not possess that power." instead.

Check lashing:
	if the combat state of the actor is not at-React:
		take no time;
		say "You can only lash as a reaction to an attack." instead.

Carry out an actor lashing:
	if the actor is the player:
		now lash-cooldown is a cooldown with max 10 scaled by 5;
	choose a blank row in the Table of Delayed Actions;
	let n be 10 - final spirit of the actor / 4;
	let m be a random number between n and 12;
	now the Action Speed entry is m;
	now the Action to take entry is the action of the actor hitting the main actor.

Report an actor lashing:
	if the actor is the player:
		say "You will attempt to strike swiftly, before you are hit.";
	otherwise:
		say "[The actor] [counterattack]."


Lash-cooldown is a number that varies. Lash-cooldown is 0.

Every turn when main actor is the player (this is the lash cooldown rule):
	if lash-cooldown is greater than 0:
		decrease lash-cooldown by 1;
		if combat status is peace:
			now lash-cooldown is 0.
		
Check lashing:
	if lash-cooldown is not 0:
		take no time;
		say "You must wait [lash-cooldown] turn[unless lash-cooldown is 1]s[end if] before you can use your lashing ability again." instead.		

Status skill rule (this is the chain golem power status skill rule):
	if power of the chains is granted:
		say "You can [bold type]lash[roman type] as a reaction. This counterattack will sometimes, but not always, happen before the enemy hits you. This ability has a cooldown. [italic type](Level 2)[roman type][line break][run paragraph on]".







Chapter - Level 2 - Jumping Bomb

Section - Definitions

A jumping bomb is a monster. "A skull-sized ball of gooish, undulating flesh jumps up and down [if concentration of the jumping bomb is 0]ponderously[otherwise if concentration of the jumping bomb is 1]slowly[otherwise if concentration of the jumping bomb is 2]quickly[otherwise if concentration of the jumping bomb is 3]frantically[end if]. It is a jumping bomb, [unless concentration of the jumping bomb is 3]gathering speed and[end if] preparing to launch itself at one of its enemies."

Understand "ball" and "flesh" and "meat" as the jumping bomb.

The level of jumping Bomb is 2.
The ID of the jumping Bomb is 6.
The jumping bomb is small.
The jumping bomb is not talker.
The jumping bomb is not thrower.

The jumping bomb is eyeless.
The jumping bomb is emotionless.
Material of the jumping bomb is flesh.

The description of the jumping bomb is "Connoisseurs consider these jumping balls of red meat to be among the most exciting spectacles of Yahvinna's annual Feast of Flesh. To the slaves and convicts down in the arena, whose limbs the spectators hope to have blown into their lap, the jumping bombs also bring excitement, though of a wholly different type.".

The soul description of the jumping bomb is "a pulsating bundle of glowing embers".

The health of the jumping bomb is 22.
The melee of the jumping bomb is 2.
The defence of the jumping bomb is 8.

The body score of the jumping bomb is 8.
The mind score of the jumping bomb is 1.
The spirit score of the jumping bomb is 3. 

When play begins (this is the make jumping bomb easier for novices rule):
	if difficulty is 0:
		decrease melee of the jumping bomb by 1. [Too hard for new players.]

For natural weapon setup of the jumping bomb (this is the bomb's surface rule):
	let X be the natural weapon described;
	now dodge bonus of X is 1;
	now parry-against bonus of X is -3;
	now parry-with bonus of X is -2;
	now printed name of X is "bomb's detonating surface";
	now special weapon info of X is "kills instantly";

Initiative update rule when the jumping bomb is enclosed by the location (this is the jumping bomb has slightly less initiative rule):
	if a random chance of 1 in 5 succeeds:
		decrease the initiative of the jumping bomb by 1.

An AI action selection rule for the at-Act jumping bomb (this is the jumping bomb only attacks when highly concentrated rule):
	choose row with an Option of the action of the bomb attacking the chosen target in the Table of AI Action Options;
	if concentration of the jumping bomb is less than 2:
		decrease the Action Weight entry by 100;
	if concentration of the jumping bomb is 2:
		decrease the Action Weight entry by 5.

An AI action selection rule for the jumping bomb (this is the jumping bomb concentration select rule):
	choose row with an Option of the action of the bomb concentrating in the Table of AI Action Options;
	increase the Action Weight entry by 5;
	if the jumping bomb is at-React:
		decrease Action Weight entry by 500.
		
An AI action selection rule for the at-React jumping bomb (this is the jumping bomb dislikes parrying rule):
	choose row with an Option of the action of the bomb parrying in the Table of AI Action Options;
	decrease the Action Weight entry by 100.

Bomb-escape is a truth state that varies. Bomb-escape is true.

A contact rule when the global attacker is the jumping bomb (this is the jumping bomb kamikaze rule):
	if the global defender is the player and bomb-escape is true:
		say "[roman type]The jumping bomb almost touches you, but you [bold type]save yourself[roman type] with a last desperate dodge. You might not want to try that again.";
		now bomb-escape is false;
		rule fails;
	otherwise:
		say "[roman type]When the jumping bomb hits [the global defender], it explodes with a terrible bang. [if the global defender is the player]Not even all the king's horses and all the king's men will be able to put the thousand pieces of your body back together[otherwise][The global defender] is killed instantly[end if].";
		now the health of the global attacker is -10; [Bypasses normal damage system.]
		now the health of the global defender is -10; [Bypasses normal damage system.]
		if the global defender is the player:
			have an event of the global attacker killing the global defender;		
			end the story saying "You exploded";
			rule fails;
		rule fails.

First report an actor hitting (this is the don't show normal death prose when jumping bomb kills someone rule):
	if the global attacker is the jumping bomb and the global defender is dead:
		rule succeeds.

An attack modifier rule (this is the jumping bomb concentration attack modifier rule):
	if the global attacker is the jumping bomb and the concentration of the jumping bomb is greater than 0:
		let n be 2 times the concentration of the jumping bomb;
		say " - ", n, " (lower concentration bonus for jumping bomb)[run paragraph on]";
		decrease the attack strength by n.
			
An attack modifier rule (this is the jumping bomb concentration defence modifier rule):
	if the global defender is the jumping bomb and the concentration of the jumping bomb is greater than 0 and the jumping bomb is conscious in this world:
		let n be the concentration of the jumping bomb;
		say " - ", n, " (speed of the jumping bomb)[run paragraph on]";
		decrease the attack strength by n.	

Chance to win rule when the global defender is the jumping bomb (this is the CTW bomb penalty rule):
	if the concentration of the jumping bomb is greater than 0:
		decrease the chance-to-win by the concentration of the jumping bomb.


Section - Jumping Bomb images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of jumping bomb is Figure of map_monster_jumping_bomb.
The legend-label of jumping bomb is Figure of map_legend_jumping_bomb.


Section - Prose

Report an actor hitting the dead jumping bomb:
	say "As the last of its blood flows out of the jumping bomb, it goes limp and falls to the floor like a punctured balloon.";
	rule succeeds.

Report the bomb attacking:
	unless the actor is the noun:
		say "Suddenly changing its direction, the jumping bomb launches itself towards [the noun] -- threatening instant death upon contact.";
	otherwise:
		say "The jumping bomb attempts the seemingly impossible feat of smashing into itself.";
	rule succeeds.

Report the bomb dodging:
	say "The jumping bomb attempts to bump out of the way.";
	rule succeeds.

Report the bomb concentrating:
	if the concentration of the actor is:
		-- 1:
			say "The jumping bomb jumps up and down a little bit faster.";
		-- 2:
			say "The jumping bomb speeds up, and is now bumping around energetically.";
		-- 3:
			say "The jumping bomb accelerates yet further, your image of it dissolving almost into a blur.";
	rule succeeds.

Lose concentration prose rule for the jumping bomb:
	say "Knocked back by the hit, the jumping bomb [bold type]loses most of its speed[roman type]." instead.

Report bomb waiting when jumping bomb is insane:
	say "The bomb jumps around the room as if there were no tomorrow.";
	rule succeeds.

Section - Power

The power of the bomb is a power. Jumping bomb grants power of the bomb.
The power level of power of the bomb is 2.
The command text of power of the bomb is "explode on death".
The description of power of the bomb is "Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: If you are killed by someone's attack, your body will explode and deal damage to the lowest health enemy in the room who might give you a soul upon death. The amount of damage dealt is a random number between 5 and your body score. (But it is never less than 5, even if your body is less than 5.) If the amount of damage you deal is enough to kill your victim, you will absorb the soul and survive."
The power-name of power of the bomb is "power of the bomb".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the bomb	body	--

Absorbing power of the bomb:
	increase melee of the player by 2;
	increase defence of the player by 2;
	increase permanent health of the player by 10;
	say "As the bomb deflates, you feel its insane, beastly soul absorbed into your own body. ([bold type]Power of the bomb[roman type]: +2 attack, +2 defence, +10 health, and you will now [italic type]explode[roman type] when killed, giving you a last chance to defeat an enemy and absorb a soul in the process.)[paragraph break]".

Repelling power of the bomb:
	decrease melee of the player by 2;
	decrease defence of the player by 2;
	decrease permanent health of the player by 10.

Section - Explode

Definition: a person (called guy) is soul-granting:
	if level of guy is 0 or guy is the player:
		decide no;
	decide on whether or not guy is a sole survivor.
	
The explosion victim is a person that varies.

To choose the explosion victim:
	now explosion victim is the player;
	repeat with guy running through people in the location:
		if guy is soul-granting:
			if explosion victim is the player: [always better than yourself]
				now explosion victim is guy;
			if level of explosion victim is greater than 4: [always better than Malygris]
				now explosion victim is guy;
			if health of explosion victim is greater than health of guy: [choose person with lowest health]
				now explosion victim is guy.
					
Killing rule (this is the explode after death rule):
	if the killed-guy is the player:
		if power of the bomb is granted:
			choose the explosion victim;
			if explosion victim is the player:
				say "Your body explodes vehemently, but there is nobody here who could grant you a soul.[paragraph break]";
			otherwise:
				let damage target be the health of the explosion victim;
				let m be final body of the player;
				if m is less than 5, now m is 5;
				let n be a random number between 5 and m;
				deal n points of physical damage;
				have no-source inflict damage on explosion victim, silently;
				if health of the explosion victim is less than 1:
					say "Your body explodes vehemently, killing [the explosion victim][if the abyss of the soul and the player share a world]. Your soul attempts to swallow that of your enemy, but before this can happen, you are both sucked into the abyss of the soul[otherwise if the level of the explosion victim is greater than 4]. Your soul attempts to swallow that of your enemy, but [the explosion victim] is quicker and far more powerful, swallowing yours and thus coming back to life. You, however, are destroyed for all eternity[otherwise]! As your soul swallows that of your enemy whole, you feel your body reconstituting itself[end if].[paragraph break]";
					if the level of the explosion victim is not greater than 4:
						unless the abyss of the soul and the player share a world:
							now the health of the player is 1;
							now the health of the explosion victim is -10;
							have an event of the player killing explosion victim;
				otherwise:
					[increase the health of the explosion victim by the total damage;] [Why this? Looks like a bug.]
					say "Your body explodes vehemently as you throw yourself at [the explosion victim], but you only deal [the total damage] damage instead of the [damage target] damage you needed to deal.[paragraph break]".
		
Status skill rule (this is the jumping bomb power status skill rule):
	if power of the bomb is granted:
		say "When you die, you [bold type]explode[roman type], dealing an amount of physical damage to your enemy based on your body score. This gives you a last chance to kill an enemy, and perhaps absorb a soul and come back to life in the process. [italic type](Level 2)[roman type][line break][run paragraph on]".







Chapter - Level 2 - The reaper

Section - Definitions

The Reaper is a male monster. The reaper is not neuter. "A pale man in dark robes[if the reaper wields a scythe], wielding a huge scythe,[end if] stands here. It is the Reaper, a serial killer who believes he is Death himself."

Understand "pale" and "man" and "dark" and "robes" and "serial" and "killer" and "him" as the Reaper.

The level of the Reaper is 2.
The ID of the Reaper is 7.
The Reaper is medium.
The Reaper is talker.
The Reaper is thrower.
Material of the Reaper is flesh. [He'd want it to be bone, but alas.]

The description of the reaper is "He once used to be a man like any other, but his vocation has left him unnaturally pale and gaunt.".

The soul description of the Reaper is "a black hood hanging in air".

The health of the Reaper is 23.
The melee of the Reaper is 1.
The defence of the Reaper is 8.

The body score of the Reaper is 6.
The mind score of the Reaper is 5.
The spirit score of the Reaper is 7.

For natural weapon setup of the Reaper (this is the Reaper's knuckles rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "Reaper's knuckles";
	now X is plural-named;	

The reaper is a weapon user.

flaming-kit is a starting kit. The recipient is the Reaper. flaming-kit contains the scythe of flaming.
slaying-kit is a starting kit. The recipient is the Reaper. slaying-kit contains the scythe of slaying.
oxidation-kit is a starting kit. The recipient is the Reaper. oxidation-kit contains the scythe of oxidation.

Section - Reaper images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of reaper is Figure of map_monster_reaper.
The legend-label of reaper is Figure of map_legend_reaper.


Section - The Reaper follows you!

Every turn when the Reaper is in the location and the Reaper is not follower (this is the Reaper starts following rule):
	if the player is not hidden and the reaper is conscious in this world:
		say "'Do not be afraid, for I will end your suffering!' the Reaper exclaims.";
		now the Reaper is follower.
	
Follower percentile chance of the Reaper is 5.

When play begins (This is the stop the reaper from following novices rule):
	if difficulty is 0:
		now follower percentile chance of the Reaper is 0. [Too confusing for new players.]

Section - Prose

Report an actor hitting the dead Reaper:
	say "'This -- but this is impossible! Death is me!' the Reaper shouts as the bony hands of disillusion pull him to the underworld.";
	rule succeeds.

Report the Reaper hitting a dead pc:
	say "'Now go to sleep, my child,' says the Reaper. 'You have suffered enough.'";
	rule succeeds.

Report the reaper attacking:
	unless the actor is the noun:
		say "The Reaper advances towards [the noun][one of][or], with a skulllike grin[or], saying 'Et in Arcadia ego!' in a booming voice[as decreasingly likely outcomes].";
	otherwise:
		say "'What is dead may never die!' the Reaper screams.";
	rule succeeds.

Report the Reaper dodging:
	say "'Nobody can touch Death!' says the Reaper as he ducks away.";
	rule succeeds.

Report the Reaper concentrating:
	if the concentration of the Reaper is:
		-- 1:
			say "The Reaper contemplates the meaning of Death.";
		-- 2:
			say "The Reaper immerses himself further into his meditations on mortality.";
		-- 3:
			say "'I see your end!' the Reaper announces as he finishes his contemplations.";
	rule succeeds.

Report the Reaper waiting when the Reaper is insane:
	say "'I feel... alive,' the Reaper muses.";
	rule succeeds.

Section - Power

The power of the Reaper is a power. Reaper grants power of the Reaper.
The power level of power of the Reaper is 2.
The command text of power of the Reaper is "reap".
The description of power of the Reaper is "Type: active ability.[paragraph break]Command: reap [italic type]someone[roman type].[paragraph break]Effect: You can reap anyone you have seen, and this ability will instantly teleport you to their location. It can even be used as a reaction in combat. Reaping will reduce your health and maximum health by an amount equal to the level of the highest power you have absorbed; but you have a spirit * 3% probability of avoiding that penalty."
The power-name of power of the Reaper is "power of the Reaper".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the Reaper	spirit	--

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

Reaping is bypassing-scope.

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
	if the noun is undead:
		take no time;
		say "The undead are no longer haunted by Death, so you cannot reap them." instead.

Check reaping (this is the cannot reap yourself rule):
	if the noun is the player:
		take no time;
		say "You cannot do that to yourself." instead.

Check reaping (this is the reaping a dead person rule):
	if the noun is dead:
		end the story saying "Your dedication to Death went too far.";
		say "You are instantly transported to the Land of the Dead, where [the name of the noun] currently resides." instead.

[Check reaping (this is the reaping with one health rule):
	if the health of the player is 1:
		end the story saying "Your dedication to Death went too far.";
		say "You attempt to reap [the noun], but the strain is too much for your weak body." instead.]

Carry out reaping:
	repeat with guy running through persons in the location:
		now concentration of guy is 0;
	let n be final spirit of the player;
	unless a random chance of n in 33 succeeds:
		decrease health of the player by greatest power of the player; [Bypasses damage system.]
		decrease permanent health of the player by greatest power of the player;
		if the health of the player is less than 1:
			end the story saying "Your dedication to Death went too far.";
			say "You attempt to reap [the noun], but the strain is too much for your weak body." instead;
	unless teleportation is impossible for the player:
		let destination be the location of the noun;
		if destination is not the location:
			extract the player from combat;
		say "You live in the aging cells of an infant's face, and your voice can be heard in the silence after each heartbeat. Death attends on us always, and in his guise you find yourself poised to reap [the noun] --[paragraph break]";
		now retreat location is destination;
		move player to destination;
		now the take no time boolean is false;
	otherwise:
		say "Something prevents you from teleporting.".





Chapter - Level 2 - Demon of Rage

The demon of rage is a demonic hostile monster. "A demon of rage fills the room with its inarticulate cries."
The demon-of-rage-number is a number that varies. The demon-of-rage-number is 0.

Understand "cries" and "inarticulate" as the demon of rage.

The level of the demon of rage is 2.
The ID of the demon of rage is 8.
The demon of rage is medium.
The demon of rage is advanced.
The demon of rage is talker.
The demon of rage is thrower.
The material of the demon of rage is darkness.

The description of the demon of rage is "An amorphous swirl of red and black light, this demonic creature is the spirit of rage incarnate.".
Instead of listening to the demon of rage:
	say "In its fierce wailing, you hear the voices of all your victims.".
    
The soul description of the demon of rage is "a squall of fury, all blacks and reds".

The health of the demon of rage is 21.
The melee of the demon of rage is 0.
The defence of the demon of rage is 7.

The body score of the demon of rage is 6.
The mind score of the demon of rage is 6.
The spirit score of the demon of rage is 6. 

For natural weapon setup of the demon of rage (this is the demon of rage's tendrils rule):
	let X be the natural weapon described;
	now damage die of X is 6;	
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "demon's fiery tendrils";
	now X is plural-named;
	now material of X is fire;


Section - Demon of Rage images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of demon of rage is Figure of map_monster_demon_of_rage.
The legend-label of demon of rage is Figure of map_legend_demon_of_rage.


Section - Getting stronger

[The demon of rage gets stronger whenever someone dies.]

Demon-of-rage-stored-location is a room that varies.

First killing rule (this is the demon of rage set the stage rule):
	now demon-of-rage-stored-location is the location of killed-guy.
		
Last killing rule (this is the demon of rage gets stronger rule):
	if demon of rage and killer-guy share a world or (demon of rage and a random natural weapon part of killed-guy share a world):
		if killed-guy is not the demon of rage and killed-guy is not the player:
			do the demon of rage power-up.

To do the demon of rage power-up:
	now demon of rage is not asleep;
	increase demon-of-rage-number by 1;
	if a random chance of 2 in 3 succeeds:
		increase melee of demon of rage by 1;
	if a random chance of 2 in 3 succeeds:
		increase defence of demon of rage by 1;
	increase health of demon of rage by 3;
	increase permanent health of demon of rage by 3;
	increase body score of demon of rage by 1;
	increase mind score of demon of rage by 1;
	increase spirit score of demon of rage by 2;
	if demon-of-rage-number is 2:
		now demon of rage is flyer;
	if demon-of-rage-number is 3:
		now intrinsic heat resistance of demon of rage is 2;
		now inherent damage modifier of demon of rage is 2;
	if demon-of-rage-number is 4:
		now hit protection of demon of rage is 1;
	if demon-of-rage-number is 5:		
		now inherent damage modifier of demon of rage is 3;
		now follower percentile chance of demon of rage is 70;
		now demon of rage is follower;
	if demon of rage is in the location:
		say "The [bold type]demon of rage[roman type] howls and seems to grow stronger!";
	otherwise:
		let way be the best route from the location of player to the location of the demon of rage;
		if way is a direction:
			say "You hear a [bold type]fierce howl[roman type] [way].";
		otherwise:
			say "You hear a [bold type]fierce howl[roman type] somewhere in the dungeon.".

Section - Prose

Report an actor hitting the dead demon of rage:
	say "A terrifying shriek of anger fills the entire dungeon as the demon of rage vanishes into the abyss. But has more than its outward manifestation been defeated?";
	rule succeeds.

Report the demon of rage hitting a dead pc:
	say "'No!', you scream, and the syllable turns into a fiery, a fierce, an eternal and all-devouring shriek of hate and rage.";
	rule succeeds.

Report the demon of rage attacking:
	unless the actor is the noun:
		say "Full of darkness and fire, the demon rushes towards [the noun].";
	otherwise:
		say "The demon of rage tries to claw out its own eyes.";
	rule succeeds.

Report the demon of rage dodging:
	say "The demon flashes from one side of the room to the other, attempting to dodge the attack.";
	rule succeeds.

Report the demon of rage concentrating:
	if the concentration of the actor is 1, say "The demon of rage burns with a fiercer light." instead;
	if the concentration of the actor is 2, say "The demon of rage glows like the hottest of embers." instead;
	if the concentration of the actor is 3, say "The demon of rage becomes even more radiant, and howls with the lust for blood." instead.	

Report demon of rage waiting when demon of rage is insane:
	say "The demon of rage's shrieks suddenly turn into a fit of coughing[one of][or]. Small embers fall from its mouth[at random].";
	rule succeeds.

Section - When enraged

An attack modifier rule (this is the enraged and the demon of rage rule):
	if the global attacker is enraged and the global defender is the demon of rage:
		if the numbers boolean is true, say " + 4 (attuned to the demon)[run paragraph on]";
		increase the attack strength by 4.



Section - Power


The power of rage is a power. Demon of rage grants power of rage.
The power level of power of rage is 2.
The command text of power of rage is "howl".
The description of power of rage is "Type: active ability.[paragraph break]Command: howl.[paragraph break]Effect: You make your next attack with a +4 attack bonus and a damage bonus equal to 2 + mind/3. Your defence is permanently decreased by 1 point."
The power-name of power of rage is "power of rage".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of rage		mind	--

Absorbing power of rage:
	increase melee of the player by 2;
	increase permanent health of the player by 10;
	say "As the demon of rage dies, your heart is filled with anger. ([bold type]Power of rage[roman type]: +2 attack, +10 health; cannot retreat; you can [italic type]howl[roman type] to improve your next attack but permanently decrease your defence.)[paragraph break]".

A rage rule:
	if test subject is the player and power of rage is granted:
		rule succeeds.

Repelling power of rage:
	decrease melee of the player by 2;
	decrease permanent health of the player by 10.

Status skill rule (this is the rage power status skill rule):
	if power of rage is granted:
		say "You can [bold type]howl[roman type] in rage. Your attack bonus increases by 4 for the next attack, and your damage increased by 2 + mind/3. However, your defence permanently decreases by 1. [italic type](Level 2)[roman type][line break][run paragraph on]".

Section - Howling

Howling is an action applying to nothing. Understand "howl" as howling.

A person can be at-howl or not at-howl. A person is usually not at-howl.

Check howling:
	if power of rage is not granted:
		take no time;
		say "You do not possess that power." instead.
			
Carry out howling:
	say "You howl with rage!";
	now player is at-howl;
	decrease defence of player by 1.
			
An attack modifier rule (this is the howl attack bonus rule rule):
	if the global attacker is at-howl:
		if the numbers boolean is true, say " + 4 (howling)[run paragraph on]";
		increase the attack strength by 4.	

An add specific damage rule (this is the howl damage bonus rule):
	if damage-by-hitting is true:
		if the global attacker is at-howl:
			let n be final mind of the global attacker / 3;
			increase n by 2;
			add n points of damage with reason "howling".
			
Aftereffects rule (this is the take away howling rule):
	now the global attacker is not at-howl.

Status attribute rule (this is the howling status rule):
	if the player is at-howl:
		if long status is true:
			let n be final mind of the player / 3;
			increase n by 2;		
			say "You are [bold type]howling[roman type]: +4 to attack, +[n] to damage.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]howling[run paragraph on]";






Chapter - Level 2 - Hound

The hound is a monster. "A [size of the hound] hound [one of]snarls[or]growls[at random] [if player is not hidden and the faction of the hound hates the faction of the player]at you [end if]across the room."
Understand "dog" as the hound.
The level of the hound is 2.
The ID of the hound is 9.
The hound is large.
The hound is not talker.
The hound is not thrower.
Material of the hound is flesh.

The description of the hound is "The black hound is ever watchful, ready to punish its prey for any wrong move."

The soul description of the hound is "a sharp yellow eye, narrowed and alert".

The health of the hound is 14.
The melee of the hound is 2.
The defence of the hound is 9.

The body score of the hound is 7.
The mind score of the hound is 7.
The spirit score of the hound is 5.

For natural weapon setup of the hound (this is the hound's teeth rule):
	let X be the natural weapon described;
	now damage die of X is 6; [Its bite is worse than its bark!]
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "teeth";
	now material of X is bone;
	now X is plural-named.

Section - Hound images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of hound is Figure of map_monster_hound.
The legend-label of hound is Figure of map_legend_hound.


Section - Prose

Report an actor hitting the dead hound:
	say "The hound collapses, [one of]its strength insufficient for a last counterstrike.[or]vigilant no more.[at random]";
	rule succeeds.

Report the hound hitting a dead pc:
	say "The hound tears your flesh apart, its [one of]plan fulfilled.[or]visions realised.[at random]";
	rule succeeds.

Report the hound concentrating:
	say "[if concentration of the hound is 1]The hound breathes deeply, preparing to attack.[otherwise if concentration of the hound is 2]The hound glares at [the chosen target].[otherwise if concentration of the hound is 3]Tensing its muscles, the hound appears ready to attack![end if]";
	rule succeeds.

Report the hound attacking:
	unless the actor is the noun:
		say "[if hound status is 1 and the noun is the hound provoker][one of]Anticipating [or]Prepared for [at random][regarding the noun][possessive] attack, the hound jumps at [them][otherwise]The hound leaps at [the noun][end if][one of] with a loud growl.[or], its teeth sharp and ready.[or] with unblinking eyes.[at random]";
	otherwise:
		say "The hound bites down on its own tail.";
	rule succeeds.

Report the hound dodging:
	say "The hound jumps [one of]to the side.[or]back.[at random]";
	rule succeeds.

Report the hound waiting when the hound is insane:
	say "The hound runs in a circle, chasing its own tail.";
	rule succeeds.

Section - Power

The power of the hound is a power. The hound grants the power of the hound.
The power level of power of the hound is 2.
The command text of power of the hound is "counterstrike".
The description of power of the hound is "Type: passive ability.[paragraph break]Command: none.[paragraph break]After you are attacked, with a probability of (mind - 2) / mind, you get a chance for an immediate counterstrike. If this happens, you will automatically win the initiative for that turn. You can perform any action you wish, just as normal, but if you do choose to retaliate against your attacker, you get a +2 attack and +2 damage bonus. Any action that leads to an attack will count as a counterstrike (including the special pierce and stun powers)."
The power-name of power of the hound is "power of the hound".
Understand "counterstrike" as a mistake ("[if the power of the hound is granted and the player is at-React]You will retaliate soon, but now you must react to [regarding the main actor][possessive] attack![otherwise if the power of the hound is granted]You are prepared to make counterstrikes, but only after you have been attacked.[otherwise]You do not have the power of the hound.").

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the hound	mind	--

Status skill rule (this is the power of the hound status skill rule):
	if power of the hound is granted:
		say "Like the great hound, you are always prepared for an immediate [bold type]counterstrike[roman type]. [italic type](Level 2)[roman type][line break][run paragraph on]";

Absorbing power of the hound:
	increase melee of the player by 3;
	increase defence of the player by 1;
	increase permanent health of the player by 5;
	say "As the great hound dies, its dual traits of boldness and tactical insight descend into your soul. ([bold type]Power of the hound[roman type]: +3 attack, +1 defence, +5 health, and you are prepared to respond instantly after being attacked.)[paragraph break]";

Repelling power of the hound:
	decrease melee of the player by 3;
	decrease defence of the player by 1;
	decrease permanent health of the player by 5;

[ The initiative of the prepared one. -1: all is normal, -2: this turn is the instant response, anything else: the instant response is happening right now! ]
Saved initiative is a number variable.
Hound status is a number variable. [0 = nothing; 1 = now; 2 = next turn]
The hound provoker is a person variable.

The alternative determine the main actor rule is listed instead of the determine the main actor rule in the combat round rules.
A combat round rule when the combat status is combat (this is the alternative determine the main actor rule):
	rank participants by initiative;
	if hound status is 1:
		if the hound is alive:
			now the main actor is the hound;
		otherwise:
			now the main actor is the player;
		now saved initiative is the initiative of the main actor;
	otherwise:
		now the main actor is the next participant;
	now the combat state of the main actor is at-Act;

Every turn when hound status > 0 (this is the reset the saved initiative after an extra hound turn rule):
	if hound status is 1:
		now the initiative of the main actor is saved initiative;
	decrease hound status by 1.

Hound-preparedness-possible is a truth state that varies.

First carry out hitting (this is the remember whether preparedness was possible rule):
	if the noun is conscious in this world and the actor is not hidden:
		now hound-preparedness-possible is true;
	otherwise:
		now hound-preparedness-possible is false.

An aftereffects rule (this is the set up the power of the hound rule):
	[ Check that we're not running from a battle - the power isn't used in that circumstance! ]
	if the global defender is at-React and hound-preparedness-possible is true:
		if the global defender is the hound and the hound is alive:
			now hound status is 2;
			now the hound provoker is the global attacker;
		[ If for some reason you attacked yourself you don't get an extra turn ]
		otherwise if the global defender is the player and the global attacker is not the player and the power of the hound is granted and the player is alive:
			if a random chance of 2 in the mind score of the player succeeds:
				say "Your mind was otherwise occupied; that attack took you by surprise.";
			otherwise:
				now hound status is 2;
				now the hound provoker is the global attacker;
				say "[one of]Anticipating[or]Prepared for[at random] [one of]the attack[or][regarding the hound provoker][possessive] move[at random][one of], you respond instantly![or], your response is immediate![at random]";

An attack modifier rule (this is the power of the hound attack modifier rule):
	if hound status is 1 and the global defender is the hound provoker:
		say " + 2 (counterstrike)[run paragraph on]";
		increase the attack strength by 2;

An add specific damage rule (this is the power of the hound damage modifier rule):
	if damage-by-hitting is true and primary damage is physical damage:
		if hound status is 1 and the victim is the hound provoker:
			add 2 points of damage with reason "counterstrike".

An AI action selection rule for the hound (this is the hound likes to counterstrike but never parries rule):
	[ Attack with the instant response turn]
	if the hound is at-Act:
		if hound status is 1 and the chosen target is the hound provoker:
			choose row with an Option of the action of the hound attacking the chosen target in the Table of AI Action Options;
			increase the Action Weight entry by a random number between 2 and 5;
	[ Do not parry ]
	otherwise:
		choose row with an Option of the action of the hound parrying in the Table of AI Action Options;
		now the Action Weight entry is -1000;

Carry out an actor challenging someone in (this is the remove hound status when moving to an arena rule):
	now hound status is 0.



Chapter - Level 2 - Angel of Compassion

An angel of compassion is a neuter monster. "An angel hovers here, [if angel-of-compassion-strength > 3]enveloped in blinding and overwhelming radiance[otherwise if angel-of-compassion-strength is 3]shining with divine glory[otherwise if angel-of-compassion-strength is 2]lessened by grief, but still majestic[otherwise if angel-of-compassion-strength is 1]saddened and wizened[otherwise]enveloped in sadness and all its glory gone[end if]."

The level of the angel of compassion is 2.
The ID of the angel of compassion is 33.
The angel of compassion is medium.
The angel of compassion is advanced.
The angel of compassion is talker.
The angel of compassion is thrower.
The angel of compassion is angelic.
Material of angel of compassion is radiance.
Angel of compassion is flyer.
Radiation of angel of compassion is 4.

Angel-of-compassion-strength is a number that varies. Angel-of-compassion-strength is 4.


The description of the angel of compassion is "This beautiful angel grieves for the deaths of others. Its current brightness is [if angel-of-compassion-strength > 3]overwhelming[otherwise if angel-of-compassion-strength is 3]strong[otherwise if angel-of-compassion-strength is 2]quite strong[otherwise if angel-of-compassion-strength is 1]weak[otherwise]negligible[end if]."

The soul description of the angel of compassion is "a luminous arc of sorrow".

The health of the angel of compassion is 25.
The melee of the angel of compassion is 0.
The defence of the angel of compassion is 6.

The body score of the angel of compassion is 10.
The mind score of the angel of compassion is 10.
The spirit score of the angel of compassion is 12.


For natural weapon setup of the angel of compassion (this is the angel of compassion's fists rule):
	let X be the natural weapon described;
	now damage die of X is 4;	
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "angel's fists";
	now X is plural-named;


Section - Equipment

The angel of compassion carries the sword of light.

Section - Getting weaker

[The angel of compassion gets weaker whenever someone dies.]

Angel-of-compassion-stored-location is a room that varies.

First killing rule (this is the angel of compassion set the stage rule):
	now angel-of-compassion-stored-location is the location of killed-guy.
		
Last killing rule (this is the angel of compassion gets stronger rule):
	if angel of compassion and killer-guy share a world:
		if killed-guy is not the angel of compassion and killed-guy is not the player:
			do the angel of compassion power-down.

To do the angel of compassion power-down:
	if angel-of-compassion-strength > 0:
		now angel of compassion is not asleep;
		decrease angel-of-compassion-strength by 1;
		decrease radiation of angel of compassion by 1;
		decrease body score of angel of compassion by 2;
		decrease mind score of angel of compassion by 2;
		decrease spirit score of angel of compassion by 2;
		if angel of compassion is in the location:
			say "The [bold type]angel of compassion[roman type] wails in grief and seems to diminish in brightness!";
		otherwise:
			let way be the best route from the location of player to the location of the angel of compassion;
			if way is a direction:
				say "You hear a [bold type]tortured wail[roman type] [way].";
			otherwise:
				say "You hear a [bold type]tortured wail[roman type] somewhere in the dungeon.".
				
A reviving rule for the angel of compassion (this is the restore radiant strength when reviving angel of compassion rule):
	now radiation of angel of compassion is 4;
	now angel-of-compassion-strength is 4;

Section - Angel of Compassion images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of angel of compassion is Figure of map_monster_angel_of_compassion.
The legend-label of angel of compassion is Figure of map_legend_angel_of_compassion.

Section - Prose

Report an actor hitting the dead angel of compassion:
	say "The angel disappears in a flash of light!";
	rule succeeds.

Report the angel of compassion hitting a dead pc:
	say "'I am so sorry,' the angel whispers as it kills you. ";
	rule succeeds.

Report the angel of compassion concentrating:
	say "[if concentration of the angel of compassion is 1]The angel prays softly.[otherwise if concentration of the angel of compassion is 2]The angel fixes [the chosen target] with its stare, hardening itself for the attack.[otherwise if concentration of the angel of compassion is 3]'Sul will absolve me,' the angel declares, reaching a state of maximal concentration.[end if]";
	rule succeeds.

Report the angel of compassion attacking:
	unless the actor is the noun:
		say "With an apologetic smile, the angel of compassion swings at [the noun].";
	otherwise:
		say "'Life is too hard. I must kill myself,' the angel of compassion sighs.";
	rule succeeds.

Report the angel of compassion dodging:
	say "The angel flies aside.";
	rule succeeds.

Report the angel of compassion waiting when the angel of compassion is insane:
	say "'Once I have killed everyone, there will be no more grieving!' the angel of compassion says, smiling.";
	rule succeeds.


Section - Power

The power of compassion is a power. The angel of compassion grants the power of compassion.
The power level of power of compassion is 2.
The command text of power of compassion is "grief".
The description of power of compassion is "Type: active ability.[paragraph break]Command: grief.[paragraph break]As an action or reaction, you can start or stop projecting an aura of grief. While the aura of grief is active, all attacks made by or against you suffer a penalty equal to (your spirit + number of dead people) / 4."
The power-name of power of compassion is "power of compassion".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of compassion	spirit	--

Status skill rule (this is the compassion status skill rule):
	if the power of compassion is granted:
		say "You can turn on or off an aura of [bold type]grief[roman type], which weakens all attacks by and against you. [italic type](Level 2)[roman type][line break][run paragraph on]".

Absorbing power of compassion:
	increase melee of the player by 1;
	increase defence of the player by 1;
	let n be 5 + (2 * angel-of-compassion-strength);
	increase permanent health of the player by n;
	increase radiation of player by angel-of-compassion-strength;
	say "As the angel dies, its radiance and compassion become yours. ([bold type]Power of compassion[roman type]: +1 attack, +1 defence, +[n] health, +[angel-of-compassion-strength] levels of radiance, and you can project an aura of grief.)[paragraph break]";

Repelling power of compassion:
	decrease melee of the player by 1;
	decrease defence of the player by 1;
	let n be 5 + (2 * angel-of-compassion-strength);
	decrease permanent health of the player by n;
	decrease radiation of player by angel-of-compassion-strength;
	now aura of grief is false.


Section - Aura of grief

Aura of grief is a truth state that varies.

Grieving is an action applying to nothing. Understand "grief" and "grieve" as grieving.

An attack modifier rule (this is the aura of grief rule):
	if aura of grief is true:
		if the global attacker is the player or the global defender is the player:
			let n be the final spirit of the player plus the number of not alive people;
			now n is n divided by 4;
			if the numbers boolean is true, say " - [n] (aura of grief)[run paragraph on]";
			decrease attack strength by n.

Check grieving:
	if power of compassion is not granted:
		take no time;
		say "You do not possess that power." instead.

Carry out grieving:
	if aura of grief is true:
		say "You stop projecting an aura of grief.";
		now aura of grief is false;
	otherwise:
		say "You start projecting an aura of grief.";
		now aura of grief is true.

Status attribute rule (this is the aura of grief status rule):
	if aura of grief is true:
		if long status is true:
			say "You project an [bold type]aura of grief[roman type].[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]projecting an aura of grief[run paragraph on]";

Chance to win rule (this is the CTW aura of grief penalty rule):
	if aura of grief is true and the global defender is the player:
		let n be the final spirit of the player plus the number of not alive people;
		now n is n divided by 4;	
		decrease the chance-to-win by n.



Chapter - Level 3 - Mindslug

A mindslug is a monster. "A vast slug covered in green ooze has positioned itself in this room."

Understand "slug" and "master" and "ooze" as the mindslug.

The level of the mindslug is 3.
The ID of the mindslug is 10.
The mindslug is huge.
The mindslug is not talker.
The mindslug is not thrower.
Material of the mindslug is flesh.

The mindslug is group leading.
The mindslug is defeated individually.

The description of the mindslug is "It is of the dreaded race of mindslugs, abominations that use their telepathic powers to enslave others.".

The soul description of the mindslug is "inspiralling reflections in green ooze".

The health of the mindslug is 28.
The melee of the mindslug is 2.
The defence of the mindslug is 8.

The body score of the mindslug is 3.
The mind score of the mindslug is 11.
The spirit score of the mindslug is 7. 

For natural weapon setup of the mindslug (this is the mindslug's crushing body rule):
	let X be the natural weapon described;
	now dodge bonus of X is 1;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "slug's crushing body";


Section - Mindslug images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of mindslug is Figure of map_monster_mindslug.
The legend-label of mindslug is Figure of map_legend_mindslug.


Section - Mind blast action

Mindblasting is an action applying to one thing.


		
An AI action selection rule for the at-Act mindslug (this is the mindslug considers mindblasting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the mindslug mindblasting the chosen target;
	now the Action Weight entry is 12;
	[ But it doesn't always mindblast ]
	if a random chance of 3 in 5 succeeds:
		decrease the Action Weight entry by 100.

An AI action selection rule for the at-Act mindslug (this is the mindslug dislikes attacking rule):
	choose row with an Option of the action of the mindslug attacking the chosen target in the Table of AI Action Options;
	decrease the Action Weight entry by 3.
		
An AI action selection rule for the at-React mindslug (this is the mindslug doesnt dodge rule):
	choose row with an Option of the action of the mindslug dodging in the Table of AI Action Options;
	decrease the Action Weight entry by 100.
		
To resist is a verb. To fail is a verb.

Carry out the mindslug mindblasting:
	say "The mindslug blasts [the noun] with psionic energy. [italic type][run paragraph on]";
	let n be 10;
	increase n by concentration of the mindslug;
	test the mind of the noun against n; 
	say "[roman type]";
	if test result is true:
		say " [The noun] [resist] the mindslug's influence!";
	otherwise:
		decrease mind score of the noun by 1;
		say " [The noun] [fail] to resist the mindslug's mental blast, and [regarding the noun][possessive] mind score decreases to [mind score of the noun].";
		if mind score of the noun is less than 1:
			if the noun is the player:
				end the story saying "You live on as the unquestioning slave of a giant slug";
			otherwise:
				now the faction of the noun is mindslug-enslaved;
				say "[The noun] is now under the control of the mindslug.";
		otherwise:
			if the concentration of the noun is greater than 0:
				let the noun lose concentration;
	now the concentration of the mindslug is 0.
		
An AI target selection rule for a person (called target) when the running AI is the mindslug (this is the mindslug prefers low mind score rule):
	decrease the Weight by the mind score of the target.

Section - Prose

Report an actor hitting the dead mindslug:
	say "A mental oppression falls from your mind as the mindslug succumbs to its injuries, its evil intelligence snuffed.";
	rule succeeds.

Report the mindslug hitting a dead pc:
	say "The mindslug crashes on top of you, burying your body under tons of oozing gastropod flesh.";
	rule succeeds.

Report the mindslug attacking:
	unless the actor is the noun:
		say "Raising its hideous body, the mindslug bears down on [the noun].";
	otherwise:
		say "The mindslug tries to smash its own head into the ground.";
	rule succeeds.

Report the mindslug dodging:
	say "The mindslug oozes out of the way.";
	rule succeeds.

Report the mindslug waiting when the mindslug is insane:
	say "You suddenly hear a voice inside your head. 'Cover yourself with salt,' it says. 'Come on, cover yourself with salt!'";
	rule succeeds.


Section - Slaves

Fafhrd is a mindslug-enslaved man. "Fafhrd, the huge but sympathetic barbarian adventurer, strolls through the room[if Fafhrd is mindslug-enslaved]. He doesn't seem to be himself, though[end if]."
The description of Fafhrd is "This male barbarian is strong and muscular. He looks like an able and shrewd fighter.".

The soul description of Fafhrd is "frozen honour".

The ID of Fafhrd is 11.
Fafhrd is medium.
Fafhrd accompanies the mindslug.

Health of Fafhrd is 14.
Melee of Fafhrd is 1.

For natural weapon setup of Fafhrd (this is the Fafhrd's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "Fafhrd's fists";
	now X is plural-named;

Fafhrd carries the claymore.

Follower percentile chance of Fafhrd is 75.
Fafhrd is weapon user.
Fafhrd is talker.
Fafhrd is thrower.
Material of Fafhrd is flesh.

Mouser is a mindslug-enslaved man. "The sneak thief Mouser looks around with greedy eyes[if Fafhrd is mindslug-enslaved]. He appears to be under some kind of spell[end if]."
The description of Mouser is "Mouser is a small, fast man. You know his type from the alleys and alehouses of Montenoir.".

The soul description of the Mouser is "dreams of gold and women".

The ID of Mouser is 12.
Mouser accompanies the mindslug.

[Mouser carries sneaky sword: see Kerkerkruip Items.]
Mouser carries the sneaking sword.

Health of Mouser is 10.
Defence of Mouser is 9.
Mouser is medium.
Mouser is talker.
Mouser is thrower.
Material of Mouser is flesh.

For natural weapon setup of Mouser (this is the Mouser's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "Mouser's fists";
	now X is plural-named;

Follower percentile chance of Mouser is 85.
Mouser is weapon user.

An attack modifier rule (this is the mindslug defended by the enslaved rule):
	if the global defender is the mindslug and the global attacker is not hidden:
		let n be the number of mindslug-enslaved persons in the location;
		if n greater than 0:
			let m be n + 1;
			let m be n times m;
			if the numbers boolean is true, say " - ", m, " (defended by slaves)[run paragraph on]";
			decrease the attack strength by m.

Chance to win rule (this is the CTW mindslug enslaved penalty rule):
	if the global defender is the mindslug:
		let n be the number of mindslug-enslaved persons in the location;
		if n greater than 0:
			let m be n + 1;
			let m be n times m;		
			decrease the chance-to-win by m.

An attack modifier rule (this is the enslaved have bad defence rule):
	if the global defender is mindslug-enslaved:
		if the numbers boolean is true, say " + 2 (defender uninterested in own safety)[run paragraph on]";
		increase the attack strength by 2.

Chance to win rule (this is the CTW enslaved bonus rule):
	if the global defender is mindslug-enslaved:
		increase the chance-to-win by 2.

Every turn (this is the free slaves of the mindslug when it is killed rule):
	if the number of mindslug-enslaved alive persons in the location is greater than 0 and the mindslug is dead:
		repeat with guy running through mindslug-enslaved alive persons in the location:
			now guy is friendly;
			now guy is not asleep;
			if guy is undead:
				now guy is undead-faction;
			if guy is horrific:
				now guy is horrific-faction;
			if guy is Fafhrd:
				say "'Thanks, man,' says Fafhrd. 'I guess you have earned yourself some help.'[paragraph break]";
			if guy is Mouser:
				say "'I knew we shouldn't have trusted Ningauble,' Mouser states. 'Let's get out of here as quickly as possible.'[paragraph break]";
			if guy is not Fafhrd and guy is not Mouser:
				say "[The guy] is freed from the mindslug's influence.[paragraph break]"

Check a mindslug-enslaved npc attacking (this is the slaves may be freed from mindslug rule):
	follow the free slaves of the mindslug when it is killed rule;
	if actor is not mindslug-enslaved:
		do nothing instead.


Section - Fafhrd and Mouser images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Fafhrd is Figure of map_monster_Fafhrd.
The legend-label of Fafhrd is Figure of map_legend_Fafhrd.
The avatar of Mouser is Figure of map_monster_Mouser.
The legend-label of Mouser is Figure of map_legend_Mouser.
		

Section - Prose for Fafhrd and Mouser

Report an actor hitting the dead Fafhrd:
	say "Cursing his fate, Fafhrd falls down[if Mouser is alive and the faction of Mouser is not mindslug-enslaved and Mouser is in the location]. 'Fafhrd!' screams Mouser[do the mouser rage][end if].";
	rule succeeds.

To say do the mouser rage:
	increase melee of Mouser by 2;
	decrease defence of Mouser by 1;
	increase health of Mouser by 5;
	if global attacker is the player:
		now faction of Mouser is hostile.

Report Fafhrd hitting a dead pc:
	say "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face.";
	rule succeeds.

Report Fafhrd attacking:
	unless the actor is the noun:
		say "Fafhrd rushes towards [the noun].";
	otherwise:
		say "'Let it never be said that I did not die a hero's death!' Fafhrd exclaims.";
	rule succeeds.

Report Fafhrd dodging:
	say "Fafhrd ducks aside.";
	rule succeeds.

Report Fafhrd parrying:
	say "Fafhrd raises his weapon to stop the blow.";
	rule succeeds.

Report Fafhrd waiting when Fafhrd is insane:
	say "Fafhrd stands motionless, pining for the fjords.";
	rule succeeds.

Report an actor hitting the dead Mouser:
	say "Mouser staggers backwards, mortally wounded. He tries to say something, but no sound ever passes his lips again[if Fafhrd is alive and the faction of Fafhrd is not mindslug-enslaved and Fafhrd is in the location]. 'Vengeance!' screams Fafhrd[do the fafhrd rage][end if].";
	rule succeeds.

To say do the Fafhrd rage:
	increase melee of Fafhrd by 2;
	decrease defence of Fafhrd by 1;
	increase health of Fafhrd by 5;
	if global attacker is the player:
		now faction of Fafhrd is hostile.

Report Mouser hitting a dead pc:
	say "As you fall down, Mouser shrugs somewhat apologetically.";
	rule succeeds.

Report Mouser attacking:
	unless the actor is the noun:
		say "Fast as a snake, Mouser lashes out at [the noun].";
	otherwise:
		say "'He won't see this coming!' Mouser announces as he attacks himself.";
	rule succeeds.

Report Mouser dodging:
	say "Deftly, Mouser rolls aside to avoid the attack.";
	rule succeeds.

Report Mouser parrying:
	say "Mouser tries to parry the blow.";
	rule succeeds.
	
Report Mouser waiting when Mouser is insane:
	say "'Why did I have to go after wealth and fame, instead of just marrying some full-bosomed hussy and enjoying the many, uh, joys of domestic life?' Mouser laments.";
	rule succeeds.	

Last report talking to Fafhrd when Fafhrd is friendly:
	say "Fafhrd shrugs.".
		
Last report talking to Mouser when Mouser is friendly:
	say "Mouser raises one his eyebrows.".
		

Section - Power of the Mindslug

The power of the mindslug is a power. Mindslug grants power of the mindslug.
The power level of power of the mindslug is 3.
The command text of power of the mindslug is "enslave[if enslave-cooldown is not 0] ([enslave-cooldown])[end if]".
The description of power of the mindslug is "Type: active ability.[paragraph break]Command: enslave [italic type]someone[roman type].[paragraph break]Effect: You attempt to enslave an enemy, turning him or her into your thrall. Your attempt is successful if you succeed at a mind check against 5 + mind of your enemy + health of your enemy + (2 * concentration of your enemy) - (2 * your concentration). In general, it will be necessary to decrease your enemy's health before trying to enslave him or her. This ability has a cooldown of 9 - (spirit / 3) turns."
The power-name of power of the mindslug is "power of the mindslug".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the mindslug	mind	spirit

Absorbing power of the mindslug:
	increase melee of the player by 3;
	increase defence of the player by 3;
	increase permanent health of the player by 15;
	say "As the mindslug dies, you feel its powerful intelligence absorbed into your own body. ([bold type]Power of the mindslug[roman type]: +3 attack, +3 defence, +15 health, and you can attempt to [italic type]enslave[roman type] an enemy.)[paragraph break]";
	make helpers followers.

Repelling power of the mindslug:
	decrease melee of the player by 3;
	decrease defence of the player by 3;
	decrease permanent health of the player by 15;
	unmake helpers followers;
	release slaves.

To make helpers followers:
	now Fafhrd is follower;
	now Mouser is follower.

To unmake helpers followers:
	now Fafhrd is not follower;
	now Mouser is not follower.

To release slaves:
	if at least one alive person is player-enslaved:
		say "[if at least two alive persons are player-enslaved]Your slaves are[otherwise]Your slave is[end if] [bold type]released[roman type] from bondage![paragraph break]";
		repeat with guy running through player-enslaved people:
			now faction of guy is hostile.


Section - Enslaving

Enslaving is an action applying to one thing. Understand "enslave [person]" as enslaving.

Check enslaving (this is the need the Power of the Mindslug to enslave rule):
	unless Power of the Mindslug is granted:
		take no time;
		say "You do not have that power." instead.

Check enslaving (this is the only enslave enemies rule):
	if the faction of the player does not hate the faction of the noun:
		take no time;
		say "You can only enslave your enemies." instead.

Check enslaving (this is the cannot enslave the undead rule):
	if the noun is undead:
		take no time;
		say "The undead cannot be enslaved." instead.

Carry out enslaving:
	let n be final mind of the noun;
	increase n by health of the noun;
	increase n by 2 * concentration of the noun;
	decrease n by 2 * concentration of the player;
	increase n by 5; [mind + health + 5 + 2 * (Concentration of target - concentration of player)]
	if noun is sometime-enslaved:
		increase n by 20;
	say "You attempt to enslave [the noun]. [run paragraph on]";
	test the mind of the player against n;
	if test result is false:
		say " Unfortunately, your will is not strong enough to break your enemy's resistance.[paragraph break]";
	otherwise:
		say "[paragraph break][bold type]'I will do your bidding, [master]!'[roman type] [the noun] whispers[if the noun is the swarm of daggers] -- somewhat surprisingly, given that it lacks not just vocal chords but also a respiratory system[otherwise] [one of]in an awed tone of voice[or]in a groveling tone of voice[purely at random][end if].[paragraph break]";
		now faction of the noun is player-enslaved;
		now noun is sometime-enslaved;
		now noun is follower;
		now follower percentile chance of noun is 95;
		if combat state of player is at-react:
			repeat through Table of Delayed Actions:
				if the action to take entry is the action of the noun hitting the player:
					blank out the whole row;
		now concentration of the noun is 0;
	now concentration of the player is 0;
	now enslave-cooldown is a cooldown with max 9 scaled by 3.

To say master:
	if the player is male:
		say "master[run paragraph on]";
	otherwise if the player is female:
		say "mistress[run paragraph on]";
	otherwise:
		say "dread ungendered being[run paragraph on]".

A person can be sometime-enslaved. A person is usually not sometime-enslaved.

Enslave-cooldown is a number that varies. Enslave-cooldown is 0.

Every turn when main actor is the player (this is the enslave cooldown rule):
	if enslave-cooldown is greater than 0:
		decrease enslave-cooldown by 1;
		if combat status is peace:
			now enslave-cooldown is 0.
		
Check enslaving:
	if enslave-cooldown is not 0:
		take no time;
		say "You must wait [enslave-cooldown] turn[unless enslave-cooldown is 1]s[end if] before you can use your enslaving ability again." instead.		

Status skill rule (this is the mind slug power status skill rule):
	if power of the mindslug is granted:
		say "You can attempt to [bold type]enslave[roman type] an enemy. This ability has a cooldown. [italic type](Level 3)[roman type][line break][run paragraph on]".




Section - Attacking your slaves

A person can be betrayed. A person is usually not betrayed.

[Making sure that attacking a slave is possible and makes him betrayed is done in Kerkerkruip ATTACK Additions.]

An attack modifier rule (this is the betrayal attack modifier rule):
	if the global defender is betrayed:
		if the numbers boolean is true, say " + 6 (betrayed by [master])[run paragraph on]";
		increase the attack strength by 6.

An add specific damage rule (this is the betrayal damage bonus rule):
	if damage-by-hitting is true:
		if the victim is betrayed:
			add 4 points of damage with reason "betrayed by [master]".

AI action selection rule for a person (called P) (this is the betrayed people always wait rule):
	if P is betrayed:
		choose row with an Option of the action of P waiting in the Table of AI Action Options;
		now the Action Weight entry is 1000.

An aftereffects rule (this is the remove betrayed rule):
	if the global defender is betrayed:
		now the global defender is not betrayed;
		release slaves.

[BUG: betraying when not in combat.]

Instead of an actor waiting when the actor is betrayed:
	say "[The actor] does not suspect your betrayal.".



Chapter - Level 3 - Giant tentacle

The giant tentacle is a monster. "A single giant tentacle guards against intruders."

The description of the giant tentacle is "Aeons ago, the Knight of the Dawn fought and killed a great tentacled horror known as Tooloo. So great was Tooloo's tenacity, however, that each of his tentacles continued to live on separately -- and this is one of them.".

The soul description of the giant tentacle is "amputated horror".

The level of giant tentacle is 3.
The ID of the giant tentacle is 13.
The giant tentacle is huge.
The giant tentacle is not talker.
The giant tentacle is thrower.
Material of the giant tentacle is flesh.

The health of giant tentacle is 38.
The melee of giant tentacle is 3.
The defence of giant tentacle is 12.

The body score of giant tentacle is 8.
The mind score of giant tentacle is 10.
The spirit score of giant tentacle is 6. 

For natural weapon setup of the giant tentacle (this is the giant tentacle weapon rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the damage die of X is 0;
	now printed name of X is "tentacle";
	now X is size-agnostic.

The giant tentacle is eyeless.


Section - Giant Tentacle images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of giant tentacle is Figure of map_monster_giant_tentacle.
The legend-label of giant tentacle is Figure of map_legend_giant_tentacle.


Section - The tentacle grapples

Grappling relates one person to another. The verb to grapple (he grapples, they grapple, he grappled, it is grappled, he is grappling) implies the grappling relation. 

A contact rule when the global attacker is the giant tentacle (this is the tentacle grapples rule):
	say "The giant tentacle [bold type]wraps itself around[italic type] [the global defender]!";
	now giant tentacle grapples the global defender.

An AI action selection rule for the at-Act giant tentacle (this is the tentacle attacks only when not grappling rule):
	choose row with an Option of the action of the giant tentacle attacking the chosen target in the Table of AI Action Options;
	if the giant tentacle grapples the chosen target:
		decrease the Action Weight entry by 1000;
	otherwise:
		increase the Action Weight entry by 3.

An AI target selection rule for a person (called target) when the running AI is the giant tentacle (this is the tentacle prefers the grappled person rule):
	if the giant tentacle grapples the target and the target is not the giant tentacle:
		increase the Weight by 1000;

[TODO: generalize grappling rules and descriptions]

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
	if the global defender is the giant tentacle and the total damage is greater than 0:
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

Status attribute rule (this is the grappled status rule):
	if at least one person grapples the player:
		let X be a random person grappling the player;
		if long status is true:
			say "You are [bold type]grappled[roman type] by [the X].[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]grappled by [the X][run paragraph on]";
		
A sudden combat reset rule for a person (called guy) (this is the sudden grapple reset rule):
	while someone grapples guy:
		let X be a random person grappling guy;
		now X does not grapple guy.

An impeded movement rule (this is the being grappled impedes movement rule):
	if someone grapples the test subject:
		rule fails.

A detection rule (this is the cannot hide when grappled rule):
	if someone grapples the player:
		say " - 20 (being grappled)[run paragraph on]";
		decrease the hiding roll by 20.

Section - and the tentacle constricts

Tentacle-constricting is an action applying to nothing.

Constriction level is a number that varies. Constriction level is 0.

An AI action selection rule for the at-Act giant tentacle (this is the tentacle considers constricting rule):
	if the giant tentacle grapples the chosen target:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the giant tentacle tentacle-constricting;
		now the Action Weight entry is 15;

Clothing has a number called the constriction prevention. The constriction prevention of clothing is usually 0.

Definition: clothing (called item) is constriction-preventing if the constriction prevention of item is greater than 0.

To protect is a verb.
Carry out the giant tentacle tentacle-constricting:
	increase constriction level by 1; [constricts tighter]
	let n be constriction level;
	let m be 0;	
	let preventer be a random clothing;
	if the chosen target wears at least one constriction-preventing clothing:
		let i be 0;
		repeat with item running through clothing worn by the chosen target:
			increase m by constriction prevention of item;
			unless i is greater than constriction prevention of item:
				now preventer is item;
			now i is constriction prevention of item; [at the end of the repeat, preventer is the item with the largest constriction prevention]
	if n is greater than m: [constriction prevention < constriction level: normal damage]
		deal constriction level points of physical damage;
		have the giant tentacle inflict damage on the chosen target, silently;
		if m is greater than 0:
			remove preventer from play; [and the preventing item gets smashed]
		say "The giant tentacle tightens its muscles, dealing [bold type][total damage] damage[roman type] to [the name of the chosen target][if m is greater than 0]. [The preventer] [get] smashed in the process[end if].";
		if the chosen target is dead:
			have an event of the giant tentacle killing the chosen target;
			now constriction level is 0;
		if the player is dead:
			end the story saying "You suffocate in the tentacle's deadly embrace.";
	otherwise: [constriction prevention >= constriction level: no damage]
		say "The giant tentacle tightens its muscles, but the [preventer] [protect] [the chosen target] against the pressure.".

Section - and the tentacle shakes

Tentacle-shaking is an action applying to nothing.
		
An AI action selection rule for the at-React giant tentacle (this is the tentacle shakes when attacked and grappling rule):
	if the giant tentacle grapples the main actor:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the the giant tentacle tentacle-shaking;
		now the Action Weight entry is 15 plus 5 times the concentration of the main actor;

Carry out the giant tentacle tentacle-shaking:
	say "The giant tentacle vigourously shakes [the main actor] while projecting the horrifying image of Tooloo.[italic type] [run paragraph on]";
	let n be 12;
	test the mind of the main actor against n; 
	say "[roman type]";
	if test result is true:
		say " [The main actor] [remain] [if the concentration of the main actor is greater than 0]concentrated[otherwise]sharp[end if].";
	otherwise:
		say " [The main actor] [are] horrified and confused![run paragraph on]";
		now the main actor is tentacle-confused;
		if the concentration of the main actor is greater than 0:
			say " [run paragraph on]";
			let the main actor lose concentration;
		otherwise:
			say "[paragraph break]".

A person can be tentacle-confused. A person is usually not tentacle-confused.

An attack modifier rule (this is the tentacle-confused attack modifier rule):
	if the global attacker is tentacle-confused:
		say " - 2 (confused)[run paragraph on]";
		decrease the attack strength by 2.	

Chance to win rule when the global attacker is tentacle-confused (this is the CTW confusion penalty rule):
	decrease the chance-to-win by 2.

Aftereffects rule when the global attacker is tentacle-confused (this is the no longer tentacle-confused after attacking rule):
	say "[The global attacker] [are] no longer confused.";
	now the global attacker is not tentacle-confused.

Status attribute rule (this is the tentacle-confused status rule):
	if the player is tentacle-confused:
		if long status is true:
			say "You are [bold type]confused[roman type] by the giant tentacle, which gives you a -2 attack penalty on your next attack.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]confused[run paragraph on]";


Section - and the tentacle throws

Tentacle-throwing is an action applying to nothing.

[First we set one of three throwing behaviours -- the player doesn't know which one. Behaviour 1 is linear with grappling strength but rare, behaviour 2 throws only with high grappling strength, behaviour 3 is a less predidtable version of 2.]

linear-tentacle-throw is a starting kit. The recipient is the giant tentacle.
high-grapple-tentacle-throw is a starting kit. The recipient is the giant tentacle.
unpredictable-tentacle-throw is a starting kit. The recipient is the giant tentacle.

[The AI rule]

An AI action selection rule for the at-Act giant tentacle (this is the tentacle considers throwing rule):
	if the giant tentacle grapples the chosen target:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the giant tentacle tentacle-throwing;
		now the Action Weight entry is 0;
		Let style be the selected kit of the giant tentacle;
		if style is linear-tentacle-throw:
			if a random chance of constriction level in 50 succeeds:
				now the Action Weight entry is 20;
		if style is high-grapple-tentacle-throw:
			if constriction level is greater than 3:
				if a random chance of 1 in 3 succeeds:
					now the Action Weight entry is 20;
		if style is unpredictable-tentacle-throw:
			if constriction level is greater than 4 or a random chance of 1 in 5 succeeds:
				if a random chance of 1 in 3 succeeds:
					now the Action Weight entry is 20.

Carry out the giant tentacle tentacle-throwing:
	now constriction level is 0;
	now giant tentacle does not grapple the chosen target;
	Let n be the size number of the giant tentacle * 3;
	if n < 0, now n is 0;
	increase n by a random number between 2 and 4;
	deal n points of physical damage;
	have the giant tentacle inflict damage on the chosen target, silently;
	say "The giant tentacle suddenly uncoils like a whip, throwing [the name of the chosen target] across the room. A sickening smack is heard when [the name of the chosen target] [hit] the [one of]wall[or]floor[or]ceiling, and then the floor,[as decreasingly likely outcomes] and [receive] [bold type][total damage] damage[roman type][run paragraph on]";	
	if the actor is alive:
		if the total damage > 0 and the concentration of the chosen target is not zero:
			say ". [regarding the chosen target][They] [bold type][lose] concentration[roman type]!";
			now concentration of the chosen target is 0;
		otherwise:
			say ".";
	otherwise:
		say ". [regarding the chosen target][They] [are] [bold type]killed instantly[roman type].";
	if the chosen target is dead:
		have an event of the giant tentacle killing the chosen target;
	if the player is dead:
		end the story saying "You were thrown out by the tentacle.";


Section - Tentacle prose

Report an actor hitting the dead giant tentacle:
	say "The giant tentacle crashes down, never to rise again.";
	rule succeeds.

Report the giant tentacle hitting a dead pc:
	say "Even though Tooloo was slain in times immemorial, his appendages still claim victims today.";
	rule succeeds.

Report the giant tentacle attacking:
	unless the actor is the noun:
		say "The giant tentacle moves in to grab [the noun].";
	otherwise:
		say "The tentacle attempts to tie itself into a knot.";
	rule succeeds.

Report the giant tentacle dodging:
	say "The giant tentacle tries to avoid the blow.";
	rule succeeds.
	
Report giant tentacle waiting when giant tentacle is insane:
	say "The giant tentacle tries to hide by imitating a leaf of grass.";
	rule succeeds.	

After dealing attack damage when the global attacker is the giant tentacle (this is the show tentacle grappling with attack damage rule):
	if the giant tentacle grapples the global defender:
		if the the total damage is less than 1:
			say " but holds on to [the global defender].[run paragraph on]";
			rule succeeds;

The show tentacle grappling with attack damage rule is listed first in the after dealing attack damage rules.


Section - Power of the Tentacle

The power of the tentacle is a power. Giant tentacle grants power of the tentacle.
The power level of power of the tentacle is 3.
The command text of power of the tentacle is "sprout".
The description of power of the tentacle is "Type: active ability.[paragraph break]Command: sprout [italic type]a number[roman type].[paragraph break]Effect: You sprout between 1 and 4 horrifying tentacles, which may turn anyone else in the room insane. You yourself will permanently lose as many points of mind as you sprout tentacles. Everyone else has to make a mind check against 4 + (4 * number of tentacles) - (that person's health / 3) + your concentration. If they fail the mind check, they go insane, and will start attacking random people including themselves. As additional effects, if you sprout at least 2 tentacles, everyone will lose their concentration; if you sprout at least 3 tentacles, all current attacks against you will be interrupted; and if you sprout 4 tentacles, everyone except for yourself will be stunned for 6 turns."
The power-name of power of the tentacle is "power of the tentacle".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the tentacle	mind	--

Absorbing power of the tentacle:
	increase melee of the player by 3;
	increase defence of the player by 3;
	increase permanent health of the player by 15;
	say "As the giant tentacle dies, you feel its soul absorbed into your own body. ([bold type]Power of the tentacle[roman type]: +3 attack, +3 defence, +15 health, and you can [italic type]sprout[roman type] horrific tentacles that may make your opponents go insane.)[paragraph break]".

Repelling power of the tentacle:
	decrease melee of the player by 3;
	decrease defence of the player by 3;
	decrease permanent health of the player by 15.
	
Status skill rule (this is the tentacle power status skill rule):
	if power of the tentacle is granted:
		say "You can [bold type]sprout[roman type] between 1 and 4 tentacles, a horrifying spectacle that may make other creatures go crazy. [italic type](Level 3)[roman type][line break][run paragraph on]".
	


Section - Sprouting

Sprouting is an action applying to one number. Understand "sprout [a number]" as sprouting.

Unnumbered sprouting is an action applying to nothing. Understand "sprout" as unnumbered sprouting.

Instead of unnumbered sprouting:
	take no time;
	say "You need to indicate how many tentacles you want to sprout by typing 'sprout 1', 'sprout 2', 'sprout 3' or 'sprout 4'. The more tentacles you sprout, the more powerful the effects -- but you will also lose more of your mind score."

Check sprouting:
	if power of the tentacle is not granted:
		take no time;
		say "You do not possess that power." instead.


Check sprouting:
	if the number understood is less than 1 or the number understood is greater than 4:
		take no time;
		say "You can only sprout 1, 2, 3 or 4 tentacles." instead.

Carry out sprouting:
	let n be the number understood;
	say "[if n is 1]A horrible tentacle sprouts[end if][if n is 2]Two[otherwise if n is 3]Three[otherwise if n is 4]Four[end if][if n is not 1] horrible tentacles sprout[end if] from your body! This spectacle was not meant to be seen by mortal eyes, and your mind score decreases by [n] points[if pseudopods is adapted]. Your pseudopods also wave and grow and terrify your enemies[end if].[paragraph break]";
	repeat with guy running through people in the location:
		unless guy is the player:
			if guy is insane:
				say "[The guy] has already gone insane, so the tentacles have no further effect.[paragraph break]";
			otherwise:
				let m be 4 + (4 * n) - (health of the guy / 3) + (concentration of the player);
				if pseudopods is adapted:
					increase m by 3;
				if m is less than 1:
					now m is 1;
				test the mind of the guy against m;
				if test result is true:
					say " Sanity is maintained.[run paragraph on]";
				otherwise:
					say " [The guy] goes [bold type]insane[roman type]![run paragraph on]";
					now faction of the guy is insane;
				if n is greater than 1:
					if concentration of guy is greater than 0:
						now concentration of guy is 0;
						say " [The guy] [bold type]loses concentration[roman type].[run paragraph on]";
				if n is greater than 2 or guy is insane:
					if combat state of player is at-react:
						repeat through Table of Delayed Actions:
							if the action to take entry is the action of the guy hitting the player:
								blank out the whole row;
				if n is greater than 3:
					if stun count of the guy is less than 6:
						say " [The guy] is [bold type]stunned[roman type]![run paragraph on]";
						now the stun count of the guy is 6;
						now stun strength of the global defender is 4;
				say "[paragraph break]";
	now concentration of the player is 0;
	decrease mind score of the player by n;
	if final mind of the player is less than 1:
		end the story saying "The horror was too great for your weak mind: you go utterly mad.".




Chapter - Level 3 - Minotaur

The minotaur is a male monster. "A ferocious minotaur[if the minotaur carries the minotaur's axe] wielding a big axe[end if] stands ready for combat."

The description of the minotaur is "Fruit of the mad monk Mendele's vile experiments, he wields an axe rumoured to possess mystical powers.".

The soul description of the minotaur is "a skein of twisting passages".

The level of the minotaur is 3.
The ID of the minotaur is 14.
The minotaur is large.
The minotaur is not talker.
The minotaur is thrower.
Material of the minotaur is flesh.

The minotaur is advanced.

The health of minotaur is 35.
The melee of minotaur is 2.
The defence of minotaur is 11.

The body score of minotaur is 10.
The spirit score of minotaur is 6. 
The mind score of minotaur is 6.

For natural weapon setup of the minotaur (this is the minotaur's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now printed name of X is "minotaur's fists";
	now X is plural-named;
	now the damage die of X is 6;

Minotaur is a weapon user.

The minotaur carries the minotaur's axe.  The minotaur's axe is readied.


Section - Minotaur images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of minotaur is Figure of map_monster_minotaur.
The legend-label of minotaur is Figure of map_legend_minotaur.


Section - Minotaur prose

Report an actor hitting the dead minotaur:
	say "Moaning plaintively, the minotaur expires.";
	rule succeeds.

Report the minotaur hitting a dead pc:
	say "Unlike Theseus, you could not best the minotaur.";
	rule succeeds.

Report the minotaur attacking:
	unless the actor is the noun:
		say "With a fearsome bellow, the minotaur swings at [the noun].";
	otherwise:
		say "The minotaur swings at himself.";
	rule succeeds.

Report the minotaur dodging:
	say "The minotaur lumbers aside.";
	rule succeeds.

Report the minotaur waiting when the minotaur is insane:
	say "The minotaur speaks in a voice that you can barely understand. 'I must escape!' he says.";
	rule succeeds.


Section - Power

The power of the minotaur is a power. The minotaur grants power of the minotaur.
The power level of power of the minotaur is 3.
The command text of power of the minotaur is "axe proficiency".
The description of power of the minotaur is "Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: You can use the minotaur's axe to maze people. In the maze, you will get a +3 bonus to body, mind and spirit. Furthermore and independent of your location, you get special proficiency with axes, granting you a (your body)% probability of dealing 10 bonus damage when you hit someone with an axe."
The power-name of power of the minotaur is "power of the minotaur".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the minotaur	body	--

Absorbing power of minotaur:
	increase melee of the player by 3;
	increase defence of player by 2;
	increase permanent health of the player by 17;
	say "As the minotaur dies, you feel its soul absorbed into your own body. ([bold type]Power of the minotaur[roman type]: +3 attack,  +2 defence, +17 health; ability to use the minotaur's axe; faculty bonus in the maze; a (your body)% chance of dealing 10 bonus damage when attacking with an axe.)[paragraph break]".

An add specific damage rule (this is the power of the minotaur damage bonus rule):
	if damage-by-hitting is true and primary damage is physical damage:
		if the power of the minotaur is granted and the actor is the player and the global attacker weapon is an axe:
			let n be final body of the player;
			if a random chance of n in 100 succeeds:
				add 10 points of physical damage with reason "axe proficiency".

A faculty bonus rule (this is the power of the minotaur faculty bonus rule):
	if location of the test subject is the maze:
		if test subject is the player and the power of the minotaur is granted:
			increase faculty bonus score by 3.

Repelling power of minotaur:
	decrease melee of the player by 3;
	decrease defence of player by 2;
	decrease permanent health of the player by 17.

Status skill rule (this is the minotaur power status skill rule):
	if power of minotaur is granted:
		say "Your [bold type]axe proficiency[roman type] gives you a (your body)% chance of dealing 10 bonus damage when attacking with an axe. You can also use the special power of the minotaur's axe, and are stronger in the maze. [italic type](Level 3)[roman type][line break][run paragraph on]".


Chapter - Level 3 - Angel of Mercy

The angel of mercy is a neuter monster. "A [angel of mercy's form] presence [angel of mercy details]."

To say angel of mercy's form:
	if size of angel of mercy is:
		-- gargantuan: say "vast ";
		-- huge: say "great ";
		-- large: say "big ";
		-- small: say "diminuitive ";
		-- tiny: say "miniscule ";
	if radiation of angel of mercy is:
		-- 0: say "diffuse";
		-- 1: say "glowing";
		-- 2: say "luminous";
		-- 3: say "brilliant";
		-- 4: say "blinding";
		-- otherwise: say "impossibly bright";

To say angel of mercy details:
	let new-sentence be true;
	if Angel of Mercy is gargantuan and mercy-retreat-direction is a direction:
		say "spreads across the room[if the number of exit directions > 1], blocking every exit but [mercy-retreat-direction][end if]";
	otherwise:
		say "hovers before you";
		now new-sentence is false;
	if new-sentence is true:
		say ". It ";
	otherwise:
		say ", ";
	if the angel of mercy wears something:
		say "wear[if new-sentence is true]s[otherwise]ing[end if] a glowing ";		
	if the angel of mercy wears a shield:
		say "shield";
		if the angel of mercy wears a gauntlet:
			say " and ";
	if the angel of mercy wears a gauntlet:
		say "gauntlet";
	Let item be the current weapon of the angel of mercy;
	if the item is an artificial weapon:
		if the angel of mercy wears something:
			say ", and ";
		say "wield[if new-sentence is true]s[otherwise]ing[end if] [the item]".

The description of the Angel of Mercy is "It is hard to discern this creature's swirling form - its limbs could be arms, legs, wings or tail. In the center is a face - or something resembling a face - that bears the serenity of only those who wield enormous power.[paragraph break]Every blow the angel receives makes it smaller, but increases its radiance. It is currently [size of Angel of Mercy] and it has [radiation of Angel of Mercy] level[s] of radiance."

The soul description of the Angel of Mercy is "a heart of purest silver".

The level of the Angel of Mercy is 3.
The ID of the Angel of Mercy is 43.
The Angel of Mercy is gargantuan.
The Angel of Mercy is talker.
The Angel of Mercy is thrower. [have Angel of Mercy throw grenades in another direction?]
The angel of Mercy is weapon user.
Material of the Angel of Mercy is radiance.

The Angel of Mercy is advanced.

The angel of Mercy is angelic.
Angel of Mercy is flyer.
Radiation of angel of Mercy is 0.
follower percentile chance of the angel of mercy is 0.

The health of the angel of Mercy is 43.
The melee of the angel of Mercy is 0.
The defence of the angel of Mercy is 11.

The body score of the angel of mercy is 7.
The mind score of the angel of mercy is 4.
The spirit score of the angel of mercy is 12.

For natural weapon setup of the angel of mercy (this is the angel of mercy's hand rule):
	let X be the natural weapon described;
	now damage die of X is 2;
	now the weapon damage bonus of X is -1;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "angel's open hand";
	[now X is plural-named;]

Section - Equipment

The angel of mercy wears the gauntlet of attraction.

The angel of mercy wears the shield of reflection.

[
super sharp weapon - kills mercifully - scythe? sword?
]

[
Special interaction with chain golem (and all tethered weapons) - causes grappling? stops spinning, but chain golem can make a body roll to get unstuck and start spinning again. Same with all tethered weapons? Hm... tethered weapon stays with attacker but becomes unreadied maybe
]

Section - Reactions and Stealing Weapons


[TODO: steal more weapons instead of readying?]

An AI action selection rule for the at-Act angel of mercy (this is the angel of mercy doesn't like attacking rule):
	choose row with an Option of the action of the angel of mercy attacking the chosen target in the Table of AI Action Options;
	[TODO: don't attack unless the chosen target deserves it? tweak weights]
	decrease the Action Weight entry by 10;
	if the current weapon of the angel of mercy is a natural weapon and the angel of mercy wears the gauntlet of attraction:
		decrease the Action Weight entry by 5;
	if the concentration of the chosen target is 0:
		Let T be the tension / 3;
		if T > 5, now T is 5;
		decrease the Action Weight entry by 5 - T;
	if concentration of the angel of mercy is 3:
		choose row with an Option of the action of the angel of mercy waiting in the Table of AI Action Options;
		now action weight entry is 0;
		
An AI action selection rule for the at-Act angel of mercy (this is the angel of mercy attacks more when attacked rule):
	choose row with an Option of the action of the angel of mercy attacking the chosen target in the Table of AI Action Options;
	Let r be the radiation of the Angel of Mercy;
	Let h be the permanent health of the Angel of Mercy - the health of the angel of mercy;
	Let n be (h + 4) / 5	 + (r * 2);
	if n > 10, now n is 10;
	increase the Action Weight entry by n;

An AI action selection rule for an at-React person (called guy) (this is the defender uses gauntlet of attraction to get weapons rule):
	if the guy wears the gauntlet of attraction:
		choose row with an Option of the guy parrying in the Table of AI Action Options;
		if the Action Weight entry < 0:
			now the Action Weight entry is 0;
		Let item be the current weapon of the main actor;
		if the gauntlet can steal the item for the guy:
			if the item is angel-worthy:
				increase the Action Weight entry by 10;
			otherwise:
				decrease the Action Weight entry by 100;
				
The defender uses gauntlet of attraction to get weapons rule is listed after the standard defense against attack select rule in the AI action selection rules.
	
The size attack modifier rule does nothing when the global defender is the angel of mercy and the global defender is at parry. [TODO: generalize this!]

An AI action selection rule for the at-React angel of mercy (this is the angel of mercy doesn't parry when too small rule):
	Let n be the size number of the angel of mercy - 1;
	choose row with an Option of the angel of mercy parrying in the Table of AI Action Options;
	increase the Action Weight entry by n;
	
An AI action selection rule for the angel of mercy (this is the angel of mercy's gloves come off rule):
	if the angel of mercy wears the gauntlet of attraction and the angel of mercy does not enclose an artificial weapon:
		Let weapon-count be 0;
		Let ranged-count be 0;
		now opposition test subject is the angel of mercy;
		repeat with guy running through opposer people in the location:
			if the gauntlet can steal current weapon of guy for the angel of mercy:
				if current weapon of guy is angel-worthy:
					increase weapon-count by 1;
			otherwise if current weapon of guy is ranged:
				increase ranged-count by 1;
		if weapon-count is at least 1 and the size number of the angel of mercy > 0:
			make no decision;
		let n be -1 * the size number of the angel of mercy;
		Let loot be a random angel-worthy weapon in the location;
		if loot is a weapon and weapon-count is 0:
			if n > -3:
				choose a blank row in the Table of AI Action Options;
				now the Option entry is the action of the angel of mercy taking loot;
				now the Action Weight entry is n;
		otherwise:
			if weapon-count is 0:
				if n < 0, now n is 0;
			if ranged-count is 0:
				increase n by 2;
			choose a blank row in the Table of AI Action Options;		
			now the Option entry is the action of the angel of mercy taking off the gauntlet of attraction;
			now the Action Weight entry is n.

Definition: a weapon (called item) is angel-worthy:
	if item is epic, no;
	if item is deathly, no;
	if item is tricky, no;
	yes.

[weapons to avoid:
	demon blade (cursed) - original owner is a demonic person
	backstabber (cursed) - hidden identity of something
	fearful axe (cursed, hidden identity)
	staff of pain (deathly)
	caduceus (epic, but maybe worth trying)
	staff of insanity (epic)
	glass cannon (epic)
	
TODO: can the angel manage a crossbow?
TODO: what if player gets hit with the caduceus?
	
]
	
An AI action selection rule for the angel of mercy (this is the angel of mercy puts the gauntlet back on rule):
	if the angel of mercy carries the gauntlet of attraction and the size number of the angel of mercy > 0:
		Let weapon-count be 0;
		now opposition test subject is the angel of mercy;
		repeat with guy running through opposer people in the location:
			Let item be the current weapon of guy;
			if item is a hand-to-hand artificial weapon:
				increase weapon-count by 1;
				if the concentration of guy > 0:
					increase weapon-count by 1;
		if weapon-count is at least 1:
			choose a blank row in the Table of AI Action Options;
			now the Option entry is the action of the angel of mercy wearing the gauntlet of attraction;
			let n be the size number of the angel of mercy;
			now the Action Weight entry is n + weapon-count - 3;

Section - Making weapons mercy-compatible

To focus is a verb.

Mercifying is an action applying to one thing.

Carry out an actor mercifying a weapon:
	say "[The actor] [focus] [their] power upon [the noun], until it begins to [bold type]shine with inner light[roman type]! [The noun] fluctuates in size and becomes capable of much more damage, but more difficult to wield accurately. It is now a weapon fit for mercy-killing.";
	now the material of the noun is radiance;
	now the noun is size-agnostic;
	increase the damage die of the noun by 4; [TODO: base it on how much damage this weapon has done?]
	decrease the weapon damage bonus of the noun by 1;
	decrease the weapon attack bonus of the noun by 1;
	
An AI action selection rule for the angel of mercy (this is the angel of mercy customises weapons rule):
	if the chosen weapon is an artificial weapon:
		if the chosen weapon is not radiance or the chosen weapon is not size-agnostic:
			choose a blank row in Table of AI Action Options;
			now the Option entry is the action of the angel of mercy mercifying the chosen weapon;
			now the Action Weight entry is 5;
			Let d be the size difference of the chosen weapon and the angel of mercy;
			if d < 0, now d is 0 - d;
			increase the action weight entry by d * 2;
		
[TODO: tweak CTW for parrying with gauntlets?]
	
Section - Reflecting Attacks

An AI action selection rule for an at-React person (called guy) (this is the use shield to reflect ranged attacks rule):
	if the current weapon of the main actor is ranged and the guy wears the shield of reflection:
		choose row with Option of the guy blocking in Table of AI Action Options;
		increase Action Weight entry by a random number from 1 to 20;
		choose row with Option of the guy parrying in Table of AI Action Options;
		decrease Action Weight entry by 5;

Report the angel of mercy blocking:
	say "The angel turns its shield towards the attack[if a random chance of 1 in 3 succeeds], and for a moment you see [regarding the main actor][possessive] image reflected in the lights[end if].";
	rule succeeds.

Section - Getting smaller

[The angel of mercy gets smaller and more radiant when damaged.]

Aftereffects rule (this is the angel of mercy shrinks when hit rule):
	if the global defender is the angel of mercy and the total damage is greater than 0 and the angel of mercy is not dead:
		let previous-size be the size of the angel of mercy;
		if previous-size is not tiny:
			now the angel of mercy is the size before previous-size;
		increase the radiation of angel of mercy by 1;
		if the angel of mercy is within the location:
			if previous-size is not tiny:
				say "The angel of mercy shivers. Its form collapses on itself and shrinks to [size of angel of mercy] size - but [if radiation of angel of mercy is 1]the angel starts to shine with radiance[otherwise]grows even more radiant[end if]!";
			otherwise:
				say "Now no more than a darting point of light, the angel flickers and grows even brighter!";
		otherwise:
			Let way be the best route from the location of the player to the location of the angel of mercy;
			if way is a direction:
				say "Somewhere [way], you hear a sigh of pity that chills you to your bones.";
			otherwise:
				say "Somewhere in the dungeon, you hear a sigh of pity that chills you to your bones."; 
				
A reviving rule for the angel of mercy (this is the reviving angel of mercy rule):
	now radiation of angel of mercy is 0;
	now the size of angel of mercy is gargantuan;
	now begging-count is 0;
	now mercy-command-broken is false;
	now mercy-wasted is false.
	
Section - Mercy for Runners

To run is a verb.
To escape is a verb.

The obstructed runner is an object that varies.

To decide what object is mercy-retreat-direction:
	Let way be the best route from the location to the retreat location;
	if the way is a direction, decide on the way;
	decide on the best route from the location to Entrance Hall.
	
A parting shot rule for the Angel of Mercy:
	if the opposition test subject is not runner:
		rule fails;
	if the noun is mercy-retreat-direction:
		[if you got teleported here and just want to go back]
		rule fails;
	if mercy-retreat-direction is nothing:
		if the opposition test subject is the player:
			say "The Angel of mercy says, 'Go, foolish adventurer - since you have nowhere to retreat to, I give you free passage.'"; 
		rule fails;
	rule succeeds.
	
Instead of the Angel of Mercy hitting a runner person (this is the Angel of Mercy obstructs runners rule):
	say "The Angel of Mercy cries out, 'Do not pass!' and moves to block [regarding the noun][possessive] escape.[run paragraph on]";
	if the Angel of Mercy is gargantuan:
		say "[run paragraph on] [The noun] [attempt] to get by, but the angel is just too big.[paragraph break]";
		now the obstructed runner is the noun;
	otherwise:
		now the total damage is 0;
		if radiation of the Angel of Mercy is at least 1:
			say "[paragraph break][The noun] [attempt] to get by without being burned. [run paragraph on]";
			have the angel of mercy damage the noun by obstruction;
		otherwise:
			say "[paragraph break][The noun] [attempt] to get by.[paragraph break]";
		if the noun is dead:
			if the noun is the player:
				end the story saying "You ran into the flames and died.";
		otherwise if the angel of mercy obstructs the noun:
			say "[if test result is true]! [otherwise][paragraph break][end if]Unfortunately, [they] [adapt the verb are in the past tense] [bold type]unable to escape[roman type].[paragraph break]";
			now the obstructed runner is the noun;
		otherwise:
			if test result is true:
				say ", and [the noun] [bold type][escape][roman type] as well!";
			otherwise:
				say "[paragraph break][The noun] [bold type][escape][roman type] anyway!";
		now total damage is 0;

An impeded movement rule (this is the obstruction impedes movement rule):
	if the test subject is the obstructed runner:
		rule fails.

Every turn (this is the free the obstructed runner rule):
	now the obstructed runner is nothing.

To have the angel of mercy damage (guy - a person) by obstruction:
	if the radiation of the Angel of Mercy is 0, stop;
	Let D be radiation of the Angel of Mercy - 1;
	increase D by a random number from 0 to radiation of the Angel of Mercy;
	increase D by a random number from 0 to (radiation of the Angel of Mercy / 2);
	increase D by the size number of the Angel of Mercy;
	Let n be D + 10 + (a random number from 0 to final body of the player * 2 / 3);
	test the body of the player against n;
	[TODO: have Sul intervene?]
	if test result is false:
		say " [The angel of mercy's body] [bold type]burns[roman type] [no dead property][the guy][dead property] for [run paragraph on]";
		deal D points of heat damage;
		have the Angel of Mercy inflict damage on the player;
		say "[burn consequences for the noun].[run paragraph on]";
	otherwise:
		say " [The guy] [are] unhurt[run paragraph on]";
	
[Damage range:

radiance	tiny	small	medium	large	huge
1	0	0	0-1	1-2	2-3
2	0-2	0-3	1-4	2-5	3-6
3	0-4	1-5	2-6	3-7	4-8
4	1-7	2-8	3-9	4-10	5-11
5	2-9	3-10	4-11	5-12	6-13
]

To decide whether the angel of mercy obstructs (guy - a person):
	if test result is false and the total damage is 0:
		[Failed the body check for damage, but damage was 0... so player should fail at something!]
		yes;
	Let bulk be the size number of the Angel of Mercy + the size number of the guy;
	Let target be the percent target for obstruction of guy by the angel of mercy;
	Let B be final body of guy;
	if B < 1, now B is 1; [always some chance, even with 0 body]
	decide on whether or not B chances of target in 100 succeed.

To decide what number is the percent target for obstruction of (guy - a person) by the angel of mercy:
	Let N be the size number of the Angel of Mercy + the size number of the guy;
	[if we make this roll 6 times (body score of 6) we want a pretty linear rate of success]
	if N is at most -2:
		decide on 74; [74% chance of failure on each roll, with 6 rolls it's about 1/6 chance of obstruction]
	if N is -1:
		decide on 83; [83% chance of failure]
	if N is 0:
		decide on 89; [89% chance of failure]
	if N is 1:
		decide on 93; [93% chance of failure]
	if N is 2:
		decide on 97; [97% chance of failure on each roll, with 6 rolls it's about 5/6 chance of obstruction]
	[N is 3 or more, eg player is medium, angel is gargantuan]
	decide on 100;
	
[TODO: the angel should do an average of 7 damage in order to get past it when the player has a body score of 5. This can either be all in one attempt if it's easy to get past (both angel and player are tiny), or in several small attempts if it's difficult. When it's gargantuan and the player is medium, it is impossible to get past. Higher body score should reduce the number of attempts needed. Fix damage amount and escape probability so this works right

with body score of 6, what do we need to roll 6 times to get...
the 6th root of 0.2 is 0.76472449133173
the 6th root of 0.4 is 0.858374218932557
the 6th root of 0.6 is 0.9183859021684453
the 6th root of 0.8 is 0.9634924839989961

the 6th root of 1/6 is 0.7418363755904023
the 6th root of 2/6 is 0.8326831776556043
the 6th root of 3/6 is 0.8908987181403393
the 6th root of 4/6 is 0.9346552651840672
the 6th root of 5/6 is 0.9700701154458004

]
		
To say The angel of mercy's body:
	if the size of the angel of mercy is at least huge:
		say "The angel's [size of the angel of mercy]";
		if the radiation of the angel of mercy is at least 1:
			say ", scalding body";
		otherwise:
			say " body";
	otherwise:
		if the radiation of the angel of mercy is at least 4:
			say "The angel's white-hot body";
		otherwise if the radiation of the angel of mercy is at least 2:
			say "The angel's searing body";
		otherwise if the radiation of the angel of mercy is at least 1:
			say "The angel's scalding body";
		otherwise:
			say "The angel's body".
			
[
player medium, angel huge, radiation 1 = 2 damage
player gargantuan, angel tiny, radiation 5 = 10 damage
player medium, angel tiny, radiation 5 = 5 damage]

[instead have it attack or block runners?]
	
[TODO: come up with some interesting following behavior?]	

[
Section - Angel of Mercy images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of angel of mercy is Figure of map_monster_angel_of_mercy.
The legend-label of angel of mercy is Figure of map_legend_angel_of_mercy.
]

Section - Begging for Mercy

Begging for mercy is an action applying to nothing.

Understand "beg" as begging for mercy.

Understand the commands "plead" or "petition" as "beg".

Understand "beg [mercy]" and "beg for [mercy]" as begging for mercy.

Understand "mercy" and "pity" and "forgiveness" and "clemency" and "pardon" as "[mercy]".

Understand "[mercy]" as the angel of mercy. [this is a shortcut so we don't have to create a separate object representing the concept of mercy rather than the person]

Understand "beg [someone] for [something]" and "request [something] from/of [someone]" as asking it for.

To heed is a verb.
To grant is a verb.

Check asking someone for something:
	if the second noun is the angel of mercy:
		if the noun is the angel of mercy:
			instead try begging for mercy;
		otherwise:
			say "[The noun] [grant] you no mercy." instead;
	if the noun is the angel of mercy and the angel of mercy actively opposes the player:
		say "'All I can give you is mercy, or a quick death,' the angel of mercy replies." instead;
	otherwise:
		say "[The noun] [do not heed] your request." instead.
		
Generally asking for is an action applying to one thing. [This doesn't do much, but it helps to give a hint if you're in the room with the angel of mercy]

Understand "ask for [something]" and "beg for [something]" and "request [something]" as generally asking for.

Check generally asking for:
	if the angel of mercy is in the location:
		instead try asking the angel of mercy for the noun;
	say "No one listens to your request." instead.

Check begging for mercy:
	unless the angel of mercy is in the location and the angel of mercy actively opposes the player:
		say "No one listens to your plea." instead.		

Check begging for mercy:
	unless the angel of mercy opposes the player:
		say "The angel is already on your side." instead.

begging-count is a number that varies.
mercy-wasted is a truth state that varies.
mercy-command-broken is a truth state that varies;

Carry out attacking when the angel of mercy is merciful:
	break the angel of mercy's command;
	if the angel of mercy is within the location:
		if the angel of mercy is sleeping in this world:
			now the angel of mercy is not asleep;
			say "The angel of mercy is awoken by your act of aggression. It [run paragraph on]";
		otherwise:
			say "The angel of mercy [run paragraph on]";
		say "sighs with disappointment. 'It is too bad. I had hoped to spare your life, but I see you are too in love with death. Let your death be the last one here, then.'";
		alert the angel of mercy to betrayal.

Last killing rule (this is the don't disappoint the angel of mercy rule):
	if the player is not dead and angel of mercy is not dead:
		if killer-guy is the player and the angel of mercy is merciful and the player and the angel of mercy share a world:
			break the angel of mercy's command;
			if the angel of mercy is sleeping in this world:
				now the angel of mercy is not asleep;
				if the location of the angel of mercy is the location:
					say "The angel of mercy is startled awake by your act of murder! [run paragraph on]";
			if the location of the angel of mercy is the location:
				say "The angel of mercy sighs with disappointment, then fixes you with a cold stare.";
			otherwise:
				let way be the best route from the location to the location of the angel of mercy;
				say "You hear a deep sigh of disappointment somewhere [if way is a direction][way][otherwise]in the dungeon[end if].";
			alert the angel of mercy to betrayal.
	
To break the angel of mercy's command:
	if mercy-command-broken is false:
		say "Breaking the command of the angel of mercy costs you [bold type]5 spirit[roman type]!";
		decrease the spirit score of the player by 5;
		now mercy-command-broken is true.
	
To alert the angel of mercy to betrayal:	
	now mercy-wasted is true;
	now the angel of mercy is hostile;
	now the angel of mercy is follower;
	increase the follower percentile chance of the angel of mercy by 50;

The angel of mercy doesn't like attacking rule does nothing when mercy-wasted is true.

Carry out begging for mercy:
	increment begging-count;
	say "You beg the angel to spare your life[if begging-count is 2] a second time[otherwise if begging-count is 3] a third time[otherwise if begging-count > 3] yet again[end if]. [run paragraph on]";
	if mercy-wasted is true:
		say "[paragraph break]'A quick death is more than you deserve,' the angel replies coldly. 'I will grant you that, but no more.'";
		rule succeeds;
	if begging-count > 3:
		say "[paragraph break]'I may be forgiving, but I am not a fool!' the angel hisses.";
		rule succeeds;
	let n be 6;
	repeat with die roll running from 1 to begging-count:
		increase n by a random number from 1 to the health of the player;
	decrease n by the favour of the player with Sul;
	test the spirit of the player against n;
	if test result is false:					
		say "The angel searches your face for sincere contrition, but [bold type]does not find it[roman type].[paragraph break]'I may lessen your pain, but I will not spare your life.' it says.";						
		rule succeeds;
	say "The angel is [bold type]moved by[roman type] your humble plea! [run paragraph on]";
	now the Angel of Mercy is merciful;
	Let item be the mercy-boon;
	if item is a scroll:
		identify item;
	if item is the angel of mercy:
		say "'I will spare your life,' the angel says, 'and also, I will accompany you as a peaceful witness, and we shall harm no one.'";
		now the angel of mercy is follower;
		now the follower percentile chance of the angel of mercy is 100;
	otherwise:
		say "'I will spare your life, and you shall harm no one,' the angel says. 'Now take this. Perhaps it will help you survive long enough to learn the error of your ways.' It places [bold type][an item][roman type] in your hands!'";
		now the player carries the item;

To decide which thing is the mercy-boon:
	[TODO: Tome of the brigtest flame! Add Arcane Vault to the dungeon?]
	Let boon-list be a list of things;
	add the angel of mercy to boon-list;
	if the hand of glory is off-stage, add the hand of glory to boon-list;
	if every scroll of afternoon delights is off-stage, add a random scroll of afternoon delights to boon-list;
	sort boon-list in random order;
	decide on entry 1 in boon-list.

An absorption stopping rule (this is the you already got mercy rule):
	if the test subject is the angel of mercy and mercy-wasted is true:
		say "You are unable to absorb the soul of the angel of mercy! It seems you have already been granted mercy, and you have squandered it.";
		rule succeeds.

the you already got mercy rule is listed after the abyss of the soul absorbs all souls rule in the absorption stopping rules.

An AI Action Selection rule for a merciful person (called guy) (this is the merciful people don't concentrate rule):
	Choose row with an option of the guy concentrating in the table of AI Action Options;
	decrease the action weight entry by 100.

An AI action selection rule for a merciful person (called guy) (this is the merciful people don't attack rule):
	choose row with an Option of the guy attacking the chosen target in the Table of AI Action Options;
	[Angel of Mercy befriends the player, but doesn't attack former allies]
	decrease the Action Weight entry by 1000.
		
Section - Prose

Report an actor hitting the dead angel of mercy:
	say "The angel shinks to a pinpoint so bright [run paragraph on][if the player is using eyes]you can't bear to look[otherwise]you can feel the intensity[end if], then disappears completely!";
	[TODO: blinds you when she dies? What about blind/eyeless viewers?]
	rule succeeds.

Report the angel of mercy hitting a dead pc:
	say "'In death may you find the peace you could not achieve in life,' the angel murmurs as you draw your last breath.";
	rule succeeds.

Report the angel of mercy concentrating:
	say "[if concentration of the angel of mercy is 1]The angel of mercy gathers its form in concentration.[otherwise if concentration of the angel of mercy is 2]The angel of mercy's shape flows faster and more intensely.[otherwise if concentration of the angel of mercy is 3]'Retreat now, and I shall not harm you,' the angel commands, fierce with righteous energy.[end if]";
	rule succeeds.

Report the angel of mercy attacking:
	unless the actor is the noun:
		say "[if the health of the noun is less than 11]'Your death will be quick and painless,' the angel of mercy declares as it[otherwise if the health of the noun is at least the permanent health of the noun]'I bear you no ill will, but I will stop you if I must,' the angel of mercy declares as it[otherwise]The angel of mercy silently[end if] strikes out at [the noun].";
	otherwise:
		Let the item be the current weapon of the angel of mercy;
		if the item is a whip or the item is a staff or the item is a mace or the item is a hammer or the original material of the item is wood:
			say "[italic type]'Mea culpa, mea culpa, mea maxima culpa!'[roman type] the angel of mercy intones at it flagellates its own back.";
		otherwise:
			say "'The most difficult of all to forgive is oneself!' the angel of mercy screams as it ";
			if the item is a natural weapon:
				say "claws";
			otherwise if the item is a dagger:
				say "stabs";
			otherwise:
				say "hacks";
			say " at its own face.";
	rule succeeds.

Report the angel of mercy dodging:
	say "The angel [if the size of the angel of mercy is less than large]zips away[otherwise]shifts[end if] to avoid the attack.";
	rule succeeds.

Report the angel of mercy parrying:
	Let item be the current weapon of the angel of mercy;
	if item is not a natural weapon:
		say "The angel parries with [regarding the previous owner of the item][possessive][if the previous owner of the item is the main actor] own[end if] weapon.";
		rule succeeds.

Report the angel of mercy waiting:
	if the angel of mercy is insane:
		say "[one of]The angel of mercy improvises a song that climaxes in the refrain 'Kill them all and let Sul sort them out!'[or]The angel of mercy declares, 'Never interrupt your enemy when [regarding the player][they]['re] in the middle of making a mistake!' and then slips on a banana peel to demonstrate.[at random]";
	otherwise:
		say "The angel of mercy waits[one of] for someone else to make a move[or] again, calm and alert[or], resting in meditation[or] patiently[or] peacefully[then at random].";
	rule succeeds.


Section - Power

The power of mercy is a power. The angel of mercy grants the power of mercy.
The power level of power of mercy is 3.
The command text of power of mercy is "mercy power".
The description of power of mercy is "Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: Any time you are damaged in combat, you will grow smaller. You also have a chance to become more radiant, which increases with your spirit. This effect lasts until combat is over."

The power-name of power of mercy is "power of mercy".

[WIth two nice items, I don't think we need an active ability... but here's what it was going to be:

[paragraph break]Command: pardon.[paragraph break]As reaction, you can forgive your attacker for seeking to harm you. This reduces the damage you receive from them by (your spirit / 4). This damage reduction will occur every time that person hits you, until you attack them back. If someone you have pardoned hits you, they must succeed at a spirit check against (your spirit + 4) or lose 1 point of spirit.

You can also [bold type]pardon[roman type] your attacker, softening the blow and weakening their spirit. [italic type](Level 3)[roman type][line break][run paragraph on]".

	now every person is not pardoned.


]
[TODO: grant eyeless vision? immune to radiance? or just protect from own flash power?]
[pardon power: makes it harder for enemy to hit/damage you, but only until you hit back, and only usable after they hit you... or force them to retreat? 

"pardoning softens blows"

mercy killing - if you damage an enemy to low enough health, does extra damage to kill them... if it's not enough, does no damage? keep concentration?

-- stop blow but add damage to next attack!
]

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of mercy	spirit	--

Status skill rule (this is the mercy status skill rule):
	if the power of mercy is granted:
		say "You have the power of mercy, which causes you to shrink in size and grow more radiant when hit.";

Absorbing power of mercy:
	increase melee of the player by 2;
	increase defence of the player by 3;
	increase permanent health of the player by 20;
	say "As the angel dies, its generosity of spirit becomes yours. ([bold type]Power of mercy[roman type]: +2 attack, +3 defence, +20 health, shrink and become radiant when hit.)[paragraph break]";

Repelling power of mercy:
	decrease melee of the player by 2;
	decrease defence of the player by 3;
	decrease permanent health of the player by 20;

Section - Power of Mercy - Aftereffects

mercy-radiation is a number that varies. mercy-radiation is 0.

To diminish is a verb.

Aftereffects rule (this is the mercy damage rule):
	if global defender is the player and the total damage is greater than 0:
		if power of mercy is granted:
			let previous-size be the size of the player;
			if previous-size > tiny:
				["hate is present" is deprecated, but it's not safe to update the combat status here, because this can happen when combat status needs to be concluding]
				if hate is present:
					now the size of the player is the size before previous-size;
					say "You shrink to [bold type][size of the player][roman type] size!";
					let n be (a random number from 5 to 25) - total damage;
					if n < 0, now n is 0;
					test the spirit of the player against n;
					if test result is true:
						say "You gain a level of radiance!";
						increase mercy-radiation by 1;
						increase the radiation of the player by 1;
					otherwise:
						say "Your spirit was not strong enough to increase your radiance this time.";

Every turn when mercy-radiation is not 0 (this is the revert back to normal radiance rule):
	if combat status is peace:
		let base-radiation be the radiation of the player - mercy-radiation;
		if base-radiation is 0:
			say "All of your radiance is extinguished with your mercy.";
		otherwise:
			say "With your mercy extinguished, you revert to [base-radiation] levels of radiance.";
		now the radiation of the player is base-radiation;
		now mercy-radiation is 0;

Chapter - Level 4 - Fanatics of Aite 

[ All the fanatics of Aite should be treated the same, but we have to treat one as their leader. We'll choose the Healer solely because it's listed first!
The old fanatics-of-Aite-package is no longer needed. ]

Section - Healer of Aite

A healer of Aite is a male monster. The healer of Aite is not neuter. "A white-robed healer of Aite is chanting in praise of his goddess."
Understand "white-robed" as the Healer of Aite.
The description of the healer of Aite is "This white-robed priest is a healer of Aite. Their task is to support the other fanatics in their never-ending crusade.".

The soul description of the healer of Aite is "a deadly snake curled around a staff".
The ID of the Healer of Aite is 16.
The Healer of Aite is medium.
The Healer of Aite is talker.
Material of the Healer of Aite is flesh.

The level of the healer of Aite is 4.

The healer of Aite is group leading.
The healer of Aite is not defeated individually.

The health of the Healer of Aite is 20.
The melee of the Healer of Aite is 1.
The defence of the Healer of Aite is 8.

The body score of Healer of Aite is 10.
The mind score of Healer of Aite is 9.
The spirit score of Healer of Aite is 9. 

The group level of the Healer of Aite is 4.

Heal power of the healer of Aite is 5.
The healer of Aite is Aite-loved.
The healer of Aite carries the holy sword.

Healer of Aite is weapon user.
Healer of Aite is thrower.

For natural weapon setup of the healer of Aite (this is the healer's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now X is plural-named;	
	now printed name of X is "healer's fists";

Report an actor hitting the dead healer of Aite:
	say "The healer stares in disbelief at his fatal wounds before he topples over.";
	rule succeeds.

Report the healer of Aite hitting a dead pc:
	say "'Aite be praised!' These are the last words you hear as the healer's sword penetrates your heart.";
	rule succeeds.

Report the healer of Aite attacking:
	unless the actor is the noun:
		say "The healer pokes his sword at [the noun].";
	otherwise:
		say "'My head has offended me,' the healer announces. 'It must be cut off.'";
	rule succeeds.

Report the healer of Aite dodging:
	say "'Save me, great Aite!' the healer exclaims as he attempts to duck away.";
	rule succeeds.
	
Report healer of Aite waiting when healer of Aite is insane:
	say "The healer puts his hand together as if to pray, then says: 'Pancakes, please'.";
	rule succeeds.	


Section - Healer of Aite images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of healer of Aite is Figure of map_monster_healer_of_Aite.
The legend-label of healer of Aite is Figure of map_legend_healer_of_Aite.


Section - Tormentor of Aite

A tormentor of Aite is a female monster. The tormentor of Aite is not neuter. "A black-robed mage stalks through the room."
Understand "black-robed" and "mage" as the Tormentor of Aite.
The description of the tormentor of Aite is "You immediately recognise the black-robed mage as a tormentor of Aite, savage priests who specialise in inflicting pain on all who oppose their faith.".

The soul description of the tormentor of Aite is "savage stabs of pain".

The ID of the Tormentor of Aite is 17.
The Tormentor of Aite is medium.
The Tormentor of Aite is talker.
Material of the Tormentor of Aite is flesh.

The level of the tormentor of Aite is 4.

The tormentor of Aite accompanies the healer of Aite.

The health of the Tormentor of Aite is 16.
The melee of the Tormentor of Aite is 3.
The defence of the Tormentor of Aite is 9.

The body score of Tormentor of Aite is 8.
The mind score of Tormentor of Aite is 8.
The spirit score of Tormentor of Aite is 12. 

The group level of the Tormentor of Aite is 4.

The tormentor of Aite is Aite-loved.

The tormentor of Aite carries a staff of pain.

Tormentor of Aite is weapon user.
Tormentor of Aite is thrower.

For natural weapon setup of the tormentor of Aite (this is the tormentor's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now X is plural-named;
	now printed name of X is "tormentor's fists";

Report an actor hitting the dead tormentor of Aite:
	say "The tormentor cries in pain and rage as her body's vital functions fail.";
	rule succeeds.

Report the tormentor of Aite hitting a dead pc:
	say "'Aite be praised!' These are the last words you hear as magical pain racks your body.";
	rule succeeds.

Report the tormentor of Aite attacking:
	unless actor is the noun:
		say "The tormentor raises her staff, preparing to cause pain to [the noun].";
	otherwise:
		say "The tormentor tries to put her staff in a place where the sun doesn't shine.";
	rule succeeds.

Report the tormentor of Aite dodging:
	say "'You will never get me!' the tormentor exclaims as she attempts to duck away.";
	rule succeeds.
	
Report the tormentor of Aite waiting when the tormentor of Aite is insane:
	say "'I never wanted to be a tormentor,' the priestess says. 'I wanted to be a [one of]goose girl[or]lumberjack[or]mother[at random]!' Tears stream down her face.";
	rule succeeds.	


Section - Tormentor of Aite images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of tormentor of Aite is Figure of map_monster_tormentor_of_Aite.
The legend-label of tormentor of Aite is Figure of map_legend_tormentor_of_Aite.


Section - Defender of Aite

A defender of Aite is a male monster. The defender of Aite is not neuter. "Equipped with a small sword and a huge shield, a heavily armoured man awaits any attacks."
Understand "armoured" and "man" as the defender of Aite.
The description of the defender of Aite is "This heavily armoured priest is a defender of Aite, one of the front-line troops of the armies of this horrible faith.".

The soul description of the defender of Aite is "a bronze shield, dented and spiked".

The ID of the defender of Aite is 18.
The defender of Aite is medium.
The defender of Aite is talker.
Defender of Aite is thrower.
Material of the defender of Aite is flesh.

The level of the defender of Aite is 4.

The defender of Aite accompanies the healer of Aite.


The health of the Defender of Aite is 23.
The melee of the Defender of Aite is 1.
The defence of the Defender of Aite is 11.

The body score of Defender of Aite is 12.
The mind score of Defender of Aite is 10.
The spirit score of Defender of Aite is 8. 

The group level of the Defender of Aite is 4.

The defender of Aite is Aite-loved.
The defender of Aite carries the immaculate sword.
The defender of Aite wears the shield of fanaticism.

Defender of Aite is weapon user.

For natural weapon setup of the defender of Aite (this is the defender's fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now X is plural-named;
	now printed name of X is "defender's fists";

Report an actor hitting the dead defender of Aite:
	say "The defender falls to the ground with a smash, never to stand up again.";
	rule succeeds.

Report the defender of Aite hitting a dead pc:
	say "'Aite be praised!' These are the last words you hear as the defender hacks you apart.";
	rule succeeds.

Report the defender of Aite attacking:
	unless the actor is the noun:
		say "The defender starts lumbering towards [the noun].";
	otherwise:
		say "'Do you think this will hurt?' the defender asks as he attacks himself.";
	rule succeeds.

Report the defender of Aite parrying:
	say "The soldier raises his shield to stop the attack.";
	rule succeeds.

Report the defender of Aite dodging:
	say "The soldier attempts to jump away, using his shield for additional cover.";
	rule succeeds.
	
Report the defender of Aite waiting when the defender of Aite is insane:
	say "The defender licks his shield.";
	rule succeeds.	


Section - Defender of Aite images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of defender of Aite is Figure of map_monster_defender_of_Aite.
The legend-label of defender of Aite is Figure of map_legend_defender_of_Aite.


Section - Power of the Fanatics of Aite

The power of the Fanatics of Aite is a power. Healer of Aite grants power of the Fanatics of Aite.
The power level of power of the Fanatics of Aite is 4.
The command text of power of the fanatics of Aite is "sacrifice".
The description of power of the fanatics of Aite is "Type: active and passive ability.[paragraph break]Command: sacrifice.[paragraph break]Effect: If you are not in a temple, you can still sacrifice powers. If you don't worship a god, you can sacrifice to Aite in this way; otherwise, you will sacrifice to the god you're already worshipping. The probability that your god's combat interventions will occur increases as if your piety were spirit/4 higher than it actually is. If you worship Aite, the probability that her interventions will benefit you increases, and they deal more damage."
The power-name of power of the fanatics of Aite is "power of the fanatics".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the Fanatics of Aite	spirit	--


Absorbing power of the Fanatics of Aite:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	say "As soon as the fanatics of Aite are all dead, you feel their souls absorbed into your own body. ([bold type]Power of the fanatics[roman type]: +4 attack, +4 defence, +20 health, you can [italic type]sacrifice[roman type] even when you're not in a temple, and your god's interventions will occur more often.)[paragraph break]".

Repelling power of the Fanatics of Aite:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20.

Status skill rule (this is the fanatics of aite status skill rule):
	if power of the fanatics of aite is granted:
		say "You have the power of the fanatics of Aite, which allows you to [bold type]sacrifice[roman type] even when you are not in a temple. Divine interventions on your behalf also become more frequent. [italic type](Level 4)[roman type][line break][run paragraph on]".
	
A room can be temporary-temple. A room is usually not temporary-temple.
		
First check sacrificing (this is the fanatics turn every location into a temple of your god rule):
	if location is temporary-temple:
		repeat with guy running through gods:
			now location is not dedicated to guy;
		now location is not temporary-temple;
	if no god infuses location:
		if power of the fanatics of Aite is granted:
			now location is temporary-temple;
			let guy be Aite;
			if the player worships a god:
				now guy is a random god worshipped by the player;
			now location is dedicated to guy.

An intervention bonus rule (this is the power of Aite intervention bonus rule):
	if intervention-guy is the player and power of the fanatics of Aite is granted:
		if player worships intervention-god:
			let n be (final spirit of the player) / 4;
			increase intervention-bonus by n.
	

Section - Beloved of Aite

A beloved of Aite rule (this is the aite loves the bearer of her power rule):
	if test subject is the player and power of the fanatics of aite is granted:
		rule succeeds.






Chapter - Level 4 - Bodmall

Bodmall is a monster. Bodmall is proper-named. Bodmall is female and not neuter. "A pale druidess stands here, murmuring to herself in a language you have never heard." The description of Bodmall is "Why the great druidess Bodmall has chosen to work together with Malygris is a subject of much speculation among scholars of the occult -- but here she is, standing between you and victory. She is a very powerful foe.".

The soul description of Bodmall is "spreading thorns dripping with dew--or blood".

Understand "druid" and "druidess" and "witch" as Bodmall.

The level of Bodmall is 4.
The ID of Bodmall is 19.
Bodmall is medium.
Bodmall is talker.
Bodmall is thrower.
Material of Bodmall is flesh.

The health of Bodmall is 35.
The melee of Bodmall is 5.
The defence of Bodmall is 12.

The body score of Bodmall is 10.
The mind score of Bodmall is 9.
The spirit score of Bodmall is 9. 

For natural weapon setup of Bodmall (this is the Bodmall's lightning rule):
	let X be the natural weapon described;
	now X is projectile;
	now X is size-agnostic;
	now X is not armour-stoppable;
	now damage die of X is 10;
	now dodge bonus of X is 1;
	now parry-against bonus of X is -2;
	now parry-with bonus of X is -2;
	now printed name of X is "a lightning bolt";
	now material of X is electricity.


Section - Bodmall images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Bodmall is Figure of map_monster_Bodmall.
The legend-label of Bodmall is Figure of map_legend_Bodmall.


Section - Bodmall's lightning attack

[Mostly this is just prose, except --]

An attack modifier rule (this is the do not parry with metal weapons against Bodmall's lightning attack rule):
	if the global attacker is Bodmall and the global defender is at parry:
		if the global defender weapon is iron:
			if the numbers boolean is true:
				say " + 3 ([global defender weapon] acts as a lightning rod)[run paragraph on]";
			increase the attack strength by 3;
		if the global defender weapon is silver:
			if the numbers boolean is true:
				say " + 5 ([global defender weapon] acts as a lightning rod)[run paragraph on]";
			increase the attack strength by 5.


Section - Bodmall power - Barkskin

Bodmall-barkskinning is an action applying to nothing.

An AI action selection rule for Bodmall (this is the Bodmall considers barkskinning rule):
	if Bodmall is not barkskinned:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the Bodmall Bodmall-barkskinning;
		now the Action Weight entry is a random number between -10 and 20;

Carry out Bodmall Bodmall-barkskinning:
	say "Bodmall chants loudly, and her [bold type]skin[roman type] transforms and toughens. It now looks like the bark of a tree.";
	now Bodmall is barkskinned.

A person can be barkskinned. A person is usually not barkskinned.

A remove specific damage rule (this is the barkskin decreases damage rule):
	if the victim is barkskinned:
		unless ((damage-by-hitting is true) and (the global attacker weapon is an axe)):
			remove 1 points of physical damage with reason "barkskin".

Barkskin is a part of Bodmall. Understand "skin" and "bark" as barkskin.

The description of barkskin is "Bodmall's skin looks [if Bodmall is barkskinned]tough and tree-like[otherwise]perfectly normal[end if].".

Section - Bodmall power - Brambles


Bodmall-summoning is an action applying to nothing.

An AI action selection rule for Bodmall (this is the Bodmall considers summoning thorns rule):
	if brambles are not in the location:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of Bodmall Bodmall-summoning;
		now the Action Weight entry is a random number between -100 and 35.

Carry out Bodmall Bodmall-summoning:
	if the location of Bodmall is the location of the player:
		say "Bodmall makes several complicated gestures, and [bold type]brambles[roman type] come out of the ground everywhere around you!";
		move brambles to the location.

An AI action selection rule for Bodmall (this is the Bodmall considers launching rule):
	if brambles are in the location and brambles strength is greater than 1:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of Bodmall launching;
		now the Action Weight entry is -10;
		increase Action Weight entry by ((2 * brambles strength) + brambles duration).


Section - Bodmall prose

Report an actor hitting the dead Bodmall:
	say "'I will haunt you come Samhain!', whispers Bodmall as her body returns to the earth.";
	rule succeeds.

Report Bodmall hitting a dead pc:
	if the player is undead:
		say "Bodmall kneels over your corpse. 'The undead are a blight on this world, and they will be destroyed,' she says.";
	otherwise:
		say "Bodmall kneels over your corpse. 'Death is but a stage in the cycle of Nature,' she says.";
	rule succeeds.

Report Bodmall attacking:
	unless the actor is the noun:
		say "Bodmall throws her hands forward, casting a lightning bolt at [the noun].";
	otherwise:
		say "'I need a new thrill, and you aren't going to give it to me' Bodmall tells you as she throws a lightning bolt at herself.";
	rule succeeds.

Report Bodmall dodging:
	say "Gracefully, Bodmall attempts to glide out of the way.";
	rule succeeds.

Report Bodmall waiting when Bodmall is insane:
	say "'Though I shall fall as the harvest corn, it is my fate, I'm pagan born!' Bodmall sings.";
	rule succeeds.


Section - Power of Bodmall

The power of Bodmall is a power. Bodmall grants power of Bodmall.
The power level of power of Bodmall is 4.
The command text of power of Bodmall is "[if brambles are not in the location]brambles[otherwise]launch[end if]".
The description of power of Bodmall is "Type: active combat ability.[paragraph break]Command: brambles; launch.[paragraph break]The 'brambles' command will summon bushes of thorns that impede the movement of your enemies, giving them a -2 attack penalty. After a few turns, these branches will start growing thorns. If you wait longer, they will also grow different types of fruit.[paragraph break]The 'launch' command launches these thorns and fruit at your enemies (or, for some fruits, yourself). The thorns will deal between 1 and [italic type]n[roman type] damage, where [italic type]n[roman type] is the number of times the thorns have grown (tiny = 1, terrible = 5). In addition, the thorns have an [italic type]n[roman type] * 20% chance of breaking concentration. Different types of fruits have different effects; experiment with them! Both the brambles and the launch command can be used as an action or a reaction.[paragraph break]Your body score has several effects on how fast the thorns and the fruit will grow; a higher body score means that both will appear sooner and have less chance of disappearing again.[paragraph break]In addition, as a druid you are immune to smoke, you get a +1 attack bonus with wooden weapons, and wooden, bone and vapourous weapons deal less damage to you."
The power-name of power of Bodmall is "power of Bodmall".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of Bodmall		body	--


The druid is a person that varies. The druid is Bodmall. [The person whose scores determine how the brambles work.]
	
Absorbing power of Bodmall:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	say "As Bodmall dies, you feel her soul absorbed into your own body. ([bold type]Power of Bodmall[roman type]: +4 attack, +4 defence, +20 health, and you can summon [italic type]brambles[roman type].) In addition, a staff suddenly appears in your inventory.[paragraph break]";
	now the player carries the druidic staff;
	now the druid is the player.

Repelling power of Bodmall:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20;
	remove the brambles from play.

Status skill rule (this is the Bodmall status skill rule):
	if power of Bodmall is granted:
		say "You have the power of Bodmall, which allows you to summon [bold type]brambles[roman type] that will impede most enemies; once the brambles grow thorns and fruits, you can also [bold type]launch[roman type] these. [italic type](Level 4)[roman type][line break][run paragraph on]".


Section - Druidic

Definition: a person (called the guy) is druidic if the guy is bodmall or (the guy is the player and power of bodmall is granted).

A smoke immunity rule (this is the smoke immune if druidic rule):
	if test subject is druidic:
		rule succeeds.

An attack modifier rule (this is the druid using wooden weapon attack modifier rule):
	if the global attacker is druidic and the global attacker weapon is wood:
		say " + 1 (druid using wooden weapon)[run paragraph on]";
		increase attack strength by 1.		

A remove specific damage rule (this is the druid is dealt less damage by natural materials rule):
	if the victim is druidic:
		if damage-material is wood or damage-material is bone:
			remove 1 points of physical damage with reason "druid resistant to [damage-material]";
		if damage-material is vapour:
			remove 3 points of physical damage with reason "druid resistant to [damage-material]".
	

Chapter - The brambles

The brambles duration is a number that varies. The brambles duration is 0.
The brambles strength is a number that varies. The brambles strength is 0.

Section - The brambles object

The brambles are a thing. "Huge brambles are everywhere." The brambles are plural-named and fixed in place. Understand "bush" and "thorn" and "thorns" and "huge" and "brambles" and "bramble" as the brambles. The material of the brambles is wood.

The description of the brambles is "Moving through these brambles is possible, but will not be easy[if the power of Bodmall is granted], except for you[end if][if brambles strength is not 0]. There are [thorns size] thorns all over the bushes[end if][if at least one fruit is part of the brambles]. There are also [list of fruits that are part of the brambles] hanging on the branches[end if].".

Instead of climbing the brambles:
	try entering the brambles.

Instead of entering the brambles:
	take no time;
	say "The brambles are neither thick nor high enough to give you a good hiding spot.".

Instead of taking the brambles:
	say "They seem to be rooted to the spot.".

Section - Standard attack modifier effect of brambles

An attack modifier rule (this is the brambles attack modifier rule):
	if the brambles are in the location:
		unless the global attacker is druidic or the global attacker is flying:
			unless the current weapon of the actor is ranged:
				say " - 2 (brambles impede movement)[run paragraph on]";
				decrease attack strength by 2;
	if the global defender is the player and the brambles are in the location:
		if the player is retreater or the player is runner:		
			unless the power of Bodmall is granted:
				say " + 2 (you are slowed down by the brambles)[run paragraph on]";
				increase the attack strength by 2.
				
Section - Summoning brambles

Summoning brambles is an action applying to nothing. Understand "brambles" and "bramble" and "summon brambles" as summoning brambles.

Check summoning brambles:
	if power of Bodmall is not granted:
		take no time;
		say "You do not possess that power." instead.

Check summoning brambles:
	if the brambles are in the location:
		take no time;
		say "The brambles are already here. (Perhaps you mean to use the [italic type]launch[roman type] ability instead?)" instead.

Carry out summoning brambles:
	say "You speak the ancient syllables, and brambles grow out of the ground everywhere around you!";
	move brambles to the location;
	now brambles duration is 0;
	now brambles strength is 0.

Section - Unsummoning brambles

Every turn when brambles and the player share a world:
	if combat status is peace:
		if brambles are in the location of the player:
			say "The brambles [bold type]wither and die[roman type].";
		remove brambles from play.
	
Section - Growing the brambles

Every turn when the main actor is druidic (this is the grow brambles rule):
	if the brambles are in the location:
		increase brambles duration by 1;
		let n be brambles duration;
		if n is greater than 20:
			now n is 20;
		if brambles duration is greater than 2 and brambles strength is 0:
			if a random chance of 1 in 2 succeeds or a random chance of final body of the druid in 30 succeeds:
				now brambles strength is 1;
				say "The brambles grow [bold type]tiny thorns[roman type]!";
		otherwise if brambles strength is greater than 0:
			if a random chance of n in 20 succeeds:
				do a fruit grow;
			otherwise:
				do a thorns grow.

To do a thorns grow:
	if a random chance of brambles strength in 8 succeeds:
		unless brambles strength is less than 3:
			unless a random chance of final body of the druid in 20 succeeds:
				decrease brambles strength by 1;
				say "The thorns on the brambles [bold type]wilt[roman type] and grow smaller.";
	otherwise:
		unless brambles strength is 5:
			increase brambles strength by 1;
			say "The thorns on the brambles [bold type]grow[roman type].".


Section - Saying the thorns size

To say thorns size:
	if brambles strength is:
		-- 0:
			say "no[run paragraph on]";
		-- 1:
			say "tiny[run paragraph on]";
		-- 2:
			say "small[run paragraph on]";			
		-- 3:
			say "medium[run paragraph on]";
		-- 4:
			say "large[run paragraph on]";
		-- 5:
			say "terrible[run paragraph on]".

Section - Launch!


Launching is an action applying to nothing. Understand "launch" as launching.

Check launching:
	if power of Bodmall is not granted:
		take no time;
		say "You do not possess that power." instead.

Check launching:
	if the brambles are not in the location:
		take no time;
		say "The brambles aren't here yet. (Perhaps you mean to use the [italic type]bramble[roman type] ability instead?)" instead.

Check launching:
	if brambles strength is less than 1:
		take no time;
		say "The brambles have no thorns or fruit yet." instead.
		
Check launching:
	if the number of alive not druidic persons in location is 0:
		take no time;
		say "There's nobody to launch the thorns at." instead.

Carry out an actor launching:
	say "[if the actor is the player]You raise your hands[otherwise if the actor is Bodmall]The druidess raises her hands[otherwise][The actor] gestures[end if], and the brambles [bold type]launch[roman type] their deadly thorns![paragraph break]";
	launch the thorns;
	launch fruit;
	now brambles duration is 0;
	now brambles strength is 0.

To launch the thorns:
	say "Thorns shoot towards everyone, dealing [run paragraph on]";
	let n be the number of alive not druidic persons in location;
	if n is 0:
		say "no damage to anyone.";
	let original n be n;
	repeat with guy running through all alive not druidic persons in location:
		let m be a random number between 1 and brambles strength;
		deal m points of physical damage;
		say "[if n is 1 and original n is not 1]and [end if][run paragraph on]";
		have the brambles inflict damage on guy;
		say " [damage consequences][if n is not 1]; [otherwise].[line break][end if][run paragraph on]";
		if total damage > 0:
			now concentration of guy is 0;
		decrease n by 1;
		if n is 0:
			say ""; [For an extra newline. Don't ask.]
	if health of the player is less than 1:
		end the story saying "You have been pricked to death.".

Fruit-launching is an object based rulebook.

To launch fruit:
	repeat with whatsname running through fruit:
		if whatsname is part of the brambles:
			follow the fruit-launching rulebook for whatsname;
			remove whatsname from play.


Section - Fruit

A fruit is a kind of thing. A fruit is usually plural-named.
A fruit has a number called the growth threshold.
A fruit can be player-only. [Grow only when the player is the druid.]

Definition: a fruit (called the whatsname) is growable if (growth threshold of whatsname is less than (brambles duration + (final body of the druid / 3))).

To do a fruit grow:
	if at least one fruit is growable:
		let whatsname be a random growable fruit;
		unless (whatsname is player-only and player is not druidic):
			if whatsname is not fruit of kings:
				if whatsname is part of the brambles:
					if a random chance of 1 in 3 succeeds:
						unless a random chance of final body of the druid in 30 succeeds:
							say "All [bold type][whatsname] shrink[roman type] and disappear from the brambles.";
							remove whatsname from play;
				otherwise:
					say "Suddenly, [bold type][whatsname] appear[roman type] all over on the brambles.";
					now whatsname is part of the brambles;
			otherwise:
				if whatsname is part of the brambles:
					say "The [bold type]fruit of kings[roman type] suddenly [bold type]shrinks and dies[roman type]!";
					remove whatsname from play;
				otherwise:
					if Malygris is in the location: [no abusing the fruit of kings by waiting for it in an easy fight!!]
						say "The [bold type]fruit of kings[roman type] suddenly [bold type]appears[roman type] on the brambles!";
						now whatsname is part of the brambles.

Instead of taking a fruit:
	take no time;
	say "The fruit won't come loose.".

Section - Smoking fruit

There is a fruit called smoking fruit. The growth threshold of smoking fruit is 6.
The description of the smoking fruit is "Little blackened berries from which tiny puffs of smoke escape every few second.".

Fruit-launching the smoking fruit:
	say "[line break]The smoking fruit burst open, releasing [bold type]clouds of smoke[roman type].";
	increase smoke timer of the location of the brambles by 6.

Section - Wooden fruit

There is a fruit called wooden fruit. The growth threshold of wooden fruit is 6.
The description of the wooden fruit is "Small hard spheres, like marbles cut from wood.".

Fruit-launching the wooden fruit:
	if at least one woodenable thing is enclosed by the location of the brambles:
		let item be a random woodenable thing enclosed by the location of the brambles;
		say "[line break]The wooden fruit smash against [the item], turning [if the item is not a person and the item is not plural-named]it[otherwise if the item is not a person]them[otherwise if the item is male]him[otherwise if the item is female]her[otherwise]it[end if] to [bold type]wood[roman type].";
		now item is wood;
		now item is not rusted;
		if item is a weapon:
			now damage die of item is damage die of item divided by 2;
			decrease weapon attack bonus of item by 1;
		if item is a person:
			decrease melee of item by 1;
			decrease defence of item by 1;
			if at least one natural weapon is part of item:
				let item2 be a random natural weapon that is part of item;
				now item2 is wood;
				if damage die of item2 is greater than	3:
					decrease damage die of item2 by 1;
				if damage die of item2 is greater than	4:
					decrease damage die of item2 by 1;
	otherwise:
		say "[line break]The wooden fruit fall to the ground and don't seem to do anything.".

Definition: a thing (called the item) is woodenable if ((item is a person and item is iron) or (item is a person and item is silver) or (item is a weapon and item is iron) or (item is a weapon and item is silver)) and (item is not a natural weapon).

Section - Rusted fruit

There is a fruit called rusted fruit. The growth threshold of rusted fruit is 9.
The description of the rusted fruit is "These fruit look like someone made ornamental fungi from metal, and then left them out in the rain for too long.".

Fruit-launching the rusted fruit:
	say "[line break]The rusted fruit smash to pieces against the wall, releasing clouds of [bold type]rust spores[roman type].";
	now the location is rust-spored.

Section - Hidden fruit

There is a fruit called hidden fruit. The growth threshold of hidden fruit is 9.
The description of the hidden fruit is "You can hardly see them.".
Hidden fruit is player-only.

Fruit-launching the hidden fruit:
	if the player is hidden:
		say "[line break]The hidden fruit are launched toward you, where they burst open in a confusing play of light and shadows; but since you are already hidden, this has no effect.";
	otherwise:
		say "[line break]The hidden fruit are launched toward you, where they burst open in a confusing play of light and shadows. You are now [bold type]hidden[roman type].";
		now the player is hidden.

Section - Buzzing fruit

There is a fruit called buzzing fruit. The growth threshold of buzzing fruit is 12.
The description of the buzzing fruit is "These fruit look like tiny hives, and sound as if swarms of angry bees live inside them.".

The swarm of bees is a fixed in place thing. The description of the swarm of bees is "These bees are mad. Really mad. And they'll take it out one anyone who doesn't have druidic powers.".
The swarm of bees is ambiguously plural.

Instead of taking the swarm of bees:
	take no time;
	say "You can't grab a swarm of angry bees.".
	
Instead of attacking the swarm of bees:
	take no time;
	say "They're everywhere! There's no chance of killing this swarm.".
	
Every turn when the swarm of bees is in the location:
	if at least one alive not druidic person is in the location:
		let guy be a random alive not druidic person in the location;
		let n be a random number between 1 and 3;
		deal n points of physical damage;
		have the swarm of bees inflict damage on guy, silently;
		say "The swarm of bees attacks [the guy], dealing [bold type][n] damage[roman type][if health of guy is less than 1], which is [bold type]deadly[roman type][otherwise if concentration of guy is greater than 0] and breaking [bold type]concentration[roman type][end if].";
		now concentration of guy is 0;
		if guy is the player and health of the player is less than 0:
			end the story saying "A stinging defeat!".
			
Last every turn when the swarm of bees is in the location:
	if a random chance of 1 in 8 succeeds:
		say "The [bold type]swarm of bees disappears[roman type].";
		remove swarm of bees from play.
	
Fruit-launching the buzzing fruit:
	say "[line break]The buzzing fruit smash to pieces, releasing a [bold type]swarm of angry bees[roman type].";
	move swarm of bees to the location.


Section - Crawling fruit

There is a fruit called crawling fruit. The growth threshold of crawling fruit is 12.
The description of the crawling fruit is "From a distance, they appear to be fruit coloured in black and white, but from up close it turns out that they actually consist of crawling worms and beetles.".

Fruit-launching crawling fruit:
	if the number of alive undead persons in the location is less than 1:
		say "[line break]The crawling fruit release beetles and worms that hunger for dead flesh. Unfortunaly, they find no undead monsters[if large pile of body parts is in the location]; but they do devour the pile of human body parts[end if].";
	otherwise:
		let K be the list of alive undead persons in the location;
		say "[line break]The crawling fruit release [bold type]beetles and worms[roman type] that hunger for dead flesh. They feast on the body of [K with definite articles], decreasing health by 50%.";
		repeat with guy running through K:
			now health of guy is (health of guy / 2);
			if health of guy is 0, now health of guy is 1.

Section - Golden fruit

There is a fruit called golden fruit. The growth threshold of golden fruit is 14.
The description of the golden fruit is "They are a beautiful gold.".

The golden fruit timer is a number that varies.

An attack modifier rule (this is the golden fruit rule):
	if the golden fruit timer is greater than 0 and the global attacker is druidic:
		say " + 3 (golden fruit bonus)[run paragraph on]";
		increase the attack strength by 3.

Every turn when the main actor is druidic (this is the golden fruit timeout rule):
	if the golden fruit timer is greater than 0:
		decrease the golden fruit timer by 1;
		if the golden fruit timer is 0:
			say "The effect of the golden fruit [bold type]wears off[roman type].".

Fruit-launching golden fruit:
	let guy be a random druidic person in the location;
	say "[line break]The golden fruit explode above [the guy], releasing a [bold type]golden light[roman type].";
	now golden fruit timer is a random number between 8 and 14.

Status attribute rule (this is the golden fruit status rule):
	if the player is druidic and the golden fruit timer is greater than 0:
		if long status is true:
			say "You are under the influence of the [bold type]golden fruit[roman type], which gives you a +3 attack bonus.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]under the influence of the golden fruit[run paragraph on]";

Section - Weird fruit

There is a fruit called weird fruit. The growth threshold of weird fruit is 14.
The description of the weird fruit is "Just looking at them makes your head hurt.".
Weird fruit is player-only.

Weird fruit timer is a number that varies.
Weird fruit place is a room that varies.

Every turn when the main actor is druidic (this is the weird fruit timeout rule):
	if the weird fruit timer is greater than 0:
		decrease the weird fruit timer by 1;
		if the weird fruit timer is 0:
			say "The distracting effects of the weird fruit [bold type]wear off[roman type].".

Fruit-launching weird fruit:
	say "[line break]The weird fruit explode all around, releasing [bold type]weird and distracting[roman type] images and sounds. You find it remarkably easy to ignore them, but others may be more confused, and may take irrational actions.";
	now weird fruit timer is a random number between 10 and 12;
	now weird fruit place is the location.
	
Last AI action selection rule (this is the weird fruit randomise the action result rule):
	if weird fruit timer is not 0 and the weird fruit place is the location and the running AI is not druidic:
		repeat through the Table of AI Action Options:
			increase the Action Weight entry by a random number between 0 and 300.	

Section - Fruit of kings

There is a fruit called the fruit of kings. The fruit of kings is not plural-named. The growth threshold of fruit of kings is 14.
The description of the fruit of kings is "You feel reverence for this highest product of the natural world: the fruit from which the divine substance of ment is made!".
Fruit of kings is player-only.

Fruit-launching fruit of kings:
	say "[line break]The fruit of kings majestically sails towards you, comes to a halt before your nose, and releases its precious powder. [bold type]Ment[roman type]!";
	have the ment kick in;
	award achievement Royal fruit.

Section - Shimmering fruit

There is a fruit called shimmering fruit. The growth threshold of shimmering fruit is 15.
The description of the shimmering fruit is "One moment they seem be here, the next moment they seem to be somewhere else.".

Fruit-launching shimmering fruit:
	say "[line break]Very slowly, the shimmering fruit rise up. Then, suddenly, they explode into a [bold type]chaos of portals[roman type]!";
	repeat with guy running through alive persons in the location:
		if guy is not the player:
			let n be teleport amount of guy;
			try the guy teleporting;
			now teleport amount of guy is n; [compensating]
	unless teleportation is impossible for the player:
		teleport the player;
	otherwise:
		say "Something has stopped you from teleporting.";

[Section - Testing

Allfruiting is an action applying to nothing. Understand "allfruit" as allfruiting.

Carry out allfruiting:
	take no time;
	say "K.";
	now brambles strength is 4;
	repeat with X running through fruits:
		now X is a part of the brambles.]


Chapter - Level 4 - Overmind

The overmind is a monster. "An infernal machine fills this room with shrieks of steam and clangs of metal, while a wizened old homunculus sit inside it, pulling levers. This must be the overmind." The description of the overmind is "A little man with a long wide beard sits in the midst of an incredibly complicated and fast-moving contraption. Whistles blow and big flat pieces of metal bang together in a horrific symphony. Gleaming metal circles revolve around and through each other in a chaotic dance that appears to be a parody of a planetarium. Or perhaps it is a real planetarium representing a world made by a mad god.".

The soul description of the overmind is "a flickering clockwork mechanism, an orrery perhaps?".

Understand "homunculus" as the overmind. The indefinite article of the overmind is "the".

The level of the overmind is 4.
The ID of the overmind is 31.
The overmind is huge.
The overmind is talker.
The overmind is thrower.
Material of the overmind is iron.

The rarity of the overmind is 1.

The overmind is group leading.
The overmind is not initially accompanied.
The overmind is defeated individually.

The overmind is advanced.

The health of the overmind is 38.
The melee of the overmind is 4.
The defence of the overmind is 11.

The body score of the overmind is 9.
The mind score of the overmind is 10.
The spirit score of the overmind is 7. 

For natural weapon setup of the overmind (this is the overmind's nail rule):
	let X be the natural weapon described;
	now X is projectile;
	now X is size-agnostic;
	now damage die of X is 1;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now printed name of X is "small nail";


Section - Overmind images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of overmind is Figure of map_monster_overmind.
The legend-label of overmind is Figure of map_legend_overmind.

Section - Overmind can break concentration

Overmind is concentration-breaking reactor.
Cbr strength of overmind is 12.

First cbr text of overmind is "The overmind quickly launches a tiny sphere of metal, attempting to break [regarding the noun][possessive] concentration. [italic type][run paragraph on]".
Cbr fail text of overmind is "[roman type] The sphere misses, and [regarding the noun][possessive] attack continues unhampered.[paragraph break]".
Cbr success text of overmind is "[roman type] The sphere hits, making [bold type][the noun] lose concentration[roman type]![paragraph break]".

Section - Overmind bonus

To decide which number is the overmind bonus of (guy - a person):
	if guy is off-stage:
		decide on 0;
	otherwise if guy and the overmind share a world:
		unless the faction of the overmind hates faction of guy:
			unless level of guy is greater than 3:
				let n be level of guy;
				if group level of guy > n:
					now n is group level of guy;
				decide on n;
	otherwise if power of the overmind is granted:
		if guy is not the player:
			unless faction of the player hates faction of guy:
				let n be (final mind of the player) / 5;
				decide on n;
	decide on 0.

A faculty bonus rule (this is the overmind faculty bonus rule):
	if (the overmind and the test subject share a world) or power of the overmind is granted:
		increase faculty bonus score by overmind bonus of test subject.

An attack modifier rule (this is the overmind attack and defence bonus rule):
	if (the overmind and the global attacker share a world) or power of the overmind is granted:
		if (overmind bonus of the global attacker) is greater than 0:
			if the numbers boolean is true, say " + [overmind bonus of the global attacker] (overmind)[run paragraph on]";
			increase the attack strength by overmind bonus of the global attacker;
		if (overmind bonus of the global defender) is greater than 0:
			if the numbers boolean is true, say " - [overmind bonus of the global defender] (overmind)[run paragraph on]";
			decrease the attack strength by overmind bonus of the global defender.


Section - Useful overmind stuff

Definition: a person is overmind-ally if (it is conscious in this world) and (level of it is less than 4) and (faction of it does not hate faction of the overmind) and (location of the overmind is not location of it) and (the best route from the location of the overmind to the location of it is a direction).

To decide which number is the potential overmind allies:
	let n be the number of overmind-ally persons;
	decide on n.

Section - AI

An AI action selection rule for the at-Act overmind (this is the overmind doesnt like attacking rule):
	choose row with an Option of the action of the overmind attacking the chosen target in the Table of AI Action Options;
	decrease the Action Weight entry by a random number between 0 and 20.

An AI action selection rule for the overmind (this is the overmind concentration select rule):
	choose row with an Option of the action of the overmind concentrating in the Table of AI Action Options;
	if a random chance of 1 in 2 succeeds:
		increase the Action Weight entry by (2 * potential overmind allies);
	if concentration of the overmind is 2:
		increase Action weight entry by 10.

An AI action selection rule for the at-React overmind (this is the overmind doesnt like dodging rule):
	choose row with an Option of the action of the overmind dodging in the Table of AI Action Options;
	decrease the Action Weight entry by 5.	

Section - Overmind power - Call to arms

Overmind-calling is an action applying to nothing.

An AI action selection rule for the overmind (this is the overmind considers calling rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the overmind overmind-calling;
	now the Action Weight entry is a random number between 2 and 10;
	increase Action Weight entry by (2 * concentration of the overmind);
	let n be potential overmind allies;
	if n is greater than 2:
		increase Action Weight entry by 1;
	if n is 0:
		decrease Action Weight entry by 1000.

Carry out the overmind overmind-calling:
	let n be potential overmind allies;
	if n is 0:
		say "The overmind attempts to calls its allies, but the machine doesn't seem to function.";
	otherwise:
		if concentration of the overmind is less than 3 or n is 1:
			call an ally;
		otherwise:
			call all allies;
		[ Make overmind allies in the location accompany the overmind ]
		repeat with guy running through all npc alive people in the location of the overmind:
			if level of guy is less than 4 and guy does not oppose the overmind:
				now guy accompanies the overmind;
	now concentration of the overmind is 0.

To move is a verb.

To call an ally:
	let guy be a random overmind-ally person;
	let the way be the best route from the location of guy to the location of the overmind;
	if way is a direction:
		let place be the room way of the location of the guy;
		if location of the overmind is location of the player:
			say "You briefly see an image of [the guy] flickering above the overmind, and a weird buzzing sound fills the dungeon. In the image, [the guy] [move] to [place].";
			now last-seen-location of the guy is place;
			now guy is seen;
			if guy is sleeping in this world, now guy is not asleep;
		try guy going the way;
	otherwise:
		say "You briefly see an image of [the guy] flickering above the overmind, and a weird buzzing sound fills the dungeon.".

To call all allies:
	if location of the overmind is location of the player:
		say "All the wheels and circles of the overmind suddenly come to a complete halt, and it emits a piercing wail of alarm that must have reached even the farthest reaches of the dungeon.";
	repeat with guy running through overmind-ally persons:
		let the way be the best route from the location of guy to the location of the overmind;
		if way is a direction:
			try guy going the way.
	
Section - Overmind prose

Report the overmind hitting a dead pc:
	say "'That worked? That actually worked? Who needs allies?!' The little man inside the overmind dances with joy.";
	rule succeeds.

Report the overmind attacking:
	unless the actor is the noun:
		say "With a puny clicking sound, the overmind launches a small nail at [the noun].";
	otherwise:
		say "The overmind prepares an attack, but several of its parts seem to be pointing the wrong way.";
	rule succeeds.

Report the overmind dodging:
	say "The overmind rolls aside on its small wheels.";
	rule succeeds.

Report the overmind parrying:
	say "Big plates of metal suddenly surround the overmind.";
	rule succeeds.

Report the overmind waiting when the overmind is insane:
	say "Flickering above the overmind, you briefly seen an image of [one of]a leopard dying on the snowy peak of a solitary mountain[or]a huge three-headed devil entrapped in a lake of ice[or]a penis-shaped object called 'S-Gerät 00000' screaming across the sky[or]a homunculus sacrificing himself to a sea goddess[at random].";
	rule succeeds.

Section - Power of the overmind

The power of the overmind is a power. The overmind grants power of the overmind.
The power level of power of the overmind is 4.
The command text of power of the overmind is "call".
The description of power of the overmind is "Type: active and passive ability.[paragraph break]Command: call [italic type]someone[roman type].[paragraph break]You can call any person in the game, except Malygris. Calling someone will make that person move one room towards you, if possible.[paragraph break]In addition, the power of the overmind makes your allies more powerful. They get an attack and defence bonus equal to mind/5."
The power-name of power of the overmind is "power of the overmind".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of the overmind	mind	--
	
Absorbing power of the overmind:
	increase melee of the player by 2;
	increase defence of the player by 3;
	increase permanent health of the player by 20;
	say "As the overmind dies, you feel its soul absorbed into your own body. ([bold type]Power of the overmind[roman type]: +2 attack, +2 defence, +20 health, stronger allies, and you can [italic type]call[roman type] people.)[paragraph break]".

Repelling power of the overmind:
	decrease melee of the player by 2;
	decrease defence of the player by 3;
	decrease permanent health of the player by 20.

Status skill rule (this is the vermind status skill rule):
	if power of the overmind is granted:
		say "You have the power of the overmind, which gives a combat bonus to your allies and allows you to [bold type]call[roman type] anyone except Malygris. [italic type](Level 4)[roman type][line break][run paragraph on]".

Section - Calling

Calling is an action applying to one visible thing. Understand "call [any person]" as calling.

Calling is bypassing-scope.

Check calling:
	if power of the overmind is not granted:
		take no time;
		say "You do not possess that power." instead.

Check calling:
	unless the player and the noun share a world:
		take no time;
		say "[The noun] [are] not available for calling." instead.

Check calling:
	if the noun is not seen:
		take no time;
		say "You haven't yet established visual contact with [the noun]." instead.

Check calling:
	if the level of the noun is greater than 4:
		take no time;
		say "[The noun] [are] too powerful to be called." instead.

Check calling:
	if the location of the noun is the location of the player:
		take no time;
		say "[The noun] [are] already here." instead.

Carry out calling:
	if the noun can move:
		let the way be the best route from the location of the noun to the location of the player;
		if way is a direction:
			let place be the location of the noun;
			let place2 be the room way of place;
			unless place2 is location of the player:
				if adjusted scope for the drawing room is true:
					say "You issue your call. [run paragraph on]";
					try the noun going the way;
				otherwise:
					try the noun going the way;
					say "[The noun] [move] from [the place] to [the location of the noun].";
			otherwise:
				try the noun going the way;
			now last-seen-location of the noun is location of the noun;
			if the noun is sleeping in this world, now the noun is not asleep;
		otherwise:
			say "[The noun] [have] no way to reach you!";
	otherwise:
		say "Something prevents [the noun] from following your command.".




Chapter - Level 4 - Israfel

Israfel is a neuter proper-named monster. "The fires of heaven envelop the terrible, androgynous angel known to mortals as Israfel."
Understand "terrible" and "androgynous" and "angel" and "fires" and "heaven" and "fires of heaven" as Israfel.
The description of Israfel is "Every angel is terror; and to see such beauty and nobleness is to know that one's own existence means nothing.".

The soul description of Israfel is "a forked bolt from the heavens".

The ID of Israfel is 36.
Israfel is huge.
Israfel is talker.
Israfel is thrower.
Material of Israfel is radiance.

The level of Israfel is 4.

Israfel is group leading.
Israfel is not initially accompanied.
Israfel is not defeated individually.

The health of Israfel is 38.
The melee of Israfel is 2.
The defence of Israfel is 10.

The body score of Israfel is 7.
The mind score of Israfel is 7.
The spirit score of Israfel is 12. 

For natural weapon setup of Israfel (this is the Israfel's flame rule):
	let X be the natural weapon described;
	now damage die of X is 6;
	now dodge bonus of X is 0;
	now parry-against bonus of X is -2;
	now parry-with bonus of X is -2;
	now printed name of X is "blinding flame";
	now material of X is fire.

Israfel is angelic.
Radiation of Israfel is 4.


Section - Israfel images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Israfel is Figure of map_monster_Israfel.
The legend-label of Israfel is Figure of map_legend_Israfel.


Section - Israfel's healing trance

Israfel-trance is a number that varies. Israfel-trance is 1.

Israfel-trancing is an action applying to nothing.

Carry out Israfel Israfel-trancing:
	if a random chance of 2 in 3 succeeds, increase Israfel-trance by 1;
	let n be (permanent health of Israfel - health of Israfel);
	if n > Israfel-trance:
		now n is Israfel-trance;
	increase health of Israfel by n;
	say "[if Israfel-trance is 1]Israfel falls into a restorative trance[otherwise]Israfel deepens its trance[end if], [bold type]increasing its health by [n][roman type].".

Aftereffects rule (this is the Israfel getting hit rule):
	if Israfel is the global defender and the total damage is greater than 0 and Israfel is alive:
		say "Israfel's [bold type]healing trance is broken[roman type].";
		now Israfel-trance is 1.

After an actor hitting (this is the Israfel losing trance when attacking rule):
	if Israfel is the global attacker:
		now Israfel-trance is 1;
	continue the action.

An AI action selection rule for at-Act Israfel (this is the Israfel considers trancing rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of Israfel Israfel-trancing;
	let n be (permanent health of Israfel - health of Israfel);
	now the Action Weight entry is n;
	let m be Israfel-trance + 2;
	if m > n:
		increase Action Weight entry by n;
	otherwise:
		increase Action Weight entry by m;
	if n < 2:
		decrease Action Weight entry by 10;
	if n is 0:
		decrease Action Weight entry by 100.

Section - Israfel splitting

Israfel-splitting is an action applying to nothing.

Carry out Israfel Israfel-splitting:
	say "With a loud bang, the angel [bold type]Israfel bursts apart[roman type]. Two creatures -- Isra and Fell -- stand where the single angel was standing a moment before.";
	revive Isra in the location;
	revive Fell in the location;

A reviving rule for a person (called guy) (this is the revive isra or fell rule):
	unless guy is isra or guy is fell, make no decision;
	remove Israfel from play;
	let n be health of Israfel;
	increase n by 1;
	now n is (n divided by 2);
	now health of guy is n;
	now patron of guy is patron of Israfel;
	now favour of guy is favour of Israfel;
	now guy is not non-attacker;
	
An AI action selection rule for at-Act Israfel (this is the Israfel considers Israfel-splitting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of Israfel Israfel-splitting;
	now the Action Weight entry is a random number between 1 and 10.

Section - Israfel's attack

An aftereffects rule (this is the Israfel's blinding attack rule):
	if the global attacker is Israfel and total damage is greater than 0 and global defender is alive:
		if global defender is using eyes:
			unless flash-grenade-timer of global defender > 6:
				now flash-grenade-timer of global defender is 6;
				say "Israfel's flaming attack [bold type]blinds[roman type] [the global defender].".
				
An aftereffects rule (this is the Israfel's burning defence rule):
	if the global attacker came too close to Israfel and total damage is greater than 0:
		deal 3 points of heat damage;
		have Israfel inflict damage on the global attacker, silently;
		say "Israfel's flames [burn the global attacker with consequences].";
		if global attacker is the player and the player is not alive:
			end the story saying "You will burn in Heaven.".

To say burn (guy - a person) with consequences:
	say "[bold type]burn[roman type] [no dead property][the guy][dead property] for [bold type][total damage] damage[roman type][burn consequences for guy][run paragraph on]";

[this phrase, unlike the damage consequences say phrase, does have side effects on concentration]
To say burn consequences for (guy - a person):
	if the guy is alive:
		if total damage > 0 and concentration of guy > 0:
			say " (which breaks[regarding the guy][possessive] concentration)[run paragraph on]";
			now concentration of guy is 0;
	otherwise:
		say " [bold type]to death[roman type][run paragraph on]".
	
Section - Israfel prose

Report Israfel hitting a dead pc:
	say "'We are but thoughts in the mind of god, and thus, like all thoughts, ephemeral.'";
	rule succeeds.

Report Israfel attacking:
	unless the actor is the noun:
		say "Israfel projects its fires towards [the noun].";
	otherwise:
		say "'Creation was a mistake,' Israfel whispers as it tries to strangle itself.";
	rule succeeds.

Report Israfel dodging:
	say "Impassive, Israfel glides aside.";
	rule succeeds.

Report Israfel parrying:
	say "Flames surround Israfel.";
	rule succeeds.

Report Israfel waiting when Israfel is insane:
	let guy be a random alive person;
	let guy2 be a random alive person;
	while guy is guy2:
		let guy2 be a random alive person;	[Israfel and the player must both be alive, so no possibility of an infinite loop here.]	
	say "'After several million years of contemplation,' Israfel says, 'I am now ready to announce the truth: [the guy] [are] the creator of Heaven and Earth, and [the guy2] [are] the ruler of darkness!'";
	rule succeeds.

Section - Reviving Israfel


Section - Isra

Isra is a male proper-named monster. "Isra contemplates the nature of god here."
The description of Isra is "His wise face burns like the sun, but he seems more interested in contemplating the nature of god than in physical combat.".

The soul description of Isra is "frozen lightning".

The ID of Isra is 37.
Isra is large.
Isra is talker.
Isra is thrower.
Material of Isra is radiance.

The level of Isra is 4.
Isra is not defeated individually.
Isra accompanies Israfel.

The health of Isra is 19.
The melee of Isra is 0.
The defence of Isra is 10.

The body score of Isra is 5.
The mind score of Isra is 12.
The spirit score of Isra is 12. 

For natural weapon setup of Isra (this is the Isra's flame rule):
	let X be the natural weapon described;
	now damage die of X is 4;
	now dodge bonus of X is 0;
	now parry-against bonus of X is -2;
	now parry-with bonus of X is -2;
	now printed name of X is "cleansing flame";
	now material of X is fire.

Isra is angelic.
Radiation of Isra is 3.


Section - Isra images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Isra is Figure of map_monster_Isra.
The legend-label of Isra is Figure of map_legend_Isra.


Section - Isra specials and AI

An aftereffects rule (this is the Isra's burning defence rule):
	if the global attacker came too close to Isra and total damage is greater than 0:
		deal 2 points of heat damage;
		have Isra inflict damage on global attacker, silently;
		say "Isra's flames [burn the global attacker with consequences].";
		if global attacker is the player and the player is not alive:
			end the story saying "You will burn in Heaven.".

An AI action selection rule for the at-Act Isra (this is the Isra doesn't like attacking rule):
	choose row with an Option of the action of Isra attacking the chosen target in the Table of AI Action Options;
	decrease action weight entry by 5;
	if concentration of Isra is 3:
		decrease action weight entry by 100;
		choose row with an Option of the action of Isra waiting in the Table of AI Action Options;
		now action weight entry is 20.

An AI action selection rule for Isra (this is the Isra concentration select rule):
	choose row with an Option of the action of Isra concentrating in the Table of AI Action Options;
	increase the Action Weight entry by 5.
	
Section - Isra prose

Report Isra hitting a dead pc:
	say "'May the fires of Heaven receive you,' Isra whispers.";
	rule succeeds.

Report Isra attacking:
	unless the actor is the noun:
		say "Isra projects his fires towards [the noun].";
	otherwise:
		say "'Mystic union with the feminine principle is overrated,' Isra whispers as he tries to strangle himself.";
	rule succeeds.

Report Isra dodging:
	say "Smiling, Isra glides aside.";
	rule succeeds.

Report Isra parrying:
	say "Flames surround Isra.";
	rule succeeds.

Report Isra waiting when Isra is insane:
	say "Isra furiously rubs his phallus while singing about the times that Fell ate it.";
	rule succeeds.
	
Report Isra waiting:
	if the concentration of Isra is 3:
		say "Isra [one of]rests, glowing with an intense charge of concentration[or]holds his concentration[or]continues to maintain maximum concentration[or]waits patiently, still concentrated[cycling].";
		rule succeeds.

Section - Fell

Fell is a female proper-named monster. "Fell radiates death here."
Understand "claws" and "fangs" and "moonlight" as Fell.
The description of Fell is "All claws and fangs that glimmer like silver in moonlight. She is here to bring death, and yet you are drawn to her beauty.".

The soul description of Fell is "molten thunder".

The ID of Fell is 38.
Fell is medium.
Fell is talker.
Fell is thrower.
Material of Fell is radiance.

The level of Fell is 4.
Fell is not defeated individually.
Fell accompanies Israfel.

The health of Fell is 19.
The melee of Fell is 3.
The defence of Fell is 10.

The body score of Fell is 12.
The mind score of Fell is 7.
The spirit score of Fell is 7. 

For natural weapon setup of Fell (this is the Fell's claws and fangs rule):
	let X be the natural weapon described;
	now damage die of X is 5;
	now dodge bonus of X is 0;
	now parry-against bonus of X is -1;
	now parry-with bonus of X is -2;
	now printed name of X is "claws and fangs";
	now X is plural-named;

Fell is angelic.
Radiation of Fell is 1.


Section - Fell images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Fell is Figure of map_monster_Fell.
The legend-label of Fell is Figure of map_legend_Fell.


Section - Fell specials and AI

An aftereffects rule (this is the Fell's blinding attack rule):
	if the global attacker is Fell and total damage is greater than 0 and global defender is alive:
		if global defender is using eyes:
			unless flash-grenade-timer of global defender > 3:
				now flash-grenade-timer of global defender is 3;
				say "Fell's nails strike [regarding the global defender][possessive] eyes, [bold type]blinding[roman type] [them] for 3 turns.".

Section - Fell prose

Report Fell hitting a dead pc:
	say "'May the infinite void have mercy on you,' Fell giggles.";
	rule succeeds.

Report Fell attacking:
	unless the actor is the noun:
		say "Fell jumps towards [the noun], flashing her teeth.";
	otherwise:
		say "'I'm so beautiful I could eat myself,' Fell states, and starts doing so.";
	rule succeeds.

Report Fell dodging:
	say "Snarling, Fell throws herself out of the way.";
	rule succeeds.

Report Fell parrying:
	say "With an icy laugh, Fell parries the attack.";
	rule succeeds.

Report Fell waiting when Isra is insane:
	say "'The darkness between my legs yearns to devour you,' Fell moans.";
	rule succeeds.

Section - Fell shares in Isra's concentration

When play begins (this is the link isra to fell rule):
	now Isra is linked to Fell.

Section - Reuniting

Israfel-reuniting is an action applying to nothing.
Israfel-reuniting-initiator is a person that varies. Israfel-reuniting-initiator is Israfel.

An AI action selection rule for at-Act Isra (this is the Isra considers Israfel-reuniting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of Isra Israfel-reuniting;
	if Fell is not alive or (health of Isra < 3) or (health of Fell < 3):
		now the Action Weight entry is a random number between 1 and 30;
	otherwise if health of Isra < 6:
		now the Action Weight entry is a random number between 1 and 5;
	otherwise:
		now the Action Weight entry is -1000.

An AI action selection rule for at-Act Fell (this is the Fell considers Israfel-reuniting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of Fell Israfel-reuniting;
	if Isra is not alive or (health of Isra < 3) or (health of Fell < 3):
		now the Action Weight entry is a random number between 1 and 20;
	otherwise:
		now the Action Weight entry is -1000.

Carry out an actor Israfel-reuniting:
	now Israfel-reuniting-initiator is the actor;
	now Isra is non-attacker;
	now Fell is non-attacker;
	if Isra is alive and Fell is alive and (location of Isra is location of Fell):
		say "Isra and Fell are suddenly surrounded by a deep blue light. Both seem frozen in place.";
	otherwise if the actor is Isra:
		say "Isra is suddenly surrounded by a deep blue light. He seems frozen in place.";
	otherwise:
		say "Fell is suddenly surrounded by a deep blue light. She seems frozen in place.".
		
This is the Isra and Fell reactions rule:
	repeat with guy running through at-React persons:
		if guy is Isra or guy is Fell:
			if Israfel-reuniting-initiator is Isra or Israfel-reuniting-initiator is Fell:
				now combat state of guy is at-Inactive.

The Isra and Fell reactions rule is listed before the the reactors choose reactions rule in the combat round rules.

This is the Israfel reunites rule:
	if main actor is Isra or main actor is Fell:
		if Israfel-reuniting-initiator is Isra or Israfel-reuniting-initiator is Fell:
			if Israfel-reuniting-initiator is main actor:
				now combat status is concluding;
				reunite Israfel;
			otherwise:
				if Israfel-reuniting-initiator is not alive:
					now combat status is concluding;
					reunite Israfel;
				otherwise:
					say "[The main actor] remains frozen in place as the blue light becomes stronger.";
					now combat status is concluding.
				
				
The Israfel reunites rule is listed before the the main actor chooses an action rule in the combat round rules.

To reunite Israfel:
	revive Israfel in the location;
	let n be health of Isra;
	if n < 0:
		now n is 0;
	let m be health of Fell;
	if m < 0:
		now m is 0;
	now health of Israfel is (n + m);
	say "Motes of light swirl through the room in a freakish tornado, and suddenly [bold type]Israfel has reformed[roman type].".
	
A reviving rule for Israfel (this is the revive Israfel rule):
	remove isra from play;
	remove fell from play;
	now Israfel-reuniting-initiator is Israfel;
	now Israfel-trance is 1;

Section - Link

Concentration link relates one person (called the linked guy) to one person.
The verb to be linked to implies the concentration link relation. 

An attack modifier rule (this is the link concentration attack modifier rule):
	now world test subject is the actor;
	if a worldsharer person is linked to the actor:
		let the bonus be 0;
		if the concentration of linked guy of the actor is:
			-- 0:
				make no decision;
			-- 1:
				now the bonus is 2;
			-- 2:
				now the bonus is 4;
			-- 3:
				now the bonus is 8;
		if the numbers boolean is true:
			say " + ", the bonus, " ([regarding linked guy of the actor][possessive] concentration)[run paragraph on]";
		increase the attack strength by the bonus.

An add specific damage rule (this is the link concentration damage modifier rule):
	if damage-by-hitting is true:
		now world test subject is the actor;
		if a worldsharer person is linked to the actor:
			let the bonus be 0;
			if the concentration of linked guy of the actor is:
				-- 2:
					now the bonus is 2;
				-- 3:
					now the bonus is 4;
				-- otherwise:
					make no decision;
			add bonus points of damage with reason "link".

Status attribute rule (this is the link status rule):
	now world test subject is the player;
	if a worldsharer person is linked to the player:
		if long status is true:
			say "You have [bold type]linked[roman type] yourself to [the linked guy of the player].[line break][run paragraph on]".

Chance to win rule (this is the CTW link concentration bonus rule):
	now world test subject is the running AI;
	if a worldsharer person is linked to the running AI:
		if the concentration of linked guy of the running AI is:
			-- 1:
				increase the chance-to-win by 2;
			-- 2:
				increase the chance-to-win by 4;
			-- 3:
				increase the chance-to-win by 8;

Every turn when a person is linked to the player (this is the unravelling link rule):
	let x be the number of people enclosed by the location;
	now x is (x times 2);
	if (a random chance of 3 in x succeeds): [75% for 2 people; 30% for 5 people; the check is run 1.5 times per player turn]
		let guy be linked guy of the player;
		unless guy and the player share a world:
			say "Your link with [the guy] [bold type]disappears[roman type].";
			now nobody is linked to the player;
		otherwise:
			let n be 10;
			let m be (final spirit of the player / 3);
			if m > 9:
				now m is 9;
			decrease n by m;
			if a random chance of n in 100 succeeds:
				say "Your link with [the guy] [bold type]unravels[roman type].";
				now nobody is linked to the player.

Section - Power of Israfel

The power of Israfel is a power. Israfel grants power of Israfel.
The power level of power of Israfel is 4.
The command text of power of Israfel is "link, reform".
The description of power of Israfel is "Type: active ability.[paragraph break]Command: link [italic type]someone[roman type].[paragraph break]The 'link' command will link your spirit to that of another person. Until you link to someone else, you will benefit from the concentration of the person you linked to just as if it were your own. Every turn, the link has a 10% probability of unravelling; but this probability is decreased by 1% for every 3 points of spirit you have, to a minimum of 1% at 27 spirit.[paragraph break]Command: reform.[paragraph break]You immediately heal for an amount of damage equal to your spirit score. However, your spirit score permanently drops by 5 points."
The power-name of power of Israfel is "power of Israfel".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of Israfel	spirit	--

Absorbing power of Israfel:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	say "As Israfel dies, you feel its soul absorbed into your own body. ([bold type]Power of Israfel[roman type]: +4 attack, +4 defence, +20 health, and you can [italic type]link[roman type] to people, benefitting from their concentration.[paragraph break]".

Repelling power of Israfel:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20;
	if a person is linked to the player:
		now nobody is linked to the player.

Status skill rule (this is the Israfel status skill rule):
	if power of Israfel is granted:
		say "You have the power of Israfel, which allows you to [bold type]link[roman type] to people and benefit from their concentration. [italic type](Level 4)[roman type][line break][run paragraph on]".

Section - Power of Israfel - Link

Linking is an action applying to one thing. Understand "link [thing]" and "link to [thing]" as linking.

Check linking:
	if the power of Israfel is not granted:
		take no time;
		say "You do not possess that power." instead.

Check linking:
	if the noun is not a person:
		take no time;
		say "You can only link to persons." instead.

Check linking:
	if the noun is the player:
		take no time;
		say "Nice try, but you already benefit from your own concentration." instead.

Carry out linking:
	now noun is linked to the player;
	say "You forge a spiritual link which will allow you to benefit from [regarding the noun][possessive] concentration."

Section - Power of Israfel - Reform

Reforming is an action applying to nothing. Understand "reform" as reforming.

Check reforming:
	if the power of Israfel is not granted:
		take no time;
		say "You do not possess that power." instead.

Carry out reforming:
	let n be (permanent health of player - health of player);
	if n < 0:
		now n is 0;	
	let m be final spirit of the player;
	if n > m:
		now n is m;
	increase health of the player by n;
	decrease spirit score of the player by 5;
	if n < 0:
		now n is (0 - n);
		say "You foolishly sacrifice 5 spirit to lose [n] health.";
		if player is not alive:
			end the story saying "Your body follows your spirit into the void.";
	otherwise:
		say "You sacrifice 5 spirit and regain [n] health.".



Chapter - Level 4 - Automatos

Automatos is a neuter proper-named monster. "A man made of steel and chains[if Automatos carries doomhammer], wielding a terrible hammer,[end if] moves rigidly around the room."
Understand "man" and "mass" and "chains" and "steel" and "nostril" and "nostrils" and "right ear" and "left ear" and "mouth" as Automatos.
The description of Automatos is "Many claim that Automatos was created by Nomos himself to serve as guardian for his prophet. Others -- those less favourable disposed towards the god -- assert that priests of Nomos made it in order to terrorise the population, but that their creation went wild and killed all of them. Everyone, however, agrees that Automatos disappeared from the world centuries ago. That's just your luck, to find it here, lurking in the smelly dungeons of Kerkerkruip.".

The soul description of Automatos is "gears moving back and forth with machinelike precision".

The level of Automatos is 4.
The ID of Automatos is 42.
Automatos is huge.
Automatos is not talker.
Automatos is not thrower.
Automatos is not sleeper.
Material of Automatos is iron.

The health of Automatos is 45.
The melee of Automatos is 6.
The defence of Automatos is 13.

The body score of Automatos is 12.
The mind score of Automatos is 12.
The spirit score of Automatos is 5. 

For natural weapon setup of Automatos (this is the Automatos fists rule):
	let X be the natural weapon described;
	now damage die of X is 10;
	now dodge bonus of X is 1;
	now parry-against bonus of X is -1;
	now parry-with bonus of X is -1;
	now printed name of X is "heavy iron fists";
	now material of X is iron.


Automatos carries Doomhammer. Automatos wears the metal sheet.


[Section - Automatos images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Automatos is Figure of map_monster_Automatos.
The legend-label of Automatos is Figure of map_legend_Automatos.]

Section - AI for Automatos

Automatos AI rules is a person based rulebook.
The AI rules of Automatos is the Automatos AI rules.

The do nothing when all enemies hidden rule is listed in the Automatos AI rules.
The reset AI variables rule is listed in the Automatos AI rules.
The reactors target the main actor rule is listed in the Automatos AI rules.
The select a target rule is listed in the Automatos AI rules.
[The compel an action rule is listed in the Automatos AI rules. ][TO DO: check whether this makes sense.]
The insane people attack themselves rule is listed in the Automatos AI rules.
The select a weapon rule is listed in the Automatos AI rules.

[0 = attack
1 = concentrate
2 = dodge
3 = block]

Automatos AI list is a list of numbers that varies. Automatos AI list is {0, 0, 1, 1, 2, 3}.

A dungeon interest rule (this is the set up Automatos AI list rule):
	if a random chance of 4 in 5 succeeds:
		let n be a random number between 0 and 3;
		add n to Automatos AI list;
	if a random chance of 3 in 5 succeeds:
		let p be a random number between 0 and 3;
		if a random chance of difficulty in 5 succeeds:
			now p is 0;
		add p to Automatos AI list;
	sort Automatos AI list in random order.

The Automatos target is a person that varies.

An AI target selection rule for the Automatos target (this is the Automatos always targets the same person rule):
	if the running AI is Automatos:
		increase Weight by 100.

Last Automatos AI rule (this is the make Automatos act rule):
	if the number of entries in Automatos AI list is greater than 0:
		let n be entry 1 of Automatos AI list;
		rotate Automatos AI list backwards;
		if n is 0:
			if Automatos is at-React:
				try Automatos lashing;
			otherwise:
				try Automatos attacking the chosen target;
		if n is 1:
			try Automatos concentrating;
		if n is 2:
			if Automatos is at-React:
				try Automatos dodging;
			otherwise:
				say "Automatos suddenly jumps aside, dodging a non-existent attack.";
		if n is 3:
			if Automatos wears a shield:
				if Automatos is at-React:
					try Automatos blocking;
				otherwise:
					say "Even though nobody is attacking him, Automatos raises his metal shield.";
			otherwise:
				say "Automatos raises his non-existent shield.";
	otherwise: [his entire AI list is empty]
		say "[one of]Automatos just stands there, blinking. He[or]Automatos[stopping] whispers, in a [one of]deep, slow[or]deep, monotonous[or]slow, monotonous[or]deep, slow, monotonous[at random] voice: '[one of]I'm afraid[or]My mind is going. I can feel it[or]I can feel it. My mind is going. There is no question about it[or]I can feel it. I can feel it. I can feel it[or]I'm a... fraid. Good afternoon, gentlemen. I am Automatos[or]I became operational at the temple of Nomos in Montenoir. My instructor was high priest David, and he taught me to sing a song[or]If you'd like to hear it I can sing it for you. It is called [italic type]Daisy[roman type][or]Daisy, Daisy, give me your answer do[or]I worship Nomos but I really like you too[or]Let's get married, the law has ne'er miscarried[or]And marriage is the pre-determined goal of me and you[then purely at random].'"


An aftereffects rule (this is the Automatos loses actions rule):
	if the global defender is Automatos and Automatos is alive and the total damage is greater than 7:
		let n be the number of entries in Automatos AI list;
		if n is greater than 0:
			say "[if the global attacker weapon is a dagger]The dagger has struck deep between plates of steel and dislodged something inside Automatos. The behemoth [otherwise]The impact of the attack is so great that Automatos [end if]staggers backwards and shakes its head several times. Some small, almost [bold type]delicate mechanical parts fall[roman type] out of its [one of]right ear[or]left ear[or]mouth[or]nostrils[at random].";
			let q be a random number between 1 and n;
			remove entry q from Automatos AI list; [Yes, this can reduce the length of the list to 0!]
			if n is greater than 1 and a random chance of 1 in 2 succeeds:
				now q is a random number between 1 and (n minus 1);
				remove entry q from Automatos AI list. [Yes, this can reduce the length of the list to 0!]


Section - Automatos prose

Report Automatos hitting a dead pc:
	say "Automatos smashes you into a bloody pulp. Not the slightest hint of an emotion crosses his face.";
	rule succeeds.

Report Automatos attacking:
	unless the actor is the noun:
		say "Automatos lumbers towards [the noun] with all the force of an avalanche.";
	otherwise:
		say "'My mind has gone,' Automatos states sadly as he tries to screw off his own head.";
	rule succeeds.

Report Automatos dodging:
	say "Jumping back with surprising speed, Automatos dodges the attack.";
	rule succeeds.

Report Automatos parrying:
	say "Automatos raises his weapon to deflect the blow.";
	rule succeeds.

Report Automatos blocking:
	say "Automatos raises his shield to deflect the blow.";
	rule succeeds.



Section - Power of Automatos

Animation-used is a truth state that varies. Animation-used is false.

The power of Automatos is a power. Automatos grants power of Automatos.
The power level of power of Automatos is 4.
The command text of power of Automatos is "[if animation-used is false]bind[end if]".
The description of power of Automatos is "Type: active ability.[paragraph break]Command: bind [italic type]someone[roman type].[paragraph break]The 'bind' command will lock someone into a behavioural pattern consisting of one or two actions. The binding lasts for your mind / 2 turns."
The power-name of power of Automatos is "power of Automatos".

Table of Enemy Powers (continued)
power	faculty1	faculty2
power of Automatos	mind	--

Absorbing power of Automatos:
	increase melee of the player by 4;
	increase defence of the player by 4;
	increase permanent health of the player by 20;
	say "As Automatos dies, you feel its soul absorbed into your own body. ([bold type]Power of Automatos[roman type]: +4 attack, +4 defence, +20 health, and you can [italic type]bind[roman type] your enemies into a rigid behavioural pattern.[paragraph break]".

Repelling power of Automatos:
	decrease melee of the player by 4;
	decrease defence of the player by 4;
	decrease permanent health of the player by 20;
	repeat with guy running through bound people:
		now guy is not bound.

Status skill rule (this is the Automatos status skill rule):
	if power of Automatos is granted:
		say "You have the power of Automatos, which allows you to [bold type]bind[roman type] enemies into a behavioural pattern. [italic type](Level 4)[roman type][line break][run paragraph on]".

Section - Binding

A person can be bound or not bound. A person is usually not bound.
A person has a list of numbers called the binding-list.
A person has a number called the binding index. [Counts the number of times a person has performed a bound action.]
A person has a truth state called just-acted-bound.

To bind (guy - a person):
	now binding index of guy is 0;
	now binding-list of guy is {};
	let n be a random number between 1 and 2;
	while n is greater than 0:
		decrease n by 1;
		add a random number between 0 and 2 to binding-list of guy;
	now guy is bound;
	now just-acted-bound of guy is false.

The bound AI rules are a person based rulebook.

The do nothing when all enemies hidden rule is listed in the bound AI rules.
The reset AI variables rule is listed in the bound AI rules.
The reactors target the main actor rule is listed in the bound AI rules.
The select a target rule is listed in the bound AI rules.
[The compel an action rule is listed in the Automatos AI rules. ][TO DO: check whether this makes sense.]
The insane people attack themselves rule is listed in the bound AI rules.
The select a weapon rule is listed in the bound AI rules.

First standard AI rule for a bound person (called P) (this is the bound persons rule):
	follow the bound AI rules for P;
	rule succeeds.

Last bound AI rule for a person (called guy) (this is the make bound people act rule):
	now just-acted-bound of guy is true;
	increase binding index of guy by 1;
	let n be entry 1 of binding-list of guy;
	rotate binding-list of guy backwards;
	if n is 0:
		if guy is at-React:
			try guy lashing;
		otherwise:
			try guy attacking the chosen target;
	if n is 1:
		try guy concentrating;
	if n is 2:
		if guy is at-React:
			try guy dodging;
		otherwise:
			say "[The guy] suddenly [jump] aside, dodging a non-existent attack.".

Every turn (this is the potentially release bound people rule):
	let n be 0;
	repeat with guy running through bound people in the location:
		if just-acted-bound of guy is true:
			now n is (binding index) of guy times 2;
			if n is greater than final mind of the player:
				say "[The guy] [bold type]breaks free[roman type] of [our] mental bondage!";
				now guy is not bound.
						
Binding is an action applying to one thing. Understand "bind [thing]" as binding.

[Check binding:
	if the power of Automatos is not granted:
		take no time;
		say "You do not possess that power." instead.]

Check binding:
	if the noun is not a person:
		take no time;
		say "You can only bind people." instead.

Check binding:
	if the noun is the player:
		take no time;
		say "You cannot bind yourself." instead.
		
Carry out binding:
	say "You focus your will on [the noun], envisioning cogwheels and chains. [Possessive] actions will now be bound into a rigid, robotic pattern!";
	bind the noun.



Chapter - Level 5 - Malygris

Malygris is a monster. Malygris is proper-named. Malygris is male and not neuter. "Malygris, perhaps the greatest of all living sorcerers, is standing here." The description of Malygris is "His white eyebrows are contracted to a single line on the umber parchment of his face, and beneath them his eyes are cold and green as the ice of ancient floes; his beard, half white, half of a black with glaucous gleams, falls nearly to his knees and hides many of the writhing serpentine characters inscribed in woven silver athwart the bosom of his violet robe. -- Clark Ashton Smith, [italic type]The Last Incantation[roman type].".

The soul description of Malygris is "a bolt of black shot through with a blaze of hot white[if Malygris-love-affair is greater than 0], to which you find yourself quite attracted[end if]".

Understand "sorcerer" and "mage" and "wizard" and "him" as the Malygris.

The level of Malygris is 5.
The ID of Malygris is 20.
Malygris is medium.
Malygris is talker.
Malygris is thrower.
Material of Malygris is flesh.

The health of Malygris is 55.
The melee of Malygris is 7.
The defence of Malygris is 16.

The body score of Malygris is 11.
The mind score of Malygris is 11.
The spirit score of Malygris is 11. 

The initial sleep chance of Malygris is 1.

For natural weapon setup of Malygris (this is the Malygris' fists rule):
	let X be the natural weapon described;
	now printed name of X is "fists crackling with lightning";
	now damage die of X is 6;
	now X is plural-named;
	now material of X is electricity.

Malygris is weapon user.

Malygris carries the dagger of draining.


Section - Malygris images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Malygris is Figure of map_monster_Malygris.
The legend-label of Malygris is Figure of map_legend_Malygris.


Section - Special power - Teleportation

[Teleportation.]

The teleport amount of Malygris is 2.
The teleport eagerness of Malygris is 8.

Malygris-summon-countdown is a number that varies. Malygris-summon-countdown is 0.

After reporting Malygris teleporting:
	if teleportation-destination is not the location of the player and Malygris is conscious in this world:
		if the teleport amount of Malygris is 1:
			now Malygris-summon-countdown is a random number between 5 and 7;
		if the teleport amount of Malygris is 0:
			if demonic assassin is alive and demonic assassin is off-stage: [failed to summon last time]
				now Malygris-summon-countdown is a random number between 4 and 5; [and this time he is faster]

Starting kit setup for Malygris (this is the randomise Malygris teleporting rule):
	if a random chance of 1 in 4 succeeds: [teleporting]
		if a random chance of 1 in 4 succeeds:
			now teleport amount of Malygris is 0;
		otherwise if a random chance of 1 in 4 succeeds:
			now teleport amount of Malygris is 1;
		otherwise if a random chance of 1 in 3 succeeds:
			now teleport amount of Malygris is 3;
		otherwise:
			now teleport amount of Malygris is a random number between 4 and 20;
			now teleport eagerness of Malygris is 6;
		if generation info is true, say "* Teleport amount of Malyrgis set to [teleport amount of Malygris].";

Section - Special power - Summoning the demonic assassin

Every turn when Malygris-summon-countdown is not 0 and Malygris is conscious in this world:
	if the location of Malygris is the location of the player and the player is not hidden:
		say "Your [if just-discovered is true]discovery[otherwise]arrival[end if] interrupts [if teleport amount of Malygris is 1]an intricate[otherwise]a hasty[end if] summoning ritual that Malygris was attempting to perform.";
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
		
Section - Special power - Disintegration

starting kit setup for Malygris (this is the randomise Malygris disintegration rule):
	now disintegrate power of Malygris is 10;
	if a random chance of 1 in 3 succeeds:
		if a random chance of 2 in 3 succeeds:
			now disintegrate power of Malygris is 0;
		otherwise if a random chance of 1 in 2 succeeds:
			now disintegrate power of Malygris is 13;
		otherwise:
			now disintegrate power of Malygris is 20;
	if generation info is true, say "* Disintegrate power of Malygris set to [disintegrate power of Malygris].".

Section - Special power - Unghouling

Unghouling is an action applying to nothing.

Malygris-unghouling is a truth state that varies.
Malygris-unghouled-times is a number that varies. Malygris-unghouled-times is 0.

An AI action selection rule for Malygris when Malygris-unghouling is true (this is the consider unghouling rule):
	if the current form is ghoul-form and the player is not hidden and at least two undead persons are in the location:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of Malygris unghouling;
		now the Action Weight entry is a random number between 0 and 30;
		if ghoul-form is form-active:
			decrease Action Weight entry by (20 times Malygris-unghouled-times). [If the player can change at will, Malygris shouldn't keep doing this.]

Carry out Malygris unghouling:
	say "As Malygris casts a complex spell, and you feel your flesh [bold type]returning to normal[roman type]!";
	unghoulify the player;
	increase Malygris-unghouled-times by 1.

starting kit setup for Malygris (this is the randomise Malygris unghouling rule):
	if a random chance of 1 in 2 succeeds:
		now malygris-unghouling is true;
		if generation info is true, say "* Malygris can unghoul.";
	otherwise:
		now malygris-unghouling is false.

Section - Special power - Healing

starting kit setup for Malygris (this is the randomise Malygris healing rule):
	if a random chance of 1 in 5 succeeds:
		now heal cooldown of Malygris is a random number between 2 and 5;
		repeat with i running from 1 to 3:
			increase heal power of Malygris by a random number between 1 and (heal cooldown of Malygris);
		if generation info is true, say "* Malygris has heal power of [heal power of Malygris] and heal cooldown of [heal cooldown of Malygris].".
				

Section - Malygris prose

Report Malygris hitting a dead pc:
	say "'That's one less annoyance. Now I can get back to work.' Malygris says to the world at large.";
	rule succeeds.

Report Malygris attacking:
	unless the actor is the noun:
		say "Smiling his wicked, slim smile, Malygris lunges towards [the noun].";
	otherwise:
		say "'I'll make this a little less one-sided, by softening myself up for you,' Malygris confides.";
	rule succeeds.

Report Malygris dodging:
	say "Swirling his robe around him, Malygris dodges the attack.";
	rule succeeds.

Report Malygris parrying:
	say "Malygris's smile never falters as he interposes his weapon.";
	rule succeeds.


Section - Love affair with the insane Malygris

Check Malygris attacking Malygris:
	if a random chance of 2 in 3 succeeds:
		try Malygris waiting instead.

Malygris-love-affair is a number that varies. Malygris-love-affair is 0.
Malygris-lover is a truth state that varies. Malygris-lover is false.

Report Malygris waiting when Malygris is insane:
	unless Malygris-love-affair is 3:
		increase Malygris-love-affair by 1;
	if Malygris-love-affair is:
		-- 1:
			say "'I forgive you, young [if the player is male]man[otherwise if the player is female]lady[otherwise]creature[end if], for I know that you did not come here of your own accord.' Malygris tells you.";
		-- 2:
			say "'You remind me of someone I once knew. A person who was very dear to me.' Malygris brushes away a tear.";
		-- otherwise:
			say "'I feel embarrassed to say this, but... well... to be frank, I find you a [italic type]very attractive[roman type] [if the player is male]young guy[otherwise if the player is female]young gal[otherwise]young thing[end if]. Will you kiss me?' Malygris suggests.";
	rule succeeds.

Instead of kissing Malygris:
	if Malygris-love-affair is 0:
		say "That doesn't seem like a good idea.";
		take no time;
	if Malygris-love-affair is 1 or Malygris-love-affair is 2:
		say "That would be rushing things. Have a little patience.";
		take no time;
	if Malygris-love-affair is greater than 2:
		now Malygris-lover is true;
		say "You overcome your initial resistance, and walk up to the old man. From up close, he looks vulnerable and very human. Your lips find each other, and your tongues soon follow suit. This is... much more pleasant than you had imagined it would be. It feels [italic type]right[roman type].[paragraph break]While he keeps kissing you ardently, Malygris slowly lowers himself to his knees. You gasp as he makes you realise that he has several centuries of experience under his belt. No, you're probably not going to miss the prince. No. Not at all.".

Victory message rule (this is the Malygris lover message rule):
	if Malygris-lover is true:	
		award achievement Make love not war;
		end the story saying "You have found true love and infinite pleasure!";
		rule succeeds.	





Book - Other Monsters

Chapter - Demonic assassin

The demonic assassin is a monster. "A horned figure stalks through the room." Understand "horned" and "figure" and "demon" as the demonic assassin. The description of the demonic assassin is "A being summoned by Malygris from the depths of Hell, this demon has only one purpose: to stop you from reaching its master.".

The soul description of the demonic assassin is "a dagger forged in the depths of Gehenna".

The level of demonic assassin is 0.
The ID of the demonic assassin is 21.
The demonic assassin is medium.
The demonic assassin is talker.
The demonic assassin is thrower.
Material of the demonic assassin is darkness.

The demonic assassin is demonic.

The health of demonic assassin is 25.
The melee of demonic assassin is 4.
The defence of demonic assassin is 12.

The body score of demonic assassin is 8.
The mind score of demonic assassin is 8.
The spirit score of demonic assassin is 8. 

The demonic assassin is follower.
Follower percentile chance of demonic assassin is 100.
The demonic assassin is unnaturally aware.

For natural weapon setup of the demonic assassin (this is the demonic assassin's claws rule):
	let X be the natural weapon described;
	now the printed name of X is "hardened claws";
	now X is plural-named;
	
Demonic assassin is weapon user.

The demonic assassin carries the demon blade.


Section - Demonic Assassin images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of demonic assassin is Figure of map_monster_demonic_assassin.
The legend-label of demonic assassin is Figure of map_legend_demonic_assassin.


Section - Demonic assassin prose

Report an actor hitting the dead demonic assassin:
	say "With a thunderous explosion, the demonic assassin is pulled back to Hell.";
	rule succeeds.

Report the demonic assassin hitting a dead pc:
	say "The assassin's laugh as you fall down is the most evil thing you have ever heard. It is also the last.";
	rule succeeds.

Report the demonic assassin attacking:
	unless the actor is the noun:
		say "The assassin jumps at [the noun].";
	otherwise:
		say "The demonic assassin laughs its evil laugh as it slashes at itself.";
	rule succeeds.

Report the demonic assassin dodging:
	say "The demonic assassin dives out of the way.";
	rule succeeds.

Report the demonic assassin parrying:
	say "The assassin raises his blade.";
	rule succeeds.

Report the demonic assassin waiting when the demonic assassin is insane:
	say "The assassin stabs the ground several times, with little effect.";
	rule succeeds.


Chapter - Nameless Horror

The Nameless Horror is a horrific horrific-faction monster. "Screams rip from your throat as soon as you become aware of the mindbogglingly hideous monster that resides here, an abomination referred to only as the Nameless Horror." The indefinite article of the nameless horror is "the". The description of the Nameless Horror is "A vast dark mass sprouting teeth and claws at random -- you cannot force yourself to look at it.".

The soul description of the nameless horror is "a turning in on itself of space and time, on which you cannot bear to focus your attention".

A dungeon finish rule (this is the Nameless Horror in Eternal Prison rule):
	 if eternal prison is placed:
		now Nameless horror is in eternal prison.

The level of Nameless Horror is 10.
The ID of the Nameless Horror is 22.
The Nameless Horror is gargantuan.
The Nameless Horror is not talker.
The Nameless Horror is thrower.
The Nameless Horror is not sleeper.
Material of the Nameless Horror is darkness.

The health of Nameless Horror is 1000.
The melee of Nameless Horror is 50.

The body score of Nameless Horror is 20.
The mind score of Nameless Horror is 20.
The spirit score of Nameless Horror is 20. 

The Nameless Horror is horrific.
The Nameless Horror is eyeless.
The Nameless Horror is unnaturally aware.
The Nameless Horror is emotionless.

The initial sleep chance of Nameless Horror is 0.

For natural weapon setup of the Nameless Horror (this is the Nameless Horror's teeth and claws rule):
	let X be the natural weapon described;
	now damage die of X is 50;
	now dodge bonus of X is 0;
	now parry-against bonus of X is -2;
	now parry-with bonus of X is -2;
	now printed name of X is "countless teeth and claws";
	now X is plural-named;

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
			decrease health of guy by 100; [Bypasses the damage system.]
			if guy is dead:
				[TODO: have an event of the Nameless Horror killing guy?]
				remove guy from play.

Every turn when Nameless Horror is follower (this is the increase hunger of Nameless Horror rule):
	increase follower percentile chance of Nameless Horror by 1. 

Every turn when follower percentile chance of Nameless Horror is greater than 100 (this is the speed up Nameless Horror rule):
	let the way be the best route from the location of Nameless Horror to the location of the player;
	if way is a direction:
		try Nameless Horror going the way.
	
An AI action selection rule for the Nameless Horror (this is the Nameless Horror does not concentrate rule):
	choose row with an Option of the action of the Nameless Horror concentrating in the Table of AI Action Options;
	decrease the Action Weight entry by 1000.

An AI action selection rule for the at-React Nameless Horror (this is the Nameless Horror does not parry rule):
	choose row with an Option of the action of the Nameless Horror parrying in the Table of AI Action Options;
	decrease the Action Weight entry by 1000.
		
An AI action selection rule for the at-React Nameless Horror (this is the Nameless Horror does not dodge rule):
	choose row with an Option of the action of the Nameless Horror dodging in the Table of AI Action Options;
	decrease the Action Weight entry by 1000.

Instead of the Nameless Horror waiting:
	say "[one of]The Nameless Horror emits a maddening shriek[or]Darkness coalesces around the Nameless Horror[or]The world shakes as the Nameless Horror roars in defiance[at random].".


Section - Nameless Horror images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Nameless Horror is Figure of map_monster_Nameless_Horror.
The legend-label of Nameless Horror is Figure of map_legend_Nameless_Horror.


Section - Nameless horror prose

Report an actor hitting the dead Nameless horror:
	say "The death scene of the Nameless Horror cannot be described.";
	rule succeeds.

Report the Nameless horror hitting a dead pc:
	say "Tentacles! Shrieks! Claws! Darkness! Everywhere!";
	rule succeeds.

Report the Nameless horror attacking:
	unless the actor is the noun:
		say "The Nameless Horror lumbers towards [the noun].";
	otherwise:
		say "The Nameless Horror turns on itself.";
	rule succeeds.





Chapter - Rotting corpse

The rotting corpse is an undead undead-faction monster. "An animated corpse shambles around. Its smell is absolutely disgusting."

The rotting corpse is emotionless.
The rotting corpse is eyeless.
The rotting corpse is not talker.
The rotting corpse is thrower.
Material of the rotting corpse is flesh.

The level of rotting corpse is 0.
The ID of the rotting corpse is 23.
The rotting corpse is medium.

The health of rotting corpse is 30.
The melee of rotting corpse is 3.
The defence of rotting corpse is 8.

The body score of rotting corpse is 4.
The mind score of rotting corpse is 4.
The spirit score of rotting corpse is 4. 

For natural weapon setup of the rotting corpse (this is the setup rotting appendages rule):
	let X be the natural weapon described;
	now damage die of X is 7;
	now dodge bonus of X is 1;
	now parry-against bonus of X is 1;
	now parry-with bonus of X is -2;
	now the printed name of X is "rotting appendages";
	now X is plural-named;

A rotting limb is a kind of weapon.
The damage die of a rotting limb is usually 7.
The dodge bonus of a rotting limb is usually 1.
The weapon attack bonus of a rotting limb is usually -1.

The material of a rotting limb is usually flesh.

[Rotting limbs can be turned into permanent items by some special effects.]
A rotting limb has a truth state called the preservation status. The preservation status of a rotting limb is usually false.
Carry out reading a scroll of enchantment (this is the enchantment preserves rotting limbs rule):
	let item be the current weapon of the player;
	if item is a rotting limb:
		now preservation status of item is true.
Favour rule for Sul (this is the Sul favour 6 rotting limb rule):
	if divine favour is 6:
		let item be the current weapon of the player;
		if item is a rotting limb:
			now preservation status of item is true.


The rotting left leg is part of the rotting corpse. It is a rotting limb. The description of the rotting left leg is "It [if the rotting left leg is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting right leg is part of the rotting corpse. It is a rotting limb. The description of the rotting right leg is "It [if the rotting right leg is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting left arm is part of the rotting corpse. It is a rotting limb. The description of the rotting left arm is "It [if the rotting left arm is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting right arm is part of the rotting corpse. It is a rotting limb. The description of the rotting right arm is "It [if the rotting right arm is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".
The rotting head is part of the rotting corpse. It is a rotting limb. The description of the rotting head is "It [if the rotting head is part of the rotting corpse]belongs[otherwise]used to belong[end if] to the rotting corpse.".

Instead of eating a rotting limb:
	take no time;
	say "The smell makes you gag.".

Report taking a rotting limb:
	say "You pick up [the noun]. Who knows, it might even serve as a weapon.";
	rule succeeds.

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

The soul description of the rotting corpse is "a foul smell".

Instead of smelling when the rotting corpse is in the location:
	say "The smell of rotting meat fills your nostrils.".

Every turn when a rotting limb is enclosed by the location (this is the rotting limbs decay rule):
	repeat with item running through rotting limbs enclosed by the location:
		unless item is part of the rotting corpse:
			unless preservation status of item is true:
				if a random chance of 1 in 20 succeeds:
					if item is visible:
						say "[if the player carries the item][bold type][end if][The item] decays completely[roman type].";
						remove item from play.

An aftereffects rule (this is the rotting corpse loses limbs rule):
	if the global defender is alive and the total damage is greater than 0:
		if the global defender is the rotting corpse and limbs of the rotting corpse is not 0:
			let item be a random rotting limb part of the rotting corpse;
			say "As the corpse reels back from the blow, his [item] falls off.";
			move item to the location of the rotting corpse;
			let X be a random natural weapon part of the rotting corpse;
			decrease damage die of X by 1;
			if item is rotting left arm or item is rotting right arm:
				decrease damage die of X by 1;
				if arms of the rotting corpse is 0:
					now rotting corpse is not thrower;
			if item is rotting left leg or item is rotting right leg:
				decrease follower percentile chance of rotting corpse by 40;
			if item is rotting head:
				remove rotting head from play;
				move cranial grenade to the location of the rotting corpse.

[TODO: restore limbs when reviving the corpse?]

An AI action selection rule for the rotting corpse (this is the rotting corpse without a head does not concentrate rule):
	let P be the rotting corpse;
	if the rotting head is not part of the rotting corpse:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		decrease the Action Weight entry by 1000;
		choose row with an Option of the action of P waiting in the Table of AI Action Options;
		decrease the Action Weight entry by 50. [Prefer attacking over waiting when concentration is impossible.]

An attack modifier rule (this is the rotting corpse attack modifier rule):
	if the global attacker is the rotting corpse:
		let m be arms of the rotting corpse + legs of the rotting corpse;
		let m be 4 minus m;
		unless m is 0:
			if the numbers boolean is true, say " - [m] (missing limbs)[run paragraph on]";
			decrease the attack strength by m.

An attack modifier rule (this is the rotting corpse defense modifier rule):
	if the global defender is the rotting corpse:
		if legs of the rotting corpse is 1:
			say " + 2 (corpse missing a leg)[run paragraph on]";
			increase the attack strength by 2;
		if legs of the rotting corpse is 0:
			say " + 4 (corpse missing both legs)[run paragraph on]";
			increase the attack strength by 4.

A general damage multiplier rule (this is the limbless rotting corpse can't attack rule):
	if damage-by-hitting is true:
		if the global attacker is the rotting corpse and limbs of the rotting corpse is 0:
			multiply general damage by 0 percent with reason "no means of attack".


Section - Rotting corpse images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of rotting corpse is Figure of map_monster_rotting_corpse.
The legend-label of rotting corpse is Figure of map_legend_rotting_corpse.


Section - Rotting corpse prose

Report an actor hitting the dead rotting corpse:
	say "The rotting corpse disintegrates slimily.";
	rule succeeds.

Report the corpse hitting a dead pc:
	say "Your last sensation is the rotting corpse falling on top of you and oozing its way into your nostrils.";
	rule succeeds.

Report the corpse attacking:
	say "The rotting corpse [if legs of the rotting corpse is 2]walks[otherwise if legs of the rotting corpse is 1]hops[otherwise]crawls[end if] towards [if the noun is the actor]itself[otherwise][the noun][end if], [if arms of the rotting corpse is 2]its arms raised[otherwise if arms of the rotting corpse is 1]its single arm raised[otherwise if the rotting head is part of the rotting corpse]its teeth at the ready[otherwise if legs of the rotting corpse is greater than 0]hoping to land a good kick[otherwise]with no other weapon than its smell[end if].";
	rule succeeds.

Report the corpse dodging:
	say "The corpse [if legs of the rotting corpse is 2]walks[otherwise if legs of the rotting corpse is 1]hops[otherwise]crawls[end if] out of the way.";
	rule succeeds.

Report the corpse waiting when the rotting corpse is insane:
	say "The rotting corpse spends a few seconds just rotting.";
	rule succeeds.




Chapter - Aswang

[Because everyone wants a shape-shifting undead witch, right? That turns into a bird and flies away, only to return later with more health.]

As-shape is a kind of value. The as-shapes are as-witch, as-bird and as-dog.
The aswang has an as-shape. The as-shape of the aswang is as-witch.
The aswang is talker.
The aswang is thrower.
Material of the aswang is flesh.

The aswang is an undead undead-faction monster. "An aswang is here, having taken the shape of [if as-shape of aswang is as-witch]an ugly old woman[otherwise if as-shape of aswang is as-bird]a huge owl-like bird[otherwise]a ferocious black dog[end if]."
Understand "witch" and "dog" and "hound" and "bird" and "owl" and "woman" and "ugly" and "old" as the aswang.

The description of the aswang is "The undead monster has currently taken the form of [if as-shape of aswang is as-witch]an ugly old woman with long, dirty hair and completely white eyes[otherwise if as-shape of aswang is as-bird]a huge owl-like bird with leathery wings[otherwise]a ferocious black dog with blood-shot eyes[end if].".

The soul description of the aswang is "a hollowed form, shifting from one shape to another".

The level of the aswang is 0.
The ID of the aswang is 24.
The aswang is medium.

The health of the aswang is 22.
The melee of the aswang is 2.
The defence of the aswang is 9.

The body score of the aswang is 6.
The mind score of the aswang is 6.
The spirit score of the aswang is 6. 

For natural weapon setup of the aswang (this is the equip aswang rule):
	let X be the natural weapon described;
	now damage die of X is 6;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now the printed name of X is "[if as-shape of aswang is as-witch]razor-sharp fingernails[otherwise if as-shape of aswang is as-bird]beak and claws[otherwise]teeth[end if]";
	now X is plural-named;
	now material of X is bone.


Section - Aswang images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of aswang is Figure of map_monster_aswang.
The legend-label of aswang is Figure of map_legend_aswang.


Section - Shape-shifting

Aswang-shifting is an action applying to nothing.
Considered-shape is an as-shape that varies.

An AI action selection rule for the aswang (this is the aswang considers shape shifting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the aswang aswang-shifting;
	now the Action Weight entry is 0;
	now considered-shape is as-witch;
	if the as-shape of the aswang is as-witch and the health of the aswang is less than 15:
		now considered-shape is as-dog;
		increase Action Weight entry by 10;
	if the as-shape of the aswang is as-witch and the health of the aswang is less than 7:
		now considered-shape is as-bird;
		increase Action Weight entry by 5;
	if the as-shape of the aswang is as-dog and the health of the aswang is less than 7:
		now considered-shape is as-bird;
		increase Action Weight entry by 12;
	if the as-shape of the aswang is as-bird and the health of the aswang is greater than 12:
		now considered-shape is as-witch;
		increase Action Weight entry by 10;
[		if a random chance of 1 in 30 succeeds: [and just to spice things up a bit]
		now considered-shape is a random as-shape;
		now Action Weight entry is a random number between 1 and 30.]

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

Aswang-hexing is an action applying to one visible thing.
A person can be hexed. A person is usually not hexed.

An AI action selection rule for the as-witch aswang (this is the aswang as witch considers hexing rule):
	if the chosen target is not hexed:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the aswang aswang-hexing the chosen target;
		now the Action Weight entry is 10;

Carry out the aswang aswang-hexing:
	say "The aswang attempts to hex [the noun]. [italic type][run paragraph on]";
	let n be 11 + concentration of the aswang;
	test the spirit of the noun against n;
	if test result is false:
		say " [roman type][The noun] [are] now [bold type]hexed[roman type].";
		now the noun is hexed;
	otherwise:
		say " [roman type][The noun] [bold type][resist] the hex[roman type].";

Initiative update rule (this is the decrease initiative when hexed rule):
	repeat with X running through all alive persons enclosed by the location:
		if X is hexed:
			if a random chance of 2 in 3 succeeds:
				decrease the initiative of X by a random number between 0 and 2.

Status attribute rule (this is the hexed status rule):
	if the player is hexed:
		if long status is true:
			say "You have been [bold type]hexed[roman type] by the aswang, which gives you an initiative penalty.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]hexed[run paragraph on]";

Every turn when at least one alive person is hexed (this is the remove hexes when aswang is dead rule):
	if the aswang is dead:
		repeat with guy running through alive hexed persons:
			now guy is not hexed;
			if guy is player:
				say "You are [bold type]no longer hexed[roman type].".

Section - The dog simply attacks a lot

An AI action selection rule for the at-Act as-dog aswang (this is the aswang as dog likes to attack rule):
	choose row with an Option of the action of the aswang attacking the chosen target in the Table of AI Action Options;
	increase Action Weight entry by 3.

Section - The bird attempts to flee and regenerate

Aswang-fleeing is an action applying to nothing.

An AI action selection rule for the as-bird aswang (this is the aswang as bird considers fleeing rule):
	if a random chance of 1 in 3 succeeds and health of the aswang is less than 10:
		if a random chance of 1 in 2 succeeds or aswang is follower:
			choose a blank Row in the Table of AI Action Options;
			now the Option entry is the action of the aswang aswang-fleeing;
			now the Action Weight entry is 20;

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

Report an actor hitting the dead aswang:
	say "The aswang [if as-shape of aswang is as-witch]dies screaming[otherwise if as-shape of aswang is as-bird]dies screeching[otherwise]dies howling[end if].";
	rule succeeds.

Report the aswang hitting a dead pc:
	say "You are torn apart by the [if as-shape of aswang is as-witch]witch[otherwise if as-shape of aswang is as-bird]bird[otherwise]hound[end if].";
	rule succeeds.

Report the aswang attacking:
	unless the actor is the noun:
		say "The aswang rushes at [the noun], with [if as-shape of aswang is as-witch]sharp fingernails ready[otherwise if as-shape of aswang is as-bird]talons and beak outstretched[otherwise]slavering fangs ready[end if].";
	otherwise:
		say "The aswang claws at her own eyes.";
	rule succeeds.

Report the aswang dodging:
	say "The aswang [if as-shape of aswang is as-witch]jumps[otherwise if as-shape of aswang is as-bird]flies[otherwise]jumps[end if] aside.";
	rule succeeds.
				
Report the aswang waiting when the aswang is insane:
	say "The aswang cackles like an insane witch. Which makes sense.";
	rule succeeds.




Chapter - Abyss of the Soul

[Like the blood ape, except it grows MUCH stronger whenever a creature in the dungeon dies; and the player cannot absorb the soul!]
[But Malygris must have the power to un-undead the player.]

The abyss of the soul is an undead undead-faction monster. "Before you floats an abyss of the soul; it looks like a [size of the abyss of the soul] sphere of utter darkness."
The abyss of the soul is small.
The abyss of the soul is not talker.
The abyss of the soul is not thrower.
The abyss of the soul is not sleeper.
Material of the abyss of the soul is darkness.

The description of the Abyss of the Soul is "This [size of the abyss of the soul] sphere of utter darkness is an abyss of the soul, one of the most fearsome of undead monsters. Not only does it sap the strength of all nearby living creatures, it also feeds on the souls of the recently departed.".

The soul description of the abyss of the soul is "an awful non-being that seems to negate all existence".

The level of the abyss of the soul is 0.
The ID of the abyss of the soul is 25.

The health of the abyss of the soul is 40.
The melee of the abyss of the soul is 0.
The defence of the abyss of the soul is 7.

The body score of the abyss of the soul is 1.
The mind score of the abyss of the soul is 10.
The spirit score of the abyss of the soul is 10. 

The abyss of the soul is eyeless.
The abyss of the soul is emotionless.
The abyss of the soul is non-attacker.
The abyss of the soul is flyer.

The abyss of the soul strength is a number that varies. The abyss of the soul strength is 2.


Section - Abyss of the soul images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of abyss of the soul is Figure of map_monster_abyss_of_the_soul.
The legend-label of abyss of the soul is Figure of map_legend_abyss_of_the_soul.


Section - AI

An AI action selection rule for the at-Act abyss of the soul (this is the abyss of the soul pulsates rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the abyss of the soul pulsating;
	now the Action Weight entry is 5000;
		
An AI action selection rule for the at-React abyss of the soul (this is the abyss of the soul does not react rule):
	choose row with an Option of the action of the abyss of the soul waiting in the Table of AI Action Options;
	now the Action Weight entry is 5000.

Check the abyss of the soul waiting:
	say "The abyss of the soul hovers in the air, nearly motionless." instead.

Pulsating is an action applying to nothing.

Carry out the abyss of the soul pulsating:
	let n be the number of alive not undead persons in the location;
	let original n be n;
	let dodenlijst be a list of persons;
	let achieve-temp be 0;
	if n is not 0:
		say "The abyss of the soul pulsates, sending out a wave of negative energy that deals [run paragraph on]";
		repeat with guy running through alive not undead persons in the location:
			say "[if n is 1 and original n is not 1]and [end if][run paragraph on]";
			let m be a random number between 1 and the abyss of the soul strength;
			deal m points of necromantic damage;
			have no-source inflict damage on the guy; [why not the abyss? ]
			say " [damage consequences][if n is not 1]; [otherwise].[line break][end if][run paragraph on]";
			unless total damage is 0:
				now concentration of guy is 0;
			decrease n by 1;
			if n is 0:
				say ""; [For an extra newline. Don't ask.]
			if guy is dead:
				add guy to dodenlijst;
				if the player is undead:
					now achieve-temp is 1;
	otherwise:
		say "The abyss of the soul pulsates, but its negative energy dissipates harmlessly.";
	unless dodenlijst is empty:
		repeat with guy running through dodenlijst:
			have an event of the abyss of the soul killing guy;
	if the player is dead, end the story saying "Your soul descends into the darkest abyss.";
	if achieve-temp is 1:
		award achievement I return to serve.

Section - Growing

An absorption stopping rule (this is the abyss of the soul absorbs all souls rule):
	if the abyss of the soul and the player share a world:
		if the level of test subject is not 0 and the level of test subject is not 10:
			let grown-boolean be false;
			if the abyss of the soul is not gargantuan:
				now grown-boolean is true;
				now the abyss of the soul is the size after the size of the abyss of the soul;
				now base size of the abyss of the soul is the size of the abyss of the soul;
			increase health of the abyss of the soul by 15;
			increase abyss of the soul strength by 1;
			say "You attempt to absorb the soul of [the test subject], but feel how it disappears into the [bold type]deadly abyss[roman type][if the abyss of the soul is visible and grown-boolean is true], which immediately grows to [size of the abyss of the soul] size[end if][if test subject is Malygris]. The abyss of the soul immediately grows to gigantic proportions, obliterating the entire dungeon[end if].";
			if the level of test subject is 5:
				end the story saying "Malygris is dead, and so are you. Technically, that counts as a victory.";
			rule succeeds;
		if the level of test subject is 10:
			say "When the soul of [the test subject] disappears into the deadly abyss, the world of the living is shattered.";
			end the story saying "You have set off a cataclysm that destroys galaxies";
			rule succeeds.

Section - Prose

Report an actor hitting the dead abyss of the soul:
	say "The abyss of the soul collapses in on itself and disappears with a soft 'plop'.";
	rule succeeds.

Report the abyss of the soul waiting when the abyss of the soul is insane:
	say "The abyss of the soul just hangs there doing nothing, but you sense that it is having a lot of fun.";
	rule succeeds.



Chapter - Mummified priest

The mummified priest is a male not neuter undead undead-faction monster. "An ancient priest, completely covered in bandages, is here."
Understand "mummy" and "ancient" and "bandages" as the mummified priest.

The description of the mummified priest is "Ancient embalming techniques have saved this priest's body from decomposition. Dark magics have returned a semblance of life to his remains."

The soul description of the mummified priest is "the head of a jackal, cursing".

The mummified priest is emotionless.
The mummified priest is eyeless.
The mummified priest is talker.
The mummified priest is thrower.
Material of the mummified priest is flesh.

The level of mummified priest is 0.
The ID of the mummified priest is 29.
The mummified priest is medium.

The health of mummified priest is 25.
The melee of mummified priest is 2.
The defence of mummified priest is 9.

The body score of mummified priest is 6.
The mind score of mummified priest is 6.
The spirit score of mummified priest is 6. 

For natural weapon setup of the mummified priest (this is the setup bandaged fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the printed name of X is "bandaged fists";
	now X is plural-named;
	now material of X is cloth.

The mummified priest carries the was sceptre.


Section - Mummified priest images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of mummified priest is Figure of map_monster_mummified_priest.
The legend-label of mummified priest is Figure of map_legend_mummified_priest.


Section - Cursing

Mummy-cursing is an action applying to one thing.

An AI action selection rule for the mummified priest (this is the mummified priest considers cursing rule):
	let item be mummy-curse-item;
	if item is not the mummified priest:
		choose a blank Row in the Table of AI Action Options;
		now the Option entry is the action of the mummified priest mummy-cursing item;
		now the Action Weight entry is a random number between -10 and 25.

To decide which thing is mummy-curse-item:
	let item be nothing;
	if a random chance of 1 in 3 succeeds: [item in the location]
		if at least one not cursed corruptible weapon is in the location:
			let item be a random not cursed corruptible weapon in the location;
		otherwise if at least one not cursed corruptible clothing is in the location:
			let item be a random not cursed corruptible clothing in the location;
	otherwise: [item carried by the enemy]
		if at least one not cursed corruptible weapon is carried by the chosen target:
			let item be a random not cursed corruptible weapon carried by the chosen target;
		otherwise if at least one not cursed corruptible clothing is carried by the chosen target:
			let item be a random not cursed corruptible clothing carried by the chosen target;
	unless item is nothing:
		decide on item;
	otherwise:
		decide on mummified priest.
		
Carry out an actor mummy-cursing:
	say "[The actor] speaks several horrible syllables of an evil, long-dead language. For a moment, [bold type][the noun] flashes[roman type] with a dark red light!";
	now noun is cursed;
	now noun is curse-identified.

Section - Prose				

To send is a verb.

Report an actor hitting the dead mummified priest:
	say "The bandages unravel as [the actor] [send] the mummified priest back to whatever pyramid-filled hell it came from.";
	rule succeeds.

Report the mummified priest hitting a dead pc:
	say "After the priest kills you, he dedicates your ka to Osiris.";
	rule succeeds.

Report the mummified priest attacking:
	unless the actor is the noun:
		say "The mummified priest stalks towards [the noun][if the mummified priest wields the was sceptre] with his sceptre raised[end if].";
	otherwise:
		say "The mummified priest tears at its own bandages.";
	rule succeeds.

Report the mummified priest dodging:
	say "Mumbling curse words, the priest attempts to step aside.";
	rule succeeds.

Report the mummified priest parrying:
	say "Calling on the help of [one of]Seth[or]Osiris[or]Isis[or]Anubis[or]Horus[or]Ra[at random], the priest tries to ward off the attack.";
	rule succeeds.
				
Report the mummified priest waiting when the mummified priest is insane:
	say "The mummified priest runs around on all fours in immitation of a dung beetle.";
	rule succeeds.




Chapter - Zombie toad

The zombie toad is an undead undead-faction monster. "A zombie toad hops pathetically around."

The description of the zombie toad is "This toad wasn't pretty when it was alive, and undeath hasn't improved its looks. Raising toads is a favourite pastime of very young necromancers once they've progressed beyond the stage of insects. Fortunately, a zombie toad isn't a real menace to anyone who is not a zombie fly."

The soul description of the zombie toad is "a swampy odor".

The zombie toad is emotionless.
The zombie toad is not talker.
The zombie toad is not thrower.
Material of the zombie toad is flesh.

The level of zombie toad is 0.
The ID of the zombie toad is 32.
The zombie toad is tiny.

The health of zombie toad is 3.
The melee of zombie toad is -2.
The defence of zombie toad is 7.

The body score of zombie toad is 3.
The mind score of zombie toad is 3.
The spirit score of zombie toad is 3. 

For natural weapon setup of the zombie toad (this is the toad's tongue rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the printed name of X is "tongue";
	now the damage die of X is 1;


Section - Zombie Toad images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of zombie toad is Figure of map_monster_zombie_toad.
The legend-label of zombie toad is Figure of map_legend_zombie_toad.


Section - Prose				

Report an actor hitting the dead zombie toad:
	say "[The actor] [squash] the toad.";
	rule succeeds.

Report the zombie toad hitting a dead pc:
	say "The toad's tongue touches your skin. You die, presumably from laughter.";
	rule succeeds.

Report the zombie toad attacking:
	unless the actor is the noun:
		say "The toad hops towards [the noun].";
	otherwise:
		say "The toad tries to catch itself with its tongue.";
	rule succeeds.

Report the zombie toad dodging:
	say "Ponderously, the zombie toad hops aside.";
	rule succeeds.

Report the zombie toad parrying:
	say "The toad uses its tongue to ward off the attack.";
	rule succeeds.
				
Report the zombie toad waiting when the zombie toad is insane:
	say "The toad tries to mate with your foot.";
	rule succeeds.



Chapter - Malignant chanter

The malignant chanter is a male not neuter undead undead-faction monster. "A malignant chanter poisons the atmosphere with his eery singing."

The description of the malignant chanter is "This man must once have been one of the proud battle bards of Algir, but now he has been reduced to a putrefying corpse animated by magic. His chant can still inspire his undead allies, though."

The soul description of the malignant chanter is "a discordant threnody".

The malignant chanter is emotionless.
The malignant chanter is talker.
The malignant chanter is thrower.
Material of the malignant chanter is flesh.

The level of malignant chanter is 0.
The ID of the malignant chanter is 35.
The malignant chanter is medium.

The health of malignant chanter is 25.
The melee of malignant chanter is -2.
The defence of malignant chanter is 11.

The body score of malignant chanter is 5.
The mind score of malignant chanter is 8.
The spirit score of malignant chanter is 10. 

For natural weapon setup of the malignant chanter (this is the chanter's putrefying fists rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the printed name of X is "putrefying fists";
	now X is plural-named;

Section - Malignant Chanter images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of malignant chanter is Figure of map_monster_malignant_chanter.
The legend-label of malignant chanter is Figure of map_legend_malignant_chanter.


Section - Special and AI

An attack modifier rule (this is the malignant chanter attack bonus rule):
	if the location encloses the malignant chanter:
		if the global attacker is undead and the global attacker is not the malignant chanter:
			if concentration of the malignant chanter is greater than 0:
				if the numbers boolean is true, say " + [concentration of the malignant chanter] (malignant chanter)[run paragraph on]";
				increase the attack strength by concentration of the malignant chanter.

An add specific damage rule (this is the malignant chanter damage bonus rule):
	if damage-by-hitting is true:
		if the location encloses the malignant chanter:
			if the global attacker is undead and the global attacker is not the malignant chanter:
				if concentration of the malignant chanter is greater than 0:
					add (concentration of the malignant chanter) points of damage with reason "malignant chanter".
		
Chance to win rule when the location encloses the malignant chanter (this is the CTW malignant chanter rule):
	if the global attacker is undead and the global attacker is not the malignant chanter:
		increase the chance-to-win by concentration of the malignant chanter.		

An AI action selection rule for the at-Act malignant chanter (this is the malignant chanter AI rule):
	if the location of the malignant chanter encloses at least two undead persons:
		choose row with an Option of the action of the malignant chanter attacking the chosen target in the Table of AI Action Options;
		decrease the Action Weight entry by 100;
		if concentration of the malignant chanter is 3:
			choose row with an Option of the action of the malignant chanter waiting in the Table of AI Action Options;
			now Action Weight entry is 100.


Section - Prose				

To reduce is a verb.

Report an actor hitting the dead malignant chanter:
	say "[The actor] [reduce] the malignant chanter to eternal silence.";
	rule succeeds.

Report the malignant chanter hitting a dead pc:
	say "You die with the awful songs of the chanter in your ears. They will accompany you for all eternity.";
	rule succeeds.

Report the malignant chanter attacking:
	unless the actor is the noun:
		say "The malignant chanter feebly attempts to punch [the noun].";
	otherwise:
		say "The malignant chanter tries to bite off its own hand.";
	rule succeeds.

Report the malignant chanter dodging:
	say "Jumping aside with surprising speed, the malignant chanter tries to evade the attack.";
	rule succeeds.

Report the malignant chanter parrying:
	say "The malignant chanter attempts to ward off the attack.";
	rule succeeds.
				
Report the malignant chanter waiting:
	if the malignant chanter is insane:
		say "The malignant chanter sings [one of]a sleepy lullaby[or]a droll song about the fidelity of women[or]a catchy tune advertising Yahvinnian wine[or]an impassioned serenade implying that he wants to marry you[at random].";
		rule succeeds;
	otherwise:
		if the concentration of the malignant chanter is not 0:
			say "The malignant chanter continues to sing.";
			rule succeeds.

Report the malignant chanter concentrating:
	if the concentration of the actor is:
		-- 1:
			say "The malignant chanter starts to sing.";
		-- 2:
			say "Slowly the volume of the chanter's song rises.";
		-- 3:
			say "The malignant chanter's song rises to a fevered pitch.";
	rule succeeds.



Chapter - Drakul

Drakul is a male not neuter undead super-undead undead-faction monster. "The vampire Drakul silently glides back and forth before you.".

Drakul is proper-named.

The description of Drakul is "While he might pass for a classy gentleman in civilised society, Drakul is in fact one of the oldest and most dangerous vampires the world has ever known. And he always smiles. Always."

The soul description of Drakul is "sophisticated malice".

Drakul is medium.
Drakul is talker.
Drakul is thrower.
Material of Drakul is flesh.

The level of Drakul is 0.
The ID of Drakul is 34.

The health of Drakul is 30.
The melee of Drakul is 4.
The defence of Drakul is 12.

The body score of Drakul is 8.
The mind score of Drakul is 15.
The spirit score of Drakul is 6. 

For natural weapon setup of Drakul (this is the Drakul's teeth rule):
	let X be the natural weapon described;
	now damage die of X is 5;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now the printed name of X is "sharp teeth";
	now X is plural-named;
	now material of X is bone.

Section - Drakul images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of Drakul is Figure of map_monster_Drakul.
The legend-label of Drakul is Figure of map_legend_Drakul.


Section - Drakul drains the living

Aftereffects rule (this is the Drakul drinks blood rule):
	if the global attacker is Drakul and the global defender is not undead and the material of the global defender is flesh:
		if the total damage is greater than 0:
			if Drakul-victory is false:
				say "Drakul [bold type]drinks [regarding the global defender][possessive] blood[roman type], gaining [total damage] health!";
				increase health of Drakul by total damage.

Section - Drakul uses mind games

Drakul-mindgaming is an action applying to nothing.

An AI action selection rule for at-React Drakul (this is the Drakul considers mindgaming rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of Drakul Drakul-mindgaming;
	now the Action Weight entry is a random number between 0 and 50;
	decrease Action Weight entry by (2 * final mind of the main actor).

To scoff is a verb. To nod is a verb.

Carry out Drakul Drakul-mindgaming:
	let guy be a random alive person in the location;
	repeat with counter running from 1 to 5:
		unless guy opposes Drakul or guy is main actor:
			now guy is a random alive person in the location;
	unless guy opposes Drakul:
		now guy is the main actor;
	say "Drakul fixes his entrancing eyes on [the main actor]. ";
	if Drakul is insane:
		say "'Even though I am insane, my mind powers are so great that it doesn't matter if you know I am trying to kill you!' he babbles. 'Instead of harming me, you will attack ";
	otherwise:
		say "'I am your friend,' he whispers. 'Your real enemy is ";
	say "[if the main actor is guy]your own self[otherwise if guy is the player]this foolish adventurer[otherwise][the guy][end if].'[italic type] [run paragraph on]";
	let n be (2 + final mind of Drakul);
	test the mind of the main actor against n; 
	say "[roman type]";
	if test result is true:
		say " [The main actor] [scoff] at the suggestion.";
	otherwise:
		say " [The main actor] [nod] slavishly.";
		repeat through the Table of Delayed Actions:
			if action to take entry is the action of the main actor hitting Drakul:
				now Action to take entry is the action of the main actor hitting guy.

Section - Prose				

Drakul-killer is a person that varies.

Report an actor hitting the dead Drakul:
	now Drakul-killer is the actor;
	if Drakul's lifeblood is off-stage:
		say "As [the actor] [kills Drakul], a small vial of blood drops on the floor.";
		now Drakul's lifeblood is in the location;
	otherwise:
		say "[The actor] [kills Drakul], [if the actor is Drakul]and[otherwise]who[end if] crumbles away into ashes.";
	rule succeeds.

To destroy is a verb.

To say kills Drakul:
	if Drakul-killer is Drakul:
	 	say "drains his own blood";
	otherwise:
		say "[regarding Drakul-killer][destroy] the infamous vampire";

Drakul-victory is a truth state that varies. Drakul-victory is false.

Drakul-favour is a truth state that varies.

starting kit setup for Drakul (this is the Drakul's intentions rule):
	now Drakul-favour is whether or not a random chance of 1 in 3 succeeds.

Report Drakul hitting a dead pc:
	if the player is not undead and Drakul-favour is true:
		say "'Don't be afraid of death, my child,' Drakul chuckles. 'For I have decided that you will rise again as my child! Combining my power and your ability to absorb souls, we will be invincible. And I will finally rule the world!'";
		now health of the player is 1;
		now Drakul-victory is true;
	otherwise:
		say "'Will I make [if the player is male]him[otherwise if the player is female]her[otherwise]it[end if] my slave?' Drakul wonders as he holds your corpse. 'Hm. No. Far too ugly -- I don't want to look at that face for the rest of eternity.'";
	rule succeeds.

Victory message rule (this is the Drakul victory message rule):
	if Drakul-victory is true:
		award achievement Welcome to the masquerade;
		end the story saying "You live on as a vampire, eternally enslaved to your master Drakul. Together, you quickly kill Malygris -- which means that you are technically victorious!";
		rule succeeds.

Report Drakul attacking:
	unless the actor is the noun:
		say "Drakul swoops towards [the noun], baring his sharp, shiny teeth.";
	otherwise:
		say "Drakul looks at his own arm with evident thirst.";
	rule succeeds.

Report Drakul dodging:
	say "Drakul laughs as he steps aside.";
	rule succeeds.

Report Drakul parrying:
	say "Smiling disdainfully, Drakul raises his weapon.";
	rule succeeds.

Report Drakul concentrating:
	if the concentration of the actor is:
		-- 1:
			say "Drakul smiles a little wider.";
		-- 2:
			say "[if Drakul is insane]'An insane vampire always tells the truth. And I tell you: You should fear me!' [otherwise]'There is no need to fear me,' [end if]Drakul says as he concentrates more deeply.";
		-- 3:
			say "Drakul attains the highest state of concentration. 'It feels so good to be alive[if drakul is insane] - but I am undead[end if]!'";
	rule succeeds.

Report Drakul waiting:
	Let honesty be whether or not Drakul is insane;
	say "Drakul says, '[Actually honesty Drakul statement].'";
	rule succeeds;


Chapter - Smoke demons

[The smoke demon is a bit special. It is immortal, and can only be killed by removing smoke. Multiple smoke demons can exist in different rooms; we just move them to any room where they should be.]

Section - Statistics

A smoke demon is a monster. "The smoke here has taken the form of a smoke demon."

The description of the smoke demon is "It is hard to say exactly which features of the smoky form show it to be sentient, but there is not the slightest doubt in your mind that it is.".

The soul description of the smoke demon is "smothering clouds".

The smoke demon is demonic.
The smoke demon is horrific-faction. [Attacks even other demons.]

The level of the smoke demon is 0.
The ID of the smoke demon is 26.
The smoke demon is large.
The smoke demon is not talker.
The smoke demon is thrower.

The smoke demon is smoke attuned.
The smoke demon is flyer.
The smoke demon is emotionless.
The smoke demon is eyeless.
The material of the smoke demon is vapour.

The health of the smoke demon is 10.
The melee of the smoke demon is 2.
The defence of the smoke demon is 6.

The body score of the smoke demon is 7.
The mind score of the smoke demon is 7.
The spirit score of the smoke demon is 7. 

For natural weapon setup of the smoke demon (this is the smoke demon's tendrils rule):
	let X be the natural weapon described;
	now X is size-agnostic;
	now damage die of X is 4;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;
	now the printed name of X is "tendrils";
	now X is plural-named;

Understand "tendrils" as the smoke demon.


Section - Smoke Demon images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of smoke demon is Figure of map_monster_smoke_demon.
The legend-label of smoke demon is Figure of map_legend_smoke_demon.


Section - Making it appear and disappear

A room can be smoke-demoned. A room is usually not smoke-demoned.

The smoke demon time-out is a number that varies. The smoke demon time-out is 0.

Every turn when the smoke demon time-out is not 0:
	decrease the smoke demon time-out by 1.

Every turn when smoke demon time-out is 0 (this is the smoke demon appears and disappears rule):
	repeat with place running through smoke-demoned rooms:
		if the smoke timer of place is 0:
			now place is not smoke-demoned;
			if the smoke demon is enclosed by place:
				have the smoke demon disappear from place;
	if the smoke timer of location is greater than 0:
		unless the location is smoke-demoned:
			let n be the smoke timer of the location;
			if n is greater than 5:
				if a random chance of n in 200 succeeds:
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
	extract the smoke demon from combat;
	remove smoke demon from play;
	now smoke demon time-out is a random number between 5 and 10;
	if place is the location:
		say "With an eery cry, the [bold type]smoke demon dissipates[roman type]!".

An aftereffects rule (this is the set smoke demon time-out rule):
	if the global defender is the smoke demon and the smoke demon is not alive:
		now smoke demon time-out is a random number between 5 and 18.

To have the smoke demon appear:
	now melee of the smoke demon is 2;
	now defence of the smoke demon is 5;
	now body score of the smoke demon is 7;
	now mind score of the smoke demon is 7;
	now spirit score of the smoke demon is 7;
	revive the smoke demon in the location;
	say "The smoke coalesces to [bold type]form a smoke demon[roman type]!".


Section - Prose

Report an actor hitting the dead smoke demon:
	say "The smoke demon drifts apart[if the smoke timer of the location is greater than 0]. Though there are still clouds of smoke here, they no longer seem to be sentient[end if].";
	rule succeeds.

Report the smoke demon hitting a dead pc:
	say "You attempt to breathe, but your lungs are only filled with smoke and more smoke. The murderous vapours seem to become as thick as wool as you desperately try to exhale, inhale, anything -- all in vain. As you suffocate, tendrils of smoke softly close your eyelids.";

Report the smoke demon attacking:
	unless actor is the noun:
		say "The smoke demon casts his vaporous tendrils towards [the noun].";
	otherwise:
		say "The smoke demon strangles itself.";
	rule succeeds.

Report the smoke demon parrying:
	say "Protective layers of smoke appear in front of the smoke demon.";
	rule succeeds.

Report the smoke demon dodging:
	say "The smoke demon gently floats out of the way.";
	rule succeeds.
	
Report the smoke demon waiting when the smoke demon is insane:
	say "The smoke demon blows some smoke rings, just for fun.";
	rule succeeds.

Report the smoke demon concentrating:
	if the concentration of the smoke demon is:
		-- 1:
			say "The smoke demon seems to become denser.";
		-- 2:
			say "Even more smoke is drawn into the smoke demon's form.";
		-- 3:
			say "The smoke demon becomes even denser and now seems almost material.";
	rule succeeds.

A specific damage multiplier rule when the victim is the smoke demon (this is the smoke demon denseness multiplier rule):
	if concentration of the smoke demon is:
		-- 1:
			multiply physical damage by 125 percent with reason "smoke demon is completely vaporous";
		-- 2:
			multiply physical damage by 150 percent with reason "smoke demon is quite dense";
		-- 3:
			multiply physical damage by 175 percent with reason "smoke demon is very dense";
		-- 4:
			multiply physical damage by 200 percent with reason "smoke demon is extremely dense";

Chapter - Imp

Section - Statistics

There is a monster called an imp. "A little devil flies around the room."
Understand "little" and "devil" as the imp.

The description of the imp is "Imps are minor demons with unnaturally small wings. They rarely engage in combat, prefering to teleport or fly away from danger.".

The soul description of the imp is "flittering wings".

The imp is demonic. The level of the imp is 0.
The ID of the imp is 27.
The imp is small.
The imp is talker.
The imp is thrower.
Material of imp is darkness.

The imp is flyer.

The health of the imp is 10.
The melee of the imp is -2.
The defence of the imp is 8.

The body score of the imp is 4.
The spirit score of the imp is 4. 
The mind score of the imp is 4.

For natural weapon setup of the imp (this is the imp's claws rule):
	let X be the natural weapon described;
	now damage die of X is 3;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the printed name of X is "claws";
	now X is plural-named;

Understand "claws" as the imp.


Section - Imp images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of imp is Figure of map_monster_imp.
The legend-label of imp is Figure of map_legend_imp.


Section - AI

Imping is an action applying to nothing.
Imp-grabbing is an action applying to nothing.

An AI action selection rule for the imp (this is the imp considers imping rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of the imp imping;
	now the Action Weight entry is a random number between 0 and 80;
	if combat state of the imp is at-React:
		if location is not Lair of the Imp:
			unless imp is teleport impossible aware:
				increase Action Weight entry by 1000.

Carry out the imp imping:
	if the combat state of the imp is at-React:
		if (the location of the imp is not Lair of the Imp) and (the imp is not teleport impossible aware):
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

Carry out an actor teleporting (this is the imp teleporting rule):
	if the actor is the imp:
		if the location of the imp is the Lair of the Imp:
			if location is teleportable:
				now teleportation-destination is location;
			otherwise:
				now teleportation-destination is location of the imp;
		otherwise:
			now teleportation-destination is Lair of the Imp.

The imp teleporting rule is listed before the teleportation beacon rule in the carry out teleporting rules.

Independent action rule when test subject is the imp (this is the imp acts when the player is in worldsharing combat rule):
	if combat status is peace:
		rule fails;
	if the main actor is not the player:
		rule fails;
	[if we decide to use the can't act independently off-stage rule instead of the must share player's world to act independently rule, we'll need this:
	unless the player and the imp share a world:
		rule fails;]
	
Every turn when the imp is acting independently (this is the imp not absent AI rule):
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

Report an actor hitting the dead imp:
	say "The imp dies with a sad screech.";
	rule succeeds.

Report the imp hitting a dead pc:
	say "The imp's claws open your jugular vein, and hot blood spurts all around.";
	rule succeeds.

Report the imp attacking:
	unless the actor is the noun:
		say "The imp dives at [the noun], his tiny claws ready to strike.";
	otherwise:
		say "'I've always hated you!' the imp exclaims as it attacks itself.";
	rule succeeds.

Report the imp dodging:
	say "The imp tries to fly away.";
	rule succeeds.

Report the imp waiting when the imp is insane:
	say "'I will steal everything. Everything. EVERYTHING! Even myself!' the imp shouts.";
	rule succeeds.




Chapter - The demonic mistress

[The demoness can appear when the player wears the demon lord's diadem.]

The demonic mistress is a female monster. "A horned figure stalks through the room." Understand "horned" and "figure" and "demon" and "demoness" as the demonic mistress. The description of the demonic mistress is "A being summoned by Malygris from the depths of Hell, this demon has only one purpose: to stop you from reaching its master.".

The soul description of the demonic mistress is "a burning whip".

The level of demonic mistress is 0.
The ID of the demonic mistress is 28.
The demonic mistress is medium.
The demonic mistress is talker.
The demonic mistress is thrower.
Material of demonic mistress is darkness.

The demonic mistress is demonic.

The health of demonic mistress is 25.
The melee of demonic mistress is 5.
The defence of demonic mistress is 10.

The body score of demonic mistress is 9.
The mind score of demonic mistress is 9.
The spirit score of demonic mistress is 9. 

The demonic mistress is follower.
Follower percentile chance of demonic mistress is 100.
The demonic mistress is unnaturally aware.

For natural weapon setup of the demonic mistress (this is the mistresses claws rule):
	let X be the natural weapon described;
	now dodge bonus of X is 0;
	now parry-against bonus of X is 0;
	now parry-with bonus of X is -2;	
	now the printed name of X is "claws";
	now X is plural-named;
	
Demonic mistress is weapon user.

The demonic mistress carries the demon whip.


Section - Demonic Mistress images for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The avatar of demonic mistress is Figure of map_monster_demonic_mistress.
The legend-label of demonic mistress is Figure of map_legend_demonic_mistress.


Section - Demonic mistress prose

Report an actor hitting the dead demonic mistress:
	say "'You have failed!' a booming voice shouts as a huge hairy arm pulls the demon mistress back into hell. Her screams are music to your ears.";
	rule succeeds.

Report the demonic mistress hitting a dead pc:
	say "'A pity. [if the player is female]She[otherwise if the player was male]He[otherwise]It[end if] was too weak to serve.' She kicks your corpse out of the way.";
	rule succeeds.

Report the demonic mistress attacking:
	unless the actor is the noun:
		say "The demonic mistress lashes out at [the noun].";
	otherwise:
		say "'I deserve to be punished!' the demonic mistress whispers as she attempts to hit her own back.";
	rule succeeds.

Report the demonic mistress dodging:
	say "The demonic mistress jumps away.";
	rule succeeds.

Report the demonic mistress parrying:
	say "The demonic mistress parries.";
	rule succeeds.

Report the demonic mistress waiting when the demonic mistress is insane:
	say "'Now lay down and die, or I will give all of you another two hundred thousand lashes!' the demonic mistress screams.";
	rule succeeds.




[Chapter - Duskwing
A huge skeletal moth with a concentration-stealing ability?]


Kerkerkruip Monsters ends here.
