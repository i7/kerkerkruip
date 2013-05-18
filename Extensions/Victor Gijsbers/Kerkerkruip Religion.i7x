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
		say "Aite shuffles your faculties -- you now have [body score of the player] body, [mind score of the player] mind, and [spirit score of the player] spirit.";		
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


			
			
Kerkerkruip Religion ends here.
