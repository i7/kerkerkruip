Kerkerkruip Religion by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Gods

Section - The god kind

A god is a kind of person.

There is a god called Aite. Aite is female.
There is a god called Nomos. Nomos is male.
There is a god called Sul. Sul is female.
There is a god called Chton. Chton is male.

Section - Worship

Worshipping relates various persons to one god. The verb to worship (he worships, they worship, he worshipped it, it is worshipped, it is worshipping) implies the worshipping relation.

Section - Divine favour

Divine favour is a number that varies. Divine favour is 0.

Section - Dedication

[Being dedicated to a god means that you can sacrifice your powers there.]

Dedication relates various rooms to one god. The verb to be dedicated to implies the dedication relation.

The verb to infuse (he infuses, they infuse, he infused it, it is infused, it is infusing) implies the reversed dedication relation.

Section - Favour rules

The favour rules are a god based rulebook.


Section - Status and short status

Status rule (this is the religion status rule):
	if the player worships a god:
		if long status is true:
			say "You worship [bold type][a random god worshipped by the player][roman type], and have accrued a favour of [divine favour].[line break][run paragraph on]";
		otherwise:
			say "Worshipping [bold type][a random god worshipped by the player][roman type], with [divine favour] favour.";





Chapter - Commands

Section - Praying

[Praying is removed, but should give an apprproiate response for returning players.]

Praying is an action applying to nothing. Understand "pray" and "pr" as praying.

Carry out praying:
	take no time;
	say "You pray -- but it seems to have no effect. [italic type]Please note that the praying command has been removed from the game. You can now sacrifice powers in temples[roman type].".

Section - Sacrificing

