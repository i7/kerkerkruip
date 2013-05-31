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

Status combat stats rule (this is the religion status rule):
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

Check sacrificing (this is the cannot sacrifice when no power is granted rule):
	if no power is granted:
		take no time;
		say "You do not have any powers to sacrifice!" instead.

Sacrifice-powers is a number that varies.
Sacrifice-lijst is a list of texts that varies.
Sacrifice-lijst-2 is a list of powers that varies.		

Carry out sacrificing:
	take no time;
	now sacrifice-powers is the number of granted powers;
	now sacrifice-lijst is {};
	now sacrifice-lijst-2 is {};
	now current question is "Which power do you want to sacrifice? (Please enter a number.)";
	repeat with stuff running through powers:
		if stuff is granted:
			add stuff to sacrifice-lijst-2;
			add power-name of stuff to sacrifice-lijst;
	add "do not sacrifice a power" to sacrifice-lijst;
	now current question menu is sacrifice-lijst;
	ask a closed question, in menu mode.

A menu question rule (this is the sacrifice rule):
	if the current question is "Which power do you want to sacrifice? (Please enter a number.)":
		let n be number of entries in sacrifice-lijst;
		let m be the number understood;
		if m > 0:
			if m < n:
				let guy be a random god who infuses the location of the player;
				now player worships guy;
				let stuff be entry m of sacrifice-lijst-2;
				let q be (divine favour plus power level of stuff);
				say "You sacrifice the [power-name of stuff] to [guy], gaining [power level of stuff in words] divine favour (for a total of [q in words] favour).[paragraph break]";
				follow the repelling rules for stuff;
				now stuff is not granted;
				while q > divine favour:
					increase divine favour by 1;
					consider the favour rules for guy;
			otherwise if m is n:
				say "You decide to not sacrifice a power.";
			exit.
		



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

Favour rule for Aite (this is the Aite favour 9 rule):
	if divine favour is 9:
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

Status attribute rule (this is the survival instinct status rule):
	if the player worships Aite and divine favour is greater than 2:
		if long status is true:
			say "You have [bold type]survival instincts[roman type].[line break][run paragraph on]".

Status combat stats rule (this is the survival instinct active status rule):
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
		say "Nomos grants you protection from the next successful attack against you, and also gifts you a gown of the red court.";
		increase hit protection of player by 1;
		move gown of the red court to the player.

Favour rule for Nomos (this is the Nomos favour 3 rule):
	if divine favour is 3:
		say "Nomos grants you a point of physical damage reduction, and an inquisitor's hood.";
		move inquisitor's hood to the player.

Favour rule for Nomos (this is the Nomos favour 6 rule):
	if divine favour is 6:
		say "Nomos grants you another point of physical damage reduction, and the Malleus Maleficarum.";
		move Malleus Maleficarum to the player.

Favour rule for Nomos (this is the Nomos favour 9 rule):
	if divine favour is 9:
		say "Nomos grants you a further two points of physical damage reduction, and the Tome of Law!";
		move Tome of Law to the player.

Section - Damage reduction

A physical damage reduction rule (this is the worshipping Nomos damage reduction rule):
	if the test subject is the player and the player worships Nomos:
		if divine favour is greater than 2:
			increase pdr by 1;
		if divine favour is greater than 5:
			increase pdr by 1;
		if divine favour is greater than 8:
			increase pdr by 2.



Section - Gown of the Red Court

[See Kerkerkruip Items]

Section - Inquisitor's hood

[See Kerkerkruip Items]

Section - Malleus Maleficarum

[See Kerkerkruip Items]

Section - Tome of Law

[See Kerkerkruip Items]

Section - Nomos's engagement in combat

Every turn when the player worships Nomos (this is the Nomos intervenes in combat rule):
	if combat status is not peace and Nomos counter is 0 and main actor is the player:
		let n be divine favour;
		if a random chance of n in 40 succeeds:
			have Nomos intervene.

