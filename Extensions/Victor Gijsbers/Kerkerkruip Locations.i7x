Kerkerkruip Locations by Victor Gijsbers begins here.

Use authorial modesty.


Book - Rooms



Part - The rooms themselves


Chapter - Entrance Hall

The Entrance Hall is a room. "The vast entrance hall is empty, silent, foreboding. Skull-sized rubies project a red light far too bright for the eyes of a human."

Entrance Hall is not habitable.
Entrance Hall is connectable.
Entrance hall is connection-inviting.
Entrance Hall is placeable.
Entrance Hall is vp-agnostic.
Entrance Hall is treasurable.
Entrance Hall is extra-accepting.
Entrance Hall is civilised.

The skull-sized rubies are in entrance hall. The skull-sized rubies are scenery and plural-named. The description of the skull-sized rubies is "They have been filled with the power of suns long extinct, and are now fixed to the ceiling of the wizard's domain. You cannot bear to look at them.". Check taking the skull-sized rubies: say "They are secured to the ceiling by magic more powerful than you can break." instead.

The red light is scenery in Entrance Hall. The description of the red light is "You force yourself to look straight into the light -- but after the merest fraction of a second, you involuntarily close your eyes against the painful glare.". 

An attack modifier rule (this is the attack penalty in Entrance Hall rule):
	if the location is Entrance Hall:
		unless the global attacker is blind:
			let n be 2 minus the smoke penalty of Entrance Hall;
			if n is greater than 0:
				say " - [n] (blinding light)[run paragraph on]";
				decrease the attack strength by n.
	
The player is in Entrance Hall.





Chapter - Hall of Mirrors

The Hall of Mirrors is a room. "Mirrors surround you on all sides in an impossible geometry[run paragraph on][unless the player is blind]. Myriad reflections follow your every movement -- though some, always in the corner of your eyes, seem to behave differently[end if]."

Hall of Mirrors is habitable.
Hall of Mirrors is connectable.
Hall of Mirrors is not connection-inviting.
Hall of Mirrors is placeable.
Hall of Mirrors is vp-agnostic.
Hall of Mirrors is treasurable.
Hall of Mirrors is extra-accepting.
Hall of Mirrors is magical.


A thing called the mirrors is in Hall of Mirrors. The mirrors are scenery and plural-named. The description of the mirrors is "You look into infinity.". Understand "mirror" as mirrors.

Before attacking the mirrors:
	say "You smash one of the mirrors -- but there are only further mirrors behind it. After a few seconds, the shards of glass start moving up and reform the mirror. Not a crack can be seen." instead.

The reflections are scenery in Hall of Mirrors. Before attacking the reflections: try attacking the mirrors instead. The description of the reflections is "Something seems to be wrong, but you cannot find positive evidence.". 

Fragmentation rule (this is the hall of mirrors fragmentation rule):
	if fragmentation-place is Hall of Mirrors:
		say "All the mirrors are blown to pieces and fall down like a rain of ice and light. But after a few seconds,  the shards of glass start moving up and reform the mirrors. Not a crack can be seen.";
		rule succeeds.


After printing the name of something while looking when the location is the Hall of Mirrors:
	say "[run paragraph on]";
	unless the player is blind:
		say " [one of](reflected thousandfold)[or](mirrored all around you)[or](copied and copied by mirrors)[or](multiplied ad infinitum)[at random]" instead.

Check an actor hitting when the location is Hall of Mirrors (this is the sometimes attack a mirror image in Hall of Mirrors rule):
	unless the global attacker is blind:
		unless the global attacker grapples the global defender:
			unless the global defender grapples the global attacker:
				test the mind of global attacker against 10;
				if test result is false:
					say " Confused by the mirrors, [if global attacker is the player]you start[otherwise][the global attacker] starts[end if] attacking a reflection before realising [if global attacker is the player]your[otherwise]its[end if] mistake.";
					if the concentration of the global attacker is greater than 1:
						now the concentration of the global attacker is 1; 
					rule fails;
	[				consider the take away until attack circumstances rules;]
				otherwise:
					say " Seeing through the illusion created by the mirrors, [if global attacker is the player]you attack[otherwise][the global attacker] attacks[end if] the real [if global defender is not the player][global defender][otherwise]you[end if].".

[A perception test rule (this is the concentration bonus in Hall of Mirrors rule): [BUG with chain golem]
	if an actor attacking in Hall of Mirrors and the actor is the test subject:
		unless the test subject is blind:
			if concentration of the actor is greater than 0:
				increase test score by concentration of the actor;
				say " + [concentration of the actor] (concentration)[run paragraph on]".]

An AI action selection rule for a person (called P) when the location is Hall of Mirrors (this is the concentration is more important in the Hall of Mirrors rule):
	choose row with an Option of the action of P concentrating in the Table of AI Action Options;
	increase the Action Weight entry by 1.



Chapter - Phantasmagoria

Phantasmagoria is a room. "This huge hall is filled with the radiant images of warriors long dead, fighting their bloody battles over and over again.[run paragraph on][unless the player is blind] You see [phantasmagoria show] -- but the scene changes before you can focus on any details.[run paragraph on][end if]"

Phantasmagoria is connectable.
Phantasmagoria is not connection-inviting.
Phantasmagoria is placeable.
Phantasmagoria is habitable.
Phantasmagoria is treasurable.
Phantasmagoria is extra-accepting.
Phantasmagoria is vp-agnostic.
Phantasmagoria is magical.

The radiant images are scenery in Phantasmagoria. Understand "warriors" and "battles" and "image" as the radiant images.

The description of the radiant images is "For a moment, you watch [phantasmagoria show].".
	
Instead of attacking the radiant images:
	say "You courageously attack the illusory beings.".

To say phantasmagoria show:
	let N be a random number between 1 and 10;
	if N is:
		-- 1: say "vast armies of skeletons clash while their masters pray for the help of forbidden deities";
		-- 2: say "a heavily muscled barbarian succumbing to the fiery breath of a dragon";
		-- 3: say "two naked [one of]male[or]female[purely at random] slaves fighting to the death for the pleasure of their reptile [one of]master[or]mistress[purely at random]";
		-- 4: say "fountains of fire erupting in the middle of a contingent of archers";
		-- 5: say "flaming bolts, fired by huge ballistae, flying right over your head";
		-- 6: say "several knights in plate armour struggling to reach the shores of a swamp, while the land retreats before them as if it were alive";
		-- 7: say "shrieking ghosts being whipped into a frenzy by a necromancer thousands of years old";
		-- 8: say "an elated thief running towards a huge pile of treasure, which then opens a maw and devours him";
		-- 9: say "a hopeful party of sixteen year old adventurers getting slaughtered by [the name of a random monster]";
		-- 10:
			if at least one monster is not alive:
				let guy be a random not alive monster;
				say "yourself fighting [the name of the guy]";
			otherwise:
				say "three bull-men getting eaten by a horrendous swamp monster".

Every turn when the location is the phantasmagoria and the combat status is not peace:
	if a random chance of 1 in 5 succeeds:
		let lijst be a list of persons;
		repeat with guy running through alive persons enclosed by the location:
			unless guy is blind:
				if concentration of guy is greater than 0:
					if a random number between 1 and 5 is greater than the concentration of guy:
						add guy to lijst;
						now concentration of guy is 0;
		say "Suddenly, [one of]a disintegrating skeletal warrior[or]a blast of dragon's fire[or]a naked male slave screaming in fear[or]a naked female slave fleeing in tears[or]a huge fountain of fire[or]a crashing ballista bolt[or]a drowning knight, crying for his god,[or]a ghost devouring the flesh of a still living man[or]a frenzied bull elephant[or]a shrieking princess in the claws of a demon[or]an obese king carried by seven blind eunuchs[at random] appears. [unless lijst is empty]While only an image that flickers and then disappears, it startles [lijst with definite articles][otherwise]The illusions do not affect anyone[end if].".

An AI action selection rule for a person (called P) when the location is Phantasmagoria (this is the concentration is often futile in Phantasmagoria rule):
	unless P is blind:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		decrease the Action Weight entry by 2 times the concentration of P.


Chapter - Lake of Lava

Lake of Lava is a room.

Lake of Lava is nogo.
Lake of Lava is not connectable.
Lake of Lava is not connection-inviting.
Lake of Lava is not placeable.
Lake of Lava is not habitable.
Lake of Lava is not treasurable.
Lake of Lava is not extra-accepting.
Lake of Lava is vp-likely-underground.
Lake of Lava is elemental.

A placement possible rule:
	if original room is Lake of Lava:
		rule fails.

