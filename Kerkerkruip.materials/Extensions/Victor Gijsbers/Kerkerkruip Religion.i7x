Kerkerkruip Religion by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Gods

Section - The god kind

A god is a kind of person.

There is a god called Aite. Aite is female.
There is a god called Nomos. Nomos is male.
There is a god called Sul. Sul is female.
There is a god called Chton. Chton is male.
There is a god called Herm. Herm is male.

A god has a number called the intervention rarity. The intervention rarity of a god is usually 100.

Section - Worship

Worshipping relates various persons to one god (called the patron). The verb to worship (he worships, they worship, he worshipped it, it is worshipped, it is worshipping) implies the worshipping relation.

The worship test god is an object that varies.
Definition: A person is worshipper if it worships the worship test god.

Section - Divine favour

A person has a number called the favour. The favour of a person is usually 0.

To decide which number is the divine favour: decide on the favour of the player.

To decide which number is the favour of (guy - a person) with (benefactor - a god):
	if guy does not worship benefactor, decide on 0;
	decide on favour of guy;

To raise the/-- favour of (guy - a person) by (N - a number):
	repeat with i running from 1 to N:
		increase favour of the guy by 1;
		follow the favour rules for the patron of the guy;

To raise the/-- favour of (guy - a person) to (N - a number):
	while the favour of the guy is less than N:
		raise favour of guy by 1;

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


Section - Intervention

[Not all interventions will work this way, but interventions triggered by every turn rules should]

To have (benefactor - a god) intervene on behalf of (guy - a person):
	say "[bracket]Error: unimplemented intervention of [the benefactor] on behalf of [the guy][close bracket][command clarification break]";
	
The intervention-guy is a person that varies.
The intervention-god is a god that varies.

Section - Intervention possible

The intervention possible rules are rulebook.

To decide whether (guy - a person) can receive intervention:
	unless guy worships a god, no;
	now intervention-guy is guy;
	now intervention-god is the patron of guy;
	follow the intervention possible rules;
	if rule succeeded, yes;
	no.

Section - intervention bonus	
	
The intervention bonus rules are a rulebook.
The intervention-bonus is a number that varies.

To decide which number is the intervention bonus for (guy - a person) with (divinity - a god):
	now intervention-bonus is 0;
	now intervention-guy is guy;
	now intervention-god is divinity;
	follow the intervention bonus rules;
	decide on intervention-bonus.
	
To decide whether (guy - a person) gets intervention:
	unless the guy can receive intervention, no;
	Let divinity be the patron of guy;
	Let the guy's chances be the favour of guy with the divinity;
	Increase the guy's chances by the intervention bonus for guy with the divinity;
	if the guy's chances < 1:
		now the guy's chances is 1;
	Let N be intervention rarity of the divinity;
	repeat with i running from 1 to the guy's chances:
		if a random chance of 1 in N succeeds:
			yes;
	no;

Every turn when the combat status is not peace (this is the spontaneous combat intervention rule):
	Repeat with boss running through gods:
		now worship test god is boss;
		Let the supplicant be a random worshipper person in the location;
		unless the supplicant is a person, next;
		if the supplicant gets intervention:
			have the patron of supplicant intervene on behalf of supplicant;
		
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
		say "You do not have any powers to sacrifice!" instead;
	otherwise if no sacrificable power is granted:
		take no time;
		say "None of your powers can be sacrificed!" instead.

Sacrifice-powers is a number that varies.
Sacrifice-lijst is a list of texts that varies.
Sacrifice-lijst-2 is a list of powers that varies.		

Carry out sacrificing:
	take no time;
	now sacrifice-powers is the number of granted sacrificable powers;
	now sacrifice-lijst is {};
	now sacrifice-lijst-2 is {};
	now current question is "Which power do you want to sacrifice?";
	repeat with stuff running through powers:
		if stuff is granted and stuff is sacrificable:
			add stuff to sacrifice-lijst-2;
			add power-name of stuff to sacrifice-lijst;
	add "do not sacrifice a power" to sacrifice-lijst;
	now current question menu is sacrifice-lijst;
	ask a closed question, in menu mode.

