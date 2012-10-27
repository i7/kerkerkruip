Kerkerkruip Scenery by Victor Gijsbers begins here.

Use authorial modesty.

[In Inform 7, making something scenery means that it will not be shown in the room description, and that it is fixed in place. In this extension we define scenery objects that may appear in different rooms.]

Chapter - Placing extra scenery

An extra is a kind of thing. An extra is usually fixed in place.

Considered extra is an extra that varies.


Dungeon interest rule (this is the add extra scenery rule):
	let n be the number of off-stage extras;
	if n is greater than 8, now n is 8;
	now n is a random number between 1 and n;
	repeat with i running from 1 to n:
		let considered extra be a random off-stage extra;
		choose an extra room;
		unless considered room is Entrance Hall:
			move considered extra to considered room;
			if generation info is true, say "* placed [considered extra] in [considered room]".

Section - Choosing a room

[The item is in considered extra, and we must generate a considered room.]
[We re-use the Table of Suitable Rooms]

To choose an extra room:
	fill the Table of Suitable Rooms for extra;
	score the suitable rooms for extra;
	sort Table of Suitable rooms in random order;
	sort Table of Suitable rooms in reverse Room Score order;
[	repeat through Table of Suitable Rooms:
		say "[Candidate entry]: [Room Score entry]";]
	let max be the number of filled rows in Table of Suitable Rooms;
	if max is 0:
		now considered room is Entrance Hall;
	otherwise:
		let pos1 be a random number between 1 and max;
		let pos2 be a random number between 1 and max;
		let pos3 be a random number between 1 and max;
		if pos2 is less than pos1, now pos1 is pos2;
		if pos3 is less than pos1, now pos1 is pos3;
		choose row pos1 in the Table of Suitable rooms;
		now considered room is Candidate entry.

To fill the Table of Suitable Rooms for extra:
	blank out the whole of the Table of Suitable Rooms;
	repeat with place running through extra-accepting placed rooms:
[		say place, " ";]
		now considered room is place;
		choose a blank row in the Table of Suitable Rooms;
		now the Candidate entry is place;
		now the Room Score entry is 0.

To score the suitable rooms for extra:
	repeat through the Table of Suitable Rooms:
		now considered room is the Candidate entry;
		now current room score is 0;
		consider the extra scoring rules;
		[say "[considered extra]; [considered room]; [current room score]";]
		now the Room Score entry is current room score.

The extra scoring rules are a rulebook.

Section - Mood

An extra scoring rule (this is the extra mood rule):
	if mood of considered extra is mood of considered room:
		increase current room score by 2;
	if mood of considered extra is non-mood:
		say "BUG: forgot to set mood of [considered extra].".
		
		
		

Chapter - Broken pipe

The broken pipe is an alchemical extra. "A broken pipe continuously spews forth vapours." The broken pipe is iron.
The description of the broken pipe is "Smoke comes from a small iron pipe that is sticking out of the wall. Perhaps it went somewhere useful once, but whatever was attached to it seems to have been forcibly removed.".

Smoke rule (this is the smoke from the broken pipe rule):
	if test room encloses broken pipe:
		if temporary smoke timer is less than 5:
			now temporary smoke timer is 5.


Chapter - Teleportation beacon

[Once turned on, the beacon attracts all teleporters.]

Teleportation-beacon-on is a truth state that varies.

A dungeon interest rule (this is the teleportation-beacon-on rule):
	if a random chance of 1 in 10 succeeds and location of teleportation beacon is placeable:
		now teleportation-beacon-on is true;
	otherwise:
		now teleportation-beacon-on is false.

The teleportation beacon is a magical stone extra. "You recognise a complicated stone contraption in a corner as a teleportation beacon. It seems to be [if teleportation-beacon-on is false]in[end if]active."

The description of the teleportation beacon is "When turned on, this beacon will ensure that all teleportations in Kerkerkruip lead to this room.".

Does the player mean switching on the teleportation beacon: it is likely.
Does the player mean switching off the teleportation beacon: it is likely.
Does the player mean turning the teleportation beacon: it is likely.

Instead of turning or pushing or pulling the teleportation beacon:
	if teleportation-beacon-on is true:
		try switching off the teleportation beacon;
	otherwise:
		try switching on the teleportation beacon.