Falling rule (this is the Lake of Lava kills fallers rule):
	if falling-destination is Lake of Lava:
		if falling-guy is not ethereal:
			if falling-guy is player:
				end the story saying "You fell into the lava";
			otherwise:
				now the health of falling-guy is -10;
			rule succeeds.



Chapter - Bridge of Doom

[TODO: nooit iets onder de Bridge of Doom?]

The Bridge of Doom is a room. "You stand on an exceedingly narrow bridge crossing a seething lake of lava. Dodging would be suicidal."

Bridge of Doom is not connectable.
Bridge of Doom is not connection-inviting.
Bridge of Doom is placeable.
Bridge of Doom is habitable.
Bridge of Doom is treasurable.
Bridge of Doom is not extra-accepting.
Bridge of Doom is vp-likely-underground.
Bridge of Doom is elemental.

Placing Bridge of Doom is a truth state that varies. Placing Bridge of Doom is false.

A placement possible rule:
	unless placing Bridge of Doom is true:
		if considered room is Bridge of Doom:
			unless considered-z is z-coordinate of original room:
				rule fails;
			let x-diff be considered-x minus x-coordinate of original room;
			let y-diff be considered-y minus y-coordinate of original room;
			let z-diff be considered-z minus z-coordinate of original room;
			let x be considered-x plus x-diff;
			let y be considered-y plus y-diff;
			let z be considered-z plus z-diff;
			unless the space at x by y by z is free:
				if the room at x by y by z is not connectable:
					rule fails;
			now x is considered-x;
			now y is considered-y;
			now z is considered-z - 1;
			unless the space at x by y by z is free:
				rule fails; [always placing Lake of Lava under Bridge of Doom]
		if original room is Bridge of Doom:
			rule fails.
			
An additional placement rule:
	if additional considered room is Bridge of Doom:
		now placing Bridge of Doom is true;
		let x-diff be x-coordinate of Bridge of Doom minus x-coordinate of original room;
		let y-diff be y-coordinate of Bridge of Doom minus y-coordinate of original room;
		let z-diff be z-coordinate of Bridge of Doom minus z-coordinate of original room;
		let x be x-coordinate of Bridge of Doom plus x-diff;
		let y be y-coordinate of Bridge of Doom plus y-diff;
		let z be z-coordinate of Bridge of Doom plus z-diff;
		if the space at x by y by z is free:
			let chosen room be a suitable room from Bridge of Doom at x by y by z;
			place chosen room from Bridge of Doom at x by y by z;
		otherwise:
			let place be the room at x by y by z;
			let way be the direction from Bridge of Doom to place;
			change the way exit of Bridge of Doom to place;
			let reverse be the opposite of way;
			change the reverse exit of place to Bridge of Doom;
		now x is x-coordinate of Bridge of Doom;
		now y is y-coordinate of Bridge of Doom;
		now z is z-coordinate of Bridge of Doom - 1;	
		place Lake of Lava from Bridge of Doom at x by y by z;
		now placing Bridge of Doom is false.

An AI action selection rule for an at-React person (called P) when the location is Bridge of Doom (this is the do not dodge on the Bridge of Doom rule):
	unless P is flying:
		choose row with an Option of the action of P dodging in the Table of AI Action Options;
		decrease the Action Weight entry by 100.

Player-vulnerable-to-bridge is a truth state that varies. Player-vulnerable-to-bridge is false.

After an actor hitting (this is the better not dodge on bridge of doom rule):
	if the location is the bridge of doom and the global defender can move:
		if the player is the global defender and the player is at dodge:
			if the attack strength is less than the defence of the global defender:
				unless the player is flying:
					if player-vulnerable-to-bridge is true:
						say "You successfully dodge the attack of [the global attacker]. Since there is no place to dodge to on the narrow bridge, your maneuver continues with an involuntary downward movement.";
						end the story saying "You fell into the lava";
						stop the action;
					otherwise:
						say "You successfully dodge the attack of [the global attacker]. Since there is no place to dodge to on the narrow bridge, your maneuver almost ends in a drop down into the lava -- but you manage to [bold type]regain your balance[roman type] almost miraculously. This is something you might not want to try again.";
						now player-vulnerable-to-bridge is true;
	continue the action.

An aftereffects rule (this is the hit may send you off the bridge of doom rule):
	if global defender can fall:
		if the location is the bridge of doom and the global defender is alive:
			if the attack damage is greater than 0:
				let n be a random number between 0 and 12;
				if n is less than the attack damage:
					say "Reeling from the blow, [the global defender] balance[s] on the edge of the bridge. [italic type][run paragraph on]";
					let n be a random number between 6 and 10;
					test the body of the global defender against n;
					say "[roman type][run paragraph on]";
					if test result is false:
						if the global defender is the player:
							if player-vulnerable-to-bridge is true:
								say " You frantically try to stay on the bridge, but to no avail. Your left foot slips, and you tumble down towards fiery death.";
								have a falling event with the global defender falling in Bridge of Doom for reason 1;
								stop the action;
							otherwise:
								say " You frantically try to stay on the bridge, slip, slide past the edge -- and then, somehow, manage to regain your footing at the last moment. That was some extraordinary luck.";
								now player-vulnerable-to-bridge is true;
						otherwise:
							say " [The global defender] slips and falls, disappearing into the lava below.";
							have a falling event with the global defender falling in Bridge of Doom for reason 1;
					otherwise:
						say " [The global defender] manage[s] to stay on the bridge.".


Exceedingly narrow bridge is scenery in Bridge of Doom. The description of exceedingly narrow bridge is "You doubt there is enough room on the bridge to safely dodge an attack.".

Seething lake of lava is a scenery open enterable container in Bridge of Doom. The description of seething lake of lava is "Molten rock -- whether heated by natural or by unnatural means you cannot say.".

Carry out entering the seething lake of lava:
	end the story saying "You committed suicide.";
	say "On a whim, you jump down into the lava." instead.

Carry out direction-jumping down in Bridge of Doom:
	try entering the seething lake of lava instead.

Instead of going down in Bridge of Doom:
	try entering the seething lake of lava instead.

First carry out inserting something into the seething lake of lava:
	remove the noun from play;
	say "You throw [the noun] into the lava." instead.
				




Chapter - Temple of Nomos

The Temple of Nomos is a room. "The exactly elliptical room is dominated by a towering statue of Nomos, built out of harsh geometrical forms."

Temple of Nomos is connectable.
Temple of Nomos is not connection-inviting.
Temple of Nomos is placeable.
Temple of Nomos is habitable.
Temple of Nomos is treasurable.
Temple of Nomos is extra-accepting.
Temple of Nomos is consecrated.
Temple of Nomos is vp-agnostic.
Temple of Nomos is religious.

The statue of Nomos is scenery in Temple of Nomos. The description of the statue of Nomos is "While neither cruel nor evil, Nature as Law is the most uncaring and least merciful of all gods. His dictates are obeyed, not out of fear, but out of necessity. Praying to Nomos can be beneficial -- if you are willing to submit to his commands." Understand "god" and "deity" as the statue of Nomos.

Instead of attacking the statue of Nomos:
	say "For aeons, warmth and coldness, air and water, and all the internal material tensions have wrought their slow changes on the atomic structure of the statue of Nomos. This is the exact moment when the critical limit is reached, and Nomos[apostrophe] massive marble fist breaks free and surrenders itself to the laws of gravity. Your body underneath is forced to surrender as well.";
	end the story saying "You were crushed". 

Instead of climbing the statue of Nomos:
	say "It is far too smooth for you to climb.".

The Nomos counter is a number that varies. The Nomos counter is 0.
The Nomos wrath counter is a number that varies. The Nomos wrath counter is 0.
The Nomos bonus is a truth state that varies. The Nomos bonus is false.

Every turn (this is the decrease the Nomos counter rule):
	if the main actor is the player:
		if Nomos counter is greater than 0:
			decrease Nomos counter by 1;
			if Nomos counter is 0:
				now Nomos bonus is true.
			
Every turn (this is the decrease the Nomos wrath counter rule):
	if the main actor is the player:
		if Nomos wrath counter is greater than 0:
			decrease Nomos wrath counter by 1;
			if the Nomos wrath counter is 0:
				say "From the beginning of time, all the Universe's constituent particles have traced their preordained paths, to arrive at their present constellation -- a rare constellation in which all the thermal energy of your body is suddenly transferred to the air and dissipates. Your blood freezes, and you die.";
				end the story saying "The last thing you hear is booming but mirthless laughter".

Instead of praying in Temple of Nomos:
	if the Nomos counter is greater than 0:
		say "You pray again, even though Nomos has already given you his decree. Will your iniquity go unpunished?";
		if Nomos wrath counter is 0:
			now Nomos wrath counter is a random number between 5 and 50;
			if a random chance of 1 in 3 succeeds:
				now Nomos wrath counter is 0;
	otherwise:
		now Nomos counter is a random number between 1 and 5;
		say "A deep voice inside your head speaks: 'You will attack [Nomos counter] turns from now. The law will be with you.'".


		