The Nomos counter is a number that varies. The Nomos counter is 0.
The Nomos bonus is a truth state that varies. The Nomos bonus is false.

Every turn (this is the decrease the Nomos counter rule):
	if the main actor is the player:
		if Nomos counter is greater than 0:
			decrease Nomos counter by 1;
			if Nomos counter is 0:
				now Nomos bonus is true.

To have Nomos intervene:
	now Nomos counter is a random number between 1 and 5;
	if Nomos counter is 1 or Nomos counter is 2:
		if a random chance of 1 in 2 succeeds:
			increase Nomos counter by 1;
	say "A deep voice inside your head speaks: 'You will attack [bold type][Nomos counter] turns[roman type] from now. The law will be with you.'".

Before reading a command (this is the planning notification rule):
	if the main actor is the player:
		if the Nomos bonus is true:
			say "[bold type](Remember: Nomos has told you to attack this turn.)[roman type][line break]".		

First every turn rule (this is the Nomos bonus is false rule):
	if the main actor is the player:
		now Nomos bonus is false.

Before not attacklike behaviour:
	if Nomos bonus is true:
		if combat state of the actor is not at-react:
			if the main actor is the player and the actor is the player:
				if at least one hostile alive person is enclosed by the location:
					let X be a random hostile person enclosed by the location;
					say "You plan on [current action], but find yourself attacking [the X] instead.";
					try attacking X instead;
				otherwise:
					say "You plan on [current action], but find your body attacking itself instead!";
					try the player hitting the player instead;
					if the player is dead:
						end the story saying "Nomos is not to be toyed with.".

Before attacklike behaviour when Nomos counter is greater than 0:
	say "Deciding to break the command of Nomos, you plan on attacking [the noun]. However, you find yourself ";
	if player is not the main actor:
		say "doing nothing instead." instead;
	otherwise:
		if a random number between 1 and 5 is:
			-- 1: say "doing nothing instead.";
				try waiting instead;
			-- 2: say "concentrating instead.";
				try concentrating instead;
			-- 3:
				if the player carries at least one thing:
					let X be a random thing carried by the player;
					say "dropping [the X] instead.";
					try dropping X instead;
				otherwise: 
					say "praising the god instead." instead;
			-- 4: say "speaking a language you have never heard instead." instead;
			-- 5: say "contemplating the inevitability of Death instead." instead.

An attack modifier rule (this is the Nomos attack bonus rule):
	if Nomos bonus is true and the global attacker is the player:
		if the numbers boolean is true, say " + [nomos piety] (the law is with you)[run paragraph on]";
		increase the attack strength by nomos piety.

A damage modifier rule (this is the Nomos damage bonus rule):
	if Nomos bonus is true and the global attacker is the player:
		if the numbers boolean is true, say " + [nomos piety] (the law is with you)[run paragraph on]";
		increase the attack damage by nomos piety.
			
To decide which number is Nomos piety:
	if player worships Nomos:
		if divine favour > 8:
			decide on 4;
		if divine favour > 5:
			decide on 3;
		if divine favour > 2:
			decide on 2;
		decide on 1;
	decide on 0.






Chapter - Sul

Check sacrificing (this is the cannot sacrifice to Sul when undead rule):
	if the location of the player is dedicated to sul and the player is undead:
		say "Sul abhors the undead! Divine wrath strikes you instantly, dealing [bold type]10 damage[roman type].";
		decrease health of player by 10;
		if the player is dead:
			end the story saying "Your attempt at contrition wasn't appreciated.";
		rule fails.


Section - Favour rules

Favour rule for Sul (this is the Sul favour 1 rule):
	if divine favour is 1:
		say "Sul grants you knowledge of deathly magic, so that you will not inadvertently use it; she gives you immunity to angelic radiance; and she protects you from curses.";
		identify a random scroll of death;
		identify a random scroll of ghoulification;
		identify a random scroll of summoning.

