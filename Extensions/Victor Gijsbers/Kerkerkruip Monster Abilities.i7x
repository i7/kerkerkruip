Kerkerkruip Monster Abilities by Victor Gijsbers begins here.

Use authorial modesty.

[This extension contains code that defines abilities, attributes and temporary properties of monsters (sometimes including the player).

Some exceptions:
- monster size is with the size system in Systems
- heat resistance is with the heat system in Systems.]

[Contents:

 - Types and Factions
 - Simple attributes
 - Movement-related stuff
 - Complex attributes
 - Abilities]

Part - Types and factions

Chapter - Basic attributes

A monster is usually hostile.
A monster is usually neuter.


Chapter - Monster types

Creature-type is a kind of value. The creature-types are living, undead, demonic, angelic, horrific.

A person has a creature-type. The creature-type of a person is usually living.

Status rule (this is the undead status rule):
	if the player is undead:
		if long status is true:
			say "You are [bold type]undead[roman type]: other undead are your allies; other potential allies may be your enemies instead; absorbing a soul may heal you only partially.[line break][run paragraph on]";


Chapter - New factions

[Undead attack everyone, except for other undead. Horrors attack everyone. Demonic doesn't hate demonic or hostile.]

undead-faction is a faction.
horrific-faction is a faction.
mindslug-enslaved is a faction.
player-enslaved is a faction.
insane is a faction.

Definition: a person is enslaved if its faction is mindslug-enslaved or its faction is player-enslaved.

When play begins (this is the set factions rule):
	now mindslug-enslaved hates friendly;
	now friendly hates mindslug-enslaved;
	repeat with X running through factions:
		now horrific-faction hates X;
		now X hates horrific-faction;
		now insane hates X;
		now X hates insane;
		unless X is undead-faction:
			now undead-faction hates X;
			now X hates undead-faction;
		if friendly hates X:
			now player-enslaved hates X;
		if X hates friendly:
			now X hates player-enslaved.

[And now some stuff we need because horrors might attack themselves.]

The standard hate rule is not listed in any rulebook.

Hate rule (this is the nonstandard hate rule):
	if the player is friendly and at least one hostile alive person is enclosed by the location:
		if friendly hates hostile:
			rule succeeds; [This is only here for speed. It is the most common case where we decide yes.]
	repeat with X running through alive not passive persons enclosed by the location:
		repeat with Y running through alive persons enclosed by the location:
			if the faction of X hates the faction of Y and X is not Y:
				rule succeeds;
	rule fails.

[An AI target selection rule for a person (called target) (this is the do not target yourself rule):
	if target is the running AI:
		decrease the Weight entry by 2000.]

Every turn when the player is undead (this is the undead follow undead rule):
	repeat with guy running through undead not follower persons in the location:
		now guy is follower;
		if follower percentile chance of guy is less than 50:
			now follower percentile chance of guy is 50.




Part - Simple attributes

Chapter - Emotionless

[Some persons have no emotions, and are immune to, for instance, being dominated.]

A person can be emotionless. A person is usually not emotionless.


Chapter - Non-attacker

[Has no influence on the AI (which you will want to customise anyway), but ensures that the person strikes no blow against the player when the player is retreating / running.]

A person can be non-attacker. A person is usually not non-attacker.


Chapter - Weapon user

[Weapon users can ready new weapons.]

A person can be a weapon user. A person is usually not a weapon user.

An AI action selection rule for a person (called P) when the chosen weapon is not readied and the running AI is not weapon user (this is the non weapon users never ready rule):
	choose row with an Option of the action of P readying the chosen weapon in the Table of AI Action Options;
	decrease the Action Weight entry by 1000.

Chapter - Talker

[Talkers can speak. Currently used for flavour; could at a later stage be used for substantial things.]

A person can be talker. A person is usually talker.



Part - Movement

Chapter - Impeded movement

[In some circumstances, you cannot move. This affects stuff like falling into the lava or jumping down the staircase -- though not reading a scroll of teleportation. We make one universal silent check. We use it for going, entering and so on. We also check it after the retreat-induced attacks because these may have stopped us from retreating.]

The impeded movement rules are a rulebook.

To decide whether (guy - a person) can move:
	now test subject is the guy;
	consider the impeded movement rules;
	if rule failed:
		decide no;
	decide yes.

Check entering when not the player can move (this is the cannot enter when unable to move rule):
	take no time;
	say "You are unable to move." instead.

Check exiting when not the player can move (this is the cannot exit when unable to move rule):
	take no time;
	say "You are unable to move." instead.

Check going when not the player can move (this is the cannot go when grappled rule):
	take no time;
	say "You are unable to move." instead.
		
Check getting off when not the player can move (this is the cannot get off when unable to move rule):
	take no time;
	say "You are unable to move." instead.


Chapter - Flying

[Some persons have flight, which makes them immune to some effects.]

A person can be a flyer. A person is usually not a flyer.

The flying rules are a rulebook.

To decide whether (guy - a person) is flying:
	now test subject is guy;
	consider the flying rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

A flying rule (this is the flyers fly rule):
	if test subject is flyer:
		rule succeeds.

Status rule (this is the flying status rule):
	if player is flying:
		if long status is true:
			say "You [if the player is flyer]have wings and [end if]are [bold type]flying[roman type].[line break][run paragraph on]";
		otherwise:
			say ", flying[run paragraph on]";

Chapter - Followers

[Followers consider the follower rules. If these do not fail, they attempt to move one room towards the player.]

A person can be a follower. A person is usually not a follower.
A person has a number called the follower percentile chance. The follower percentile chance of a person is usually 100.

The followers rules are a rulebook.

Every turn (this is the have followers follow rule):
	if main actor is the player:
		repeat with guy running through alive not off-stage follower persons:
			if the location of guy is not the location of the player:
				now test subject is guy;
				consider the followers rules;
				unless rule failed:
					let the way be the best route from the location of guy to the location of the player;
					if way is a direction, try guy going the way.

A followers rule (this is the follower percentile chance rule):
	let n be the follower percentile chance of the test subject;
	unless a random chance of n in 100 succeeds:
		rule fails.

A followers rule (this is the follower cannot follow hidden person rule):
	if player is hidden and test subject is not unnaturally aware and test subject is not unnaturally aware follower:
		rule fails.




Part - Complex attributes

Chapter - Blindness

A person can be blinded. A person is usually not blinded. [Blinded is a property that makes you blind. It can be cured.]

A person can be eyeless. A person is usually not eyeless. [An eyeless person is blind but not negatively affected by blindness.]

The blindness rules are a rulebook.

To decide whether (guy - a person) is blind:
	now test subject is guy;
	consider the blindness rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

A blindness rule (this is the blind if blinded rule):
	if test subject is blinded:
		rule succeeds.

A blindness rule (this is the blind if eyeless rule):
	if test subject is eyeless:
		rule succeeds.
		
Status rule (this is the blindness status rule):
	if player is blind:
		if long status is true:
			say "You are [bold type]blind[roman type].[line break][run paragraph on]";
		otherwise:
			say ", blind[run paragraph on]";
	
Status rule (this is the eyeless status rule):
	if player is eyeless:
		if long status is true:
			say "You do not need [bold type]eyes[roman type] to perceive your surroundings.[line break][run paragraph on]";
		otherwise:
			say ", eyeless[run paragraph on]";

An attack modifier rule (this is the blindness attack modifier rule):
	if the global attacker is blind and the global attacker is not eyeless:
		say " - 3 (blindness)[run paragraph on]";
		decrease the attack strength by 3;

An attack modifier rule (this is the blindness defence modifier rule):
	if the global defender is blind and the global defender is not eyeless:
		say " + 2 (defender blind)[run paragraph on]";
		increase the attack strength by 2;

Chance to win rule (this is the CTW blindness bonus rule):
	if the global attacker is blind and the global attacker is not eyeless:
		decrease the chance-to-win by 3;
	if the global defender is blind and the global defender is not eyeless:
		increase the chance-to-win by 2.

Chapter - Being enraged

A person can be enraged. A person is usually not enraged.

The rage rules are a rulebook.

To decide whether (guy - a person) is raging:
	now test subject is guy;
	consider the rage rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.
		
A rage rule:
	if test subject is enraged:
		rule succeeds.

Status rule (this is the rage status rule):
	if player is raging:
		if long status is true:
			say "You are [bold type]raging[roman type], and will not retreat.[line break][run paragraph on]";
		otherwise:
			say ", enraged[run paragraph on]";

This is the do not go in combat when raging rule:
	if the player is raging and the combat status is not peace:
		let Y be the player;
		repeat with X running through persons in the location:
			if the faction of X hates the faction of the player:
				now Y is X;
		take no time;
		say "And allow [the Y] to live? Never!" instead.

The do not go in combat when raging rule is listed before the going and retreating in combat rule in the check going rules.
The do not go in combat when raging rule is listed in the check retreating rules.
The do not go in combat when raging rule is listed in the check digging rules.


Chapter - Bloodlust

Section - Bloodlusting

A person can be bloodlusting, about-to-bloodlust, or notlusting. A person is usually notlusting.

Aftereffects rule (this is the aftereffect bloodlusting rule):
	if the attack damage is not 0:
		now global attacker is about-to-bloodlust.

Every turn (this is the bloodlusting rule):
	if main actor is about-to-bloodlust:
		now main actor is bloodlusting;
	otherwise:
		now main actor is notlusting.

Section - Bloodlust rules

The bloodlust rules are a rulebook.
The bloodlust dummy is a number that varies.

To decide which number is bloodlust of (guy - a person):
	now test subject is guy;
	now bloodlust dummy is 0;
	consider the bloodlust rules;
	decide on bloodlust dummy.

Section - Attack and damage bonus

An attack modifier rule (this is the bloodlusting attack bonus rule):
	if the global attacker is bloodlusting:
		let n be bloodlust of global attacker;
		if n is not 0:
			say " + ", n, " (bloodlust)[run paragraph on]";
			increase the attack strength by n.

A damage modifier rule (this is the bloodlusting damage bonus rule):
	if the global attacker is bloodlusting:
		let n be bloodlust of global attacker;
		if n is not 0:
			say " + ", n, " (bloodlust)[run paragraph on]";
			increase the attack damage by n.

Section - Status

Status rule (this is the bloodlust status rule):
	if bloodlust of player is not 0:
		let n be bloodlust of the player;
		if long status is true:
			say "Level [N in words] [bold type]bloodlust[roman type].[line break][run paragraph on]".

Section - Status

Status rule (this is the bloodlusting status rule):
	if player is bloodlusting and bloodlust of player is not 0:
		let n be bloodlust of the player;
		if long status is true:
			say "[bold type]Bloodlust[roman type]: +[n] attack bonus, +[n] damage bonus.[line break][run paragraph on]";
		otherwise:
			say "[bold type]Bloodlust[roman type]: +[n] attack, +[n] damage[line break][run paragraph on]".

Section - AI

Chance to win rule when the main actor is bloodlusting (this is the CTW bloodlusting bonus rule):
	let n be bloodlust of the main actor;
	increase the chance-to-win by n.

An AI action selection rule for a bloodlusting person (this is the prefer attacking when bloodlusting rule):
	choose row with an Option of the action of the main actor attacking the chosen target in the Table of AI Action Options;
	let n be bloodlust of the main actor;
	increase the Action Weight entry by n.	

Section - Innate bloodlust

A person has a number called the innate bloodlust. The innate bloodlust of a person is usually 0.

Bloodlust rule (this is the innate bloodlust rule):
	increase bloodlust dummy by innate bloodlust of test subject.
		


Chapter - Radiance

A person has a number called the radiation. The radiation of a person is usually 0.
Definition: a person (called guy) is radiant if the radiation of guy > 0.
Definition: a person (called guy) is radiance-immune if ((guy is angelic) or (guy is the player and player worships Sul)).


An attack modifier rule (this is the radiance attack bonus rule):
	if the global attacker is radiant:
		unless global defender is blind or global defender is radiance-immune:
			let n be radiation of global attacker;
			if n is not 0:
				say " + ", n, " (radiance)[run paragraph on]";
				increase the attack strength by n;
	if the global defender is radiant:
		unless global attacker is blind or the global attacker is radiance-immune:
			let n be radiation of global defender;
			if n is not 0:
				say " - ", n, " (radiance)[run paragraph on]";
				decrease the attack strength by n.

Section - Status

Status rule (this is the radiance status rule):
	if player is radiant:
		let n be radiation of the player;
		if long status is true:
			say "Level [n in words] [bold type]radiance[roman type]: +[n] to attack and defence against sighted beings (except angels).[line break][run paragraph on]".





Chapter - Insanity

A Standard AI rule for an insane person (called P) (this is the insane people attack themselves rule):
	if P is at-Act:
		if a random chance of 1 in 6 succeeds:
			try P attacking P;
			rule succeeds.

An AI target selection rule (this is the insane randomise the target result rule):
	if the running AI is insane:
		increase the Weight by a random number between 0 and 700.

Last AI action selection rule (this is the insane randomise the action result rule):
	if the running AI is insane:
		repeat through the Table of AI Action Options:
			increase the Action Weight entry by a random number between 0 and 700.

A damage modifier rule (this is the insane people sometimes get insane damage bonus rule):
	if global attacker is insane and global attacker weapon is not size-agnostic:
		if a random chance of 1 in 5 succeeds:
			if the numbers boolean is true, say " + 10 (insane burst of strength)[run paragraph on]";
			increase the attack damage by 10.

Chapter - Beloved of Aite

The beloved of Aite rules are a rulebook.

To decide whether (guy - a person) is beloved of Aite:
	now test subject is guy;
	consider the beloved of Aite rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

A person can be Aite-loved. A person is usually not Aite-loved.

A beloved of Aite rule (this is the Aite-loved rule):
	if test subject is Aite-loved:
		rule succeeds.

Chapter - Physical damage reduction

The physical damage reduction rules are a rulebook. [To be used by all physical damage effects which should be stopped by stuff like armour.]

The pdr is a number that varies.

To calculate the pdr for (guy - a person):
	now pdr is 0;
	now test subject is guy;
	consider the physical damage reduction rules.





Part - Abilities

Chapter - Healing

[This is an action that monsters can take.]

Healing is an action applying to nothing. [Obviously, it will apply to someone, but our simple AI cannot handle it that way.]

A person has a number called the heal power. The heal power of a person is usually 0.
A person has a number called the heal cooldown. The heal cooldown of a person is usually 3.
A person has a number called the current heal cooldown. The current heal cooldown of a person is usually 0.
			
First AI action selection rule for a person (called P) (this is the consider healing rule):
	if the heal power of P is greater than 0 and the current heal cooldown of P is less than 1:
		let someone needs healing be false;
		let greatest injury be 0;
		repeat with X running through alive persons enclosed by the location not opposed by P:
			let injury be permanent health of X minus health of X; 
			if injury is greater than 0:
				now someone needs healing is true;
				if greatest injury is less than injury:
					now greatest injury is injury;
		if someone needs healing is true:
			if greatest injury is greater than heal power of the running AI:
				now greatest injury is heal power of the running AI; [now m becomes the maximum amount of damage the global attacker can heal]
			choose a blank Row in the Table of AI Action Options;
			now the Option entry is the action of P healing;
			now the Action Weight entry is 5 plus greatest injury;

Carry out an actor healing:
	let m be 0;
	let chosen one be the actor;
	repeat with guy running through alive persons enclosed by the location:
		if the faction of guy does not hate the faction of the actor and guy is not the actor:
			let n be permanent health of guy minus health of guy; 
			if n is greater than 0:
				if m is less than n:
					now chosen one is guy;
					now m is n;
	if m is greater than heal power of the actor:
		now m is heal power of the actor;
	say "[The actor] casts a spell of magical healing on [the chosen one], removing [m] points of damage.";
	heal chosen one for m health;
	now current heal cooldown of the actor is heal cooldown of the actor. 

Every turn (this is the reduce heal cooldown of the main actor rule):
	if the current heal cooldown of the main actor is greater than 0:
		decrease the current heal cooldown of the main actor by 1.


Chapter - Teleportation

[As a monster action.]

Teleporting is an action applying to nothing.

A person has a number called the teleport amount. The teleport amount of a person is usually 0. [Number of times the monster can teleport. -1 means infinitely.]
A person has a number called the teleport eagerness. The teleport eagerness of a person is usually 10. [percentage chance of serious consideration]
A person can be a spontaneous teleporter. A person is usually not a spontaneous teleporter. [A spontaneous teleporter will also teleport when the player is not present. Best used with a teleport amount of -1.]

A room can be teleportable. A room is usually teleportable. [A teleportable room is one you can teleport TO.]

[We have teleport rules which check whether a person can teleport.]
The teleport impossible rules are a rulebook.

To decide whether teleportation is impossible for (guy - a person):
	now test subject is guy;
	consider the teleport impossible rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

A teleport impossible rule (this is the no teleportation outside the dungeon rule):
	if test subject is off-stage:
		rule succeeds;
	otherwise if x-coordinate of (the location of the test subject) is 100:
		rule succeeds.

[Finally, it need not be obvious to a person that teleportation is impossible. If a person is a teleport impossible aware, he does.]
A person can be teleport impossible aware. A person is usually not teleport impossible aware.

[ The teleporting action ]

Teleportation-destination is a room that varies.
Teleportation-from is a room that varies.

Setting action variables for teleporting:
	now teleportation-from is the location of the actor; [see teleportation Event]

Check an actor teleporting (this is the teleport impossible rule):
	if teleportation is impossible for the actor:
		now the actor is teleport impossible aware;
		if the actor is visible:
			say "[The actor] tries to teleport away, but something makes this impossible!" instead;
		otherwise:
			do nothing instead.

First carry out an actor teleporting (this is the choose a destination rule):
	let destination be a random placed placeable teleportable room;
	while destination is the location of the actor:
		let destination be a random placed placeable teleportable room;
	now teleportation-destination is destination;

Last carry out an actor teleporting (this is the actually do the teleportation rule):
	move actor to teleportation-destination;
	now concentration of actor is 0;
	unless teleport amount of actor is -1 or teleport amount of actor is 0:
		decrease teleport amount of actor by 1;
	unless teleportation-from is the location and teleportation-destination is the location:
		clean the table of delayed actions for the actor;

Report an npc teleporting:
	if teleportation-from is the location and teleportation-destination is the location:
		say "[The actor] teleport[s] away, but reappear[s] in the exact same spot.";
	otherwise:
		if teleportation-from is the location:
			say "[The actor] suddenly teleport[s] away!";
		if  teleportation-destination is the location:
			say "[The actor] suddenly teleport[s] into the room!";


To teleport the player:
	say "A sickening feeling, and then you find yourself in --[paragraph break]";
	try the player teleporting;
	now retreat location is teleportation-destination;
	consider the sudden combat reset rules;
	now the take no time boolean is false;


[AI rules]

First AI action selection rule for an at-Act person (called P) (this is the consider teleporting rule):
	choose a blank Row in the Table of AI Action Options;
	now the Option entry is the action of P teleporting;
	if the teleport amount of P is 0:
		now the Action Weight entry is -1000;
	otherwise:
		if P is teleport impossible aware:
			now the Action Weight entry is -100;
		otherwise:
			now the Action Weight entry is -20.

An AI action selection rule for an at-Act person (called P) (this is the teleport eagerness rule):
	let n be the teleport eagerness of P;
	if a random chance of n in 100 succeeds:
		choose row with an Option of the action of P teleporting in the Table of AI Action Options;
		increase the Action Weight entry by 35.

Every turn (this is the spontaneous teleport rule):
	repeat with guy running through spontaneous teleporter not off-stage persons:
		if teleport amount of guy is not 0:
			let n be the teleport eagerness of guy;
			if a random chance of n in 100 succeeds:
				try guy teleporting. 

Every turn (this is the teleport impossible awareness expires rule):
	repeat with guy running through teleport impossible aware persons:
		unless teleportation is impossible for guy:
			now guy is not teleport impossible aware.


Chapter - Ray of disintegration

[Our implementation is simple in the sense that the AI has no preference for destroying one object over another. Making this more interesting would be a good project for the future.]

Disintegrating is an action applying to nothing.

A person has a number called the disintegrate power. The disintegrate power of a person is usually 0.
A person has a number called the disintegrate cooldown. The disintegrate cooldown of a person is usually 5.
A person has a number called the current disintegrate cooldown. The current disintegrate cooldown of a person is usually 0.
		
First AI action selection rule for a person (called P) (this is the consider disintegrating rule):
	if the disintegrate power of P is greater than 0 and the current disintegrate cooldown of the P is less than 1:
		repeat with guy running through alive persons enclosed by the location opposed by P:
			if guy has at least one[ corruptible] thing:
				choose a blank Row in the Table of AI Action Options;
				now the Option entry is the action of P disintegrating;
				now the Action Weight entry is disintegrate power of P;
				if a random chance of 1 in 10 succeeds:
					increase Action Weight entry by 10;
				stop;

Carry out an actor disintegrating (this is the standard disintegrate rule):
	let boolean be false;
	let guy be the actor;
	let item be the non-thing;
	while boolean is false:
		now guy is a random alive person enclosed by the location;
		if the actor opposes the guy:
			if guy has at least one[ corruptible] thing:
				now item is a random[ corruptible] thing had by guy;
				now boolean is true;
	let n be the disintegrate power of the actor;
	if item is minor or item is non-treasure:
		now n is n times 6;
	if item is major:
		now n is n times 4;
	if item is epic:
		now n is n times 2;
	if item is incorruptible:
		now n is 0;
	if a random chance of n in 100 succeeds:
		say "[The actor] casts a ray of disintegration at [the item], destroying the object!";
		remove item from play;
		ready natural weapons;
	otherwise:
		say "[The actor] casts a ray of disintegration at [the item], but the object resists!";
	now current disintegrate cooldown of the actor is disintegrate cooldown of the actor.

Every turn (this is the reduce disintegrate cooldown of the main actor rule):
	if the current disintegrate cooldown of the main actor is greater than 0:
		decrease the current disintegrate cooldown of the main actor by 1.
		







Kerkerkruip Monster Abilities ends here.