Before reading a command (this is the planning notification rule):
	if the main actor is the player:
		if the Nomos bonus is true:
			say "[bold type](Remember: Nomos has told you to attack this turn.)[roman type][line break]".		

First every turn rule (this is the Nomos bonus is false rule):
	if the main actor is the player:
		now Nomos bonus is false.

Before not attacklike behaviour:
	if Nomos bonus is true:
		if combat state of the actor is not at-react:
			if the main actor is the player and the actor is the player:
				if at least one hostile alive person is enclosed by the location:
					let X be a random hostile person enclosed by the location;
					say "You plan on [current action], but find yourself attacking [the X] instead.";
					try attacking X instead;
				otherwise:
					say "You plan on [current action], but find your body attacking itself instead!";
					try the player hitting the player instead;
					if the player is dead:
						end the story saying "Nomos is not to be toyed with".

Before attacklike behaviour when Nomos counter is greater than 0:
	say "Deciding to break the command of Nomos, you plan on attacking [the noun]. However, you find yourself ";
	if player is not the main actor:
		say "doing nothing instead." instead;
	otherwise:
		if a random number between 1 and 5 is:
			-- 1: say "doing nothing instead.";
				try waiting instead;
			-- 2: say "concentrating instead.";
				try concentrating instead;
			-- 3:
				if the player carries at least one thing:
					let X be a random thing carried by the player;
					say "dropping [the X] instead.";
					try dropping X instead;
				otherwise: 
					say "praising the god instead." instead;
			-- 4: say "speaking a language you have never heard instead." instead;
			-- 5: say "contemplating the inevitability of Death instead." instead.

An attack modifier rule (this is the Nomos attack bonus rule):
	if Nomos bonus is true and the global attacker is the player:
		if the numbers boolean is true, say " + 2 (the law is with you)[run paragraph on]";
		increase the attack strength by 2.

A damage modifier rule (this is the Nomos damage bonus rule):
	if Nomos bonus is true and the global attacker is the player:
		let n be 0;
		if the global defender provides the property level:
			now n is 1 + level of the global defender;
		otherwise:
			now n is 2;
		if the numbers boolean is true, say " + [n] (the law is with you)[run paragraph on]";
		increase the attack damage by n.


		


Chapter - Temple of Aite

The Temple of Aite is a room. "The black stones have been scratched in a million fights, and will nevermore lose the faint colour of blood. This is the temple of Aite, whose laughing statue rises above all."

Temple of Aite is connectable.
Temple of Aite is not connection-inviting.
Temple of Aite is placeable.
Temple of Aite is habitable.
Temple of Aite is treasurable.
Temple of Aite is extra-accepting.
Temple of Aite is consecrated.
Temple of Aite is vp-agnostic.
Temple of Aite is religious.

The statue of Aite is scenery in Temple of Aite. The description of the statue of Aite is "A vast statue made of razor sharp weapons. The goddess of chaos and destruction is a dangerous one to worship -- but it can be worth it.". Understand "god" and "deity" as the statue of Aite.

The Aite wrath state is a number that varies. The Aite wrath state is 0. [-1: angry; +1 pleased]

Instead of attacking the statue of Aite:
	say "You experimentally whack the statue a couple of times, but it doesn't seem to budge. Has this pleased the goddess, or angered her?";
	if a random chance of 4 in 9 succeeds:
		now the Aite wrath state is 1; [good]
	otherwise:
		now the Aite wrath state is -1. [bad]

Instead of touching the statue of Aite:
	try climbing the statue of Aite.

Instead of climbing the statue of Aite:
	say "You cut yourself badly as soon as you touch the statue.";
	decrease the health of the player by 3;
	if the health of the player is less than 1:
		end the story saying "You sacrificed yourself to Aite".

Instead of praying in Temple of Aite (this is the Aite prayer rule):
	do the Aite prayer.
	
To do the Aite prayer:	
	say "You ask Aite for help in battle, and [run paragraph on][if player is beloved of Aite]confidently[otherwise]anxiously[end if] await the consequences.[line break][paragraph break]";
	if the Aite counter is 0:
		now the Aite counter is a random number between 2 and 12.
	
The Aite counter is a number that varies. The Aite counter is 0.

Every turn (this is the decrease the Aite counter rule):
	if Aite counter is greater than 0:
		decrease Aite counter by 1;
		if Aite counter is 0:
			have Aite intervene.

To have Aite intervene:
	let p be the final spirit of the player;
	let aite damage bonus be 0;
	let n be a random number between 1 and 6;
	if power of the fanatics of aite is granted:
		if a random chance of p in 50 succeeds:
			now n is a random number between 2 and 6;
		now aite damage bonus is p divided by 5;
	if Aite wrath state is 1 and n is less than 4:
		increase n by 3;
	if Aite wrath state is -1 and n is greater than 3:
		decrease n by 3;  [1-3 are bad, 4-6 are good]
	if player is beloved of Aite:
		increase n by 1;
	if at least one hostile alive person is enclosed by the location:
		repeat with guy running through hostile alive persons enclosed by the location:
			if guy is beloved of Aite:
				if a random chance of 1 in 2 succeeds, decrease n by 1;
	if n is greater than 6, now n is 6;
	if n is less than 1, now n is 1;
	let X be permanent health of the player;
	now X is X divided by 8; [the standard unit of damage is 12.5% of the maximum health of the player, rounded down]
	increase X by aite damage bonus; [increased by spirit / 5 if the player has the power of aite]
	unless at least one hostile alive person is enclosed by the location:
		if n is greater than 2:
			make no decision;
	let guy be a random hostile alive person enclosed by the location;
	if n is:
		-- 1: 
			say "A gigantic [one of]sword[or]spear[or]pike[at random] bursts out of the ground, skewering you for [bold type][X times 2] damage[roman type]!";
			decrease the health of the player by X times 2;
			unless the player is dead:
				let the player lose concentration;
				if the player is hidden:
					now the player is not hidden;
					say "Your cry of pain reveals your presence.";
			if health of the player is less than 1:
				end the story saying "Aite is a dangerous mistress";
		-- 2: 
			say "A huge [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling you for [bold type][X] damage[roman type]!";
			decrease the health of the player by X;
			unless the player is dead:
				let the player lose concentration;
			if health of the player is less than 1:
				end the story saying "Aite is a dangerous mistress";
		-- 3:
			if the concentration of the guy is less than 3:
				say "[The guy] suddenly looks [bold type]highly concentrated[roman type], as if divinely inspired.";
				now the concentration of the guy is 3;
		-- 4:
			if the concentration of the player is less than 3:
				say "You suddenly feel divinely inspired and [bold type]highly concentrated[roman type].";
				now the concentration of the player is 3;
		-- 5: 
			say "A huge [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling [the guy] for [bold type][X] damage[roman type]!";
			decrease the health of the guy by X;
			unless guy is dead:
				let the guy lose concentration;			
			if health of the guy is less than 1:
				now the global attacker is the player;
				now the global defender is the guy;
				consider the grant powers when a monster is slain rule;
		-- 6: 
			say "A gigantic [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling [the guy] for [bold type][X times 2] damage[roman type]!";
			decrease the health of the guy by X times 2;
			unless guy is dead:
				let the guy lose concentration;			
			if health of the guy is less than 1:
				now killer-guy is the player;
				now killed-guy is the guy;
				consider the grant powers when a monster is slain rule.


An attack modifier rule (this is the Aite-loved bonus in Temple of Aite rule):
	if the location is the Temple of Aite:
		if the global attacker is beloved of Aite:
			if the numbers boolean is true, say " + 2 (beloved of Aite)[run paragraph on]";
			increase the attack strength by 2.

Chance to win rule (this is the CTW Aite bonus rule):
	if the location is the Temple of Aite:
		if the global attacker is beloved of Aite:
			increase the chance-to-win by 2.


Chapter - Temple of Sul

The Temple of Sul is a room. "The only feature breaking the monotony of the circular room made of polished white marble is a huge [if the statue of Sul is in the Temple of Sul]statue. Hewn from flawless mountain crystal, it portrays the goddess Sul[otherwise]pile of fragments of the broken statue[end if]."

Temple of Sul is connectable.
Temple of Sul is not connection-inviting.
Temple of Sul is placeable.
Temple of Sul is habitable.
Temple of Sul is treasurable.
Temple of Sul is extra-accepting.
Temple of Sul is consecrated.
Temple of Sul is vp-agnostic.
Temple of Sul is religious.

