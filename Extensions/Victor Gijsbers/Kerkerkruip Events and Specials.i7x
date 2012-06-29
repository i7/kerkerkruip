Kerkerkruip Events and Specials by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Elemental Plane of Smoke

There is a room called Elemental Plane of Smoke. "Smoke is everywhere. You are completely disoriented."

Elemental Plane of Smoke is not connectable.
Elemental Plane of Smoke is not connection-inviting.
Elemental Plane of Smoke is not placeable.
Elemental Plane of Smoke is not habitable.
Elemental Plane of Smoke is not treasurable.
Elemental Plane of Smoke is not teleportable.
Elemental Plane of Smoke is not extra-accepting.
Elemental Plane of Smoke is vp-agnostic.
Elemental Plane of Smoke is elemental.

Smoke rule (this is the smoke on the Elemental Plane of Smoke rule):
	if test room is Elemental Plane of Smoke:
		if temporary smoke timer is less than 25:
			now temporary smoke timer is 25.

Instead of digging in Elemental Plane of Smoke:
	take no time;
	say "You cannot dig tunnels in the smoke.".
	
A teleport impossible rule (this is the no teleportation in elemental plane of smoke rule):
	if the location of the test subject is elemental plane of smoke:
		rule succeeds.	

Instead of going in Elemental Plane of Smoke:
	now concentration of the player is 0;
	repeat with item running through things in Elemental Plane of Smoke:
		unless item is a person or item is a backdrop:
			move item to Elemental Plane of Smoke Storage.;
	let lijst be a list of things;
	repeat with item running through things in Elemental Plane of Smoke Storage:
		if a random chance of 1 in 20 succeeds:
			move item to Elemental Plane of Smoke;
			add item to lijst;
	say "[if lijst is not empty]Running through the smoke, you stumble across [a list of things that list-inhabit lijst][otherwise][one of]You stumble blindly through the smoke[or]You run through an endless world of clouds[or]Nothing appears to change, no matter how long you run[as decreasingly likely outcomes][end if].".
			
Elemental Plane of Smoke Storage is a room.
Elemental Plane of Smoke Storage is not placeable.

The portal to Kerkerkruip is a stone thing. It is fixed in place. The portal to Kerkerkruip is in Elemental Plane of Smoke.  Understand "exit" as the portal to Kerkerkruip. The description of the portal to Kerkerkruip is "Presumably, this is the portal back to Kerkerkruip.".

Does the player mean entering the portal to Kerkerkruip: it is likely.

Instead of going outside in Elemental Plane of Smoke:
	try exiting.

Instead of exiting in Elemental Plane of Smoke:
	if portal to Kerkerkruip is in the location:
		try entering the portal to Kerkerkruip;
	otherwise:
		say "If only you could find that portal again!".

Instead of entering the portal to Kerkerkruip:
	consider the sudden combat reset rules;
	move player to Portal of Smoke;
	now the take no time boolean is false.
			





Kerkerkruip Events and Specials ends here.