Favour rule for Sul (this is the Sul favour 3 rule):
	if divine favour is 3:
		say "Sul grants you a level of angelic radiance, and makes you an undead slayer!";
		increase radiation of player by 1.

Favour rule for Sul (this is the Sul favour 6 rule):
	if divine favour is 6:
		let item be a random readied weapon enclosed by the player;
		if item is a natural weapon:
			say "Sul makes you a demon slayer; she also attempts to bless your weapon, but you aren't wielding any.";
		otherwise if item is incorruptible:
			say "Sul makes you a demon slayer; she also attempts to bless [the item], but unfortunately it resists the attempt.";
		otherwise:
			say "Sul makes you a demon slayer, and blesses [the item], making it more accurate, more deadly, and imbuing it with the purifying power of fire.";
			increase damage die of item by 1;
			increase weapon attack bonus of item by 1;
			increase internal heat of item by 3.

Favour rule for Sul (this is the Sul favour 9 rule):
	if divine favour is 9:
		say "Sul cures you of any addictions you might have, and grants you two more levels of angelic radiance.";
		increase radiation of player by 2;
		now ment timer is 0;
		now OD timer is 0;
		now ment addiction is 0.

Section - Protection from curses

Every turn when the player worships Sul:
	if the player encloses an uncurseable thing and divine favour > 0:
		let K be a list of things;
		repeat with item running through uncurseable things had by the player:
			if hidden identity of item is not non-thing and hidden identity of item is corruptible:
				now hidden identity of item is not cursed;
			if item is corruptible:
				now item is not cursed;
			add item to K; [we uncurse the hidden identity, but we do not reveal it!]
		say "Sul uncurses [K with definite articles].".

Section - Unable to use deathly magic

Last check reading a scroll of death:
	if player worships Sul:
		remove noun from play;
		say "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals [bold type]10 damage[roman type] to you.";
		decrease health of player by 10;
		if the player is dead:
			end the story saying "And you will know My name is the Lady when I lay My vengeance upon thee.";
		rule fails.

Last check reading a scroll of summoning:
	if player worships Sul:
		remove noun from play;
		say "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals [bold type]10 damage[roman type] to you.";
		decrease health of player by 10;
		if the player is dead:
			end the story saying "And you will know My name is the Lady when I lay My vengeance upon thee. ";
		rule fails.
		
Last check reading a scroll of ghoulification:
	if player worships Sul:
		remove noun from play;
		say "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals [bold type]10 damage[roman type] to you.";
		decrease health of player by 10;
		if the player is dead:
			end the story saying "And you will know My name is the Lady when I lay My vengeance upon thee. ";
		rule fails.
		
Section - Radiance

[See Kerkerkruip Monster Abilities.]

Section - Undead slayer

An attack modifier rule (this is the undead slayer attack bonus rule):
	if the global attacker is the player and the player worships sul and the global defender is undead and divine favour > 2:
		say " + 2 (undead slayer)[run paragraph on]";
		increase the attack strength by 2.

A damage modifier rule (this is the undead slayer damage bonus rule):
	if the global attacker is the player and the player worships sul and the global defender is undead and divine favour > 2:
		say " + 2 (undead slayer)[run paragraph on]";
		increase the attack damage by 2.
		
Status attribute rule (this is the undead slayer status rule):
	if player worships sul and divine favour > 2:
		if long status is true:
			say "[bold type]Undead slayer[roman type]: +2 to attack and damage against undead.[line break][run paragraph on]".		

Section - Demon slayer

An attack modifier rule (this is the demon slayer attack bonus rule):
	if the global attacker is the player and the player worships sul and the global defender is demonic and divine favour > 5:
		say " + 2 (demon slayer)[run paragraph on]";
		increase the attack strength by 2.