The statue of Sul is scenery in Temple of Sul. The description of the statue of Sul is "This is the crystal-clear statue of Sul, goddess of blessings and purification. She has been known to lift curses; but she has also been rumoured to hate spurious prayers.". Understand "god" and "deity" as the statue of Sul.

The pile of fragments is scenery. The description of the pile of fragments is "This crystal rubble is all that is left of the proud statue of Sul.". Instead of taking the pile of fragments: say "For reasons that cannot be merely physical, you are unable to move the rubble". Understand "rubble" and "broken" and "statue" and "crystal" as the pile of fragments.


Instead of attacking the statue of Sul:
	say "As soon as you strike the statue, it shatters into a thousand pieces.";
	remove the statue of Sul from play;
	move the pile of fragments to the temple of sul;
	repeat with item running through things:
		if a random chance of 9 in 10 succeeds:
			unless item is incorruptible, now item is cursed. 

Instead of touching the statue of Sul:
	try climbing the statue of Sul.

Instead of climbing the statue of Sul:
	say "You attempt to climb Sul's statue, but it so smooth that you make no progress at all.".

Maximum prayers to Sul is a number that varies.
When play begins:
	now maximum prayers to Sul is a random number between 1 and 3.

Instead of praying in Temple of Sul:
	unless the statue of Sul is in the Temple of Sul:
		say "Praying has little effect, now that the statue has been destroyed.";
	otherwise:
		unless the maximum prayers to Sul is greater than 0:
			say "You pray, but there is no answer.";
		otherwise:
			if the player has at least one uncurseable thing:
				let K be a list of things;
				repeat with item running through uncurseable things had by the player:
					if hidden identity of item is not non-thing and hidden identity of item is corruptible:
						now hidden identity of item is not cursed;
					if item is corruptible:
						now item is not cursed;
					add item to K; [we uncurse the hidden identity, but we do not reveal it!]
				say "Sul uncurses [K with definite articles].";
				decrease maximum prayers to Sul by 1;
			otherwise if the player has at least one cursed thing:
				say "Unfortunately, Sul cannot help you.";
			otherwise:
				say "Sul is displeased with your spurious prayer!";
				now maximum prayers to Sul is 0;
				if the player has at least one corruptible not cursed thing:
					let item be a random corruptible not cursed thing had by the player;
					now item is cursed;
					now item is curse-identified.




Chapter - Temple of Isatzo

The Temple of Isatzo is a room. "Exactly half of the room is black, and exactly half of it is white. This is the temple of Isatzo, the god of balance, whose statue stands in the center, one arm stretched out to each side."

Temple of Isatzo is connectable.
Temple of Isatzo is connection-inviting.
Temple of Isatzo is placeable.
Temple of Isatzo is habitable.
Temple of Isatzo is treasurable.
Temple of Isatzo is extra-accepting.
Temple of Isatzo is consecrated.
Temple of Isatzo is vp-agnostic.
Temple of Isatzo is religious.

The unlock level of Temple of Isatzo is 5.
The unlock text of Temple of Isatzo is "a temple dedicated to the fickle god of balance"

The statue of Isatzo is scenery in Temple of Isatzo. The description of the statue of Isatzo is "Made of grey stone, the statue of Isatzo offers one healing and one punishing hand to the world. He looks on mankind with one auspicious and one dropping eye, in equal scale weighing delight and dole.". Understand "god" and "deity" as the statue of Isatzo.

Instead of attacking the statue of Isatzo:
	say "The statue seems impervious to harm.". 

Instead of touching the statue of Isatzo:
	try climbing the statue of Isatzo.

Instead of climbing the statue of Isatzo:
	say "For every meter you climb, you glide one meter down.".

Understand "auspicious" and "dropping" and "eye" and "arm" and "arms" as the statue of Isatzo.

The Isatzo time-out is a number that varies. The Isatzo time-out is 0.

Every turn (this is the decrease the Isatzo time-out each turn rule):
	if the main actor is the player and the Isatzo time-out is greater than 0:
		decrease Isatzo time-out by 1;
		if Isatzo time-out is 0 and player is in Temple of Isatzo:
			say "Isatzo is available for prayer again.".
	
Instead of praying in the Temple of Isatzo:
	if the combat status is peace:
		take no time;
		say "There is nothing for Isatzo to balance here -- you must be engaged in a fight.";
	otherwise:
		if Isatzo time-out is greater than 0:
			take no time;
			say "The time for a new intervention by Isatzo has not yet come.";
		otherwise:
			now Isatzo time-out is a random number between 2 and 10;
			let guy be the player;
			while the faction of guy does not hate the faction of the player:
				let guy be a random person enclosed by the location; [this cannot fail, since hate is present]
			let m be a random number between 1 and 4;
			if m is 1:
				let n be concentration of guy + concentration of player;
				increase n by 1;
				now n is n divided by 2;
				now concentration of guy is n;
				now concentration of the player is n;
				say "Isatzo sets your concentration and that of [the guy] to [if n is 0]none[otherwise if n is 1]mild[otherwise if n is 2]medium[otherwise if n is 3]maximal[end if].";
			if m is 2:
				if health of guy is health of player:
					say "Isatzo feels your health and that of [the guy] are already balanced enough.";
				otherwise:
					let n be health of guy minus health of player;
					let n be absolute value of n;
					increase n by 1;
					now n is n divided by 2;
					if health of guy is less than health of player:
						say "Isatzo transfers [n] health from you to [the guy].";
						increase health of the guy by n;
						decrease health of the player by n;
					if health of guy is greater than health of player:
						say "Isatzo transfers [n] health from [the guy] to you.";
						decrease health of the guy by n;
						increase health of the player by n;
			if m is 3:
				if a random chance of 1 in 2 succeeds:
					let i be the number of things had by the player;
					let j be the number of things had by guy;
					let k be i + j;
					if i is j or k is 0:
						say "Isatzo feels your items and those of [the guy] are well-balanced.";
					if i is greater than j:
						let item be a random not readied thing had by the player;
						say "Isatzo decides to give your [item] to [the guy].";
						move item to guy;
					if j is greater than i:
						let item be a random not readied thing had by the guy;
						say "Isatzo decides to give [possessive of the guy] [item] to you.";
						move item to player;
				otherwise:
					let n be a random number between 0 and 3;
					if a random chance of 1 in 2 succeeds:
						now concentration of the player is n;
						say "To balance the combat, Isatzo sets your concentration to [if n is 0]none[otherwise if n is 1]mild[otherwise if n is 2]medium[otherwise if n is 3]maximal[end if].";
					otherwise:
						now concentration of guy is n;
						say "To balance the combat, Isatzo sets the concentration of [the guy] to [if n is 0]none[otherwise if n is 1]mild[otherwise if n is 2]medium[otherwise if n is 3]maximal[end if].";
			if m is 4:
				let item be a random readied weapon enclosed by the player;
				if a random chance of 1 in 2 succeeds:
					say "Isatzo decides that your [item] is imbalanced and needs a buff (permanent +1 attack bonus).";
					increase weapon attack bonus of item by 1;
				otherwise:
					say "Isatzo decides that your [item] is imbalanced and needs a nerf (permanent -1 attack bonus).";
					decrease weapon attack bonus of item by 1.


Chapter - The Crypt

The Crypt is a room. "Skulls and bones lie scattered amongst the ruined tombs. One big sarcophagus is still intact, and currently [if the sarcophagus is open]open[otherwise]closed[end if]."

The Crypt is connectable.
The Crypt is not connection-inviting.
The Crypt is placeable.
The Crypt is not habitable.
The Crypt is treasurable.
The Crypt is extra-accepting.
The Crypt is vp-underground.
The Crypt is deathly.

Ruined tombs is scenery in the crypt. Understand "skulls" and "skull" and "bones" and "bone" as the ruined tombs. The description of the ruined tombs is "Broken and useless.". Instead of taking the ruined tombs: say "You do not find anything useful among the debris.".

The sarcophagus is a closed openable scenery container in The Crypt. Understand "tomb" as the sarcophagus. The description of the sarcophagus is "A marble monstrosity carved with skeletons and other symbols of death.".

The symbols of death are scenery in The Crypt. The symbols of death are plural-named. Understand "skeletons" and "formula" as the symbols of death. The description of the symbols of death is "The symbols seem to spell out a magical formula. Your knowledge of necromancy is limited, and the only way to find out what the formula does would be by reading it.".

Symbols-of-death-number is a number that varies. Symbols-of-death-number is 0.