[TODO: doesn't remove powers yet!] 

Sacrificing is an action applying to nothing. Understand "sacrifice" as sacrificing.

Check sacrificing (this is the cannot sacrifice when not in a dedicated room rule):
	unless the location of the player is dedicated to a god:
		take no time;
		say "You are not in a holy place." instead.

Check sacrificing (this is the cannot sacrifice to a new god rule):
	if the player worships a god:
		if the location of the player is dedicated to a god:
			let guy be a random god who infuses the location of the player;
			unless the player worships guy:
				take no time;
				say "[Guy] will not accept your sacrifice, since you already worship [a random god worshipped by the player]!" instead.
		
Carry out sacrificing:
	let guy be a random god who infuses the location of the player;
	now player worships guy;
	increase divine favour by 1;
	say "You now worship [guy], and have [divine favour] favour.";
	consider the favour rules for guy.




Chapter - Aite

Section - Favour rules

Favour rule for Aite (this is the Aite favour 1 rule):
	if divine favour is 1:
		say "Aite grants you one level of bloodlust!".

Favour rule for Aite (this is the Aite favour 3 rule):
	if divine favour is 3:
		say "Aite grants you survival instincts!";
		let n be body score of player + mind score of player + spirit score of player;
		increase n by a random number between 2 and 4;
		let a be a random number between 1 and n;
		now n is n - a;
		let b be a random number between 1 and n;
		if b is less than 1, now b is 1;
		let c be n - b;
		if c is less than 1, now c is 1;
		let d be a random number between 1 and 3;
		if d is 1:
			now body score of the player is a;
			now mind score of the player is b;
			now spirit score of the player is c;
		if d is 2:
			now body score of the player is b;
			now mind score of the player is c;
			now spirit score of the player is a;
		if d is 3:
			now body score of the player is c;
			now mind score of the player is a;
			now spirit score of the player is b;			
		say "Aite shuffles your faculties -- you now have [body score of the player] body, [mind score of the player] mind, and [spirit score of the player] spirit."

The Aite-gift-box is a container. Two scrolls of the blade are in the Aite-gift-box.

Favour rule for Aite (this is the Aite favour 6 rule):
	if divine favour is 6:
		say "Aite grants you another level of bloodlust, and two scrolls of the blade!";
		repeat with item running through things enclosed by the Aite-gift-box:
			if item is a scroll:
				identify item;
			move item to player.

Favour rule for Aite (this is the Aite favour 10 rule):
	if divine favour is 10:
		say "Aite remakes your body in her own image!";
		now player is female;
		let n be a random number between -2 and 5;
		if n is 0:
			now n is 1;
		say "Your attack score changes from [melee of the player] to [melee of the player + n]. ";
		increase melee of the player by n;
		now n is a random number between -2 and 5;
		if n is 0:
			now n is 1;
		say "Your defence score changes from [defence of the player] to [defence of the player + n]. ";
		increase defence of the player by n;
		now n is body score of player + mind score of player + spirit score of player;
		increase n by a random number between -2 and 10;
		let a be a random number between 1 and n;
		now n is n - a;
		let b be a random number between 1 and n;
		if b is less than 1, now b is 1;
		let c be n - b;
		if c is less than 1, now c is 1;
		let d be a random number between 1 and 3;
		if d is 1:
			now body score of the player is a;
			now mind score of the player is b;
			now spirit score of the player is c;
		if d is 2:
			now body score of the player is b;
			now mind score of the player is c;
			now spirit score of the player is a;
		if d is 3:
			now body score of the player is c;
			now mind score of the player is a;
			now spirit score of the player is b;			
		say "Aite shuffles your faculties -- you now have [body score of the player] body, [mind score of the player] mind, and [spirit score of the player] spirit. ";		
		consider the mutating rules;
		follow the consider mutations rule;
		follow the consider mutations rule.

Section - Bloodlust

Bloodlust rule (this is the aite bloodlust rule):
	if test subject is the player and player worships aite:
		if divine favour is greater than 0:
			increase bloodlust dummy by 1;
		if divine favour is greater than 5:
			increase bloodlust dummy by 1.


Section - Survival Instinct

An attack modifier rule (this is the survival instinct attack modifier rule):
	if the global defender is the player:
		if survival instinct is active:
			say " - 2 (survival instinct)[run paragraph on]";
			decrease the attack strength by 2.

To decide whether survival instinct is active:
	if the player worships Aite:
		if divine favour is greater than 2:
			let n be ((permanent health of the player + 3) / 4);
			if health of the player < n:
				decide yes;
	otherwise:
		decide no.

Status rule (this is the survival instinct status rule):
	if the player worships Aite and divine favour is greater than 2:
		if long status is true:
			say "You have [bold type]survival instincts[roman type].[line break][run paragraph on]".

Status rule (this is the survival instinct active status rule):
	if survival instinct is active:
		if long status is true:
			say "[bold type]Survival instinct[roman type]: +2 defence bonus[line break][run paragraph on]";
		otherwise:
			say "[bold type]Survival instinct[roman type]: +2 defence[line break][run paragraph on]".			

Section - Beloved of Aite

A beloved of Aite rule (this is the worshippers are beloved of Aite rule):
	if test subject worships Aite:
		rule succeeds.

Section - Aite's engagement in combat

Every turn when the player worships Aite (this is the Aite intervenes in combat rule):
	if combat status is not peace:
		if at least one hostile alive person is enclosed by the location:
			let n be divine favour;
			if power of the fanatics of Aite is granted:
				increase n by (final spirit of the player / 3);
			if a random chance of n in 100 succeeds:
				have Aite intervene.

To have Aite intervene:
	let n be a random number between 3 and 50;
	increase n by a random number between 1 and divine favour;
	increase n by a random number between 1 and divine favour;
	if power of the fanatics of Aite is granted:
		increase n by 3;
	if Aite wrath state is 1:
		increase n by 10;
	if Aite wrath state is -1:
		decrease n by 10;
	if at least one hostile alive person is enclosed by the location:
		repeat with guy running through hostile alive persons enclosed by the location:
			if guy is beloved of Aite:
				decrease n by 4;
	let X be permanent health of the player;
	now X is X divided by 10; [the standard unit of damage is 10% of the maximum health of the player, rounded down]
	increase X by a random number between 0 and 2;
	if power of the fanatics of Aite is granted:
		if a random chance of final spirit of the player in 50 succeeds:
			increase X by 2;
	let guy be a random hostile alive person enclosed by the location;
	if n < 10:
		let Y be (X times 3) divided by 2;
		say "A gigantic [one of]sword[or]spear[or]pike[at random] bursts out of the ground, skewering you for [bold type][Y] damage[roman type]!";
		decrease the health of the player by Y;
		unless the player is dead:
			let the player lose concentration;
			if the player is hidden:
				now the player is not hidden;
				say "Your cry of pain reveals your presence.";
		if health of the player is less than 1:
			end the story saying "Aite is a dangerous mistress";
	otherwise if n < 20:
		say "A huge [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling you for [bold type][X] damage[roman type]!";
		decrease the health of the player by X;
		unless the player is dead:
			let the player lose concentration;
		if health of the player is less than 1:
			end the story saying "Aite is a dangerous mistress";
	otherwise if n < 30:
		if the concentration of the guy is less than 3:
			say "[The guy] suddenly looks [bold type]highly concentrated[roman type], as if divinely inspired.";
			now the concentration of the guy is 3;
	otherwise if n < 40:
		if the concentration of the player is less than 3:
			say "You suddenly feel divinely inspired and [bold type]highly concentrated[roman type].";
			now the concentration of the player is 3;
	otherwise if n < 50:
		say "A huge [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling [the guy] for [bold type][X] damage[roman type]!";
		decrease the health of the guy by X;
		unless guy is dead:
			let the guy lose concentration;			
		if health of the guy is less than 1:
			now the global attacker is the player;
			now the global defender is the guy;
			consider the grant powers when a monster is slain rule;
	otherwise:
		let Y be (X times 3) divided by 2;
		say "A gigantic [one of]sword[or]spear[or]pike[at random] bursts out of the ground, impaling [the guy] for [bold type][Y] damage[roman type]!";
		decrease the health of the guy by Y;
		unless guy is dead:
			let the guy lose concentration;			
		if health of the guy is less than 1:
			now killer-guy is the player;
			now killed-guy is the guy;
			consider the grant powers when a monster is slain rule.


Chapter - Nomos

Section - Favour rules

Favour rule for Nomos (this is the Nomos favour 1 rule):
	if divine favour is 1:
		say "Nomos grants you protection from the next successful attack against you!";
		increase hit protection of player by 1.

Favour rule for Nomos (this is the Nomos favour 3 rule):
	if divine favour is 3:
		say "Nomos grants you 1 point of physical damage reduction, and an inquisitor's hood.";
		move inquisitor's hood to the player.

Favour rule for Nomos (this is the Nomos favour 6 rule):
	if divine favour is 6:
		say "Nomos grants you another 1 point of physical damage reduction, and the Malleus Maleficarum.";
		move Malleus Maleficarum to the player.


Section - Damage reduction

A physical damage reduction rule (this is the worshipping Nomos damage reduction rule):
	if the test subject is the player and the player worships Nomos:
		if divine favour is greater than 2:
			increase pdr by 1;
		if divine favour is greater than 5:
			increase pdr by 1;
		if divine favour is greater than 9:
			increase pdr by 2.

Section - Inquisitor's hood

[See Kerkerkruip Items]

Section - Malleus Maleficarum

[See Kerkerkruip Items]
			
Kerkerkruip Religion ends here.