A damage modifier rule (this is the demon slayer damage bonus rule):
	if the global attacker is the player and the player worships sul and the global defender is demonic and divine favour > 5:
		say " + 2 (demon slayer)[run paragraph on]";
		increase the attack damage by 2.
		
Status attribute rule (this is the demon slayer status rule):
	if player worships sul and divine favour > 5:
		if long status is true:
			say "[bold type]Demon slayer[roman type]: +2 to attack and damage against demons.[line break][run paragraph on]".				

Section - Sul's intervention

A damage multiplier rule when the player worships sul (this is the sul sometimes prevents damage rule):
	unless faction of global defender hates faction of player:
		unless global defender is undead or global defender is demonic:
			if a random chance of divine favour in 40 succeeds:
				say "[bold type] - 100% (Sul intervenes)[roman type][run paragraph on]";
				now the attack damage is 0.




Chapter - Chton

Favour rule for Chton (this is the Chton favour 1 rule):
	if divine favour is 1:
		say "Chton grants you knowledge of and partial protection from deathly magic, and gifts you a scroll.";
		identify a random scroll of death;
		identify a random scroll of ghoulification;
		identify a random scroll of summoning;
		do a Chton gift;
		now player is deathly-resistant.

Favour rule for Chton (this is the Chton favour 3 rule):
	if divine favour is 3:
		say "Chton grants you the ability to switch between ghoul form and human form, and gifts you three more scrolls.";
		do a Chton gift;
		do a Chton gift;
		now ghoul-form is form-active;
		now human-form is form-active.

Favour rule for Chton (this is the Chton favour 6 rule):
	if divine favour is 6:
		say "Chton grants you the ability to switch to ghost form, and gifts you three more scrolls.";
		do a Chton gift;
		do a Chton gift;
		do a Chton gift;
		now ghost-form is form-active.

Favour rule for Chton (this is the Chton favour 9 rule):
	if divine favour is 9:
		say "Chton grants you the ability to switch to lich form, and gifst you three more scrolls.";
		do a Chton gift;
		do a Chton gift;
		do a Chton gift;
		now lich-form is form-active.

Section - Chton's treasure chest

Chton-treasure-chest is a container.
Twelve scrolls of death and five scrolls of summoning are in Chton-treasure-chest.

To do a Chton gift:
	let item be a random thing in Chton-treasure-chest;
	move item to player.

Section - Chton's intervention

Every turn when the player worships Chton (this is the Chton intervenes in combat rule):
	if combat status is not peace:
		if at least one hostile alive person is enclosed by the location:
			let n be divine favour;
			if current form is ghost-form:
				increase n by 2;
			if current form is lich-form:
				increase n by 5;
			increase n by 6;
			decrease n by (3 times (the number of people in the location));
			if n < 1:
				now n is 1;
			if a random chance of n in 100 succeeds:
				have Chton intervene.

To have Chton intervene:
	say "Chton suddenly sends a [bold type]wave of unholy energy[roman type] through the room, dealing [run paragraph on]";
	let n be the number of alive not undead persons in the location;
	let original n be n;
	if n is greater than 0:
		repeat with guy running through all alive not undead persons in the location:
			let m be a random number between 3 and 6;
			if guy is deathly-resistant:
				decrease m by 2;
			decrease health of guy by m;
			say "[if n is 1 and original n is not 1]and [end if][m] damage to [the name of the guy][if guy is dead] (which is [bold type]lethal[roman type])[end if][roman type][if concentration of the guy is greater than 0 and guy is alive] (which breaks [possessive of the guy] concentration)[end if][if n is not 1]; [otherwise].[line break][end if][run paragraph on]";
			now concentration of the guy is 0;
			decrease n by 1;
			if n is 0:
				say ""; [For an extra newline. Don't ask.]
	otherwise:
		say "no damage to anyone.";
	if health of the player is less than 1:
		end the story saying "Quem di diligunt, adolescens moritur".	

			
Kerkerkruip Religion ends here.