A menu question rule (this is the sacrifice rule):
	if the current question is "Which power do you want to sacrifice?":
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
				raise favour of the player to q;
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
		increase n by a random number between 4 and 6;
		let a be a random number between 3 and (n minus 4);
		now n is n - a;
		let b be a random number between 2 and (n minus 2);
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
		increase n by a random number between 1 and 10;
		let a be a random number between 3 and (n minus 6);
		now n is n - a;
		let b be a random number between 3 and (n minus 3);
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
		follow the mutating rules;
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

Intervention possible when intervention-god is Aite:
	rule succeeds.

To have (benefactor - Aite) intervene on behalf of (guy - a person):
	now opposition test subject is guy;
	if at least one alive opposer person is enclosed by the location:
		let n be a random number between 3 and 52;
		repeat with i running from 1 to 2:
			increase n by a random number between 1 and the favour of guy with Aite;
		if guy is the player:
			if power of the fanatics of Aite is granted:
				let m be (final spirit of the player / 3);
				increase n by a random number between 0 and m;
			now opposition test subject is guy;
			repeat with opp running through alive opposer persons enclosed by the location:
				if opp is beloved of Aite:
					decrease n by 4;
		now opposition test subject is guy;
		let opp be a random alive opposer person enclosed by the location;
		let X be permanent health of the guy;
		now X is X divided by 10; [the standard unit of damage is 10% of the maximum health of the player, rounded down]
		increase X by a random number between 1 and 2;
		if power of the fanatics of Aite is granted and guy is the player:
			if a random chance of final spirit of the guy in 50 succeeds:
				increase X by 2;
		if n < 10:
			deal X points of Aite-damage to the guy on behalf of the guy, plus gigantic damage;
		otherwise if n < 20:
			deal X points of Aite-damage to the guy on behalf of the guy;
		otherwise if n < 30:
			have Aite grant concentration to the opp;
		otherwise if n < 40:
			have Aite grant concentration to the guy;
		otherwise if n < 50:
			deal X points of Aite-damage to the opp on behalf of the guy;
		otherwise:
			deal X points of Aite-damage to the opp on behalf of the guy, plus gigantic damage;

To deal (X - a number) points of Aite-damage to (guy - a person) on behalf of (the supplicant - a person), plus gigantic damage:
	Let the size factor be 2;
	if plus gigantic damage:
		now the size factor is 3;
		say "A gigantic ";
	otherwise:
		say "A huge ";
	say "[one of]sword[or]spear[or]pike[at random] bursts out of the ground[run paragraph on]";
	if guy is flying:
		say " in front of [the guy][run paragraph on]";
		if a random chance of 1 in the size factor succeeds:
			say "! [regarding the guy][They] [fly] [if plus gigantic damage]around[otherwise]over[end if] it, narrowly avoiding the sharp point.";
			stop;
		say ". [regarding the guy][They] [crash] into it for [bold type][X] damage[roman type]!";
	otherwise:
		now X is X times the size factor divided by 2;
		say ", skewering [the guy] for [bold type][X] damage[roman type]!";
	deal X points of divine damage;
	have Aite inflict damage on the guy;
	unless the guy is dead:
		let the guy lose concentration;
		if the guy is the player and the player is hidden:
			now the player is not hidden;
			say "Your cry of pain reveals your presence.";
	if health of the guy is less than 1:
		if the guy is the player:
			if the player is the supplicant:
				end the story saying "Aite is a dangerous mistress";
			otherwise:
				end the story saying "A maddening laughter of the Goddess is the last sound you'll ever hear";
		otherwise:
			if the guy is beloved of Aite:
				say "Clearly, it doesn't always pay off to serve the mad goddess.";
		have an event of the supplicant killing the guy;


