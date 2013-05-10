Kerkerkruip Tests by Victor Gijsbers begins here.

Use authorial modesty.

[ Tests for various things ]

Chapter - Tests (not for release)



Section - Cheats - Plunk, plonk, rambo, meatboy, reduce

Plunking is an action applying to one thing.
Understand "plunk [something]" as plunking.

Carry out plunking:
	say "You plunk [the noun].";
	now the health of the noun is -5.

Plonking is an action applying to nothing.
Understand "plonk" as plonking.

Carry out plonking:
	say "These fools are no match for you!";
	repeat with X running through all alive persons enclosed by the location:
		if the faction of the player hates the faction of X:
			now the health of X is -5.

Ramboing is an action applying to nothing. Understand "rambo" as ramboing.

Carry out ramboing:
	say "RAMBO!";
	now permanent health of the player is 100;
	now health of the player is 100;
	now melee of the player is 100;
	now damage die of gilded rapier is 100.

Meatboying is an action applying to nothing. Understand "meatboy" as meatboying.

Carry out meatboying:
	say "Meatboy!";
	now health of the player is 1000.

Reducing is an action applying to one thing. Understand "reduce [person]" as reducing.

Carry out reducing:
	say "Set to 1 HP.";
	now health of the noun is 1.

Winning is an action applying to nothing. Understand "win" as winning.

Carry out winning:
	say "Sure.";
	now health of Malygris is -2.


Section - Granting powers

Cheatgranting is an action applying to one object.

Understand "grantme [any power]" as cheatgranting.

Carry out cheatgranting:
	now the noun is granted;
	say "You have been granted [the noun].".

Section - Testing Person IDs

Last when play begins (this is the check person IDs rule):
	repeat with X running through npc people:
		if the ID of X is 0:
			say "[X] does not have an ID.[line break]";
		otherwise:
			repeat with Y running through npc people:
				if X is not Y and the ID of X is the ID of Y:
					say "[X] has the same ID as [Y].[line break]";


Section - Showing readied weapons

Testreadying is an action applying to nothing. Understand "testready" as testreadying.

Carry out testreadying:
	repeat with guy running through not off-stage persons:
		let item be a random readied weapon enclosed by guy;
		say "[guy] - [item][line break]".


Section - Showing Unlock Table

Table of Unlocks
stuff		unllevel
(an object)	(a number)
with 200 blank rows

Unlocktabling is an action applying to nothing. Understand "showunlock" as unlocktabling.

Carry out unlocktabling:
	let X be a list of objects; [We cannot repeat through objects, so:]
	repeat with Y running through rooms:
		if Y is unlockable:
			add Y to X;
	repeat with Y running through persons:
		if Y is unlockable:
			add Y to X;
	repeat with Y running through things:
		if Y is not a person:
			if Y is unlockable:
				add Y to X;
	repeat with item running through X:
		choose a blank row in Table of Unlocks;
		now stuff entry is item;
		now unllevel entry is unlock level of item;
	sort Table of Unlocks in unllevel order;
	repeat through Table of Unlocks:
		say "[unllevel entry]: [stuff entry] ([if unlock hidden switch of stuff entry is false][unlock text of stuff entry][otherwise]hidden[end if])[line break]".




Kerkerkruip Tests ends here.