Instead of reading the symbols of death:
	if Symbols-of-death-number is 0:
		now Symbols-of-death-number is 1;
		let n be a random number between 1 and 5;
		if n is less than 3:
			say "You either fail to pronounce the symbols correctly, or the spell has lost its power, for there is no effect.";
		if n is 3:
			unless ghoul-form is form-active:
				say "As you read the symbols, your flesh starts to rot and most of your vital functions cease. You have been turned into a ghoul!";
				ghoulify the player;
			otherwise:
				say "You feel your flesh crawl.";
		if n is 4: 
			unless the player is hidden:
				now the player is hidden;
				say "As you speak the spell, you blend into the shadows.";
			otherwise:
				say "You feel mysterious.";
		if n is 5:
			say "As you read the symbols of death, you feel an immense power surge through your body. It is either intensely hot or inhumanly cold; the difference is impossible to tell. You finish reading the spell, and wonder what you have been given, and whether it is a blessing or a curse.";
			if a random chance of 1 in 2 succeeds:
				now the player is death-blessed;  [See systems.]
			otherwise:
				now the player is death-cursed;
	otherwise:
		say "You read the symbols once again, but nothing happens.";
	stop the action.

The sarcophagus-inhabitant is a person that varies. The sarcophagus-inhabitant is yourself. [No other default value.]

Treasure placement rule (this is the fill the sarcophagus rule):
	if the crypt is placed:
		if a random chance of 1 in 2 succeeds:
			place 1 of minor things in the sarcophagus;
		if a random chance of 1 in 5 succeeds:
			place 1 of major things in the sarcophagus;
		if a random chance of 1 in 12 succeeds:
			place 1 of epic things in the sarcophagus;
		if a random chance of 3 in 7 succeeds:
			let X be a random off-stage undead person;
			now sarcophagus-inhabitant is X.

Report opening the sarcophagus:
	if the sarcophagus-inhabitant is not yourself:
		if the sarcophagus-inhabitant is not off-stage or the sarcophagus-inhabitant is dead:
			now the sarcophagus-inhabitant is yourself;
	if the sarcophagus-inhabitant is not yourself and the sarcophagus contains less than one thing:
		move sarcophagus-inhabitant to the location of the sarcophagus;
		now the player is not hidden;
		say "As you open the sarcophagus, [a sarcophagus-inhabitant] jumps out!" instead;
	if the sarcophagus-inhabitant is not yourself and the sarcophagus encloses at least one things:
		move sarcophagus-inhabitant to the location of the sarcophagus;
		now the player is not hidden;
		say "As you open the sarcophagus, you see [a list of things enclosed by the sarcophagus]; but also [a sarcophagus-inhabitant] jumping out of it!" instead;
	if the sarcophagus-inhabitant is yourself and the sarcophagus encloses at least one thing:
		say "The sarcophagus contains [a list of things enclosed by the sarcophagus]." instead;
	if the sarcophagus-inhabitant is yourself and the sarcophagus contains less than one thing:
		say "The sarcophagus is disappointingly empty. Some other grave robber must have been here before you." instead. 

Instead of entering the sarcophagus:
	say "One should not joke with death.".


Chapter - Workshop of the Blademaster

Workshop of the Blademaster is a room. "The famous workshop of the master of Algir has been transported here in all its glory. A huge forge dominates the room."

Workshop of the Blademaster is connectable.
Workshop of the Blademaster is not connection-inviting.
Workshop of the Blademaster is placeable.
Workshop of the Blademaster is habitable.
Workshop of the Blademaster is treasurable.
Workshop of the Blademaster is extra-accepting.
Workshop of the Blademaster is vp-agnostic.
Workshop of the Blademaster is civilised.

The huge forge is scenery in Workshop of the Blademaster. The huge forge is an open enterable container. The description of the huge forge is "Some say the Blademaster sold his soul for this forge. Whether infernal or simply magical, it is continually heated by ever-burning sulphur unconsumed, and has been used to craft wonders. Even someone as unskilled as you can insert weapons into it in order to heat them up.". Understand "sulphur" and "fire" as the huge forge.

Carry out entering the huge forge:
	say "You decide to test whether the inside of the forge is truly as hot as hell. Your experience is consistent with the stories.";
	end the story saying "Only a little carbon remains of you.".

Every turn when the huge forge contains at least one thing (this is the huge forge rule):
	repeat with item running through things enclosed by huge forge:
		now heat strength of item is 9.


Chapter - Space-Time Discontinuum

Space-Time Discontinuum is a room. "Here powerful sorcerers once tortured time to learn the secrets of eternity. Everything around you seems to happen either faster or slower than it should."

Space-Time Discontinuum is connectable.
Space-Time Discontinuum is not connection-inviting.
Space-Time Discontinuum is placeable.
Space-Time Discontinuum is habitable.
Space-Time Discontinuum is treasurable.
Space-Time Discontinuum is extra-accepting.
Space-Time Discontinuum is vp-agnostic.
Space-Time Discontinuum is magical.

The difficulty level of Space-Time Discontinuum is 1. [Too weird for newbies.]
The rarity of Space-Time Discontinuum is 1. [Placed less often.]

The unlock level of Space-Time Discontinuum is 10.
The unlock text of Space-Time Discontinuum is "a weird place where time functions differently than elsewhere".

An initiative update rule (this is the initiative is almost completely random in Space-Time Discontinuum rule):
	if location is Space-Time Discontinuum and the location is not initiative-conferring:
		repeat with X running through all alive persons enclosed by the location:				
			now the initiative of X is a random number between 0 and 100.


Chapter - Vast Staircase

The Vast Staircase is a room. "A vast staircase spirals up and down[if staircase still goes down]. In a pinch, you would be able to jump down to the room below, although this might not be particularly healthy[end if]."

Vast Staircase is connectable.
Vast Staircase is not connection-inviting.
Vast Staircase is placeable.
Vast Staircase is habitable.
Vast Staircase is treasurable.
Vast Staircase is extra-accepting.
Vast Staircase is vp-agnostic.
Vast Staircase is barren.

Placing Vast Staircase is a truth state that varies. Placing Vast Staircase is false.

[Because it is only considered when moving up or down, we boost the likelihood of the VS a little in those circumstances.]

A placement scoring rule (this is the Vast Staircase has higher probability rule):
	if considered room is Vast Staircase:
		increase current room score by 1.

A placement possible rule:
	unless placing Vast Staircase is true:
		if considered room is Vast Staircase:
			unless considered-z is not z-coordinate of original room:
				rule fails;
			let x-diff be considered-x minus x-coordinate of original room;
			let y-diff be considered-y minus y-coordinate of original room;
			let z-diff be considered-z minus z-coordinate of original room;
			let x be considered-x plus x-diff;
			let y be considered-y plus y-diff;
			let z be considered-z plus z-diff;
			unless the space at x by y by z is free:
				if the room at x by y by z is not connectable:
					rule fails;
		if original room is Vast Staircase:
			rule fails.
			
An additional placement rule:
	if additional considered room is Vast Staircase:
		now placing Vast Staircase is true;
		let x-diff be x-coordinate of Vast Staircase minus x-coordinate of original room;
		let y-diff be y-coordinate of Vast Staircase minus y-coordinate of original room;
		let z-diff be z-coordinate of Vast Staircase minus z-coordinate of original room;
		let x be x-coordinate of Vast Staircase plus x-diff;
		let y be y-coordinate of Vast Staircase plus y-diff;
		let z be z-coordinate of Vast Staircase plus z-diff;
		if the space at x by y by z is free:
			let chosen room be a suitable room from Vast Staircase at x by y by z;
			place chosen room from Vast Staircase at x by y by z;
		otherwise:
			let place be the room at x by y by z;
			let way be the direction from Vast Staircase to place;
			change the way exit of Vast Staircase to place;
			let reverse be the opposite of way;
			change the reverse exit of place to Vast Staircase;
		now placing Vast Staircase is false.

To decide whether the staircase still goes down:  [The player may collapse the passage.]
	let place be the room down from Vast Staircase;
	if place is a room:
		decide yes;
	otherwise:
		decide no.

Check direction-jumping down in Vast Staircase:
	unless staircase still goes down:
		take no time;
		say "That passage no longer exists." instead.

Check direction-jumping down in Vast Staircase:
	unless the player can move:
		take no time;
		say "Right now, you cannot move." instead.

Carry out direction-jumping down in Vast Staircase:
	say "You jump down the vast staircase.";
	have a falling event with actor falling in Vast Staircase for reason 2;
	do nothing instead.

