Kerkerkruip Locations by Victor Gijsbers begins here.

Use authorial modesty.


Book - Rooms

Section - Room labels for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

A room has a figure name called the map-label. The map-label of a room is usually Figure of Null.


Section - Special map backgrounds (for use with Kerkerkruip Glimmr Additions by Erik Temple)

A room has a figure name called the map-background. The map-background of a room is usually Figure of Null.

The Bridge of Doom is tunnel-drawn. The map-background of Bridge of Doom is Figure of map_room_lava.
[If a room's background needs to extend outside the tile extent of the room, give it a y-offset.]
[Figure of map_room_lava has a number called y-offset. The y-offset is 0.]


Part - The rooms themselves


Chapter - Temple type
[Initially, at least, the only role of the temple kind is to enable easy display of the temple overlay on the graphical map.]

A temple is a kind of a room.


Chapter - Entrance Hall

The entrance hall is a room. "The vast entrance hall is empty, silent, foreboding. Skull-sized rubies project a red light far too bright for the eyes of a human[initial-possessions]."

Entrance Hall is not habitable.
Entrance Hall is connectable.
Entrance hall is connection-inviting.
Entrance Hall is placeable.
Entrance Hall is vp-agnostic.
Entrance Hall is treasurable.
Entrance Hall is extra-accepting.
Entrance Hall is civilised.


Say-possessions is a truth state that varies. Say-possessions is true.

To say initial-possessions:
	if say-possessions is true:
		now say-possessions is false;
		say ".[paragraph break]You possess [a list of things had by the player][run paragraph on]"


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


Section - Entrance Hall label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Entrance Hall is Figure of map_label_Entrance.


Chapter - Hall of Mirrors

The hall of mirrors is a room. "Mirrors surround you on all sides in an impossible geometry[run paragraph on][unless the player is blind]. Myriad reflections follow your every movement -- though some, always in the corner of your eyes, seem to behave differently[end if]."

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
		say " [one of](reflected thousandfold)[or](mirrored all around you)[or](copied and copied by mirrors)[or](multiplied ad infinitum)[at random]".

Check an actor hitting when the location is Hall of Mirrors (this is the sometimes attack a mirror image in Hall of Mirrors rule):
	unless the global attacker is blind:
		unless the global attacker grapples the global defender:
			unless the global defender grapples the global attacker:
				unless reflection-attack is true:
					test the mind of global attacker against 10;
					if test result is false:
						say " Confused by the mirrors, [if global attacker is the player]you start[otherwise][the global attacker] starts[end if] attacking a reflection before realising [if global attacker is the player]your[otherwise]its[end if] mistake.";
						if the concentration of the global attacker is greater than 1:
							now the concentration of the global attacker is 1; 
						rule fails;
		[				consider the take away until attack circumstances rules;]
					otherwise:
						say " Seeing through the illusion created by the mirrors, [if global attacker is the player]you attack[otherwise][the global attacker] attacks[end if] the real [if global defender is not the player][global defender][otherwise]you[end if].".

An AI action selection rule for a person (called P) when the location is Hall of Mirrors (this is the concentration is more important in the Hall of Mirrors rule):
	choose row with an Option of the action of P concentrating in the Table of AI Action Options;
	increase the Action Weight entry by 1.


Section - Hall of Mirrors label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Hall of Mirrors is Figure of map_label_Mirrors.


Chapter - Phantasmagoria

The phantasmagoria is a room. "This huge hall is filled with the radiant images of warriors long dead, fighting their bloody battles over and over again.[run paragraph on][unless the player is blind] You see [phantasmagoria show] -- but the scene changes before you can focus on any details.[run paragraph on][end if]"

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
	let n be the number of alive persons in phantasmagoria;
	now n is (3 times n);
	if a random chance of 1 in n succeeds:
		let lijst be a list of persons;
		repeat with guy running through alive persons enclosed by the location:
			unless guy is blind:
				if concentration of guy is greater than 0:
					if a random number between 1 and 5 is greater than the concentration of guy:
						add guy to lijst;
						now concentration of guy is 0;
		say "Suddenly, [one of]a disintegrating skeletal warrior[or]a blast of dragon's fire[or]a naked male slave screaming in fear[or]a naked female slave fleeing in tears[or]a huge fountain of fire[or]a crashing ballista bolt[or]a drowning knight, crying for his god,[or]a ghost devouring the flesh of a still living man[or]a frenzied bull elephant[or]a shrieking princess in the claws of a demon[or]an obese king carried by seven blind eunuchs[at random] appears. [unless lijst is empty]While only an image that flickers and then disappears, it [bold type]startles [lijst with definite articles][roman type][otherwise]The illusions do not affect anyone[end if].".

An AI action selection rule for a person (called P) when the location is Phantasmagoria (this is the concentration is often futile in Phantasmagoria rule):
	unless P is blind:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		decrease the Action Weight entry by 2 times the concentration of P.


Section - Hall of Mirrors label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Phantasmagoria is Figure of map_label_Phantasmagoria.


Chapter - Lake of Lava

The lake of lava is a room.

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


Section - Lake of Lava label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Lake of Lava is Figure of map_label_Lava_lake.


Chapter - Bridge of Doom

[TODO: nooit iets onder de Bridge of Doom?]

The bridge of doom is a room. "You stand on an exceedingly narrow bridge crossing a seething lake of lava. Dodging would be suicidal."

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
	unless the player is ethereal:
		end the story saying "You committed suicide.";
		say "On a whim, you jump down into the lava." instead;
	otherwise:
		try going down instead.

Carry out direction-jumping down in Bridge of Doom:
	try entering the seething lake of lava instead.

Instead of going down in Bridge of Doom when the player can move:
	unless the player is ethereal:
		try entering the seething lake of lava instead.

First carry out inserting something into the seething lake of lava:
	remove the noun from play;
	say "You throw [the noun] into the lava." instead.
				
Section - Bridge of Doom label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Bridge of Doom is Figure of map_label_Bridge.



Chapter - Temple of Nomos

The temple of Nomos is a temple. "The exactly elliptical room is dominated by a towering statue of Nomos, built out of harsh geometrical forms."

Temple of Nomos is dedicated to Nomos.

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



[Doesn't do anything right now, but we might want to reuse it.]
The Nomos wrath counter is a number that varies. The Nomos wrath counter is 0.			

Every turn (this is the decrease the Nomos wrath counter rule):
	if the main actor is the player:
		if Nomos wrath counter is greater than 0:
			decrease Nomos wrath counter by 1;
			if the Nomos wrath counter is 0:
				say "From the beginning of time, all the Universe's constituent particles have traced their preordained paths, to arrive at their present constellation -- a rare constellation in which all the thermal energy of your body is suddenly transferred to the air and dissipates. Your blood freezes, and you die.";
				end the story saying "The last thing you hear is booming but mirthless laughter".




Section - Temple of Nomos label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Temple of Nomos is Figure of map_label_Nomos.


Chapter - Temple of Aite

The temple of Aite is a temple. "The black stones have been scratched in a million fights, and will nevermore lose the faint colour of blood. This is the temple of Aite, whose laughing statue rises above all."

Temple of Aite is dedicated to Aite.

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

An attack modifier rule (this is the Aite-loved bonus in Temple of Aite rule):
	if the location is the Temple of Aite:
		if the global attacker is beloved of Aite:
			if the numbers boolean is true, say " + 2 (beloved of Aite)[run paragraph on]";
			increase the attack strength by 2.

Chance to win rule (this is the CTW Aite bonus rule):
	if the location is the Temple of Aite:
		if the global attacker is beloved of Aite:
			increase the chance-to-win by 2.


Section - Temple of Aite label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Temple of Aite is Figure of map_label_Aite.


Chapter - Temple of Sul

The temple of Sul is a temple. "The only feature breaking the monotony of the circular room made of polished white marble is a huge [if the statue of Sul is in the Temple of Sul]statue. Hewn from flawless mountain crystal, it portrays the goddess Sul[otherwise]pile of fragments of the broken statue[end if]."

Temple of Sul is dedicated to Sul.

Temple of Sul is connectable.
Temple of Sul is not connection-inviting.
Temple of Sul is placeable.
Temple of Sul is habitable.
Temple of Sul is treasurable.
Temple of Sul is extra-accepting.
Temple of Sul is consecrated.
Temple of Sul is vp-agnostic.
Temple of Sul is religious.

The statue of Sul is scenery in Temple of Sul. The description of the statue of Sul is "This is the crystal-clear statue of Sul, goddess of blessings and purification. She has been known to lift curses; but she has also been rumoured to hate spurious prayers.". Understand "god" and "deity" and "crystal" as the statue of Sul.

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


Section - Temple of Sul label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Temple of Sul is Figure of map_label_Sul.



Chapter - Temple of Chton

The temple of Chton is a temple. "This austere alabaster chamber is a temple to Chton, the god of death. You do not expect the dead to be particularly meek here. A smooth grey statue of Chton silently watches you." [Allusions are to Emily Dickinson, "Safe in their alabaster chambres."]

Temple of Chton is dedicated to Chton.

Temple of Chton is connectable.
Temple of Chton is connection-inviting.
Temple of Chton is placeable.
Temple of Chton is habitable.
Temple of Chton is treasurable.
Temple of Chton is extra-accepting.
Temple of Chton is consecrated.
Temple of Chton is vp-agnostic.
Temple of Chton is religious.

The statue of Chton is scenery in Temple of Chton. The description of the statue of Chton is "Strangers to your country are always surprised that Chton is depicted as a good-looking youth rather than as an old man or a skeletal figure. They don't understand that death is the opposite and the abolition of age, illness, decay -- nothing could be more beautiful and seductive.". Understand "smooth" and "grey" as the statue of Chton.

Instead of attacking the statue of Chton:
	say "With strange aeons even death may die -- but for now this statue seems indestructible.". 

Instead of touching the statue of Chton:
	say "It feels as cold as death.".

Instead of climbing the statue of Chton:
	say "The statue is too smooth to climb.".

An attack modifier rule (this is the undead better in temple of Chton rule):
	if the global attacker is undead and the location is the Temple of Chton:
		if the numbers boolean is true, say " + 1 (undead in temple of Chton)[run paragraph on]";
		increase the attack strength by 1.
	

Section - Temple of Chton label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Temple of Chton is Figure of map_label_Chton.


Chapter - Temple of Herm

The temple of Herm is a temple. "Shadows are everywhere, and you feel that the subtle god Herm might be hiding in any of them -- or in none. Warriors despise him, for they assume that Herm is cowardly; mages respect him, for he is a source of knowledge; but only those either unwilling or too weak to fight truly love him."

Temple of Herm is dedicated to Herm.

Temple of Herm is connectable.
Temple of Herm is connection-inviting.
Temple of Herm is placeable.
Temple of Herm is habitable.
Temple of Herm is treasurable.
Temple of Herm is extra-accepting.
Temple of Herm is consecrated.
Temple of Herm is vp-agnostic.
Temple of Herm is religious.

Last detection rule (this is the Temple of Herm detection rule):
	if the location is the Temple of Herm:
		say " + 2 (Temple of Herm)[run paragraph on]";
		increase the hiding roll by 2.

Section - Temple of Herm label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Temple of Herm is Figure of map_label_Herm.


Chapter - The Crypt

The crypt is a room. "Skulls and bones lie scattered amongst the ruined tombs. One big sarcophagus is still intact, and currently [if the sarcophagus is open]open[otherwise]closed[end if]."

The Crypt is connectable.
The Crypt is not connection-inviting.
The Crypt is placeable.
The Crypt is not habitable.
The Crypt is treasurable.
The Crypt is extra-accepting.
The Crypt is vp-underground.
The Crypt is deathly.

Ruined tombs is scenery in the crypt. Understand "skulls" and "skull" and "bones" and "bone" as the ruined tombs. The description of the ruined tombs is "Broken and useless.". Instead of taking the ruined tombs: say "You do not find anything useful among the debris.".

The sarcophagus is a closed openable scenery container in The Crypt. Understand "tomb" and "coffin" as the sarcophagus. The description of the sarcophagus is "A marble monstrosity carved with skeletons and other symbols of death.".

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
			let X be a random off-stage not super-undead undead person;
			now sarcophagus-inhabitant is X.

Report opening the sarcophagus:
	if the sarcophagus-inhabitant is not yourself:
		if the sarcophagus-inhabitant is not off-stage or the sarcophagus-inhabitant is dead:
			now the sarcophagus-inhabitant is yourself;
	let N be the number of things contained by the sarcophagus;
	if the sarcophagus-inhabitant is not yourself:
		move sarcophagus-inhabitant to the location of the sarcophagus;
		now the player is not hidden;
		now the sarcophagus-inhabitant is not asleep;
		have the parser notice the sarcophagus-inhabitant;
		if N is 0:
			say "As you open the sarcophagus, [a sarcophagus-inhabitant] jumps out!";
		otherwise:
			say "As you open the sarcophagus, you see [a list of things enclosed by the sarcophagus]; but also [a sarcophagus-inhabitant] jumping out of it!";
	otherwise if N > 0:
		say "The sarcophagus contains [a list of things enclosed by the sarcophagus]. You pick [if N is 1]it[otherwise]them[end if] up.";
		have the parser notice a random thing enclosed by the sarcophagus;
		now the player carries everything enclosed by the sarcophagus;
	otherwise:
		say "The sarcophagus is disappointingly empty. Some other grave robber must have been here before you.";
	rule succeeds;

Instead of entering the sarcophagus:
	say "One should not joke with death.".


Section - Crypt label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Crypt is Figure of map_label_Crypt.



Chapter - Workshop of the Blademaster

The workshop of the blademaster is a room. "The famous workshop of the master of Algir has been transported here in all its glory. A huge forge dominates the room."

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

[Every turn when the huge forge contains at least one thing (this is the huge forge rule):
	repeat with item running through things enclosed by huge forge:
		now heat strength of item is 9.]

Last check inserting something into the huge forge:
	say "You hold [the noun] in the forge for a few seconds.";
	now heat strength of noun is 9;
	rule succeeds.


Section - Workshop of the Blademaster label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Workshop of the Blademaster is Figure of map_label_Workshop.



Chapter - Space-Time Discontinuum

The space-time discontinuum is a room. "Here powerful sorcerers once tortured time to learn the secrets of eternity. Everything around you seems to happen either faster or slower than it should."

Space-Time Discontinuum is connectable.
Space-Time Discontinuum is not connection-inviting.
Space-Time Discontinuum is placeable.
Space-Time Discontinuum is habitable.
Space-Time Discontinuum is treasurable.
Space-Time Discontinuum is extra-accepting.
Space-Time Discontinuum is vp-agnostic.
Space-Time Discontinuum is magical.

The rarity of Space-Time Discontinuum is 1. [Placed less often.]

The unlock level of Space-Time Discontinuum is 10.
The unlock text of Space-Time Discontinuum is "a weird place where time functions differently than elsewhere".

An initiative update rule (this is the initiative is almost completely random in Space-Time Discontinuum rule):
	if location is Space-Time Discontinuum and the location is not initiative-conferring:
		repeat with X running through all alive persons enclosed by the location:				
			now the initiative of X is a random number between 0 and 100.


Section - Space-Time Discontinuum label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Space-Time Discontinuum is Figure of map_label_Discontinuum.



Chapter - Vast Staircase

The vast staircase is a room. "A vast staircase spirals up and down[if staircase still goes down]. In a pinch, you might be able to escape from combat by [italic type]jumping down[roman type] to the room below, although this might not be particularly healthy[end if]."

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
						say "Reeling from the blow, [the global defender] balance[s] on the edge of the staircase. [italic type][run paragraph on]";
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


Section - Vast Staircase label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Vast Staircase is Figure of map_label_Staircase.



Chapter - Alchemical Laboratory

The alchemical laboratory is a room. "Centuries ago, Malygris captured the great alchemist Metastasio and forced him to work in this laboratory. Most of his equipment is now gone, but one curious machine remains."

Alchemical Laboratory is connectable.
Alchemical Laboratory is connectable.
Alchemical Laboratory is not connection-inviting.
Alchemical Laboratory is placeable.
Alchemical Laboratory is habitable.
Alchemical Laboratory is treasurable.
Alchemical Laboratory is extra-accepting.
Alchemical Laboratory is vp-agnostic.
Alchemical Laboratory is alchemical.

The curious machine is scenery in alchemical laboratory. The curious machine is an open container. The material of the curious machine is iron. The description of the curious machine is "You have no idea how this machine works, but it seems that you can insert an item into it.".

The machine-counter is a number that varies. The machine-counter is 0.

Last check inserting something into the curious machine:
	if the noun is a grenade or the noun is incorruptible:
		say "The machine beeps angrily and rejects [the noun].";
	otherwise:
		let chosen grenade be a random flash grenade;
		let m be a random number between 1 and 6;
		if m is 2, now chosen grenade is a random rust grenade;
		if m is 3, now chosen grenade is a random fragmentation grenade;
		if m is 4, now chosen grenade is a random smoke grenade;
		if m is 5, now chosen grenade is a random teleportation grenade;
		if m is 6, now chosen grenade is a random Morphean grenade;
		if a random chance of 1 in 100 succeeds, now chosen grenade is the Blessed Grenade;
		let item be a new object cloned from chosen grenade;
		move item to the location;
		have the parser notice the item;
		increase machine-counter by 1;
		remove the noun from play;
		let explode-boolean be false;
		if a random chance of machine-counter in 50 succeeds:
			now explode-boolean is true;
			now machine-counter is 0;
		say "You put [the noun] in the curious machine. It starts clicking and beeping, and after a short while, [an item] drops on the ground[if explode-boolean is true]. Something seems to have gone wrong, though, and it immediately explodes[end if].";
		if explode-boolean is true:
			now exploding-location is the location;
			now exploding-grenade is the item;
			follow the exploding rules;
			remove item from play;
	rule succeeds.


Section - Alchemical Laboratory label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Alchemical Laboratory is Figure of map_label_Laboratory.



Chapter - Hall of Vapours

Pipes-open is a truth state that varies.

A dungeon interest rule (this is the open or close pipes in Hall of Vapours rule):
	if a random chance of 3 in 4 succeeds:
		now pipes-open is true;
	otherwise:
		now pipes-open is false.

The hall of vapours is a room. "Several large pipes [if pipes-open is true]continuously spew forth vapours into this room[otherwise]dominate the room[end if]. A big wheel is attached to the pipes."

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


Section - Hall of Vapours label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Hall of Vapours is Figure of map_label_Vapours.
			


Chapter - Portal Room

The portal room is a room. "A huge [if the huge magical portal is in Portal Room]magical[otherwise]empty[end if] portal dominates the room."

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

Instead of entering the huge magical portal when the player can move:
	teleport the player;
	if a random chance of 1 in 4 succeeds:
		remove huge magical portal from play;
		move huge empty portal to Portal Room.

Instead of entering the huge empty portal:
	take no time;
	say "The magical field has dissipated, and the portal is now useless.".


Section - Portal Room label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Portal Room is Figure of map_label_Portal.


Chapter - Library

The library is a room. "Hundreds of books line the walls of this magnificent library, a bigger collection than the already legendary one of the marquis of Savon. Malygris even has a scroll analyser installed."

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

The scroll analyser is an open scenery container in library. The initial appearance of the scroll analyser is "A scroll analyser seems to have been abandoned here." The material of the scroll analyser is iron. The description of scroll analyser is "This weird machine can identify scrolls, [if scroll analyser count is greater than 0]and seems ready for operation. Just put a scroll in it, and it will do its magic[otherwise]but it seems to have broken. It no longer accepts scrolls[end if].".
Understand "analyzer" and "weird" and "machine" and "device" as the scroll analyser.

First dungeon interest rule (this is the turn the analyser into an extra rule):
	if the library is not placed:
		now scroll analyser is extra;
		now scroll analyser is not scenery;
		now mood of scroll analyser is civilised;
		remove scroll analyser from play;
		decrease scroll analyser count by 1.

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


Section - Library label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Library is Figure of map_label_Library.



Chapter - Drawing Room

The drawing room is a room. "This otherwise unremarkable room has been decorated with a fascinating drawing."

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
	repeat with guy running through denizen persons:
		unless guy is Malygris or guy is Nameless Horror:
			add guy to X;
	let n be the number of dead persons;
	if the number of entries in X is greater than 1:
		say "The artist has skillfully drawn a battle scene involving [X with indefinite articles]. [if n is greater than 2]Several figures seem to have been smudged out. [end if]In the background, Malygris rises triumphant over all[if Eternal Prison is placed] -- unless the huge shadow behind him is a creature threatening to consume even him[end if]. You could further [italic type]examine[roman type] the individual creatures, if you wanted to.";
	otherwise:
		say "The artist has skillfully drawn a battle scene between you and Malygris, where you are evidently being crushed by the mighty wizard. Large portions of the drawing have been wiped out.".


Adjusted scope for the drawing room is a truth state that varies.

After deciding the scope of the player while adjusted scope for the drawing room is true:
	repeat with guy running through denizen persons:
		unless guy is Nameless Horror:   [TODO!!! This is an ugly hack.]
			place guy in scope.

Before taking a player action when the location is the drawing room:
	now adjusted scope for the drawing room is true.

After taking a player action:
	now adjusted scope for the drawing room is false.


Examining is bypassing-scope.
[ See more in Monsters ]

Before doing something in the Drawing Room:
	if not bypassing-scope:
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


Section - Drawing Room label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Drawing Room is Figure of map_label_Drawing.



Chapter - Quartering Room

The quartering room is a room. "The smell of decay here is overwhelming. A large pile of human body parts lies in a corner."

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
			otherwise if N < 50:
				find a healthy scroll;
			otherwise:
				find the corpse;
		-- otherwise:
			if N < 10:
				find an unhealthy scroll;
			otherwise if N < 30:
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
	have the parser notice the new scroll;
	say "You have found [a new scroll][one of] in between the body parts[or] buried in the pile[at random]. It's slightly [one of]wet and smelly[or]covered in slime[at random], but it looks like it will still work, so you scoop it up.";

To find the corpse:
	if rotting corpse is off-stage and rotting corpse is alive:
		say "As you search the pile, a rotting corpse jumps out!";
		move rotting corpse to location of the large pile of body parts;
		now the player is not hidden;
	otherwise:
		say "The most valuable thing you find is a putrefying arm that might function as a club.";
		move putrefying arm to player;
	now pile search count is -2; [ Account for the increment ]

The putrefying arm is a weapon.
The description of putrefying arm is "Although it smells terribly, this arm is actually quite sturdy. You could beat people with it.".
The damage die of putrefying arm is 8.
The weapon attack bonus of putrefying arm is 1.
Instead of smelling putrefying arm:
	say "It is horrible.".


Section - Quartering Room label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Quartering Room is Figure of map_label_Quartering.



Chapter - Hall of the Raging Banshees

The hall of the raging banshees is a room. "A shaded, grotesque hall, fully cut out of onyx.[if living banshees boolean is false] Deep within the blackness of its walls hideous female figures seem to scream at you.[otherwise] A horde of female spirits is flying around, wailing their insane laments.[end if] [italic type](Current tension modifier: +[bansheemod] body, -[bansheemod] mind[if living banshees boolean is true]; [20 + (4 * tension)]% chance of concentration failure[end if].)[roman type]"

The Hall of the Raging Banshees is connectable.
The Hall of the Raging Banshees is not connection-inviting.
The Hall of the Raging Banshees is placeable.
The Hall of the Raging Banshees is habitable.
The Hall of the Raging Banshees is treasurable.
The Hall of the Raging Banshees is extra-accepting.
The Hall of the Raging Banshees is vp-agnostic.
The Hall of the Raging Banshees is deathly.

The rarity of Hall of the Raging Banshees is 1.

There is a thing called the banshees. "A horde of banshees is flying through the room, screaming and howling."

The banshees are scenery, and plural-named. Understand "figure", "figures", "silhouettes", "silhouette", "woman", "women", "banshee", "banshees" as the banshees. The banshees are in Hall of the Raging Banshees.

Instead of examining the banshees:
	say "You avert your eyes from the horrific sight of the madly screaming women.".
	
Instead of attacking the banshees:
	say "[if the living banshees boolean is true]They appear to be insubstantial[otherwise]You could not break through the onyx walls[end if].";
	take no time.

Instead of listening to the banshees:
	say "[if the living banshees boolean is true]They screams are bloodcurdling[otherwise]No actual sound escapes from the walls[end if].".

[Declaring a variable which determines whether the banshees find enough tension to break loose from the walls]
The living banshees boolean is a truth state variable that varies. The living banshees boolean is false.

To decide which number is the bansheemod:
	let x be the tension;
	now x is x divided by 4;
	if tension is greater than 12:
		increase x by 1;
	decide on x.

Every turn when the location is the Hall of the Raging Banshees (this is the activate banshees rule):
	if (the tension is greater than 9) and the living banshees boolean is false:
		say "The [bold type]banshees[roman type] suddenly break loose from the onyx walls!  They start to incite all creatures in the hall, screaming and flying around them.";
		now the living banshees boolean is true;
	otherwise if (4 is greater than the tension) and the living banshees boolean is true:
		say "Bored by a lack of tension, the [bold type]banshees[roman type] recede into the walls, leaving with a last, horrifying scream.";
		now the living banshees boolean is false.

Check an actor concentrating when the living banshees boolean is true:
	let y be the tension;
	now y is y times 4 plus 20;
	if a random chance of y in 100 succeeds:
		say "The wailing of the banshees disturbs [possessive of the actor] attempt to concentrate." instead.

An AI action selection rule for a person (called P) when the location is Hall of the Raging Banshees (this is the less concentration when banshees howl rule):
	if the living banshees boolean is true:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		decrease the Action Weight entry by bansheemod.
		
A body bonus rule (this is the banshee body bonus rule):
	if the location is the Hall of the Raging Banshees and the combat status is not peace:
		increase faculty bonus score by bansheemod.

A mind bonus rule (this is the banshee mind bonus rule):
	if the location is the Hall of the Raging Banshees and the combat status is not peace:
		decrease faculty bonus score by bansheemod.


Section - Hall of the Raging Banshees label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Hall of the Raging Banshees is Figure of map_label_Banshees.


Chapter - Tungausy Sweat Lodge 

The Tungausy sweat lodge is a room. "The penetrating scent of dozens of indigenous herbs pervades your nostrils as you enter the Tungausy Sweat Lodge.  A large group of men wearing skull masks encircles you, chanting monotonously in an ancient tongue.  At each of the four cardinal directions, incense burners produce a grey, thick smoke. While you may feel feeble due to the intense smoke within this hall, the incense places your soul in a state of trance, assisting you in the use of certain powers. [italic type](Current tension modifier: +[incensemod] spirit, -[incensemod] on attacks.)[roman type]"

The Tungausy Sweat Lodge is connectable.
The Tungausy Sweat Lodge is not connection-inviting.
The Tungausy Sweat Lodge is placeable.
The Tungausy Sweat Lodge is habitable.
The Tungausy Sweat Lodge is treasurable.
The Tungausy Sweat Lodge is extra-accepting.
The Tungausy Sweat Lodge is vp-agnostic.
The Tungausy Sweat Lodge is religious.

The rarity of Tungausy Sweat Lodge is 1.

The incense is scenery. Understand "scent", "herbs", "indigenous", "indigenous herbs", "smoke" as incense.  The description of the incense is "The smell of the incense is pervading, containing a mixture of sweet and spicy senses". The incense is in the Tungausy Sweat Lodge.

Instead of taking the incense:
	say "The circle of chanting shamans prevents you from getting anywhere near the incense".

The dancing Tungausy shamans are scenery in the Tungausy Sweat Lodge. They are plural-named. Understand "men", "man", "shaman", "chanting", "circle", "dancer", "dancers" as the dancing Tungausy shamans. The description of the dancing Tungausy shamans is "You're not certain whether they are real or a figment, but you feel sure that they cannot harm you, nor you them."

Instead of doing anything to the dancing Tungausy shamans:
	say the description of the dancing Tungausy shamans;
	say line break.

To decide which number is the incensemod:
	let x be the tension;
	now x is x divided by 4;
	if tension is greater than 12:
		increase x by 1;
	decide on x.

A spirit bonus rule (this is the incense spirit bonus rule):
	if the location is the Tungausy Sweat Lodge and the combat status is not peace:
		increase faculty bonus score by incensemod.

An attack modifier rule (this is the incense penalty in Sweat Lodge rule):
	if the location is the Tungausy Sweat Lodge:
		say " - [incensemod] (incense penalty)[run paragraph on]";
		decrease the attack strength by incensemod.
		
Status combat stats rule (this is the sweat lodge attack modifier rule):
	if the location is the Tungausy Sweat Lodge and incensemod is not 0:
		if long status is true:
			say "The [bold type]incense[roman type] gives everyone a +[incensemod] spirit bonus and a -[incensemod] attack penalty.[line break][run paragraph on]";
		otherwise:
			say "[bold type]Incense[roman type]: -[incensemod] attack.";


Section - Tungausy Sweat Lodge label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Tungausy Sweat Lodge is Figure of map_label_Sweat_lodge.



Chapter - Columnated Ruins

The columnated ruins is a room. "This must have been a temple once, but all that is left is a forest of pillars, mostly broken and shattered. Even gods may be forgotten."
Understand "columns" as the columnated ruins when the location is not columnated ruins.

Columnated Ruins is connectable.
Columnated Ruins is not connection-inviting.
Columnated Ruins is placeable.
Columnated Ruins is habitable.
Columnated Ruins is treasurable.
Columnated Ruins is extra-accepting.
Columnated Ruins is vp-agnostic.
Columnated Ruins is civilised.

The rarity of Collumnated Ruins is 1.

The pillars are scenery in columnated ruins. The description of the pillars is "Larger creatures will have trouble navigating the dense forest of pillars, while smaller creatures will find many easy spots to duck away.". Understand "column" and "pillar" and "columns" as the pillars.

Instead of pushing or pulling or attacking the pillars:
	say "They are too tough to play domino with.".

An attack modifier rule (this is the attack penalty in Columnated Ruins rule):
	if the location is Columnated Ruins:
		let n be the size difference of the global attacker and the global defender;
		if n is greater than 0:
			say " + [n] (defender hampered by pillars)[run paragraph on]";
		otherwise if n is less than 0:
			say " - [-1 * n] (attacker hampered by pillars)[run paragraph on]";
		increase the attack strength by n..


Section - Columnated Ruins label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Columnated Ruins is Figure of map_label_Columns.



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

The eternal prison is a room. "The sense of evil emanating from the very stone of this room is almost overpowering."

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


Section - Eternal Prison label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Eternal Prison is Figure of map_label_Prison.



Chapter - Hidden Treasury

The hidden treasury is a room. "On a raised portion of the floor stands a huge chest, beautifully inlaid with gems and precious metals. It must have been full of treasure once."

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


Section - Hidden Treasury label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Hidden Treasury is Figure of map_label_Treasury.


Chapter - The Mausoleum

The mausoleum is a room. "The walls are adorned with rich gems and gold -- more in a display of wealth than of sound aesthetic judgment. In the middle of the room stands the marble tomb of an ancient king."

Mausoleum is connectable.
Mausoleum is not connection-inviting.
Mausoleum is not placeable.
Mausoleum is not habitable.
Mausoleum is treasurable.
Mausoleum is not teleportable.
Mausoleum is vp-agnostic.
Mausoleum is deathly.

The tomb of the ancient king is scenery in the mausoleum. The tomb of the ancient king is a closed openable container. Understand "marble" and "screw" and "screws" and "lid" and "sculptures" and "sculpted" and "head" and "heads" as the tomb of the ancient king. The description of the tomb of the ancient king is "The tomb is made of richly sculpted marble. Some of the sculptures serve as screws to hold the tomb closed.".

Tomb-ancient-king-counter is a number that varies. Tomb-ancient-king-counter is 0.

Last check opening the tomb of the ancient king:
	if combat status is peace:
		if tomb-ancient-king-counter greater than 0:
			say "With combat no longer on your mind, you easily unscrew the lid.";
		otherwise:
			say "Unscrew the lid turns out to be a lot of work, but not difficult.";
	otherwise:
		if tomb-ancient-king-counter is 10:
			say "With a sigh, you remove the last of the marble screws.";
		otherwise:
			increase tomb-ancient-king-counter by 1;
			say "Marble screws with sculpted heads hold the tomb closed. You painstakingly unscrew one that looks like a [one of]gargoyle[or]mermaid[or]skeleton[or]naked woman[or]phallus[or]horse[or]minotaur[or]fairy[or]priest[or]wizard[or]chained slave[or]blood ape[or]copulating man and woman[or]bull impregnating a human woman[or]double-bladed axe[or]man with wings[at random]." instead.

A dungeon interest rule (this is the potentially add the Mausoleum rule):
	if Mausoleum is not placed:
		if a random chance of 1 in 10 succeeds:
			put Mausoleum in a near location;
			people the Mausoleum;
		otherwise:
			if a random chance of 1 in 10 succeeds: [TODO]
				let place be a random placed connectable room;
				place mausoleum next to place;
				people the mausoleum.

To people the mausoleum:
	if (a random chance of 2 in 5 succeeds) and (at least one super-undead person is off-stage):
		let guy be a random super-undead off-stage person;
		move guy to the mausoleum;
	otherwise:
		if at least one undead person is off-stage:
			let guy be a random off-stage undead person; [can be super-undead!]
			move guy to the mausoleum;
		if at least one undead person is off-stage:
			let guy be a random off-stage undead person; [can be super-undead!]
			move guy to the mausoleum;
	if at least one epic thing is off-stage:
		let item be a random epic thing;
		now item is in tomb of the ancient king;
	if a random chance of 1 in 4 succeeds:
		if at least one epic thing is off-stage:
			let item be a random epic thing;
			now item is in tomb of the ancient king;
	if abyss of the soul is in the mausoleum:
		if at least one undead person is off-stage:
			let guy be a random off-stage undead person; [can be super-undead!]
			move guy to the mausoleum;
		remove abyss of the soul from play.
			
Section - Mausoleum label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Mausoleum is Figure of map_label_Mausoleum.

			

Chapter - Cavern of Rust

The cavern of rust is a room. "The walls of this cavern are covered with the spores of the rust fungus."

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


Section - Cavern of Rust label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Cavern of Rust is Figure of map_label_Rust.



Chapter - Portal of Smoke

The portal of smoke is a room. "Huge clouds of smoke pour forth from a magical portal. This must be an entrance to the elemental plane of smoke!"

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

Instead of entering the portal to the elemental plane of smoke when the player can move:
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


Section - Portal of Smoke label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Portal of Smoke is Figure of map_label_Smoke_portal.



Chapter - Lair of the Imp

The lair of the imp is a room. "There is no mistaking the smell of this room: an imp has been living here for centuries."

Lair of the Imp is connectable.
Lair of the Imp is not connection-inviting.
Lair of the Imp is placeable.
Lair of the Imp is not habitable.
Lair of the Imp is treasurable.
Lair of the Imp is teleportable.
Lair of the Imp is extra-accepting.
Lair of the Imp is vp-agnostic.
Lair of the Imp is magical.

Rarity of the Lair of the Imp is 3. [Should be special.]

Instead of smelling the lair of the imp:
	say "Mostly sulphur, but you'd recognise this smell anywhere -- you used to have a pet imp when you were an apprentice."

The unlock level of Lair of the Imp is 2.
The unlock hidden switch of the lair of the imp is true.

Dungeon interest rule (this is the add imp to its lair rule):
	if Lair of the Imp is placed:
		move imp to Lair of the Imp.


Section - Lair of the Imp label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Lair of the Imp is Figure of map_label_Imp_s_Lair.



Chapter - The maze

The maze is a room. "You are in a maze of twisty little passages, all alike. Exits lead in all directions."

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

Greater-maze is a region. Maze and maze-waiting-room are in greater-maze.

Maze-sound is a direction that varies.

Instead of going in the maze when the player can move:
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


Section - Maze label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Maze is Figure of map_label_Maze.


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
			otherwise: [when the player is not involved, we simulate a combat]
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


Last every turn when the location is the maze:
	update the combat status;
	if no person is in the maze-waiting-room and combat status is peace:
		say "You are [bold type]transported back[roman type] from the maze.";
		repeat with item running through things in the maze:
			unless item is player:
				move item to pre-maze-location;
		move player to pre-maze-location.


Chapter - Entrance to the Arena

Entrance to the Arena is a room. "A large, black dome seen from the outside towers over you -- though you find it impossible to say in which direction, as if the normal rules of space do not obtain here. The outer wall of the dome, which must be the legendary Arena of the Fallen, is adorned with high reliefs of battle scenes. The scene depicted above the entrance, which seems hermetically closed, shows [if triumphing boolean is false]Victor triumphing over Malygris[otherwise] [the name of the player] triumphing over [oppname][end if]. Some inscriptions are engraved on the wall."
	
Entrance to the Arena is connectable.
Entrance to the Arena is not connection-inviting.
Entrance to the Arena is placeable.
Entrance to the Arena is not habitable.
Entrance to the Arena is not treasurable.
Entrance to the Arena is extra-accepting.
Entrance to the Arena is vp-agnostic.
Entrance to the Arena is magical.

The rarity of Entrance to the Arena is 5. 

The black dome is scenery in the Entrance to the Arena. Understand "Arena" and "large" and "black" and "of the fallen" as the black dome. The description of the black dome is "You feel uneasy looking at it, as it seems to be formed of unholy energies that defy all the laws of your own world."

The scribblings are scenery in the Entrance to the Arena and plural-named. Understand "writings" and "inscriptions" and "inscription" as the scribblings. The description of the scribblings is "[if triumphing boolean is false]As you start to read the text, it lights up in a dark crimson: [italic type] If you wish, you can relive a battle you fought before, but it will become the most challenging fight you ever had. To start the fight, simply [roman type]REVIVE[italic type][otherwise]Writings glowing with an eerie red light celebrate your victory: 'Hail to our last victor!'[end if].".

Instead of reading the scribblings:
	try examining the scribblings.

[See Arena of the Fallen in Kerkerkruip Events and Specials.]
		

Section - Entrance to the Arena label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Entrance to the Arena is Figure of map_label_Arena.
				

Chapter - Hall of the Gods

Hall of Gods is a room. "A long hall, adorned with great statues of the [number of gods in words] great gods are here, together with pictures of the great battles already fought in this room. The last picture mentions [if Godfight boolean is true]you triumphing over [Chosenname][otherwise][random fight text][end if]. [if the Godfight boolean is false]While this fight may not let you harvest the soul of the opponent, your victory will be hailed upon by your god [italic type](+2 divine favour)[roman type]. If you are willing to fight, stand on the empty pedestal.[end if] Agnosticists and Atheists will not be tolerated!" 
	
Hall of Gods is connectable.
Hall of Gods is not connection-inviting.
Hall of Gods is placeable.
Hall of Gods is not habitable.
Hall of Gods is not treasurable.
Hall of Gods is extra-accepting.
Hall of Gods is vp-agnostic.
Hall of Gods is religious.

The rarity of Hall of Gods is 5. 
The unlock level of Hall of Gods is 2.

[See Arena of the Fallen in Kerkerkruip Events and Specials.]

Section - Hall of Gods label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Hall of Gods is Figure of map_label_Hall_of_Gods.


Chapter - The Arcane Vault

The arcane vault is a room. "An oppressive silence pervades the marble hall, as if all earthly sounds are smothered by the alien force of magic. For magic is strong here, and seems to be radiating outward from a crystal pedestal in the middle of the room."

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


Section - Arcane Vault label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Arcane Vault is Figure of map_label_Vault.


		
Chapter - The Zen Room

The Zen Room is a room. "A room of calmth and serenity, adorned with beautiful drawings[if comfy chair is in Zen room]. In the centre, a comfortable looking chair is waiting for you to sit on[end if]."

The Zen Room is connectable.
The Zen Room is not connection-inviting.
The Zen Room is placeable.
The Zen Room is habitable.
The Zen Room is treasurable.
The Zen Room is teleportable.
The Zen Room is not extra-accepting.
The Zen Room is vp-agnostic.
The Zen Room is civilised.

The rarity of Zen Room is 6.

The Zen drawings are scenery and plural-named. The Zen drawings are in the Zen room. Understand "drawing" and "beautiful" and "mandala" and "Buddha" as the Zen drawings.
Instead of examining the Zen drawings, say "Mandalas and pictures of the Buddha. You've never had much respect for these pacifistic religions."

The chairinheritor is a person that varies. The chairinheritor is Malygris.

When play begins:
	if a random chance of 1 in 4 succeeds:
		let X be a list of persons;
		repeat with guy running through talker denizen not friendly persons:
			add guy to X;
		sort X in random order;
		now chairinheritor is entry 1 of X.


Section - Zen Room label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)

The map-label of Zen Room is Figure of map_label_Zen.


Section - Chairs

A chair is a kind of supporter. A chair is enterable.

An attack modifier rule (this is the hard to fight while sitting in a chair rule):
	if the global attacker is on a chair:
		say " - 3 (sitting in a chair)[run paragraph on]";
		decrease the attack strength by 3;
	if global defender is on a chair:
		say " + 2 (defender sitting in a chair)[run paragraph on]";
		increase the attack strength by 2.

Check going (this is the cannot go when in a chair rule):
	if the player is on a chair:
		take no time;
		say "You'll have to stand up first." instead.

Check retreating (this is the cannot retreat when in a chair rule):
	if the player is on a chair:
		take no time;
		say "You'll have to stand up first." instead.	

Last check rolling when the player is on a chair (this is the roll out of a chair rule):
	let item be a random chair enclosing the player;
	silently try getting off the item;
	if the player is on the item:
		take no time;
		say "You can't do that while sitting." instead;
	otherwise:
		say "(This action involves getting off [the item].)".

Section - Comfy chair

The comfy chair is a chair and scenery in the Zen Room. The description of the comfy chair is "A leather, well worn chair, but quite cozy to look at[if chairinheritor and comfy chair share a world]. Somehow, you feel it is owned by [the chairinheritor][end if]." Understand "comfortable looking","well worn" and "leather" as the comfy chair.
 
Report entering the comfy chair:
	if the comfy chair is in the Zen room and chairinheritor is not in the Zen room and chairinheritor is alive and chairinheritor is not off-stage and the chairinheritor is not asleep:
		if the best route from the Zen room to the location of the chairinheritor is a direction:
			let chair-route be a list of rooms;
			let place be the Zen room;
			let way be north;
			while place is not the location of the chairinheritor:
				now way is best route from place to the location of the chairinheritor;
				now place is the room way of place;
				if place is not the location of the chairinheritor:
					add place to chair-route;
					now place is visited;
					now retreat location is place; [will end up being the last room before the final room]
			move the comfy chair to the location of chairinheritor;
			now comfy chair is not scenery;
			now player is not hidden;
			say "You hear [the chairinheritor] screaming: '[if player is male]He[otherwise if player is female]She[otherwise]It[end if]'ll probably be in the Zen Room!' Suddenly, you feel yourself, and the chair, moving at a breakneck speed[if chair-route is not empty] through [chair-route with definite articles][end if]. A few moments later you find yourself in [the printed name of the location]. 'Well, well, well,' [the chairinheritor] smirks, 'look who we have here. We meet at last, Adventurer!'";
			take no time;
			rule succeeds.

[Elemental Plane: see Kerkerkruip Events and Specials]

Kerkerkruip Locations ends here.