Instead of switching on the teleportation beacon:
	if teleportation-beacon-on is true:
		take no time;
		say "The beacon is already on.";
	otherwise:
		now teleportation-beacon-on is true;
		say "With a confident magical gesture, you turn on the teleportation beacon. All teleportations in the dungeon will now end up here.".

Instead of switching off the teleportation beacon:
	if teleportation-beacon-on is false:
		take no time;
		say "The beacon is already off.";
	otherwise:
		now teleportation-beacon-on is false;
		say "With a complicated magical gesture, you turn off the teleportation beacon.".


A special teleportation destination rule (this is the teleportation beacon rule):
	unless the teleportation beacon is off-stage:
		if teleportation-beacon-on is true:
			now teleportation-destination is location of teleportation beacon.


Chapter - Statue of shards

The statue of shards is an iron alchemical extra. "A weird statue made of metal shards stands in one of the corners. It is ugly and slightly menacing."

The description of the statue of shards is "It looks like some insane alchemist's practical joke.".

Statue-of-shards-unstable is a truth state that varies.

A dungeon interest rule (this is the statue of shards rule):
	if a random chance of 1 in 2 succeeds:
		now statue-of-shards-unstable is true;
	otherwise:
		now statue-of-shards-unstable is false.
		
Every turn when the location of the statue of shards is the location of the player:
	if statue-of-shards-unstable is true:
		if a random chance of 1 in 25 succeeds:
			say "With a mighty bang, the statue of shards [bold type]explodes[roman type], dealing [run paragraph on]";
			have a fragmentation event in location with statue of shards by player.



Chapter - Flickering lights

The flickering lamps are a civilised extra. "Flickering lamps hang suspended from the ceiling, casting weird shadows all across the room." Understand "weird" and "shadows" as the flickering lamps. The flickering lamps are plural-named.

The description of the flickering lamps is "Because of the constantly shifting patterns of light and shadows, it should be relatively easy to hide in this room.".

Last detection rule (this is the flickering lamps detection rule):
	if the location encloses the flickering lamps:
		let n be the detection probability divided by 2;
		now the detection probability is n.







Part - Symbols

A symbol-extra is a kind of extra.

Understand "read [symbol-extra]" as examining.

An extra scoring rule (this is the extra symbols in same room rule):
	if considered extra is a symbol-extra:
		if considered room encloses a symbol-extra:
			decrease current room score by 20.

Chapter - Holy symbols

The holy symbols are a religious symbol-extra. "Hundreds of holy symbols cover the walls." The holy symbols are plural-named.

The description of the holy symbols is "You see the symbols of all the more life-affirming religions you know: suns and stars, solar wheels, crosses, hexagrams, flames, trees, birds, and many others. Presumably, their presence protects against undead and demonic beings.".

An attack modifier rule (this is the holy symbols attack bonus rule):
	if the location encloses the holy symbols:
		if the global attacker is undead or the global attacker is demonic:
			if the numbers boolean is true:
				say " - 2 (holy symbols)[run paragraph on]";
			decrease the attack strength by 2;

Chance to win rule when the location encloses the holy symbols (this is the CTW holy symbols rule):
	if the global attacker is undead or the global attacker is demonic:
		decrease the chance-to-win by 2.


Chapter - Unholy symbols

The unholy symbols are a religious symbol-extra. "Hundreds of unholy symbols cover the walls." The holy symbols are plural-named.

The description of the unholy symbols is "You see the symbols of all the death-worshiping religions you know: skulls and bones, pentagrams, moons, bats, scythes, and many others. Presumably, their presence strengthens undead and demonic beings.".

An attack modifier rule (this is the unholy symbols attack bonus rule):
	if the location encloses the unholy symbols:
		if the global attacker is undead or the global attacker is demonic:	
			if the numbers boolean is true, say " + 2 (unholy symbols)[run paragraph on]";
			increase the attack strength by 2.
		
Chance to win rule when the location encloses the unholy symbols (this is the CTW unholy symbols rule):
	if the global attacker is undead or the global attacker is demonic:
		decrease the chance-to-win by 2.		

Kerkerkruip Scenery ends here.
