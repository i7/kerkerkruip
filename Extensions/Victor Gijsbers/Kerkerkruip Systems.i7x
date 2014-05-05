Kerkerkruip Systems by Victor Gijsbers begins here.

Use authorial modesty.

Volume - Systems

Test score is a number that varies.
Test result is a truth state that varies.
The test subject is a person that varies.
The test room is a room that varies.
The test object is an object that varies.



Part - Keeping track of where things are

Section - Worldsharable

Definition: a thing is worldsharable if it is not off-stage.

Definition: a backdrop is worldsharable: no.

Definition: a person is worldsharable if it is not off-stage and it is alive.

Section - Denizen

Definition: a thing is denizen if it is worldsharable and the location of it is placed.

Section - World sharing

To decide whether (guy - a thing) and (other guy - a thing) share a world:
	if guy is not worldsharable or other guy is not worldsharable:
		decide no;
	if the location of guy is the location of other guy:
		decide yes;
	if guy is denizen and other guy is denizen:
		decide yes;
	if guy is a backdrop or other guy is a backdrop:
		[avoid testing the location of a backdrop]
		[this will not work correctly if the backdrop is present somewhere besides the main dungeon]
		decide no;
	if location of guy is location of other guy:
		decide yes;
	let way be best route from (location of guy) to (location of other guy);
	if way is a direction:
		decide yes;
	repeat with wherever running through regions:
		if location of guy is in wherever:
			if location of other guy is in wherever:
				decide yes;
	decide no.

Section - Worldsharer

[ALWAYS set the world test subject before asking about worldsharers.]

World test subject is a thing that varies. World test subject is yourself.

Definition: a thing is worldsharer if it and world test subject share a world.

Part - Properties of rooms

[Standard set of properties:
X is connectable.
X is not connection-inviting.
X is placeable.
X is habitable.
X is treasurable.
X is vp-agnostic.
X is not consecrated.
X is civilised/religious/barren/deathly/elemental/magical/alchemical]


Section - Placement properties

A room can be connectable. A room is usually connectable. [Additional connections can be made in the last stage of making the map, and digging is allowed.]

A room can be connection-inviting. A room is usually not connection-inviting. [If connection-inviting (and connectable), all possible connections to this room will be made.]

A room can be placeable. A room is usually placeable. [Not placeable rooms are not considered during the normal dungeon creation.]

A room can be secretly placeable. A room is usually not secretly placeable. [A room can be both placeable and secretly placeable. If so, it has a chance to be placed in the main dungeon and another outside the connected dungeon.]

A room can be habitable. A room is usually habitable. [Monsters can be placed in it.]

A room can be treasurable. A room is usually treasurable. [Treasures can be placed in it.]

A room can be extra-accepting. A room is usually extra-accepting. [Extras can be placed in it.]

A room can be nogo. A room is usually not nogo. [Nogo rooms are not listed in exits and remember commands.]

To mark (place - a room) as normally placed:
	now place is placed;
	now place is not secretly placeable;

To mark (place - a room) as secretly placed:
	now place is placed;
	now place is secretly placeable;
	now place is not teleportable;

Section - Derived Properties of Rooms

Definition: A room is secretly placed if it is placed and it is secretly placeable.

Definition: A room is normally placed if it is placed and it is placeable.

Definition: A room is denizen if it is placed and it is not nogo.

Definition: A room (called place) is memorable:
	if the place is a visited tunnel, no;
	if the place is nogo, no;
	if the place is not placed, no;
	if the place is visited, yes;
	if the place is secretly placed, no;
	yes.

Section - Vertical placement

[This section defines properties of rooms that affect how deep in the dungeon they are placed. It also contains the necessary rules for doing this.]

[vp-agnostic: standard
vp-underground: only underground
vp-likely-underground: probably underground
vp-above-ground: only above ground (z =>0)
vp-high: only above ground level (z>0)
vp-likely-high: more likely above ground]

Vertical placement is a kind of value. The vertical placements are vp-agnostic, vp-underground, vp-likely-underground, vp-above-ground, vp-high, and vp-likely-high.

A room has a vertical placement. The vertical placement of a room is usually vp-agnostic.

[A room can be underground or not underground. A room is usually not underground. [Underground rooms can only be placed underground, and are more likely than other rooms to be placed so.]]

A placement possible rule (this is the vertical placement possible rule):
	if considered room is vp-underground:
		if the considered-z is not less than 0:
			rule fails;
	if considered room is vp-above-ground:
		if the considered-z is less than 0:
			rule fails;
	if considered room is vp-high:
		if the considered-z is not greater than 0:
			rule fails.

A placement scoring rule (this is the vertical placement scoring rule):
	if considered room is vp-underground or considered room is vp-likely-underground:
		if the considered-z is less than 0:
			increase current room score by 0 - considered-z;
	if considered room is vp-high or considered room is vp-likely-high:
		if the considered-z is greater than 0:
			increase current room score by considered-z.
			
Section - Mood

[Mood is used during generation of the dungeon. Rooms with the same mood are more often placed together, and treasures are often placed in a room with fits their mood.]

Mood is a kind of value. The moods are civilised, religious, barren, deathly, elemental, magical, alchemical and non-mood.
A room has a mood. The mood of a room is usually barren.

A placement scoring rule (this is the link rooms with the same mood rule):
	if the mood of considered room is the mood of original room:
		[say "([considered room] has same mood as [original room])";]
		increase current room score by 2.

Section - Consecration

[Temples should be consecrated. Some powers -- such as extra praying abilities -- will only work in non-consecrated rooms.]

A room can be consecrated. A room is usually not consecrated.



Section - Collapse

First carry out going (this is the collapse rule):
	if the room noun of location collapses location:
		let n be greatest power of the player;
		if a random chance of n in 3 succeeds:
			let X be room noun of location;
			change the noun exit of location to nothing;
			let reverse be the opposite of noun;
			change the reverse exit of X to nothing;
			say "With a huge crash, the [if noun is up or noun is down]staircase[otherwise]corridor[end if] [bold type]collapses[roman type] behind you!";
			now the retreat location is X;
			now X does not collapse location;
			now location does not collapse X;
			wait for any key;
		otherwise:
			say "That passage felt a bit unstable -- you feel that it [bold type]might collapse[roman type] in the future.".

Section - Tunnels

Tunnel is a kind of room. "A fairly nondescript tunnel." A tunnel is usually not placeable. A tunnel is usually not habitable. There is 35 tunnels.

[Note: we cannot use Dynamic Objects to create new tunnels without disabling fast route finding. (Fast route finding uses a table of rooms, and fails messily when we add new rooms to the game.) So I'm just starting out with 25 tunnels. We don't want the player to dig hundreds of tunnels anyway.]


Section - Digging and extra rooms

Digging is an action applying to one object.
Understand "dig [direction]" as digging.

Check digging (this is the dig in a direct rule):
	if noun is not a cardinal direction:
		say "You can only dig north, south, west, east, up, or down." instead.

A thing can be a digging tool. A thing is usually not a digging tool.

Check digging (this is the can only dig when carrying a digging tool rule):
	unless (the player has a digging tool or tunneling claws is adapted):
		take no time;
		say "You need a suitable tool to dig." instead.

Check digging (this is the only dig in connectable rooms rule):
	unless location is connectable:
		say "A magical force prevents you from digging." instead.

Check digging (this is the only dig in placed rooms rule):
	unless location is placed:
		say "A magical force prevents you from digging." instead.

Check an at-React pc digging (this is the cannot dig as reaction rule):
	take no time;
	say "You cannot dig as a reaction." instead.

Carry out digging:
	let x be the x noun of location;
	let y be the y noun of location;
	let z be the z noun of location;
	if the space at x by y by z is free:
		if there is at least one not placed tunnel:
			let item be a random not placed tunnel;
			place item from location at x by y by z;
			say "You [if tunneling claws is adapted]quickly dig[otherwise]magically create[end if] a tunnel [noun].";
			do the dig move;
		otherwise:
			say "The laws of this place prevent further digging.";
	otherwise:
		let item be the room at x by y by z;
		if item is the room noun from the location: 
			say "There already is a passage there.";
			take no time;
		otherwise:
			if item is connectable:
				change the noun exit of the location to item; 
    				let reverse be the opposite of noun; 
    				change the reverse exit of item to the location;
				say "You [if tunneling claws is adapted]quickly dig[otherwise]magically create[end if] a tunnel [noun].";
				do the dig move;
			otherwise:
				say "A magical force prevents you from digging.".

To do the dig move:
	if the player can move:
		if the combat status is not peace:
			now the player is runner;
			extract the player from combat, giving enemies a chance to hit;
			now the player is not runner;
		if the player is mobile:
			let place be the room noun of location;
			now retreat location is location;
			move the player to place;
			now the take no time boolean is false.


Last carry out looking when the location is a tunnel (this is the hint about other rooms rule):
	let K be a list of directions;
	let m be 0;
	repeat with way running through cardinal directions:
[		say "testing [way] ";]
		let x be the x way of location;
		let y be the y way of location;
		let z be the z way of location;
		if not the space at x by y by z is free:
			let place be room at x by y by z;
[			say "[place] is [way] of [location] ";]
			unless place is the room way from location:
				unless place is a tunnel:
					increase m by 1;
					add way to K;
	if m is greater than 0:
		say "There seems to be somewhat different stone [K].".