To have Aite grant concentration to (guy - a person):
	if the concentration of the guy is at least 3:
		stop;
	now the concentration of the guy is 3;
	if the guy is the player:
		say "You suddenly feel divinely inspired and [bold type]highly concentrated[roman type].";
	otherwise:
		say "[The guy] suddenly looks [bold type]highly concentrated[roman type], as if divinely inspired.";



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
		say "Nomos grants you a total of two physical damage reduction, and the Malleus Maleficarum.";
		move Malleus Maleficarum to the player.

Favour rule for Nomos (this is the Nomos favour 9 rule):
	if divine favour is 9:
		say "Nomos grants you a total of four physical damage reduction, and the Tome of Law!";
		move Tome of Law to the player.

Section - Damage reduction

A remove specific damage rule (this is the worshipping Nomos damage reduction rule):
	let n be 0;
	if the victim is the player and the player worships Nomos:
		if divine favour is greater than 2:
			increase n by 1;
		if divine favour is greater than 5:
			increase n by 1; [total 2]
		if divine favour is greater than 8:
			increase n by 2; [total 4]
	remove n points of physical damage with reason "Nomos".



Section - Gown of the Red Court

[See Kerkerkruip Items]

Section - Inquisitor's hood

[See Kerkerkruip Items]

Section - Malleus Maleficarum

[See Kerkerkruip Items]

Section - Tome of Law

[See Kerkerkruip Items]

Section - Nomos's engagement in combat

Intervention possible when intervention-god is Nomos:
	if the Nomos counter is 0, rule succeeds;
	rule fails.

The intervention rarity of Nomos is 40.