An aftereffects rule (this is the hit may send you off the vast staircase rule):
	if staircase still goes down:
		if the global defender can fall:
			if the location is the vast staircase and the global defender is alive:
				if the attack damage is greater than 0:
					let n be a random number between 0 and 16;
					if n is less than the attack damage:
						say "Reeling from the blow, [the global defender] balance[s] on the edge of the staircase. [italic type]";
						let n be a random number between 6 and 11;
						test the body of the global defender against n;
						say "[roman type]";
						if test result is false:
							if the global defender is the player:
								say " You frantically try to stay on the staircase, but to no avail. Your right foot slips, and you tumble down. ";
							otherwise:
								say " [The global defender] slips and falls!";
							have a falling event with global defender falling in Vast Staircase for reason 1;								
						otherwise:
							say " [The global defender] manage[s] to stay on the staircase.".

A thing called the staircase is scenery in vast Staircase. Understand "stairs" as the staircase. The description of the staircase is "The staircase winds around the wall, leaving the middle of the room empty.". Instead of climbing the staircase: try going up.



Chapter - Alchemical Laboratory

The Alchemical Laboratory is a room. "Centuries ago, Malygris captured the great alchemist Metastasio and forced him to work in this laboratory. Most of his equipment is now gone, but one curious machine remains."

Alchemical Laboratory is connectable.
Alchemical Laboratory is not connection-inviting.
Alchemical Laboratory is placeable.
Alchemical Laboratory is habitable.
Alchemical Laboratory is treasurable.
Alchemical Laboratory is extra-accepting.
Alchemical Laboratory is vp-agnostic.
Alchemical Laboratory is alchemical.

The curious machine is scenery in alchemical laboratory. The curious machine is an open container. The material of the curious machine is iron. The description of the curious machine is "You have no idea how this machine works, but it seems that you can insert an item into it.".

Last check inserting something into the curious machine:
	if the noun is a grenade:
		say "The machine beeps angrily and rejects [the noun].";
	otherwise:
		if more than zero grenades are off-stage:
			let chosen grenade be a random flash grenade;
			let m be a random number between 1 and 4;
			if m is 2, now chosen grenade is a random rust grenade;
			if m is 3, now chosen grenade is a random fragmentation grenade;
			if m is 4, now chosen grenade is a random smoke grenade;
			let item be a new object cloned from chosen grenade;
			move item to the location;
			remove the noun from play;
			say "You put [the noun] in the curious machine. It starts clicking and beeping, and after a short while, [an item] drops on the ground.";
		otherwise:
			say "You put [the noun] in the curious machine, but when nothing happens, you take it out again.";
	rule succeeds.



Chapter - Hall of Vapours

Pipes-open is a truth state that varies.

A dungeon interest rule (this is the open or close pipes in Hall of Vapours rule):
	if a random chance of 3 in 4 succeeds:
		now pipes-open is true;
	otherwise:
		now pipes-open is false.

The Hall of Vapours is a room. "Several large pipes [if pipes-open is true]continuously spew forth vapours into this room[otherwise]dominate the room[end if]. A big wheel is attached to the pipes."

Hall of Vapours is connectable.
Hall of Vapours is connection-inviting.
Hall of Vapours is placeable.
Hall of Vapours is habitable.
Hall of Vapours is treasurable.
Hall of Vapours is extra-accepting.
Hall of Vapours is vp-agnostic.
Hall of Vapours is alchemical.

Understand "vapours" and "vapour" as the clouds of smoke.

The large pipes are scenery in Hall of Vapours. The description of large pipes is "You wonder whether these are actual chimneys or tiny portals to some smoke-filled hell.". The large pipes are iron.

The big wheel is part of the pipes. The description of the big wheel is "This wheel can be turned to open or close the pipes.".

Instead of opening the pipes:
	if pipes-open is true:
		take no time;
		say "The pipes are already open.";
	otherwise:
		try turning the big wheel.
		
Instead of closing the pipes:
	if pipes-open is false:
		take no time;
		say "The pipes are already closed.";
	otherwise:
		try turning the big wheel.

Instead of turning the big wheel:
	if pipes-open is true:
		now pipes-open is false;
	otherwise:
		now pipes-open is true;
	say "With a mighty push, you turn the wheel. [if pipes-open is true]Smoke immediately starts pouring forth from the pipes[otherwise]Smoke stops coming from the pipes[end if].".
	
Instead of pushing the wheel:
	try turning the wheel.
	
Instead of pulling the wheel:
	try turning the wheel.
	
Instead of switching on the pipes:
	try opening the pipes.
	
Instead of switching off the pipes:
	try closing the pipes.

Smoke rule (this is the smoke the Hall of Vapours rule):
	if test room is Hall of Vapours and pipes-open is true:
		if temporary smoke timer is less than 10:
			now temporary smoke timer is 10.
			


Chapter - Portal Room

Portal Room is a room. "A huge [if the huge magical portal is in Portal Room]magical[otherwise]empty[end if] portal dominates the room."

Portal Room is connectable.
Portal Room is not connection-inviting.
Portal Room is placeable.
Portal Room is habitable.
Portal Room is treasurable.
Portal Room is extra-accepting.
Portal Room is vp-agnostic.
Portal Room is magical.

The huge magical portal is scenery in Portal Room. The description of huge magical portal is "You can enter this portal -- but who knows where you will be getting out?".

A thing called the huge empty portal is scenery. The description of the huge empty portal is "The magical field gone, the portal now seems pretty useless.".

Instead of entering the huge magical portal:
	teleport the player;
	if a random chance of 1 in 4 succeeds:
		remove huge magical portal from play;
		move huge empty portal to Portal Room.

Instead of entering the huge empty portal:
	take no time;
	say "The magical field has dissipated, and the portal is now useless.".


Chapter - Library

Library is a room. "Hundreds of books line the walls of this magnificent library, a bigger collection than the already legendary one of the marquis of Savon. Malygris even has a scroll analyser installed."

Library is connectable.
Library is not connection-inviting.
Library is placeable.
Library is habitable.
Library is treasurable.
Library is extra-accepting.
Library is vp-agnostic.
Library is civilised.

Hundreds of books are scenery in library. Understand "book" as the hundreds of books. The description of hundreds of books is "These tomes appear to be written in many different alphabets, but none you can make any sense of.".
Instead of taking the hundreds of books: say "You'd love to partake of the undoubtedly forbidden knowledge stored in them, but you cannot read any of the alphabets -- and there is little doubt that the languages would be equally unfamiliar to you.".
Instead of reading the hundreds of books: try taking the hundreds of books.
Instead of burning the hundreds of books: say "You are not a barbarian!".
The material of hundreds of books is paper.

The scroll analyser count is a number that varies.

When play begins (this is the set scroll analyser count rule):
	now scroll analyser count is 1;
	if a random chance of 1 in 2 succeeds:
		increase scroll analyser count by 1;	
	if a random chance of 1 in 2 succeeds:
		increase scroll analyser count by 1;
	if a random chance of 1 in 3 succeeds:
		increase scroll analyser count by 1;		
	if a random chance of 1 in 4 succeeds:
		increase scroll analyser count by 1.

The scroll analyser is an open scenery container in library. The material of the scroll analyser is iron. The description of scroll analyser is "This weird machine can identify scrolls, [if scroll analyser count is greater than 0]and seems ready for operation. Just put a scroll in it, and it will do its magic[otherwise]but it seems to have broken. It no longer accepts scrolls[end if].".
Understand "analyzer" and "weird" and "machine" and "device" as the scroll analyser.

A treasure scoring rule (this is the scrolls in library rule):
	if considered treasure contains a scroll and considered room is the library:
		increase current room score by 2.

Last check inserting something into the scroll analyser:
	if the noun is not a scroll or scroll analyser count is less than 1:
		say "The scroll analyser refuses to open.";
	otherwise:
		decrease scroll analyser count by 1;
		if the noun is identified:
			say "The machine confirms that this is [a noun].[run paragraph on]";
		otherwise:
			identify noun;
			say "It is a [noun]![run paragraph on]";
		if scroll analyser count is less than 1:
			say " As you take back your scroll, something snaps within the analyser. It will probably never work again.";
		otherwise:
			say "[paragraph break]";
	rule succeeds.


Chapter - Drawing Room

The Drawing Room is a room. "This otherwise unremarkable room has been decorated with a fascinating drawing."

The Drawing Room is connectable.
The Drawing Room is not connection-inviting.
The Drawing Room is placeable.
The Drawing Room is habitable.
The Drawing Room is treasurable.
The Drawing Room is vp-agnostic.
The Drawing Room is civilised.


A placement possible rule:
	if the considered room is the drawing room or the considered room is the quartering room:
		 if the number of rooms surrounding considered-x by considered-y by considered-z is the number of cardinal directions:
			rule fails.

An additional placement rule:
	if the additional considered room is the drawing room:
		place quartering room next to drawing room.
			
An additional placement rule:
	if the additional considered room is the quartering room:
		place drawing room next to quartering room.
		
The fascinating drawing is scenery in the drawing room. Understand "painting" and "shadow" and "battle" and "scene" as the fascinating drawing.

