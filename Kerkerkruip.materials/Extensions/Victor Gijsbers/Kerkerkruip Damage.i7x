Kerkerkruip Damage by Victor Gijsbers begins here.

[We will make the simplification that no source of damage will consist of multiple materials. So something can deal "physical damage", and then the material might be silver or iron or whatever; but we don't need to define different damage types for all materials.]

Section - Damage types

Damage type is a kind.

Physical damage is a damage type.
Heat damage is a damage type.
Acid damage is a damage type.
Necromantic damage is a damage type.
Divine damage is a damage type.

Damage-source is a thing that varies.
Damage-material is a material that varies.
No-source is a thing. The material of no-source is other-material.


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

The before damage rules are a rulebook. [Probably used sparingly.]
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

Section - Adding specific damage

[Effects that add damage to an already established damage profile should do so using this phrase. You can add damage normally, which means the damage is always added; or conditional on damage of that type already being dealt. Heat vulnerability -- which adds 2 damage when heat damage is being dealt -- should add 2 points of heat damage conditionally; while a curse that adds 2 heat damage to any damage you get from any source should add the damage normally.]

To add (n - a number) points of (type - a damage type) with reason (reason - some text), conditionally:
	if not conditionally or harm of type is greater than 0:
		increase harm of type by n;
		unless n is 0:
			unless damage silence is true:
				say " + [n] ([reason])[run paragraph on]";
				now damage comment is true.


Section - Removing specific damage

[Any effect that removes, say, 2 fire damage, should do so using this phrase. It makes sure that the damage type doesn't drop below 0. "Removed damage" returns the total damage done, if needed. The reason is shown between brackets.]

Removed damage is a number that varies.

To remove (n - a number) points of (type - a damage type) with reason (reason - some text):
	if harm of type is less than n:
		now n is harm of type;
	decrease harm of type by n;
	now removed damage is n;
	unless removed damage is 0:
		unless damage silence is true:
			say " - [removed damage] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Multiplying specific damage

[Any effect that, say, doubles fire damage should do so using this phrase.]

[We're using Glulx, so we should never meet the limit of the naturals -- about 2 billion -- even if we multiply by 100. But we do want to be in the situation that  x 50% x 200% = x 100%, which we cannot completely guarantuee without using reals. We could add the full fixed point math extension, but I'm happy with an easy hack here.]

A damage type has a number called the rounding error.

To multiply (type - a damage type) by (percentage - a number) percent with reason (reason - some text):
	if harm of type is not 0:
		let n be harm of type;
		now n is n times percentage;
		increase n by ((percentage times rounding error of type) divided by 100);
		let m be n divided by 100;
		let p be m times 100;
		now rounding error of type is (n - p);
		let change be (harm of type minus m);
		now harm of type is m;
		unless damage silence is true:
			if change is less than 0:
				now change is (0 - change);
				say " - [change] ([reason])[run paragraph on]";
			otherwise:
				say " + [change] ([reason])[run paragraph on]";
			now damage comment is true.

First specific damage multiplier rule (this is the reset rounding error rule):
	reset rounding errors.
	
To reset rounding errors:
	repeat with type running through damage types:
		now rounding error of type is 0.

[Example caculation. Heat damage is 7. Percentage is 50.
n = 7
n = 350
n = 350 + 0 = 350
m = 3
p = 300
rounding error = 50
heat damage = 3

Percentage is 200.
n = 3
n = 600
n = 600 + ((50 * 200)/100) = 700
m = 7
p = 700
rounding error = 0
heat damage = 7

As expected, since 0.5 x 2 = 1.]

[What we do not compensate for is this. Suppose I get 5 heat damage and 5 physical damage. Both are halved. I will then get 2 + 2 = 4 damage, rather than 5. We could add up remaining rounding errors and see that another point of damage ought to be dealt; but what type is it supposed to have, and how are we to indicate to the player what is happening? Better just ignore it. It's a feature, not a bug.]

Section - Adding total damage

To add (n - a number) points of general damage with reason (reason - some text):
	increase total damage by n;
	unless n is 0:
		unless damage silence is true:
			say " + [n] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Removing total damage

To remove (n - a number) points of general damage with reason (reason - some text):
	if total damage is less than n:
		now n is total damage;
	decrease total damage by n;
	now removed damage is n;
	unless removed damage is 0:
		unless damage silence is true:
			say " - [removed damage] ([reason])[run paragraph on]";
			now damage comment is true.

Section - Multiplying total damage

The general damage rounding error is a number that varies.

To multiply general damage by (percentage - a number) percent with reason (reason - some text):
	if total damage is not 0:
		let n be total damage;
		now n is n times percentage;
		increase n by ((percentage times general damage rounding error) divided by 100);
		let m be n divided by 100;
		let p be m times 100;
		now general damage rounding error is (n - p);
		now total damage is m;
		unless damage silence is true:
			say " x [percentage]% ([reason])[run paragraph on]";
			now damage comment is true.

First general damage multiplier rule (this is the reset general rounding error rule):
	now general damage rounding error is 0.
	



Section - Inflicting damage

[Always call this when you're inflicting damage!]

To have (source - a thing) inflict damage on (guy - a person), silently:
	now the victim is guy;
	now damage-source is source;
	now damage-material is material of source;
	now damage comment is false;
	if silently:
		now damage silence is true;
	otherwise:
		now damage silence is false;
	now total damage is 0;
	follow the before damage rules; [this is where immunities should be taken care of]
	let n be 0;
	repeat with type running through damage types:
		increase n by harm of type;
	if n is 0:  [totally immune to our damage]
		now total damage is 0;
	otherwise:
		follow the add specific damage rules;
		follow the remove specific damage rules;	
		follow the specific damage multiplier rules;
		now total damage is 0;
		repeat with type running through damage types:
			unless harm of type is less than 0:
				increase total damage by harm of type;
		follow the add general damage rules;
		follow the remove general damage rules;	
		follow the general damage multiplier rules;
		if total damage is less than 0:
			now total damage is 0;
	unless silently:
		if damage comment is true:
			say " = [bold type]", total damage, " damage[roman type][run paragraph on]";
		otherwise:
			say " [bold type]", total damage, " damage[roman type][run paragraph on]";
	decrease health of the victim by total damage;
	follow the after damage rules;
	reset the damage profile;
	now damage-by-hitting is false.



Section - Merging our new damage system with ATTACK

The consider the damage modifier rules rule is not listed in any rulebook.
The consider the damage multiplier rules rule is not listed in any rulebook.
The standard show the attack damage dealt rule is not listed in any rulebook.
The subtract damage from health rule is not listed in any rulebook.

Override-normal-attack-damage-rule is a truth state that varies. Override-normal-attack-damage-rule is false.

To deal is a verb.

Carry out an actor hitting (this is the set up attack damage rule):
	if override-normal-attack-damage-rule is false:
		unless damage die of the global attacker weapon is less than 1:
			now the attack damage is a random number between 1 and the damage die of the global attacker weapon;
		increase the attack damage by weapon damage bonus of the global attacker weapon; [1d(damage die) + WDB]
		if the numbers boolean is true:
			say "[roman type][The global attacker] [deal] ", the attack damage, "[run paragraph on]";
		now harm of physical damage is attack damage;
		now damage-by-hitting is true;	
		have global attacker weapon inflict damage on the global defender;  [The crucial line.]
		if the total damage is less than 1:
			say ", allowing [the global defender] to escape unscathed.[run paragraph on]";
		otherwise:
			[non-fatal]
			if the health of the global defender is greater than 0:
				say ", wounding [the global defender] to ", health of the global defender, " health.[run paragraph on]" ;
			[fatal]
			otherwise:
				say ", killing [the name of the global defender].[run paragraph on]";
		say "[roman type][paragraph break]";
	otherwise:
		now override-normal-attack-damage-rule is false.

The standard damage roll rule is not listed in any rulebook.
The offensive flow damage modifier rule is not listed in any rulebook.

An add specific damage rule (this is the new offensive flow damage modifier rule):
	if damage-by-hitting is true:
		let bonus be offensive flow of the global attacker;
		add bonus points of physical damage with reason "offensive flow".

The standard tension damage modifier rule is not listed in any rulebook.

An add general damage rule (this is the new tension damage modifier rule):
	if damage-by-hitting is true:
		let the bonus be the tension divided by 3;
		if the bonus is not 0:
			add bonus points of general damage with reason "tension".

The can't deal negative damage rule is not listed in any rulebook.

Setting action variables for hitting (this is the new reset hitting variables rule):
	now the global attacker is the actor;
	now the global defender is the noun;
	ready natural weapons;
	now the global attacker weapon is a random readied weapon enclosed by the actor;
	now the global defender weapon is a random readied weapon enclosed by the noun;
	have the actor start pressing the noun;
	now the attack strength is 0;
	now the attack damage is 0;
	now the total damage is 0;
	
The reset hitting variables rule is not listed in any rulebook.


Chapter - Special damage rules

A remove specific damage rule (this is the iron or silver suit acts as a faraday cage rule):
	if material of damage-source is electricity:
		if the victim wears an iron suit or the victim wears a silver suit:
			remove 3 points of physical damage with reason "suit acts as a Faraday cage".







Chapter - Testing

Testdamaging is an action applying to nothing. Understand "testdamage" as testdamaging.

Carry out testdamaging:
	deal 2 points of physical damage;
	deal 3 points of divine damage;
	have no-source inflict damage on player.

Kerkerkruip Damage ends here.