The Nomos attacker is a person that varies. The Nomos attacker is yourself.
Definition: a person is Nomos-attacker if it is the Nomos attacker. [ Definition for bug #1411 ]

The Nomos counter is a number that varies. The Nomos counter is 0.
The Nomos bonus is a truth state that varies. The Nomos bonus is false.

Every turn (this is the decrease the Nomos counter rule):
	if (the main actor is the player) and (the current action is not the action of the player dontparsing):
		if Nomos counter is greater than 0:
			decrease Nomos counter by 1;
			if Nomos counter is 0:
				activate Nomos bonus;

To follow is a verb. To prepare is a verb.

To activate Nomos bonus:
	now Nomos bonus is true;
	if the Nomos attacker is not the player, say "[The Nomos attacker] [follow] the rules of [their] God, and [prepare] to attack!";

[An AI action selection rule for an at-Act person who is the Nomos attacker (this is the Nomos attacker AI should obey Nomos rule):] [ bug #1411 ]
An AI action selection rule for an at-Act Nomos-attacker person (this is the Nomos attacker AI should obey Nomos rule):
	if Nomos bonus is true:
		choose row with an Option of the action of the Nomos attacker attacking the chosen target in the Table of AI Action Options;
		increase Action Weight entry by 1500;
	otherwise if the Nomos Counter > 0:
		choose row with an Option of the action of the Nomos attacker attacking the chosen target in the Table of AI Action Options;
		decrease Action Weight entry by 1500;

To deactivate Nomos bonus:
	now Nomos bonus is false;
		
To have (benefactor - Nomos) intervene on behalf of (supplicant - a person):
	if the Nomos counter > 0 or the Nomos bonus is true:
		stop;
	now the Nomos attacker is the supplicant;
	now Nomos counter is a random number between 1 and 4;
	if a random chance of concentration of supplicant in 5 succeeds:
		now Nomos counter is a random number between 1 and 3;
	if Nomos counter is 1 or Nomos counter is 2:
		if a random chance of 1 in 2 succeeds:
			increase Nomos counter by 1;
	if the Nomos attacker is the player:
		say "A deep voice inside your head speaks: 'You will attack [bold type][Nomos counter] turns[roman type] from now. The law will be with you.'";
	otherwise:
		say "The god of Law speaks out loud: '[bold type][Nomos attacker][roman type], attack in [bold type][Nomos counter] turns[roman type] and my strength will guide you!'";

Before reading a command (this is the planning notification rule):
	if the main actor is the player and the Nomos attacker is the player:
		if the Nomos bonus is true:
			say "[bold type](Remember: Nomos has told you to attack this turn.)[roman type][line break]".		

Aftereffects rule (this is the Nomos bonus is false rule):
	if the main actor is the Nomos attacker:
		deactivate Nomos bonus.

After attacklike behaviour (this is the attacking is never fast rule):
	now the take no time boolean is false;
	continue the action;

[To say itself-themselves:
	if the prior named noun is the player:
		say "yourself";
	otherwise if the prior named noun acts plural:
		say "themselves";
	otherwise if the prior named noun is neuter:
		say "itself";
	otherwise if the prior named noun is female:
		say "herself";
	otherwise:
		say "himself";]

To plan is a verb. To find is a verb.

Before doing anything (this is the Nomos makes you attack rule):
	if the current action is unattacklike:
		if Nomos bonus is false or the take no time boolean is true:
			make no decision;
		if the actor is not the Nomos attacker:
			make no decision;
		if the actor is not the main actor or the combat state of the actor is at-react:
			make no decision;
		now opposition test subject is the Nomos attacker;
		if at least one opposer alive person is enclosed by the location:
			let X be a random opposer person enclosed by the location;
			say "[The actor] [plan] on [current action], but [find] [themselves] attacking [the X] instead.";
			try attacking X instead;
			deactivate Nomos bonus;
		otherwise:
			say "[The actor] [plan] on [current action], but [find] [their] body attacking itself instead!";
			try the player hitting the player instead;
			deactivate Nomos bonus;
			if the player is dead:
				end the story saying "Nomos is not to be toyed with.".

Before attacklike behaviour when Nomos counter is greater than 0 (this is the Nomos stops you from attacking rule):
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
	if Nomos bonus is true and the global attacker is the Nomos attacker:
		if the numbers boolean is true, say " + [nomos piety] (the law is with [the Nomos attacker])[run paragraph on]";
		increase the attack strength by nomos piety.

An add specific damage rule (this is the Nomos damage bonus rule):
	if damage-by-hitting is true:
		if Nomos bonus is true and the global attacker is the Nomos attacker:
			add nomos piety points of divine damage with reason "the law is with [the Nomos attacker]".
			
To decide which number is the Nomos piety:
	decide on the Nomos piety of the Nomos attacker;

To decide which number is Nomos piety of (guy - a person):
	Let f be the favour of guy with Nomos;
	if f > 8:
		decide on 4;
	if f > 5:
		decide on 3;
	if f > 0:
		decide on 2;
	decide on 0.
	
Chapter - Sul

Check sacrificing (this is the cannot sacrifice to Sul when undead rule):
	if the location of the player is dedicated to sul and the player is undead:
		let m be health of the player;
		deal 10 points of divine damage;
		have Sul inflict damage on the player;
		let n be (m minus health of the player);
		say "Sul abhors the undead! Divine wrath strikes you instantly, dealing [bold type][n] damage[roman type].";
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
		otherwise:
			say "Sul makes you a demon slayer, and blesses [the item], making it more accurate, more deadly, and imbuing it with the purifying power of fire.";
			increase damage die of item by 2;
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
	if the player encloses an uncurseable thing and the favour of the player with Sul > 0:
		let K be a list of things;
		repeat with item running through uncurseable things had by the player:
			if hidden identity of item is not non-thing and hidden identity of item is corruptible:
				now hidden identity of item is not cursed;
			if item is corruptible:
				now item is not cursed;
			add item to K; [we uncurse the hidden identity, but we do not reveal it!]
		say "Sul uncurses [K with definite articles].".

Section - Unable to use deathly magic

[TODO: see if we can change this to one rule, "Last check reading an unhealthy scroll"]

Last check reading a scroll of death:
	if player worships Sul:
		do the Sul vengance;
		rule fails.

Last check reading a scroll of summoning:
	if player worships Sul:
		do the Sul vengance;
		rule fails.
		
Last check reading a scroll of ghoulification:
	if player worships Sul:
		do the Sul vengance;
		rule fails.

To do the Sul vengance:
	remove noun from play;
	let m be health of the player;
	deal 10 points of divine damage;
	have Sul inflict damage on the player;
	let n be (m minus health of the player);
	say "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals [bold type][n]damage[roman type] to you.";
	if the player is dead:
		end the story saying "And you will know My name is the Lady when I lay My vengeance upon thee.";

Before drinking Drakul's lifeblood when the player worships Sul:
	say "As you gulp down the blood, you feel Sul changing it into wine. She is extremely pleased with your assistance in destroying this unholy item, and grants you two points of favour.";
	raise the favour of the player by 2;
	remove Drakul's lifeblood from play;
	stop the action.
		
Section - Radiance

[See Kerkerkruip Monster Abilities.]

Section - Undead slayer

Definition: A person is undead-slayer if the favour of it with Sul is greater than 2.

An attack modifier rule (this is the undead slayer attack bonus rule):
	if the global attacker is undead-slayer and the global defender is undead:
		say " + 2 (undead slayer)[run paragraph on]";
		increase the attack strength by 2.

An add specific damage rule (this is the undead slayer damage bonus rule):
	if damage-by-hitting is true:
		if the global attacker is undead-slayer and the global defender is undead:
			add 2 points of divine damage with reason "undead slayer".
		
Status attribute rule (this is the undead slayer status rule):
	if player is undead-slayer:
		if long status is true:
			say "[bold type]Undead slayer[roman type]: +2 to attack and damage against undead.[line break][run paragraph on]".		

Section - Demon slayer

Definition: A person is demon-slayer if the favour of it with Sul is greater than 5.

An attack modifier rule (this is the demon slayer attack bonus rule):
	if the global attacker is demon-slayer and the global defender is demonic:
		say " + 2 (demon slayer)[run paragraph on]";
		increase the attack strength by 2.

An add specific damage rule (this is the demon slayer damage bonus rule):
	if damage-by-hitting is true:
		if the global attacker is demon-slayer and the global defender is demonic:
			add 2 points of divine damage with reason "demon slayer".		
		
Status attribute rule (this is the demon slayer status rule):
	if player is demon-slayer:
		if long status is true:
			say "[bold type]Demon slayer[roman type]: +2 to attack and damage against demons.[line break][run paragraph on]".				

Section - Sul's intervention

Intervention possible when intervention-god is Sul:
	unless an actor hitting, rule fails;
	if the global defender is undead or the global defender is demonic, rule fails;
	if the global defender opposes intervention-guy and the global defender is not intervention-guy, rule fails;
	rule succeeds.

To decide whether Sul will protect (guy - a person):
	Now the opposition test subject is guy;
	Now the worship test god is Sul;
	Let the intercessor be a random worshipper not opposer person in the location;
	Unless the intercessor is a person, no;
	Decide on whether or not the intercessor gets intervention;
	
The intervention rarity of Sul is 40.

A general damage multiplier rule when someone worships sul (this is the sul sometimes prevents damage rule):
	if Sul will protect the victim:
		multiply general damage by 0 percent with reason "Sul intervenes".


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
		say "Chton grants you the ability to switch to lich form, and gifts you three more scrolls.";
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

Intervention possible when intervention-god is Chton:
	rule succeeds.

Intervention bonus when intervention-god is Chton:
	if intervention-guy is the player:
		if current form is ghost-form:
			increase intervention-bonus by 2;
		if current form is lich-form:
			increase intervention-bonus by 5;
	increase the intervention-bonus by 6;
	decrease intervention-bonus by (3 times (the number of people in the location));

To have (benefactor - Chton) intervene on behalf of (supplicant - a person):
	say "Chton suddenly sends a [bold type]wave of unholy energy[roman type] through the room, dealing [run paragraph on]";
	let n be the number of alive not undead persons in the location;
	let original n be n;
	if n is greater than 0:
		repeat with guy running through all alive not undead persons in the location:
			let m be a random number between 2 and 5;
			if supplicant is the player:
				increase m by 1;
			let p be health of guy;
			deal m points of necromantic damage;
			have Chton inflict damage on guy;
			let q be (p minus health of guy);
			say "[if n is 1 and original n is not 1]and [end if][q] damage to [the name of the guy][if guy is dead] (which is [bold type]lethal[roman type])[end if][roman type][if concentration of the guy is greater than 0 and guy is alive] (which breaks [regarding the guy][possessive] concentration)[end if][if n is not 1]; [otherwise].[line break][end if][run paragraph on]";
			now concentration of the guy is 0;
			decrease n by 1;
			if n is 0:
				say ""; [For an extra newline. Don't ask.]
	otherwise:
		say "no damage to anyone.";
	if health of the player is less than 1:
		end the story saying "Quem di diligunt, adolescens moritur".	



Chapter - Herm

Herm-treasure-chest is a container.
One scroll of knowledge and one scroll of mapping are in Herm-treasure-chest.

Herm-backup-chest is a container.
Six scrolls of shadows, three scrolls of psycholocation, and two scrolls of shadows are in Herm-backup-chest.

To do a Herm gift:
	let item be a random thing in Herm-treasure-chest;
	move item to player;
	if at least one thing is in Herm-backup-chest:
		let item be a random thing in Herm-backup-chest;
		move item to Herm-treasure-chest.

Favour rule for Herm (this is the Herm favour 1 rule):
	if divine favour is 1:
		say "The subtle Herm welcomes you, and gifts you two scrolls.";
		do a Herm gift;
		do a Herm gift.

Favour rule for Herm (this is the Herm favour 3 rule):
	if divine favour is 3:
		say "Herm gifts you a scroll and Snipe; and grants you a permanent +1 bonus to hiding.";
		do a Herm gift;
		move Snipe to the player.

Favour rule for Herm (this is the Herm favour 6 rule):
	if divine favour is 6:
		say "Herm gifts you two scrolls[unless player encloses magical spade] and a magical spade[end if]; and increases your hiding bonus to +2.";
		do a Herm gift;
		do a Herm gift;
		unless player encloses magical spade:
			move magical spade to player.

Favour rule for Herm (this is the Herm favour 9 rule):
	if divine favour is 9:
		say "Herm gifts you three scrolls and a Morphean grenade; and increases your hiding bonus to +3.";
		do a Herm gift;
		do a Herm gift;
		do a Herm gift;
		let chosen grenade be a random Morphean grenade;
		let item be a new object cloned from chosen grenade;
		move item to the player.

A detection rule (this is the Herm worship decreases probability of detection rule):
	if the player worships Herm:
		let n be 0;
		if divine favour > 2:
			now n is 1;
		if divine favour > 5:
			now n is 2;
		if divine favour > 8:
			now n is 3;
		if n > 0:
			say " + [n] (worshipping Herm)[run paragraph on]";
			increase the hiding roll by n.


Section - Herm's intervention

Intervention possible when intervention-god is Herm:
	unless an actor hitting, rule fails;
	unless the global defender is intervention-guy, rule fails;
	unless the global defender is conscious, rule fails;
	unless the location of the global attacker is the location of the global defender, rule fails;
	rule succeeds.

The intervention rarity of Herm is 20;

Before an actor hitting someone who worships Herm:
	unless the global defender gets intervention, make no decision;
	say "[bold type]Herm[roman type] bends space and time around [the noun] and [the actor], and you suddenly find [if the noun is the player]yourself in the role of attacker[otherwise]that [the noun] is attacking [the actor] instead[end if]!";
	try the noun hitting the actor instead.
			
Kerkerkruip Religion ends here.