Instead of examining the fascinating drawing:
	let X be a list of persons;
	repeat with guy running through alive not off-stage persons:
		unless guy is Malygris or guy is Nameless Horror:
			add guy to X;
	let n be the number of dead persons;
	let item be a random readied weapon carried by the player;
	if the number of entries in X is greater than 1:
		say "The artist has skillfully drawn a battle scene involving [X with indefinite articles]. [if n is greater than 2]Several figures seem to have been smudged out. [end if]In the background, Malygris rises triumphant over all[if Eternal Prison is placed] -- unless the huge shadow behind him is a creature threatening to consume even him[end if]. You could further [italic type]examine[roman type] the individual creatures, if you wanted to.";
	otherwise:
		say "The artist has skillfully drawn a battle scene between you and Malygris, where you are evidently being crushed by the mighty wizard. Large portions of the drawing have been wiped out.".

[After deciding the scope of the player while the location is the Drawing Room:
	repeat with guy running through alive not off-stage persons:
		unless guy is Nameless Horror:   [TODO!!! This is an ugly hack.]
			place guy in scope.]

Adjusted scope for the drawing room is a truth state that varies.

After deciding the scope of the player while adjusted scope for the drawing room is true:
	repeat with guy running through alive not off-stage persons:
		unless guy is Nameless Horror:   [TODO!!! This is an ugly hack.]
			place guy in scope.

Before taking a player action when the location is the drawing room:
		now adjusted scope for the drawing room is true.

After taking a player action:
	now adjusted scope for the drawing room is false.



Before doing anything except examining or reaping in Drawing Room:
	if the noun is a person and the location of the noun is not the location of the player:
		take no time;
		say "It is only a drawing." instead;
	if the second noun is a person and the location of the second noun is not the location of the player:
		take no time;
		say "It is only a drawing." instead;
	continue the action.

Persuasion rule for asking people to try doing something when the player is in Drawing Room:
	if the location of the person asked is not the location of the player:
		say "It is only a drawing.";
		persuasion fails. 

Instead of attacking or cutting or touching the fascinating drawing:
	say "The painting seems to be magically protected.".


Chapter - Quartering Room

The Quartering Room is a room. "The smell of decay here is overwhelming. A large pile of human body parts lies in a corner."

The Quartering Room is connectable.
The Quartering Room is not connection-inviting.
The Quartering Room is placeable.
The Quartering Room is habitable.
The Quartering Room is treasurable.
The Quartering Room is vp-agnostic.
The Quartering Room is deathly.

Instead of smelling in the Quartering Room:
	say "The stench of rotting bodies overwhelms everything else.".

The large pile of body parts is scenery in the Quartering Room.
Understand "human" and "non-human" and "part" and "legs" and "arms" and "heads" and "intestines" and "bodies" as the large pile of body parts.

Description of the large pile of body parts is "A gruesome collection of legs, arms, heads, intestines, and all other parts of the human body. If you really wanted to, you could search it for treasures.".

Instead of taking the large pile of body parts:
	say "You definitely do not want any of the body parts.".

Pile search count is a number variable.