Section - Collapsing passages

Collapsing is an action applying to one object.
Understand "collapse [direction]" as collapsing.

Check collapsing (this is the collapse in a direct rule):
	if noun is not a cardinal direction:
		say "You can only collapse a passage to the north, south, west, east, up, or down." instead.

A thing can be a collapsing tool. A thing is usually not a collapsing tool.

Check collapsing (this is the can only collapse when carrying a collapsing tool rule):
	unless the player has a collapsing tool:
		say "You need a suitable tool to collapse passages." instead.

Check collapsing:
	let place be the room noun from location;
	unless place is a room:
		take no time;
		say "There is no passage there to collapse." instead;
	otherwise:
		if the location is not connectable or place is not connectable:
			take no time;
			say "A magical force prevents you from collapsing that passage." instead.

Carry out collapsing:
	let place be room noun of location;
	change the noun exit of location to nothing;
	let reverse be the opposite of noun;
	change the reverse exit of place to nothing;
	say "With a huge crash, the [if noun is up or noun is down]staircase[otherwise]corridor[end if] collapses!".


Section - Support for mapping

To decide whether the map can be shown:
	if glulx graphics is supported and glulx graphic-window mouse input is supported and glulx PNG transparency is supported:
		decide yes;
	decide no.

[Kerkerkruip's REMEMBER command uses a room's visited status to list rooms. However, we might have a need for showing rooms on the map that haven't been visited yet.]

A room can be map-revealed. A room is usually not map-revealed.

[We may need to show enemies without actually mapping the rooms they are in. We still need to reserve space on the map for necessary rooms, however, and can do so by designating rooms to be "enemy-drawn".]

A room can be enemy-revealed. A room is usually not enemy-revealed.

[It might make sense for some rooms to be drawn as if they were tunnels; these would generally be linear rooms, such as a bridge.]

A room can be tunnel-drawn. A room is usually not tunnel-drawn. A tunnel is usually tunnel-drawn.

Definition: a room (called the place) is map-ready if the place is placed and (the place is visited or the place is map-revealed or the place is enemy-revealed).

Extent-minimum-x is a number variable.
Extent-maximum-x is a number variable.
Extent-minimum-y is a number variable.
Extent-maximum-y is a number variable.
Extent-minimum-z is a number variable.
Extent-maximum-z is a number variable.

To calculate the extent of the dungeon:
	now extent-minimum-x is 100;
	now extent-maximum-x is -100;
	now extent-minimum-y is 100;
	now extent-maximum-y is -100;
	now extent-minimum-z is 100;
	now extent-maximum-z is -100;
	repeat with place running through map-ready rooms:
		let x be x-coordinate of place;
		let y be y-coordinate of place;
		let z be z-coordinate of place;
		if x is greater than extent-maximum-x:
			now extent-maximum-x is x;
		if x is less than extent-minimum-x:
			now extent-minimum-x is x;
		if y is greater than extent-maximum-y:
			now extent-maximum-y is y;
		if y is less than extent-minimum-y:
			now extent-minimum-y is y;
		if z is greater than extent-maximum-z:
			now extent-maximum-z is z;
		if z is less than extent-minimum-z:
			now extent-minimum-z is z.	


Chapter - Arenas

Section - Arena and Holding Cell Kinds

An arena is a kind of room. An arena has a room called the challenge site. An arena can be conquered.

An arena can be faction-imposing. An arena is usually not faction-imposing.
An arena can be challenged-group-inviting. An arena is usually not challenged-group-inviting.

An arena is usually not connectable.
An arena is usually not connection-inviting.
An arena is usually not placeable.
An arena is usually not habitable.
An arena is usually not treasurable.
An arena is usually not teleportable.
An arena is usually not extra-accepting.
An arena is usually vp-agnostic.
An arena is usually magical.

A holding cell is a kind of room. The description of a holding cell is usually "BUG: the player should never end up here." 

A holding cell is usually not connectable.
A holding cell is usually not connection-inviting.
A holding cell is usually not placeable.
A holding cell is usually not habitable.
A holding cell is usually not treasurable.
A holding cell is usually not teleportable.
A holding cell is usually not extra-accepting.
A holding cell is usually vp-agnostic.
A holding cell is usually magical.

An arena has a room called the staging area.

Section - Having a fight in an Arena

[The challenged opponent is an object that varies;] [the noun]
[The selected arena is an object that varies;] [the second noun]

To have (first guy - a person) and (second guy - a person) fight in (place - an arena):
	try the first guy trying challenging the second guy in the place;

Challenging it in is an action applying to one visible thing and one visible object.
			
Check an actor challenging someone in (this is the must be enemies to challenge rule):
	unless the person asked opposes the noun:
		stop the action; [silently]
	if the person asked is the noun:
		stop the action; [silently]

Check an actor challenging someone in (this is the player should be the actor when challenging rule):
	if the noun is the player:
		instead try challenging the person asked in the second noun;

Check an actor challenging someone in (this is the NPCs simulate arena battle rule):
	if the person asked is the player:
		continue the action;
	let n be level of the actor plus level of the noun;
	increase n by 4;
	let m be level of the person asked;
	increase m by 2;
	while the person asked is alive and the noun is alive:
		if a random chance of m in n succeeds:  [chance is: LVL1 + 2 / (LVL1 + 2 + LVL2 + 2); creatures of the same level: 1/2; level 4 vs level 3: 6/11; level 4 vs level 2: 6/10; level 4 vs level 0: 6/8.]
			decrease health of the noun by 2;
		otherwise:
			decrease health of the person asked by 2;
	if location of the person asked is location of the player:
		Let the defeated be the noun;
		if the person asked is not alive:
			now the defeated is the person asked;
		say "[The name of the person asked] and [the name of the noun] briefly flicker in and out of existence. When they become solid once more, [bold type][the name of the defeated] has been killed[roman type]!";
	stop the action.

The player should be the actor when challenging rule is listed first in the check challenging it in rules.

The must be enemies to challenge rule is listed first in the check challenging it in rules.

The NPCs simulate arena battle rule is listed last in the check challenging it in rules.

Carry out an actor challenging someone in (this is the remember the challenge site rule):
	now the challenge site of the second noun is the location of the person asked;

Carry out an actor challenging someone in (this is the place challenged opponents in staging area rule):
	extract the noun from combat;
	move the noun to the staging area of the second noun;
	if the second noun is a challenged-group-inviting arena and the noun is group leading and the noun is not defeated individually and the noun is initially accompanied:
		repeat with the guy running through people who accompany the noun:
			extract the guy from combat;
			move the guy to the location of the noun;

Carry out an actor challenging someone in (this is the impose arena faction rule):
	if the second noun is a faction-imposing arena (called the place) (this is the impose arena-faction rule):
		Repeat with guy running through people in the staging area of the second noun:
			now the faction of guy is arena-faction;

Carry out an actor challenging someone in (this is the arena arrival rule):
	carry out the arena arrival activity with the second noun;

The place challenged opponents in staging area rule is listed first in the carry out challenging it in rules.

The impose arena faction rule is listed last in the carry out challenging it in rules.

The arena arrival rule is listed last in the carry out challenging it in rules.

Arena arrival of something is an activity on objects.

For arena arrival of an arena (called destination) (this is the move the challenger to the arena rule):
	extract the person asked from combat;
	move the person asked to the destination.

Section - Getting out of an Arena

Arena exit of something is an activity on objects.

Last every turn when the location is an arena and the player is alive (this is the check for completed arena battle rule):
	update the combat status;
	while the location is an arena and combat status is peace:
		if the staging area of the location is not the location and someone is in the staging area of the location:
			make no decision;
		[any bugs here, such as failing to exit the arena, can cause infinite loops]
		carry out the arena exit activity with the location;
		update the combat status;

Before arena exit of an arena (called place) (this is the clean up conquered arena rule):
	Now the place is conquered;
	repeat with item running through things in the place:
		unless (the item is the player or the item is a backdrop or the item is shimmering):
			move item to the challenge site of the place;

For arena exit of an arena (called place) (this is the standard for arena exit rule):
	say "You are [bold type]transported back[roman type] from the [place].";

After arena exit of an arena (called place) (this is the finally return the player from the arena rule):
	[there should never be combat at this point, so we shouldn't need to extract the player from combat]
	move player to the challenge site of the place.

Section - Actions in an Arena

Instead of digging in an arena:
	take no time;
	say "The magical walls resist your efforts at digging.".

A teleport impossible rule (this is the no teleportation in arena rule):
	if the location of the test subject is an arena:
		rule succeeds.

Chapter - Size

Size is a kind of value. The sizes are tiny, small, medium, large, huge and gargantuan.

A thing has a size. A thing is usually medium.

A person has a size called the base size.

Last when play begins (this is the set base size rule):
	repeat with guy running through persons:
		now base size of guy is size of guy.

Understand the size property as describing a weapon.
Understand the size property as describing a person.

Before printing the name of a weapon (called item):
	if item is not medium:
		say "[size of item] ".

Before printing the plural name of a weapon (called item):
	if item is not medium:
		say "[size of item] ".

Status attribute rule (this is the size status rule):
	if player is not medium:
		if long status is true:
			say "Your current size is [bold type][size of the player][roman type][if size of the player is not base size of the player], and your base size is [bold type][base size of the player][roman type][end if].[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute][size of the player] in stature[run paragraph on]";


[Note: sizes of a person are meant to reflect how big they themselves are. Sizes of objects are meant to reflect for what size person they were meant. Thus, a 'medium dagger' is much smaller than a 'medium bed': both are normal-sized objects as they are made for normal-sized humans. A huge dagger might be about the same size as a medium sword -- it would just be hard to handle for a medium person, because the hilt would be too big to grip with a hand!]

The standard measure is a medium thing. [You can test the size difference of the standard measure and X.]

To decide which number is the size difference of (a - a thing) and (b - a thing):
	if a is medium and b is medium: [most common case, just to speed things up]
		decide on 0;
	let n be 0;
	if a is tiny:
		increase n by 2;
	if a is small:
		increase n by 1;		
	if a is large:
		decrease n by 1;
	if a is huge:
		decrease n by 2;	
	if a is gargantuan:
		decrease n by 3;
	if b is tiny:
		decrease n by 2;
	if b is small:
		decrease n by 1;		
	if b is large:
		increase n by 1;
	if b is huge:
		increase n by 2;	
	if b is gargantuan:
		increase n by 3;
	decide on n.
	
[The resulting number lies between +5 (a is tiny, b is gargantuan) and -5 (a is gargantuan, b is tiny)]

Section - Size and combat

An attack modifier rule (this is the size attack modifier rule):
	if the global defender is not medium:
		if the global defender is tiny:
			say " - 2 (defender tiny)[run paragraph on]";
			decrease the attack strength by 2;
		if the global defender is small:
			say " - 1 (defender small)[run paragraph on]";
			decrease the attack strength by 1;		
		if the global defender is large:
			say " + 1 (defender large)[run paragraph on]";
			increase the attack strength by 1;
		if the global defender is huge:
			say " + 2 (defender huge)[run paragraph on]";
			increase the attack strength by 2;
		if the global defender is gargantuan:
			say " + 3 (defender gargantuan)[run paragraph on]";
			increase the attack strength by 3.

Chance to win rule when the global defender is not medium (this is the CTW defender size bonus rule):
	if the global defender is tiny:
		decrease the chance-to-win by 2;
	if the global defender is small:
		decrease the chance-to-win by 1;		
	if the global defender is large:
		increase the chance-to-win by 1;
	if the global defender is huge:
		increase the chance-to-win by 2;
	if the global defender is gargantuan:
		increase the chance-to-win by 3.

An add specific damage rule (this is the size damage increase rule):
	if damage-by-hitting is true:
		if the global attacker is not medium:
			if the global attacker weapon is not size-agnostic:
				if the size of the global attacker is:
					-- large:
						add 1 points of physical damage with reason "large attacker", unconditionally;
					-- huge:
						add 2 points of physical damage with reason "huge attacker", unconditionally;
					-- gargantuan:
						add 4 points of physical damage with reason "gargantuan attacker", unconditionally.
						
A remove specific damage rule (this is the size damage decrease rule):
	if damage-by-hitting is true:
		if the global attacker is not medium:
			if the global attacker weapon is not size-agnostic:
				if the size of the global attacker is:
					-- tiny:
						remove 2 points of physical damage with reason "tiny attacker";
					-- small:
						remove 1 points of physical damage with reason "small attacker".
						
An attack modifier rule (this is the weapon size attack modifier rule):
	if global attacker weapon is not size-agnostic:
		if the global attacker weapon is not a natural weapon part of the global attacker:
			let n be the size difference of the global attacker and the global attacker weapon;
			if n is less than 0:
				now n is 0 minus n;
			unless n is 0:
				let n be n times 2;
				decrease n by 1;
				if the numbers boolean is true, say " - [n] (weapon size)[run paragraph on]";
				decrease the attack strength by n.

[No chance to win rule: monsters who start using over- or undersized weapons probably deserve being clumsy.]

Section - Size of weapons

[These operations are now reversible.]

To increase the size of (item - a weapon):
	unless the size of item is gargantuan:
		now the size of item is the size after the size of item;
		unless item is size-agnostic:
			increase weapon damage bonus of item by 1;
			increase damage die of item by 1;
			if size of item is small or size of item is large or size of item is gargantuan:
				decrease parry-against bonus of item by 1;
				increase dodge bonus of item by 1.
	
To decrease the size of (item - a weapon):
	unless the size of item is tiny:
		now the size of item is the size before the size of item;
		unless item is size-agnostic:
			decrease weapon damage bonus of item by 1;
			decrease damage die of item by 1;
			if size of item is tiny or size of item is medium or size of item is huge:
				increase parry-against bonus of item by 1;
				decrease dodge bonus of item by 1.
	
A dungeon interest rule (this is the change weapon sizes rule):
	repeat with item running through not off-stage not non-treasure not carried not size-agnostic weapons:
		if a random chance of 1 in 20 succeeds:
			decrease the size of item;
			if a random chance of 1 in 2 succeeds:
				decrease the size of item;
			if generation info is true, say "* Now [item] is [size of item].";
		otherwise:
			if a random chance of 1 in 10 succeeds:
				increase the size of item;
				if a random chance of 2 in 3 succeeds:
					increase the size of item;
					if a random chance of 2 in 3 succeeds:
						increase the size of item;
				if generation info is true, say "* Now [item] is [size of item].".

Section - Size of People

To increase the size of (guy - a person):
	unless the base size of guy is gargantuan:
		now the base size of guy is the size after the base size of guy;
	unless the size of guy is gargantuan:
		now the size of guy is the size after the size of guy;
	
To decrease the size of (guy - a person):
	unless the base size of guy is tiny:
		now the base size of guy is the size before the base size of guy;
	unless the size of guy is tiny:
		now the size of guy is the size before the size of guy;

Section - Other effects of size

A detection rule (this is the size increases probability of detection rule):
	let n be the size difference of (the player) and (the standard measure);
	if n > 0:
		say " + ", n, " ([size of the player])[run paragraph on]";
	if n < 0:
		let m be -1 * n;
		say " - [m] ([size of the player])[run paragraph on]";
	increase hiding roll by n.


Chapter - Powers

A power is a kind of object.

A power can be granted. A power is usually not granted.
A power has a number called the power level. The power level of a power is usually 1.
A power has some text called the command text. The command text of a power is usually "".
A power has a text called the description.
A power has a text called the power-name.
A power can be sacrificable. A power is usually sacrificable.

Granting relates one monster to one power. The verb to grant (he grants, they grant, he granted, it is granted, he is granting) implies the granting relation.

Killing rule (this is the grant powers when a monster is slain rule):
	if the killer-guy is the player and the killed-guy is not the player:
		do the absorption with killed-guy.

Every turn (this is the remove all killed monsters from play rule):
	repeat with guy running through dead not off-stage persons:
		unless guy is the player:
			do the absorption with guy.

A person can be already-granted. A person is usually not already-granted.
Every turn (this is the remove already-granted rule):
	repeat with guy running through already-granted people:
		now guy is not already-granted.

To do the absorption with (guy - a person):
	have the guy disappear;
	if guy is grouper and guy is not group leading:
		let guy2 be a random person accompanied by guy; [Redirect absorption to group leader]
		unless guy2 is defeated individually:
			now guy is guy2;
	if guy is not group leading or group of guy has been defeated or guy is defeated individually:
		unless guy is already-granted:
			increase score by level of guy;
			now test subject is guy;
			unless absorption is stopped:
				do power transferral with the guy;
				heal fully because the guy is slain;
				now guy is already-granted;
			do achievement awarding for the guy.

To do power transferral with (guy - a person):
	repeat with X running through powers:
		if guy grants X:
			unless X is granted:
				follow the absorbing rules for X;
				now X is granted;
				let n be the power level of X;
				let Z be a list of powers;
				repeat with Y running through granted powers:
					unless X is Y:
						unless power level of Y is greater than the power level of X:
							add Y to Z;
							follow the repelling rules for Y;
							now Y is not granted;
				if the number of entries in Z is greater than 0:
					say "The violence of the absorption drives [Z with definite articles] out of your body. ";
				grant a faculty increase of n.

To heal fully because (guy - a person) is slain:
	if the level of guy is greater than 0 and the level of guy is not 10:
		unless the player is undead:
			say "Absorbing a soul has [bold type]fully healed[roman type] you.";
			fully heal the player;
		otherwise:
			say "Absorbing a soul has [bold type]restored some of your health[roman type].";
			let n be 8 times level of guy;
			heal the player for n health;
	if the level of guy is 10:
		do the level 10 victory with guy.

To have (guy - a person) disappear:
	consider the disappearing rules for guy;
	let X be the holder of guy;
	unless X is nothing:
		repeat with Y running through things had by guy:
			move Y to X;
			if Y is a weapon:
				now Y is not readied;
	remove guy from play.


To do achievement awarding for (guy - a person):
	if level of guy is 1:
		award achievement assistant dungeoneer;
	if level of guy is 2:
		award achievement adventurer;
	if level of guy is 3:
		award achievement hunter;
	if level of guy is 4:
		award achievement destroyer.

Disappearing is a person based rulebook.
Absorbing is a power based rulebook.
Repelling is a power based rulebook.

Section - Greatest power of the player

To decide which number is the greatest power of the player:
	let m be 0;
	if at least one power is granted:
		repeat with X running through granted powers:
			if power level of X is greater than m:
				now m is power level of X;
	decide on m.

Section - Whether absorption is stopped

The absorption stopping rules are a rulebook.

To decide whether absorption is stopped:
	consider the absorption stopping rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.




Chapter - Ranged weapons

[Some specials should or should not happen for ranged weapons. For instance, a heated ranged weapon does not deal extra damage.]
	
A weapon can be ranged. A weapon is usually not ranged.

Chapter - Armour-stoppable

[Armour should only reduce the damage of some weapons. For instance, armour doesn't help against a lightning bolt or dragon's fire.]

A weapon can be armour-stoppable. A weapon is usually armour-stoppable.

Chapter - Size-agnostic

[Some weapons are not dependent on the user's size for their damage output.]

A weapon can be size-agnostic. A weapon is usually not size-agnostic.


Chapter - Materials

Material is a kind of value.

[A material has a number called the corrosion resistance. [Percentile chance, because we are working with some small probabilities here -- they come up every turn, and get large quickly.]]
Heat-behaviour is a kind of value. The heat-behaviours are burner and melter. [A material has a heat-behaviour.]

The materials are defined by the Table of Materials.

Table of Materials
material	material-adjective	destroying heat	heat-behaviour	corrosion resistance
other-material	"nondescript"	5	burner	950					
iron	"iron"	10	melter	995
silver	"silver"	7	melter	985
paper	"paper"	1	burner	950
cloth	"cloth"	1	burner	950
wood	"wooden"	3	burner	970
leather	"leather"	3	burner	980
flesh	"flesh"	2	burner	900
bone	"bone"	4	burner	940
glass	"glass"	6	melter	999
stone	"stone"	15	melter	998
dragon skin	"dragon skin"	20	burner	999
radiance	"radiant"	999	melter	1000
darkness	"dark"	999	melter	1000
adamant	"adamantine"	999	melter	1000
vapour	"vapourous"	999	burner	1000
fire		"fiery"	999		burner	1000
electricity	"electric"		999		burner	1000

Understand the material property as describing a thing.
[Understand the material-adjective property as describing a material.]
Understand "wooden" as wood.
Understand "radiant" as radiance.
Understand "adamantine" as adamant.
Understand "vapourous" and "vapor" and "vaporous" as vapour.

A thing has a material. The material of a thing is usually other-material.
The material of a person is usually flesh.

A thing has a material called the original material.

When play begins (this is the set original material rule):
	repeat with item running through things:
		now the original material of item is the material of item.

When play begins (this is the set incorruptibility based on material rule):
	repeat with item running through things:
		if the material of item is adamant or the material of item is radiance:
			now item is incorruptible.

Before printing the name of a thing (called item):
	if material of item is not original material of item:
		if item is not proper-named:
			say "[material-adjective of material of item] ".

Before printing the plural name of a thing (called item):
	if material of item is not original material of item:
		if item is not proper-named:
			say "[material-adjective of material of item] ".

First after printing the name of a thing (called item):
	if material of item is not original material of item:
		if item is proper-named:
			say " (now [material-adjective of material of item])".






[Section - Test other-material - Not for Release

Last when play begins:
	repeat with item running through other-material things:
		say "WARNING: [item] doesn't have a material.".
]

Section - Silver

[A damage modifier rule (this is the silver damage rule):
	if the global attacker weapon is silver:
		if the global defender is not undead and the global defender is not demonic:
			say " - 2 (silver weapon)[run paragraph on]";
			decrease the attack damage by 2;
		otherwise:
			say " + 4 (silver weapon)[run paragraph on]";
			increase the attack damage by 4;]

An add specific damage rule (this is the undead silver damage rule):
	if damage-material is silver:
		if victim is undead or victim is demonic:
			add 4 points of physical damage with reason "silver".

A remove specific damage rule (this is the non-undead silver damage rule):
	if damage-material is silver:
		if victim is not undead and victim is not demonic:
			remove 1 points of physical damage with reason "silver".



Chapter - Attacklike behaviour

Attacking is attacklike behaviour.
Hitting is attacklike behaviour.



Chapter - Doing risky things

[Sometimes, the player can do a risky thing which should allow his enemy to make an attack of opportunity. But we do not want this to be a good way of making your enemy attack before his concentration is high enough -- so we are going to give the enemy a big to-hit bonus when the player is doing something risky.] 

[I don't think we are actually using this right now.]

A person can be risky. A person is usually not risky.

An attack modifier rule (this is the defender is doing something risky rule):
	if the global defender is risky:
		say " + 6 (defender taking risky action)[run paragraph on]";
		increase the attack strength by 6.

Chance to win rule when the global defender is risky (this is the CTW risky bonus rule):
	increase the chance-to-win by 6.




Chapter - Heat

[The heat system currently supports hotness for things. However, giving a hotness to persons is _not_ truly supported, and will lead to unwanted behaviour.]

[Much of the heat system has been turned off. It was too unituitive and punishing. Perhaps also too computation intensive?]

Section - Basics

A thing has a number called the heat strength. The heat strength of a thing is usually 0.

Definition: a thing is hot if its heat strength is greater than 0. 


Section - Feedback

Not-mentioning-hotness is a truth state that varies. Not-mentioning-hotness is false.
Not-mentioning-flaming is a truth state that varies. Not-mentioning-flaming is false.

To turn off mentioning hotness:
	now not-mentioning-hotness is true;
	now not-mentioning-flaming is true.

To turn on mentioning hotness:
	now not-mentioning-hotness is false;
	now not-mentioning-flaming is false.

Before printing the name of hot not flaming thing (called item):
	unless not-mentioning-hotness is true:
		if heat strength of item is less than 3:
			say "hot [run paragraph on]";
		otherwise if heat strength of item is less than 6:
			say "very hot [run paragraph on]";
		otherwise:
			say "blazingly hot [run paragraph on]".

Before printing the plural name of hot not flaming thing (called item):
	unless not-mentioning-hotness is true:
		if heat strength of item is less than 3:
			say "hot [run paragraph on]";
		otherwise if heat strength of item is less than 6:
			say "very hot [run paragraph on]";
		otherwise:
			say "blazingly hot [run paragraph on]".
		
Understand "hot" as a thing when the heat strength of the item described is greater than 0.	
Understand "very hot" as a thing when the heat strength of the item described is greater than 2.
Understand "blazingly" as a thing when the heat strength of the item described is greater than 5.		

Last carry out examining a hot thing:
	now not-mentioning-hotness is true;
	say "[The noun] is ";
	now not-mentioning-hotness is false;	
	if heat strength of noun is less than 3:
		say "hot.";
	otherwise if heat strength of noun is less than 6:
		say "very hot.";
	otherwise:
		say "blazingly hot.".

First attack modifier rule:
	turn off mentioning hotness.

Last attack modifier rule:
	turn on mentioning hotness.

Before damage rule:
	turn off mentioning hotness.

After damage rule:
	turn on mentioning hotness.


Section - Temperatures and flaming

A thing can be flaming. A thing is usually not flaming.
Understand the flaming property as describing a thing. Understand "burning" as flaming.

Every turn (this is the flaming items burn away rule):
	now world test subject is player;
	repeat with item running through flaming not off-stage corruptible worldsharer things:
		if a random chance of 1 in 4 succeeds or destroying heat of material of item + 2 is not greater than heat strength of item:
			now heat strength of item is 0;
			now item is not flaming;
			turn off mentioning hotness;			
			if item is visible, say "[The item] [if material of item is melter]melts[otherwise if material of item is not flesh]burns[otherwise]chars[end if] away.";
			turn on mentioning hotness;			
			remove the item from play.
			
Before printing the name of a flaming thing (called item):
	unless not-mentioning-flaming is true:
		say "burning [run paragraph on]".

Before printing the plural name of a flaming thing (called item):
	unless not-mentioning-flaming is true:
		say "burning [run paragraph on]".

Every turn (this is the heat destroys items rule):
	now world test subject is player;
	repeat with item running through hot not flaming not off-stage corruptible worldsharer things:
		let n be heat strength of item;
		let m be destroying heat of the material of item;
		if m is not greater than n:
			if material of item is burner and m + 2 is greater than n:
				now item is flaming;
				turn off mentioning hotness;
				if item is visible, say "[The item] catches fire!";
				turn on mentioning hotness;				
			otherwise:
				turn off mentioning hotness;
				if item is visible, say "[The item] [if material of item is melter]melts[otherwise if material of item is not flesh]burns[otherwise]chars[end if] away.";
				turn on mentioning hotness;				
				remove the item from play.

Section - Damage

An add specific damage rule (this is the heat increases damage rule):
	if the damage-source is hot:
		unless (damage-by-hitting is true and global attacker weapon is ranged):
			let n be heat strength of damage-source;
			add n points of heat damage with reason "[damage-source] [is-are] hot".

Section - Weapons

An aftereffects rule (this is the heat can cause weapons to break rule):
	let n be heat strength of the global attacker weapon;
	let m be heat strength of the global defender weapon;
	if n is greater than 0 and global attacker weapon is not ranged:
		if the global attacker weapon is corruptible:
			if the attack damage is greater than 0 or defender is at parry:
				if a random chance of n in 50 succeeds:
					turn off mentioning hotness;			
					say "[The global attacker weapon], weakened by being heated, is [bold type]destroyed[roman type]!";
					turn on mentioning hotness;				
					remove global attacker weapon from play;
	if the attack damage is less than 1 and the defender is at parry:
		if m is greater than 0:
			if the global defender weapon is corruptible:
				if a random chance of n in 50 succeeds:
					turn off mentioning hotness;			
					say "[The global defender weapon], weakened by being heated, is [bold type]destroyed[roman type]!";
					turn on mentioning hotness;				
					remove global defender weapon from play.


Section - Material heat resistance

A remove specific damage rule (this is the material heat resistance rule):
	let n be destroying heat of the material of victim - 2;
	if n is less than 0:
		now n is 0;
	remove n points of heat damage with reason "victim made of [material of victim]".

Section - Intrinsic heat resistance

A person has a number called the intrinsic heat resistance. The intrinsic heat resistance of a person is usually 0.

An add specific damage rule (this is the intrinsic heat vulnerability rule):
	if intrinsic heat resistance of victim is less than 0:
		add (intrinsic heat resistance of victim) points of heat damage with reason "intrinsic heat vulnerability". [Not unconditionally!]

A remove specific damage rule (this is the intrinsic heat resistance rule):
	if intrinsic heat resistance of victim is greater than 0:
		remove (intrinsic heat resistance of victim) points of heat damage with reason "intrinsic heat resistance".

Section - Internal heat

A thing has a number called the internal heat. The internal heat of a thing is usually 0.

Definition: a thing (called the item) is internally-heated if the internal heat of item is greater than 0.

When play begins:
	follow the internal heat rule.

Last every turn (this is the internal heat rule):
	repeat with item running through internally-heated things:
		if heat strength of item is less than internal heat of item:
			now heat strength of item is internal heat of item.

Section - Cooling

A thing can be a cooler. A thing is usually cooler. [If a burn check was made for an item, it will become not cooler than 1, and therefore will not cool down this turn. This stops us from having many repeated messages about something cooling down completely.]

Last every turn (this is the cooling rule):
	repeat with item running through hot not flaming things:
		unless item is not cooler and heat strength of item is 1:
			if heat strength of item is greater than internal heat of item:
				if a random chance of 1 in 2 succeeds:
					decrease heat strength of item by 1;
					if heat strength of item is 0 and item is visible:
						if item is a readied weapon: [EASY way to stop too many messages; but it is what we want??]
							say "[The item] has cooled down completely.";
		now item is cooler.


[
Section - Hot items heat up other items

Every turn (this is the hot things heat up other things rule):
	repeat with item running through hot things enclosed by the location:
		if item is held by a container:
			let X be a random container holding item;
			do the burn check with X and strength heat strength of item;
			repeat with item2 running through things held by X:
				do the burn check with item2 and strength heat strength of item;
		if item is a container:
			repeat with item2 running through things held by item:
				do the burn check with item2 and strength heat strength of item;
		if item is held by a person and item is not a readied weapon:
			let X be a random person holding item;
			repeat with item2 running through things held by X:
				if item2 is not part of X:
					do the burn check with item2 and strength heat strength of item.

To do the burn check with (item - a thing) and strength (n - a number):
	if n is greater than heat strength of item:
		let m be n - heat strength of item;
		if a random chance of m in 3 succeeds and a random chance of 1 in 3 succeeds:
			increase heat strength of item by 1;
			now item is not cooler.
]




Chapter - Rust

Section - The property

A thing can be rusted. A thing is usually not rusted.
Understand the rusted property as describing a thing.
Understand "rusted" as a thing when the item described is rusted.
Understand "not-rusted" and "not rusted" and "unrusted" as a thing when the item described is not rusted.

Not-mentioning-rust is a truth state that varies. Not-mentioning-rust is false.

To turn off mentioning rust:
	now not-mentioning-rust is true.

To turn on mentioning rust:
	now not-mentioning-rust is false.

Before printing the name of a rusted thing:
	if not-mentioning-rust is false, say "rusted [run paragraph on]".
	
Before printing the plural name of a rusted thing:
	if not-mentioning-rust is false, say "rusted [run paragraph on]".
	
First attack modifier rule:
	turn off mentioning rust.

Last attack modifier rule:
	turn on mentioning rust.

Before damage rule:
	turn off mentioning rust.

After damage rule:
	turn on mentioning rust.


Section - Damage penalty

A remove specific damage rule (this is the rust decreases damage rule):
	if damage-source is rusted:
		remove 2 points of physical damage with reason "rust".

Section - Rusted monster penalty

An attack modifier rule (this is the rusted monster decreases attack rule):
	if the global attacker is rusted:
		say " - 2 (rust)[run paragraph on]";
		decrease the attack strength by 2.

Chance to win rule when the global attacker is rusted (this is the CTW rusted monster penalty rule):
	decrease the chance-to-win by 2.


Section - Rust spores

A room can be rust-spored. A room is usually not rust-spored.

Definition: rust spores are denizen if a placed room is rust-spored.

Rust spores is a backdrop. Rust spores is everywhere. Rust spores is plural-named. Understand "brown" and "moss" and "spore" as rust spores.

Instead of doing anything with rust spores:
	if the location is not rust-spored:
		say "This place is blessedly free of rust spores.".

Instead of examining rust spores when the location is rust-spored:
	say "These small brown flaked look innocent enough, but they corrode iron faster than one would think possible.".

Instead of taking rust spores when the location is rust-spored:
	say "You attempt to take some of the rust spores, but they are blown out of your hand as you close it.".



Section - Rust spores rust iron items

Every turn (this is the rust spores rust iron rule):
	repeat with place running through rust-spored rooms:
		repeat with item running through iron not rusted corruptible things enclosed by place: [iron mentioned for speed]
			unless item is enclosed by a closed container:
				if item can rust:
					unless (item is a natural weapon and item is part of an iron person):
						if a random chance of 1 in 6 succeeds:
							now item is rusted;
							if item is a person:
								let X be a random natural weapon part of item;
								if X is iron:
									now X is rusted;
							if player can see item:
								turn off mentioning rust;
								say "As rust spores whirl around the room, [the item] rust[unless item is plural-named][s][end if].";
								turn on mentioning rust.


Section - Rusting rules

The rusting rules are a rulebook.

To decide whether (item - a thing) can rust:
	now test object is item;
	consider the rusting rules;
	if rule failed:
		decide no;
	otherwise:
		decide yes.

A rusting rule (this is the hot items cannot rust rule):
	if heat strength of test object is greater than 1:
		rule fails.

A rusting rule (this is the only iron items can rust rule):
	if material of test object is not iron:
		rule fails.


Section - Spreading of the rust

A room can be a rust-spored-candidate.

Every turn when at least one placed room is rust-spored (this is the spread rust spores rule):
	repeat with place running through placed not rust-spored rooms:
		if at least one rust-spored room is adjacent to place:
			if a random chance of 1 in 10 succeeds:
				now place is rust-spored-candidate;
	repeat with place running through rust-spored-candidate rooms:
		now place is rust-spored;
		now place is not rust-spored-candidate;
		if player is enclosed by place:
			say "Clouds of [bold type]rust spores[roman type] drift into the room.".

Every turn when at least three placed room are rust-spored (this is the kill rust spores rule):
	let n be the number of rust-spored rooms;
	if a random chance of n in 1000 succeeds:
		repeat with place running through rust-spored rooms:
			now place is not rust-spored;
			if place is the location:
				say "Suddenly, the [bold type]rust spores blacken and wither[roman type]."

[Every turn when at least one placed room is fungi-killer (this is the kill the rust spores rule):
	repeat with place running through placed rust-spored fungi-killer rooms:
		now place is not rust-spored;
		if place is location:
			say "All the rust spores blacken and wither.".]



Section - Starting with a rusting room

A dungeon interest rule (this is the add rust to the dungeon rule):
	if a random chance of 1 in 50 succeeds:
		let place be a random placed room;
		now place is rust-spored;
		if generation info is true:
			say "* [Place] is full of rust spores.".

Section - Containers which release rust spores

A container can be rust-releasing. A container is usually not rust-releasing.

Every turn when at least one rust-releasing container is not off-stage (this is the rust the contents of rust-releasing containers rule):
	repeat with item running through rust-releasing not off-stage containers:
		if item contains at least one thing:
			repeat with item2 running through things contained by item:
				if item2 can rust:
					now item2 is rusted.

Last report opening a rust-releasing container (called the item):
	now item is not rust-releasing;
	now location is rust-spored;
	say "As you open the container, a large cloud of rust spores drifts out of it.".

[Next rule is "last" because we want to remove treasure packs first.]
Last dungeon finish rule (this is the sometimes containers release rust rule):
	if a random chance of 1 in 10 succeeds:
		if at least one closed openable container is not off-stage:
			let item be a random closed openable  not off-stage container;
			if location of item is placed:
				now item is rust-releasing;
				if generation info is true, say "Made [item] rust-releasing.".





Chapter - Corrosion

[Corrosion does two things: it completely destroys items with a certain chance; and it degrades weapons.]

To corrode (item - a thing):
	if item corrodes:
		if item is visible:
			say "[The item] dissolve[if item is not plural-named]s[end if].";
		remove item from play;
	otherwise if item is a weapon:
		if item corrodes:
			decrease weapon attack bonus of item by 1;
		if item corrodes:
			decrease weapon attack bonus of item by 1;			
		if item corrodes:
			decrease damage die of item by 1;
			if damage die of item is less than 1:
				now damage die of item is 1.


The corroding rules are a rulebook.

To decide whether (item - a thing) corrodes:
	now test object is item;
	consider the corroding rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.

[Two types of resistance: based on the material, and based on the item itself.]

A thing has a number called the personal corrosion resistance. The personal corrosion resistance of a thing is usually 0.

A corroding rule (this is the incorruptible things do not corrode rule):
	if test object is incorruptible:
		rule fails.

A corroding rule (this is the corroding resistances rule):
	let m be the corrosion resistance of the material of test object;
	let n be a random number between 1 and 1000;
	if n is greater than m:
		let m be the personal corrosion resistance of test object;
		let n be a random number between 1 and 1000;
		if n is greater than m:
			rule succeeds.



Chapter - Environmental messages

[currently: smoke and rust spores]

Before printing the locale description of a room (this is the environmental effects rule):
	if the smoke penalty of the location is greater than 0:
		say "[if smoke penalty of the location is greater than 2]Thick[otherwise]Thin[end if] [bold type]clouds of smoke[roman type][if location is rust-spored] and tiny brown spores of the [bold type]rust moss[roman type][end if] fill the room.";
	if the location is rust-spored and the smoke penalty of the location is less than 1:
		say "The air is full of the tiny brown spores of the [bold type]rust moss[roman type].".


Chapter - Resetting Fighters

Section - To Extract From Combat

Last chance to hit is a truth state that varies.

To extract (guy - a person) from combat, giving enemies a chance to hit:
	if the guy is off-stage, stop;
	if giving enemies a chance to hit and the guy is not hidden:
		now last chance to hit is true;
	follow the sudden combat reset rules for guy;
	now last chance to hit is false;

Section - The Sudden Combat Reset Rules

[After teleportation, and other sudden move actions of the player, concentration and so on ought to be reset. They work on the location of the player, so should be called _before_ the move.]

The sudden combat reset rules are an object based rulebook.

[This could be a whole rulebook in itself...]
To decide whether (fighter - a person) would take a parting shot at (deserter - a person):
	if last chance to hit is false, no;
	unless deserter is the player, no;
	if fighter is the player or fighter is the deserter, no;
	if fighter is non-attacker or fighter is asleep or fighter is not alive, no;
	unless fighter opposes deserter, no;
	if deserter is runner, yes;
	if concentration of fighter is greater than 0, yes;
	if fighter presses deserter or deserter presses fighter, yes;
	no.

A first sudden combat reset rule for a person (called the deserter) (this is the last chance to hit the deserter rule):
	[this rule could use optimizing if things get slow - watch out for teleportation grenades in rooms with hundreds of people!]
	repeat with X running through alive persons in the location of the deserter:
		if X would take a parting shot at the deserter:
			try X hitting the deserter;
			if the deserter is not mobile, rule fails;
		now X does not press the deserter;
		now the deserter does not press X;
	
A last sudden combat reset rule for a person (called the deserter) (this is the sudden reset action stats rule):
	if the deserter is the player:
		repeat with guy running through alive persons enclosed by the location:
			reset combat action stats of the guy;
	if the deserter is not the player or the deserter is dead:
		reset combat action stats of the deserter;

To reset combat action stats of (guy - a person):
	now concentration of the guy is 0;
	now offensive flow of the guy is 0;
	now defensive flow of the guy is 0;
	now the guy is at-Inactive;
	now the guy is not at dodge;
	now the guy is not at parry;
	now the guy is not at-block;
	now the guy is not at-roll;
	clean the table of delayed actions for the guy;

Section - Reviving

[This phrase is used by the smoke demon and Israfel, and in arenas]

A person has a faction called the original faction.

When play begins (this is the remember original factions rule):
	Repeat with guy running through people:
		now the original faction of guy is the faction of guy.

To revive (guy - a person) in (place - a room):
	reset combat action stats of guy; 
	now guy is not asleep;
	now the stun count of guy is 0;
	now the stun strength of guy is 0;
	now the size of guy is the base size of guy;
	now the faction of guy is the original faction of guy;
	now guy is unseen;
	now last-seen-location of guy is Null-Room;
	move guy to place;
	restore the health of guy;

Chapter - Forced action

Forced-action is a truth state that varies. Forced-action is false. [When it is true, we don't say anything about a player's motivation. Currently used for the boots of wandering.]

Every turn (this is the remove forced action rule):
	now forced-action is false.



Chapter - Reflection

[Some checks for hitting should not be carried out when the attack was reflected. Reflection happens during check hitting; should remain true during the check hitting for the reflected attack; and should then be stopped.]

Reflection-attack is a truth state that varies. Reflection-attack is false.

First carry out an actor hitting (this is the reset reflection rule):
	now reflection-attack is false.


Part - Person stuff

Chapter - Seen

[ We don't need the full Epistemology extension - just a single property for people is enough for us. ]

A person can be either seen or unseen. A person is usually unseen.

Every turn (this is the mark people as seen every turn rule):
	now all people in the location are seen;



Chapter - Death blessing and death curse

[This is a SECRET status that the player can receive -- for instance, by reading the symbols of death.]

A person can be death-blessed.
A person can be death-cursed.

A remove general damage rule (this is the death-blessed rule):
	if the victim is death-blessed:
		if a random chance of 1 in 15 succeeds:
			remove 10 points of general damage with reason "blessing of life";
			if a random chance of 1 in 2 succeeds:
				now the victim is not death-blessed.

An add general damage rule (this is the death-cursed rule):
	if victim is death-cursed:
		if a random chance of 1 in 20 succeeds:
			add 10 points of general damage with reason "curse of death";
			if a random chance of 1 in 2 succeeds:
				now the victim is not death-cursed.



Chapter - Falling

[First, we implement a falling check. Default outcome is that a person can fall.]

Falling-test-person is a person that varies.

To decide whether (guy - a person) can fall:
	now falling-test-person is guy;
	consider the falling-test rules;
	if rule succeeded:
		decide no;
	otherwise:
		decide yes.

The falling-test rules are a rulebook.

A falling-test rule (this is the fliers cannot fall rule):
	if falling-test-person is flying and falling-reason is not 2:
		rule succeeds.

A falling-test rule (this is the non-moving persons cannot fall rule):
	unless falling-test-person can move:
		rule succeeds.

A falling-test rule (this is the ethereal persons cannot fall rule):
	if falling-test-person is ethereal:
		rule succeeds.

[Now we calculate the destination, if any.]

Falling destination rule (this is the standard falling destination rule):
	now falling-destination is the room down from falling-place;
	unless falling-destination is a room:
		now falling-destination is the location of falling-guy.

[Triggered by the falling event in Kerkerkruip Events.

Fall begins.
Stage 1: Does anything want to prevent us from falling? PREEMPT FALLING RULE
Stage 2: Does something in the current room want to give a custom effect to falling? FIRST FALLING RULE
Stage 3: Does something in the destination room want to give a custom effect to falling? FALLING RULE
Stage 4: Otherwise, we apply standard damage in the LAST FALLING RULE.]

Falling rule (this is the move the falling person to the destination rule):
	extract falling-guy from combat;
	move falling-guy to falling-destination.

Last falling rule (this is the standard deal falling damage rule):
	unless falling-guy is flying:
		unless falling-guy is ethereal:
			let m be a random number between 2 and 5;
			if falling-reason is 2:
				decrease m by 1; [small bonus for voluntary jumping]
			if a random chance of 1 in 10 succeeds: [make it slightly dangerous]
				increase m by 5;
			deal m points of physical damage;
			have no-source inflict damage on falling-guy;
			if falling-guy is the player:
				say "With a loud smack, you land in [the location], [if total damage is 0]receiving no damage[otherwise]receiving [bold type][total damage] damage[roman type][end if].";
				now concentration of player is 0;
				now the take no time boolean is false;
				if player is dead:
					end the story saying "Your death was not particularly heroic.";
			otherwise:
				now concentration of the falling-guy is 0;
				if the location of falling-guy is the location of the player and total damage is not 0:
					say "[The falling-guy] receives [total damage] damage from the fall.";


Chapter - Player forms

[The player can take on different forms: human-form, ghoul, vampire, vampire bat, ...

The variabel "current form" contains the current player form.

In addition, forms are either form-active or not form-active. Active forms are those that a player can switch to -- assuming we have built te code to do so, of course.]

Player form is a kind of value. The player forms are defined by the Table of Form Properties.

A player form has a text called turn-text.
A player form has a creature-type.
A player form has a text called form-name. 



Table of Form Properties
player form	turn-text	creature-type	form-name
human-form	"You turn back into a normal human being."	living	"human"
ghoul-form	"You turn into a loathsome ghoul!"	undead	"ghoul"
vampire-form	"You turn into a vampire!"	undead	"vampire"
vampirebat-form	"You turn into a vampire bat!"	undead	"bat"
ghost-form	"You turn into a transparent ghost!"	undead	"ghost"
lich-form	"You turn into a dreadful lich!"	undead	"lich"

Current form is a player form that varies.
Current form is human-form.

A player form can be form-active. A player form is usually not form-active.
Human-form is form-active.

Changing form to is an action applying to one player form.

Check changing form to the current form (this is the can't change to the current form rule):
	say "You don't seem to change.";
	stop the action.

Carry out changing form to (this is the standard change form rule):
	now the current form is the player form understood;
	now the creature-type of the player is the creature-type of the current form;
	now the current form is form-active;

Carry out changing form to a living player form (this is the turn-living rule):
	now undead-faction hates friendly;
	now friendly hates undead-faction;
	now undead-faction hates player-enslaved;
	now player-enslaved hates undead-faction.
	
Carry out changing form to an undead player form (this is the turn-undead rule):
	now undead-faction does not hate friendly;
	now friendly does not hate undead-faction;
	now undead-faction does not hate player-enslaved;
	now player-enslaved does not hate undead-faction.

Report changing form to (this is the standard describe form change rule):
	say the turn-text of the player form understood;
	say line break;
 
This is the short player form status rule:
	if long status is false:
		say "You are [if current form is ghoul-form]a ghoul[else if current form is vampire-form]a vampire[else if current form is vampirebat-form]a vampire bat[else if current form is ghost-form]a ghost[else if current form is lich-form]a lich[else if the player is undead]undead[else]human[end if]. [run paragraph on]";


Section - Human

[No specials.]


Section - Ghoul

To ghoulify the player:
	unless the player worships Chton:
		now human-form is not form-active;
	try changing form to ghoul-form.

An attack modifier rule (this is the ghoul has less chance to hit rule):
	if the global attacker is the player and current form is ghoul-form:
		say " - 1 (ghoul)[run paragraph on]";
		decrease the attack strength by 1.

[A damage modifier rule (this is the ghoul gives damage resistance rule):
	if the global defender is the player and current form is ghoul-form:
		say " - 1 (you are a ghoul)[run paragraph on]";
		decrease the attack damage by 1.]

A remove specific damage rule (this is the ghoul damage reduction rule):
	if the victim is the player and the current form is ghoul-form:
		remove 1 points of physical damage with reason "ghoul".

Status attribute rule (this is the ghoul status rule):
	if current form is ghoul-form:
		if long status is true:
			say "You are a [bold type]ghoul[roman type]: -1 attack; +1 physical damage resistance.[line break][run paragraph on]".

To unghoulify the player:
	unless player worships Chton:
		now ghoul-form is not form-active;
	try changing form to human-form.


Section - Ghost

Status attribute rule (this is the ghost status rule):
	if current form is ghost-form:
		if long status is true:
			say "You are a [bold type]ghost[roman type]: all attacks by and against you have an additional 50% chance of missing; you get a +3 bonus to hiding.[line break][run paragraph on]".

Last check an actor hitting (this is the ghost form rule):
	if current form is ghost-form:
		if global attacker is player or global defender is player:
			if a random chance of 1 in 2 succeeds:
				say "Due to your [bold type]insubstantiality[roman type], [possessive of the global attacker] attack passes harmlessly through [the global defender]." instead.

Detection rule (this is the ghost detection rule):
	if the current form is ghost-form:
		say " + 3 (ghost form)[run paragraph on]";
		increase the hiding roll by 3.

Section - Lich

Status attribute rule (this is the lich status rule):
	if current form is lich-form:
		if long status is true:
			say "You are a [bold type]lich[roman type]: even powerful undead will follow you; you have a dreadful presence equal to the number of undead in the room; all undead allies gain +1 bloodlust.[line break][run paragraph on]".

A dread rule (this is the lich-form dread rule):
	if test subject is player and current form is lich-form:
		let n be the number of alive undead persons in the location;
		increase dread dummy by n.

Bloodlust rule (this is the lich-form bloodlust rule):
	if test subject is undead and test subject is not the player and current form is lich-form:
		if location of the player is location of test subject:
			unless faction of player hates faction of test subject:
				increase bloodlust dummy by 1.


Section - Vampire


To vampirise the player:
	now vampirebat-form is form-active;
	unless player worships chton:
		now human-form is not form-active;
		now ghoul-form is not form-active;
	try changing form to vampire-form.

This is the turn-vampire rule:
	say "".

Status attribute rule (this is the vampire status rule):
	if current form is vampire-form:
		if long status is true:
			say "You are a [bold type]vampire[roman type]: +4 mind, +2 attack, -2 defence, +1 bonus to hiding.[line break][run paragraph on]".

A mind bonus rule (this is the mind bonus of vampire rule):
	if the test subject is the player and the current form is vampire-form:
		increase faculty bonus score by 4.

An attack modifier rule (this is the vampire has more chance to hit rule):
	if the global attacker is the player and current form is vampire-form:
		say " + 2 (vampire)[run paragraph on]";
		increase the attack strength by 2.

An attack modifier rule (this is the vampire has more chance to be hit rule):
	if the global defender is the player and the current form is vampire-form:
		say " + 2 (you are a vampire)[run paragraph on]";
		increase the attack strength by 2.

Chance to win rule when the global defender is the player and current form is vampire-form (this is the CTW versus vampire rule):
	increase the chance-to-win by 2.
		
Detection rule (this is the vampire detection rule):
	if the current form is vampire-form:
		say " + 1 (vampire form)[run paragraph on]";
		increase the hiding roll by 1.

To unvampirise the player:
	now the faction of the player is friendly;
	now current form is human-form.


Section - Vampire bat

This is the turn-vampire-bat rule:
	say "".

Status attribute rule (this is the vampire bat status rule):
	if current form is vampirebat-form:
		if long status is true:
			say "You are a [bold type]vampire bat[roman type]: +2 defence, -2 attack, +2 bonus to hiding, bonus to running away, flying, cannot use weapons or clothing.[line break][run paragraph on]".

An attack modifier rule (this is the vampire bat has less chance to be hit rule):
	if the global defender is the player and current form is vampirebat-form:
		say " - 2 (bat form)[run paragraph on]";
		decrease the attack strength by 2.

Chance to win rule when the global defender is the player and current form is vampirebat-form (this is the CTW versus vampire bat rule):
	decrease the chance-to-win by 2.
		
An attack modifier rule (this is the vampire bat has less chance to hit rule):
	if the global attacker is the player and current form is vampirebat-form:
		say " - 2 (bat form)[run paragraph on]";
		decrease the attack strength by 2.		

Detection rule (this is the vampire bat detection rule):
	if the current form is vampirebat-form:
		say " + 2 (vampire bat form)[run paragraph on]";
		increase the hiding roll by 2.

A flying rule (this is the vampire bat flies rule):
	if test subject is player and the current form is vampirebat-form:
		rule succeeds.

An attack modifier rule (this is the vampire bat grants better retreat rule):
	if the global defender is the player and current form is vampirebat-form and the global defender is retreater:
		say " - 2 (bat form retreat bonus)[run paragraph on]";
		decrease the attack strength by 2;
	if the global defender is the player and current form is vampirebat-form and the global defender is runner:
		say " - 2 (bat form retreat bonus)[run paragraph on]";
		decrease the attack strength by 2.	

Check readying (this is the vampire bat cannot ready a weapon rule):
	if the current form is vampirebat-form:
		take no time;
		say "In bat form, you cannot use weapons." instead.

Check wearing (this is the vampire bat cannot wear clothing rule):
	if the current form is vampirebat-form:
		take no time;
		say "In bat form, you cannot wear clothing." instead.

Every turn when the current form is vampirebat-form (this is the unready readied weapons when bat rule):
	if the player encloses at least one readied weapon:
		repeat with X running through readied weapons enclosed by the player:
			unless X is a natural weapon:
				say "Your claws cannot effectively wield [the X].";
				now X is not readied;
	let X be a random natural weapon enclosed by the player;
	now X is readied.


Section - Commands for turning into forms

Turning human is an action applying to nothing. Understand "human" and "turn human" and "turn into human" as turning human.

Check turning human:
	if human-form is not form-active:
		take no time;
		say "You cannot turn back into a human." instead;
	if the current form is human-form:
		take no time;
		say "You already are in human form." instead.

Carry out turning human:
	try changing form to human-form.
	

Turning ghoul is an action applying to nothing. Understand "ghoul" and "turn ghoul" and "turn into ghoul" as turning ghoul.

Check turning ghoul:
	if ghoul-form is not form-active:
		take no time;
		say "You do not possess that power." instead;
	if the current form is ghoul-form:
		take no time;
		say "You already are in ghoul form." instead.

Carry out turning ghoul:
	try changing form to ghoul-form.	


Turning ghost is an action applying to nothing. Understand "ghost" and "turn ghost" and "turn into ghost" as turning ghost.

Check turning ghost:
	if ghost-form is not form-active:
		take no time;
		say "You do not possess that power." instead;
	if the current form is ghost-form:
		take no time;
		say "You already are in ghost form." instead.

Carry out turning ghost:
	try changing form to ghost-form.	


Turning lich is an action applying to nothing. Understand "lich" and "turn lich" and "turn into lich" as turning lich.

Check turning lich:
	if lich-form is not form-active:
		take no time;
		say "You do not possess that power." instead;
	if the current form is lich-form:
		take no time;
		say "You already are in lich form." instead.

Carry out turning lich:
	try changing form to lich-form.	


Turning vampire is an action applying to nothing. Understand "vampire" and "turn vampire" and "turn into vampire" as turning vampire.

Check turning vampire:
	if vampire-form is not form-active:
		take no time;
		say "You do not possess that power." instead;
	if the current form is vampire-form:
		take no time;
		say "You already are in vampire form." instead;

Carry out turning vampire:
	try changing form to vampire-form.


Turning bat is an action applying to nothing. Understand "bat" and "bat form" and "vampire bat" and "turn into bat" and "turn into vampire bat" as turning bat.

Check turning bat:
	if vampirebat-form is not form-active:
		take no time;
		say "You do not possess that power." instead;
	if the current form is vampirebat-form:
		take no time;
		say "You already are in vampire bat form." instead;

Carry out turning bat:
	try changing form to vampirebat-form;

Carry out changing form to vampirebat-form (this is the get naked when changing to bat form rule):
	repeat with X running through weapons enclosed by the player:
		now X is not readied;
	repeat with X running through clothing enclosed by the player:
		now the player carries X.

Section - Status

Status attribute rule (this is the change form rule):
	if long status is true:
		let n be 0;
		let m be 0;
		let stuff be indexed text;
		repeat with item running through player forms:
			if item is form-active and current form is not item:
				increase n by 1;
		if n > 0:
			say "You can [bold type]turn into[roman type] [run paragraph on]";
			repeat with item running through player forms:
				if item is form-active and current form is not item:			
					choose row with a player form of item in Table of Form Properties;
					say "[form-name entry][if n > 2],[end if][if n is 2] and[end if] [run paragraph on]";
					decrease n by 1;
			say "form.[line break][run paragraph on]".




Chapter - Mutations

[Mutations are for use with the scroll of mutation, and maybe some other stuff. They apply only to the player.

We also put the mutation rules here, even when they do not use the mutation kind -- e.g., when they apply to properties of all people.]

Section - Mutating rules

The mutating rules are a rulebook.

The mutated boolean is a truth state that varies.
First mutating rule (this is the set mutated boolean rule):
	now mutated boolean is false.

A mutating rule (this is the mutate size rule):
	let target size be a random size;
	if a random chance of 1 in 4 succeeds:
		now target size is medium;
	if target size is not the size of the player:
		now size of the player is target size;
		now base size of the player is target size;
		say "Your body suddenly becomes [target size]!";
		now mutated boolean is true.


A mutating rule (this is the mutate gender rule):
	if a random chance of 1 in 10 succeeds:
		let n be a random number between 1 and 11;
		if n is less than 6:
			if the player is not male:
				now the player is male;
				say "You turn into a man!";
				now mutated boolean is true;
		otherwise if n is less than 11:
			if the player is not female:
				now the player is female;
				say "You turn into a woman!";
				now mutated boolean is true;
		otherwise:
			if the player is male or the player is female:
				now the player is not female;
				now the player is not male;
				say "You turn into a sexless being!";
				now mutated boolean is true.
		
			


Section - The mutation kind

Mutation is a kind of value. Some mutations are defined by the Table of Player Mutations.

Mutations can be adapted. Mutations are usually not adapted.

Table of Player Mutations
mutation	mutate-text	unmutate-text
wings	"You grow [bold type]wings[roman type] and gain the power of flight!"	"You lose your wings."
eyeless vision	"You gain the ability to [bold type]see without eyes[roman type]!"	"You lose your eyeless vision."
pseudopods	"Hundreds of apparently useless [bold type]pseudopods[roman type] grow from your skin."	"The pseudopods that covered you disappear."
disintegrating flesh	"Your [bold type]flesh[roman type] loses much of its consistency!"	"Your flesh returns to its normal solidity."
metallic scales	"Your body is covered in [bold type]metallic scales[roman type]!"	"The metallic scales disappear from your body."
tunneling claws	"Your hands turn into [bold type]tunneling claws[roman type]!"	"Your tunneling claws disappear."
flexible muscles	"Your muscles become [bold type]flexible[roman type]!"		"Your muscles regain their normal flexibility."
an iron will		"A change in your brain increases your [bold type]willpower[roman type]!"	"Your willpower returns to its normal strength."
astral sensitivity	"A physiological change makes you [bold type]astrally sensitive[roman type], increasing your spirit score."	"You lose your astral sensitivity."
psychic powers	"You gain [bold type]psychic powers[roman type]!"		"You lose your psychic powers."


Status attribute rule (this is the mutations status rule):
	if at least one mutation is adapted:
		if long status is true:
			say "Your altered body has [bold type][list of adapted mutations][roman type].[line break][run paragraph on]";

Section - Mutating mutations

Mutations can be just-mutated. Mutations are usually not just-mutated.

A mutating rule (this is the consider mutations rule):
	let n be 2;
	while a random chance of 1 in n succeeds:
		if at least one mutation is not just-mutated:
			let perk be a random not just-mutated mutation;
			if perk is adapted:
				unmutate perk;
				now mutated boolean is true;
			otherwise:
				mutate perk;
				now mutated boolean is true;
			now perk is just-mutated;
			increase n by 2;
	repeat with perk running through mutations:
		now perk is not just-mutated.

To mutate (perk - a mutation):
	choose row with mutation of perk in Table of Player Mutations;
	now perk is adapted;
	say "[mutate-text entry][line break]".

To unmutate (perk - a mutation):
	choose row with mutation of perk in Table of Player Mutations;
	now perk is not adapted;
	say "[unmutate-text entry][line break]".


Section - Wings

A flying rule (this is the wings flying rule):
	if test subject is player and wings is adapted:
		rule succeeds.

Section - Eyeless vision

First blindness rule (this is the not blind if darkvision rule):
	if test subject is player and eyeless vision is adapted:
		rule fails.

Section - Pseudopods

[Pseudopods give a bonus to the sprout ability!]

Section - Disintegrating flesh

An add specific damage rule (this is the disintegrating flesh damage modifier rule):
	if the victim is the player and disintegrating flesh is adapted:
		add 1 points of physical damage with reason "disintegrating flesh".


Section - Metallic scales

A remove specific damage rule (this is the metallic scales damage reduction rule):
	if the victim is the player and metallic scales is adapted:
		remove 1 points of physical damage with reason "metallic scales".

Section - Tunneling claws

[Tunneling claws coded into the digging rules.]

Section - Flexible muscles, iron will, astrally sensitive

A body bonus rule (this is the flexible muscles rule):
	if the test subject is the player and flexible muscles is adapted:
		increase faculty bonus score by 2.

A mind bonus rule (this is the iron will rule):
	if the test subject is the player and an iron will is adapted:
		increase faculty bonus score by 2.		

A spirit bonus rule (this is the astrally sensitive rule):
	if the test subject is the player and astral sensitivity is adapted:
		increase faculty bonus score by 2.

Section - Psychich powers

A psycholocation rule (this is the psychic powers rule):
	if psychic powers is adapted:
		rule succeeds.


Chapter - Blood Magic

Section - Preliminaries

A thing has a number called the blood magic cost. The blood magic cost of a thing is usually 0.
A thing has a number called the blood magic level. The blood magic level of a thing is usually 0.
A thing has a number called the blood magic maximum. The blood magic maximum of a thing is usually 0.

To decide which number is the current blood cost of (item - a thing):
	let n be (blood magic level of item) + 1;
	now n is n * (blood magic cost of item);
	decide on n.

Total blood magic is a number that varies. Total blood magic is 0.
	
Section - Feeding
	
Feeding is an action applying to one carried thing. Understand "feed [something]" and "feed blood to [something]" and "feed [something] blood" as feeding.

Check feeding:
	if blood magic cost of the noun is 0:
		say "You cannot feed [the noun]." instead;
	if blood magic level of the noun is blood magic maximum of the noun:
		say "[The noun] [is-are] satiated." instead.

Carry out feeding:
	let n be current blood cost of the noun;
	decrease health of the player by n;
	if health of the player is less than 1:
		say "You feed [n] health to [the noun], which is more than your body can handle.";
		end the game saying "Foolish people should not dabble in blood magic.";
	otherwise:
		say "You feed [n] health to [the noun], increasing [its-theirs] power[if concentration of the player is greater than 0] (and losing your concentration)[end if]!";
		increase blood magic level of the noun by 1;
		reset the blood timer of the noun;
		now concentration of the player is 0;
		increase total blood magic by n;
		if total blood magic is greater than 49:
			award achievement Give them blood.

After printing the name of a thing (called item) while stock-taking:
	if blood magic cost of item is not 0:
		if blood magic level of item is not blood magic maximum of item:
			say " (can be fed [current blood cost of item] blood)".

Section - Temporary Blood Magic

A thing has a number called the minimum blood timeout. The minimum blood timeout of a thing is usually 1.
A thing has a number called the maximum blood timeout. The maximum blood timeout of a thing is usually 0.
A thing has a number called the blood timer. The blood timer of a thing is usually 0.

To decide whether (item - a thing) has temporary blood magic:
	decide on whether or not the maximum blood timeout of the item is greater than the minimum blood timeout of the item.

Definition: a thing is temporarily blood-enhanced if the blood timer of it is at least 1;

To reset the blood timer of (item - a thing):
	if the item has temporary blood magic and the item is not temporarily blood-enhanced:
		now the blood timer of item is a random number from the minimum blood timeout of the item to the maximum blood timeout of the item.

Every turn (this is the count down blood timers rule):
	if (the main actor is the player) and (the current action is not the action of the player dontparsing):
		Repeat with the item running through temporarily blood-enhanced things:
			decrease the blood timer of the item by 1;
			if the blood timer of the item < 1:
				decrease the blood magic level of the item by 1;
				if the blood magic level of the item < 1:
					if the location of the item is the location, say "The blood power of [the item] wears off completely.";
				otherwise:
					reset the blood timer of the item;
					if the location of the item is the location, say "Some of the blood power of [the item] wears off.";



Kerkerkruip Systems ends here.