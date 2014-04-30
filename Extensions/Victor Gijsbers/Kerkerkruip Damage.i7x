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

Section - Rulebooks and globals

The specific damage rules are a rulebook. [For rules pertaining to specific types of damage.]
The specific multiplying damage rules are a rulebook. [Idem, but rules that multiply the damage by a constant.]
The general damage rules are a rulebook. [Next two rulebooks idem, but for general damage.]
The general multiplying damage rules are a rulebook.
The after damage rules are a rulebook. [For things like losing concentration.]

The victim is a person that varies.
The total damage is a number that varies.

Damage comment is a truth state that varies.
Damage silence is a truth state that varies.

Section - The damage profile

[Every damage type has a number. When we wish to deal harm, we first add harm of the appropriate damage type(s), and then we inflict the damage.]

A damage type has a number called the harm.

Section - Resetting damage profile

[We don't need to invoke this ourselves, since it is automatically invoked when damage is inflicted.]

To reset the damage profile:
	repeat with q running through damage types:
		now the harm of q is 0.

Section - Adding damage to the damage profile

[Invoke with phrases like "deal 2 points of fire damage".]

To deal (n - a number) points of (type - a damage type):
	increase the harm of type by n.

Section - Inflicting damage

[Always call this when you're inflicting damage!]

To inflict damage to (guy - a person), silently:
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
	consider the specific damage rules;
	consider the specific multiplying damage rules;
	now total damage is 0;
	repeat with type running through damage types:
		unless harm of type is less than 0:
			increase total damage by harm of type;
	consider the general damage rules;
	consider the general multiplying damage rules;
	if total damage is less than 0:
		now total damage is 0;
	unless silently:
		if damage comment is true:
			say " = [bold type]", total damage, " damage[roman type][run paragraph on]";
		otherwise:
			say " damage[roman type][run paragraph on]";
	decrease health of the victim by total damage;
	consider the after damage rules;
	reset the damage profile.







Section - Testing

Testdamaging is an action applying to nothing. Understand "testdamage" as testdamaging.

Carry out testdamaging:
	deal 2 points of physical damage;
	deal 3 points of divine damage;
	inflict damage to player.

Kerkerkruip Damage ends here.