[ The probabilities of finding a healthy scroll, unhealthy scroll, or the corpse depends on how many times we've searched the pile already. The chance of finding both a healthy scroll and the corpse increases the more we search. ]
Instead of searching the large pile of body parts:
	let N be a random number between 0 and 99;
	if pile search count is:
		-- -1:
			say "You find nothing else in the pile." instead;
		-- 0:
			if N < 60:
				find an unhealthy scroll;
			otherwise if N < 90:
				find a healthy scroll;
			otherwise:
				find the corpse;
		-- 1:
			if N < 35:
				find an unhealthy scroll;
			otherwise if N < 85:
				find a healthy scroll;
			otherwise:
				find the corpse;
		-- 2:
			if N < 10:
				find an unhealthy scroll;
			otherwise if N < 60:
				find a healthy scroll;
			otherwise:
				find the corpse;
		-- otherwise:
			if N < 10:
				find an unhealthy scroll;
			otherwise if N < 20:
				find a healthy scroll;
			otherwise:
				find the corpse;
	increment pile search count;

To find an unhealthy scroll:
	find a scroll of type random unhealthy scroll name;

To find a healthy scroll:
	find a scroll of type random healthy scroll name;

To find a scroll of type (N - scroll name):
	let the template be the default value of scroll;
	repeat with S running through scrolls:
		if the true name of S is N:
			now the template is S;
			break;
	let the new scroll be a new object cloned from the template;
	now the new scroll is carried by the player;
	say "You have found [a new scroll] buried between the body parts. It is slightly wet and smelly, but still usable.";

To find the corpse:
	if rotting corpse is off-stage and rotting corpse is alive:
		say "As you search the pile, a rotting corpse jumps out!";
		move rotting corpse to location of the large pile of body parts;
		now the player is not hidden;
	otherwise:
		say "The most valuable thing you find is a putrefying arm that might function as a club.";
		move putrefying arm to player;
	now pile search count is -2; [ Account for the increment ]

The putrefying arm is a 	weapon.
The description of putrefying arm is "Although it smells terribly, this arm is actually quite sturdy. You could beat people with it.".
The damage die of putrefying arm is 8.
The weapon attack bonus of putrefying arm is 1.
Instead of smelling putrefying arm:
	say "It is horrible.".


[In a huge beast skeleton?]
 [a white stairway that mounted amid the veering vapors. Behind him the flames rose unbroken, like a topless rampart; and on either hand, from instant to instant, the smoke shaped itself into demon forms and faces that menaced him]
[Presently he came to the huge, browless skull of an uncouth creature, which reposed on the ground with upward-gazing orbits; and beyond the skull was the monster's moldly skeleton, wholly blocking the passage. Its ribs were cramped by the narrowing walls, as if it had crept there and had died in the darkness, unable to withdraw or go forward. White spiders, demon-headed and large as monkeys, had woven their webs in the hollow arches of the bones; and they swarmed out interminably as Nushain approached; and the skeleton seemed to stir and quiver as they seethed over it abhorrently and dropped to the ground before the astrologer. Behind them others poured in a countless army, crowding and mantling every ossicle.]


Part - Special Rooms

To put (place - a room) in a near location:
	let starting position be a random placed room;
	now considered-x is the x-coordinate of starting position;
	now considered-y is the y-coordinate of starting position;
	now considered-z is the z-coordinate of starting position;
	do a random step;
	do a random step;
	while not the space at considered-x by considered-y by considered-z is free:
		do a random step;
	now x-coordinate of place is considered-x;
	now y-coordinate of place is considered-y;
	now z-coordinate of place is considered-z;
	now place is placed;
	if generation info is true, say "* Added [place] ([x-coordinate of place], [y-coordinate of place], [z-coordinate of place]).[line break][run paragraph on]".
	
To do a random step:
	let q be a random number between 1 and 6;
	if q is 1, increase considered-x by 1;
	if q is 2, decrease considered-x by 1;
	if q is 3, increase considered-y by 1;
	if q is 4, decrease considered-y by 1;
	if q is 5, increase considered-z by 1;
	if q is 6, decrease considered-z by 1.
	

Chapter - Eternal Prison

The Eternal Prison is a room. "The sense of evil emanating from the very stone of this room is almost overpowering."

Eternal Prison is connectable.
Eternal Prison is not connection-inviting.
Eternal Prison is not placeable.
Eternal Prison is not habitable.
Eternal Prison is not treasurable.
Eternal Prison is not extra-accepting.
Eternal prison is not teleportable.
Eternal Prison is vp-underground.
Eternal Prison is barren.

A dungeon interest rule (this is the potentially add the Eternal Prison rule):
	if a random chance of 1 in 5 succeeds:
		put Eternal Prison in a near location.


Chapter - Hidden Treasury

Hidden Treasury is a room. "On a raised portion of the floor stands a huge chest, beautifully inlaid with gems and precious metals. It must have been full of treasure once."

Hidden Treasury is connectable.
Hidden Treasury is not connection-inviting.
Hidden Treasury is not placeable.
Hidden Treasury is not habitable.
Hidden Treasury is not treasurable.
Hidden Treasury is not teleportable.
Hidden Treasury is vp-agnostic.
Hidden Treasury is civilised.

The ornate chest is scenery in Hidden Treasury. The ornate chest is a closed openable container. Understand "gems" and "precious" and "metals" as the ornate chest.

A dungeon interest rule (this is the potentially add the Hidden Treasury rule):
	if a random chance of 1 in 5 succeeds:
		put Hidden Treasury in a near location;
		place 3 of minor things in ornate chest;
		place 1 of major things in ornate chest;
		if a random chance of 1 in 3 succeeds:
			place 1 of epic things in ornate chest.



Chapter - Cavern of Rust

Cavern of Rust is a room. "The walls of this cavern are covered with the spores of the rust fungus."

Cavern of Rust is connectable.
Cavern of Rust is not connection-inviting.
Cavern of Rust is not placeable.
Cavern of Rust is not habitable.
Cavern of Rust is treasurable.
Cavern of Rust is not teleportable.
Cavern of Rust is vp-agnostic.
Cavern of Rust is barren.

Cavern of Rust is rust-spored.

A dungeon interest rule (this is the potentially add the Cavern of Rust rule):
	if a random chance of 1 in 5 succeeds:
		put Cavern of Rust in a near location.


Chapter - Portal of Smoke

Portal of Smoke is a room. "Huge clouds of smoke pour forth from a magical portal. This must be an entrance to the elemental plane of smoke!"

Portal of Smoke is connectable.
Portal of Smoke is not connection-inviting.
Portal of Smoke is not placeable.
Portal of Smoke is not habitable.
Portal of Smoke is not treasurable.
Portal of Smoke is not teleportable.
Portal of Smoke is not extra-accepting.
Portal of Smoke is vp-agnostic.
Portal of Smoke is elemental.

Smoke rule (this is the smoke at the Portal of Smoke rule):
	if test room is Portal of Smoke:
		if temporary smoke timer is less than 20:
			now temporary smoke timer is 20.

The portal to the elemental plane of smoke is stone scenery in Portal of Smoke. Understand "entrance" as portal to the elemental plane of smoke. The description of the portal to the elemental plane of smoke is "You cannot make out any details, given all the smoke that is coming from it; but you could enter the portal if you really wanted to.".

Instead of entering the portal to the elemental plane of smoke:
	consider the sudden combat reset rules;
	let item be portal to Kerkerkruip;
	move item to Elemental Plane of Smoke;
	move player to Elemental Plane of Smoke;
	now the take no time boolean is false.

Does the player mean entering the portal to the elemental plane of smoke: it is likely.

Instead of going inside in Portal of Smoke:
	try entering the portal to the elemental plane of smoke.

A dungeon interest rule (this is the potentially add the Portal of Smoke rule):
	if a random chance of 1 in 5 succeeds:
		put Portal of Smoke in a near location;
		place 3 of minor things in Elemental Plane of Smoke Storage;
		place 1 of major things in Elemental Plane of Smoke Storage;
		if a random chance of 1 in 3 succeeds:
			place 1 of epic things in Elemental Plane of Smoke Storage.

Chapter - Lair of the Imp

Lair of the Imp is a room. "There is no mistaking the smell of this room: an imp has been living here for centuries."

Lair of the Imp is connectable.
Lair of the Imp is not connection-inviting.
Lair of the Imp is placeable.
Lair of the Imp is not habitable.
Lair of the Imp is treasurable.
Lair of the Imp is teleportable.
Lair of the Imp is extra-accepting.
Lair of the Imp is vp-agnostic.
Lair of the Imp is magical.

Instead of smelling the lair of the imp:
	say "Mostly sulphur, but you'd recognise this smell anywhere -- you used to have a pet imp when you were an apprentice."

The difficulty level of Lair of the Imp is 2.

Dungeon interest rule (this is the add imp to its lair rule):
	if Lair of the Imp is placed:
		move imp to Lair of the Imp.


Chapter - The maze

The Maze is a room. "You are in a maze of twisty little passages, all alike. Exits lead in all directions."

The maze is not connectable.
The maze is not connection-inviting.
The maze is not placeable.
The maze is not habitable.
The maze is not treasurable.
The maze is not teleportable.
The maze is not extra-accepting.
The maze is vp-agnostic.
The maze is magical.

The maze-waiting-room is a room. "BUG: the player should never end up here."

The maze-waiting-room is not connectable.
The maze-waiting-room is not connection-inviting.
The maze-waiting-room is not placeable.
The maze-waiting-room is not habitable.
The maze-waiting-room is not treasurable.
The maze-waiting-room is not teleportable.
The maze-waiting-room is not extra-accepting.
The maze-waiting-room is vp-agnostic.
The maze-waiting-room is magical.

Maze-sound is a direction that varies.

Instead of going in the maze:
	do the maze move.		

To do the maze move:
	now concentration of the player is 0;
	repeat with item running through things in the maze:
		unless item is the player:
			unless item is a person:
				remove item from play;
			otherwise:
				move item to maze-waiting-room;
	say "You move through the tunnels, quickly losing all sense of direction.";
	if noun is maze-sound:
		let guy be a random person in maze-waiting-room;
		move guy to maze;
		now concentration of guy is 0;
	now maze-sound is northwest;
	update the combat status;
	if combat status is peace:
		if a random chance of 1 in 2 succeeds:
			now maze-sound is a random cardinal direction;
			say "[line break]A sound comes from somewhere [bold type][maze-sound][roman type] from here.";
	try looking.

Instead of digging in the maze:
	take no time;
	say "The magical walls resist your efforts at digging.".

A teleport impossible rule (this is the no teleportation in maze rule):
	if the location of the test subject is the maze:
		rule succeeds.

Section - Getting mazed

Pre-maze-location is a room that varies.

To maze (the first guy - a person) and (the second guy - a person):
	unless first guy is in the maze:
		if first guy opposes second guy and first guy is alive and second guy is alive: [if they're not enemies, we do nothing]
			if second guy is the player:
				now second guy is first guy;
				now first guy is the player; [we switch them, so the player comes first]
			if first guy is the player:
				now pre-maze-location is location of the player;
				say "You suddenly find yourself transported to...";
				move the player to the maze;
				move second guy to maze-waiting-room;
				now maze-sound is northwest; [you cannot go nw]
			otherwise: [when the player is not involved, we stimulate a combat]
				let n be level of first guy plus level of second guy;
				increase n by 4;
				let m be level of first guy;
				increase m by 2;
				while first guy is alive and second guy is alive:
					if a random chance of m in n succeeds:  [chance is: LVL1 + 2 / (LVL1 + 2 + LVL2 + 2); creatures of the same level: 1/2; level 4 vs level 3: 6/11; level 4 vs level 2: 6/10; level 4 vs level 0: 6/8.]
						decrease health of second guy by 2;
					otherwise:
						decrease health of first guy by 2;
				if location of first guy is location of the player:
					say "[The name of the first guy] and [the name of the second guy] guy briefly flicker in and out of existence. When they become solid once more, [bold type][if first guy is not alive][the name of the first guy][otherwise][the name of the second guy][end if] has been killed[roman type]!"


Section - Getting out of the maze


Every turn when the location is the maze:
	update the combat status;
	if no person is in the maze-waiting-room and combat status is peace:
		say "You are [bold type]transported back[roman type] from the maze.";
		repeat with item running through things in the maze:
			unless item is player:
				move item to pre-maze-location;
		move player to pre-maze-location.







Chapter - The Arcane Vault

The Arcane Vault is a room. "An oppressive silence pervades the marble hall, as if all earthly sounds are smothered by the alien force of magic. For magic is strong here, and seems to be radiating outward from a crystal pedestal in the middle of the room."

The Arcane Vault is connectable.
The Arcane Vault is not connection-inviting.
The Arcane Vault is placeable.
The Arcane Vault is not habitable.
The Arcane Vault is not treasurable.
The Arcane Vault is teleportable.
The Arcane Vault is not extra-accepting.
The Arcane Vault is vp-agnostic.
The Arcane Vault is magical.

The rarity of Arcane Vault is 5.

A dungeon interest rule (this is the potentially add the Arcane Vault rule):
	if Arcane Vault is not placed:
		if a random chance of 1 in 30 succeeds:
			put Arcane Vault in a near location;
			now Arcane Vault is not teleportable.

Instead of listening to the Arcane Vault:
	say "All sounds seem muffled and unreal.".

The crystal pedestal is scenery in Arcane Vault. The crystal pedestal is a supporter. The description of crystal pedestal is "The pedestal is made of a pale purple crystal you have never seen before. On top of it lies [if at least one tome is on the crystal pedestal][a random tome on the crystal pedestal][otherwise]a tome-shaped piece of air[end if]."

A dungeon interest rule (this is the place a tome on the pedestal rule):
	let item be a random off-stage tome;
	move item to the crystal pedestal;
	if generation info is true, say "* Put [item] on the pedestal.".
		
Check taking a tome (this is the do no remove tomes from the pedestal rule):
	if the noun is on the crystal pedestal:
		say "The magical forces binding the tome to the pedestal are too great." instead.
		



[Elemental Plane: see Kerkerkruip Events and Specials]

Kerkerkruip Locations ends here.
