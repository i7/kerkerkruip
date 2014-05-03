Kerkerkruip Damage by Victor Gijsbers begins here.

[We will make the simplification that no source of damage will consist of multiple materials. So something can deal "physical damage", and then the material might be silver or iron or whatever; but we don't need to define different damage types for all materials.]

Section - Damage types

Damage type is a kind.

Physical damage is a damage type.
Heat damage is a damage type.
Acid damage is a damage type.
Necromantic damage is a damage type.
Divine damage is a damage type.

Damage-material is a material that varies.

A damage type can be activated or not activated.

Section - Grouping damage types

[We do it here so we don't forget to update when adding a damage type.]

To decide whether (type - a damage type) is physical-body-only: [Immune when ethereal.]
	if type is physical damage and damage-material is radiance, decide no;
	if type is necromantic damage, decide no;
	if type is divine damage, decide no;
	decide yes.


Section - Rulebooks and globals

[We need a whole bunch of rulebooks.

1. Add damage of specific types.
2. Remove damage of specific types. (Can't go below 0, which is why we must add first.
3. Multiply specific types as appropriate. (E.g., "double heat damage".)

We then count al specific damage types, and get the total damage.

4. Add general damage. -- This should be used sparingly or not at all, because damage ought to be of a specific type.
5. Remove general damage.
6. Multiply general damage.

Deal damage!]

The add specific damage rules are a rulebook. [For rules pertaining to specific types of damage.]
The remove specific damage rules are a rulebook. [For rules pertaining to specific types of damage.]
The specific damage multiplier rules are a rulebook. [Idem, but rules that multiply the damage by a constant.]
The add general damage rules are a rulebook. [Next three rulebooks idem, but for general damage.]
The remove general damage rules are a rulebook.
The general damage multiplier rules are a rulebook.
The after damage rules are a rulebook. [For things like losing concentration.]

The victim is a person that varies.
The total damage is a number that varies.

Damage comment is a truth state that varies.
Damage silence is a truth state that varies.

Damage-by-hitting is a truth state that varies. [Set to true when dealing damage from an attack, so rules know that global attacker/defender and weapon properties are available.]

Section - The damage profile

[Every damage type has a number. When we wish to deal harm, we first add harm of the appropriate damage type(s), and then we inflict the damage.]

A damage type has a number called the harm.

Section - Resetting damage profile

[We don't need to invoke this ourselves, since it is automatically invoked when damage is inflicted.]

To reset the damage profile:
	repeat with q running through damage types:
		now the harm of q is 0.

Section - Dealing damage

[Invoke with phrases like "deal 2 points of fire damage".]

To deal (n - a number) points of (type - a damage type):
	increase the harm of type by n.

Section - Adding damage to the damage profile

[Effects that add damage to an already established damage profile should do so using this phrase. You can add damage normally, which means conditional on damage of that type already being dealt; or unconditionally, which means that it should be dealt anyway. Heat vulnerability -- which adds 2 damage when heat damage is being dealt -- should add 2 points of heat damage; while a curse that adds 2 heat damage to any damage you get from any source should add the damage unconditionally.]

To add (n - a number) points of (type - a damage type) with reason (reason - some text), unconditionally:
	if unconditionally or type is activated:
		increase harm of type by n;
		unless n is 0:
			unless damage silence is true:
				say " + [n] ([reason])[run paragraph on]";
				now damage comment is true.


Section - Removing damage from the damage profile

[Any effect that removes, say, 2 fire damage, should do so using this phrase. It makes sure that the damage type doesn't drop below 0. "Removed damage" returns the total damage done, if needed. The reason is shown between brackets.]

Removed damage is a number that varies.

To remove (n - a number) points of (type - a damage type) with reason (reason - some text):
	if type is activated:
		if harm of type is less than n:
			now n is harm of type;
		decrease harm of type by n;
		now removed damage is n;
		unless removed damage is 0:
			unless damage silence is true:
				say " - [removed damage] ([reason])[run paragraph on]";
				now damage comment is true.

Section - Inflicting damage

[Always call this when you're inflicting damage!]

To inflict damage on (guy - a person), silently:
	now the victim is guy;
	now damage comment is false;
	if silently:
		now damage silence is true;
	otherwise:
		now damage silence is false;
	now total damage is 0;
	repeat with type running through damage types:
		if harm of type is 0:
			now type is not activated;
		otherwise:
			now type is activated; [if we deal 2 heat damage, and a rule distracts 2, other rules should still know that heat damage is being dealt and might need to be changed]
			increase total damage by harm of type;
	unless silently:
		say "[total damage][run paragraph on]";
	consider the add specific damage rules;
	consider the remove specific damage rules;	
	consider the specific damage multiplier rules;
	now total damage is 0;
	repeat with type running through damage types:
		unless harm of type is less than 0:
			increase total damage by harm of type;
	consider the add general damage rules;
	consider the remove general damage rules;	
	consider the general damage multiplier rules;
	if total damage is less than 0:
		now total damage is 0;
	unless silently:
		if damage comment is true:
			say " = [bold type]", total damage, " damage[roman type][run paragraph on]";
		otherwise:
			say " damage[roman type][run paragraph on]";
	decrease health of the victim by total damage;
	consider the after damage rules;
	reset the damage profile;
	now damage-by-hitting is false.







Section - Testing

Testdamaging is an action applying to nothing. Understand "testdamage" as testdamaging.

Carry out testdamaging:
	deal 2 points of physical damage;
	deal 3 points of divine damage;
	inflict damage on player.

Kerkerkruip Damage ends here.
