Kerkerkruip Dream of Montenoir by Remko van der Pluijm begins here.
Use authorial modesty.

Chapter - Dream of A Bar in Montenoir (for use with Kerkerkruip Dreams by Victor Gijsbers)

Dream of a bar in Montenoir is a dream.



Section - Declarations
The bully is a monster that varies.
The dream-chest is a container.

Section - Start of the dream
The start the dream rule of dream of a bar in Montenoir is the start dream of a bar in Montenoir rule.

This is the start dream of a bar in Montenoir rule:
	repeat with items running through things enclosed by the player:
		unless item is part of the player:
			move item to dream-chest;
	move player to a bar in Montenoir;
	now the player carries the tankard of grog;
	silently try wielding the tankard of grog;
	now the bully is a random off-stage talker monster whose level is 0 or 2 or 3;
	say "In your hand you find a tankard, containing a strong liquor.".

Section - Drunking
[The player will be drunk while he is in his dream (and hammered afterwards)]
Drunkstate is a kind of value.  The values of drunkstate are sober, tipsy, groggy, drunk and delirium tremens.
A person has a drunkstate that varies. The drunkstate of a person is usually sober.

hammeredturncounter is a number variable. hammeredturncounter is 0.
maxdrunkstate is a drunkstate that varies. maxdrunkstate is sober.

Every turn when hammeredturncounter > 0:
	decrease hammeredturncounter by 1;
	if hammeredturncounter = 0:
		now drunkstate of the player is the drunkstate before the drunkstate of the player;
		unless drunkstate of the player is sober:
			if the maxdrunkstate of the player is:
				-- tipsy: increase hammeredturncounter by 1;
				-- groggy: increase hammeredturncounter by 2;
				-- drunk: increase hammeredturncounter by 3.

A damage modifier rule when the drunkstate of the player is not sober (this is the drunken fighting rule):
	let x be 0;
	if the player is:
		-- tipsy:
			increase x by a random number between 0 and 1;
		-- groggy: 
			increase x by a random number between 0 and 2;
		-- drunk:
			increase x by a random number between 0 and 3;
		-- delirium tremens:
			increase x by a random number between 0 and 4;
	if hammeredturncounter > 0:
		now x is x multiplied by -1;
		say " [x] (delirium tremens modifier)[run paragraph on]";
	otherwise:
		say " +[x] (grog bonus while being [drunkstate of the player]) [run paragraph on]";
	increase the attack damage by x.

A defence modifier rule (this is the unpredictable defence when drunken rule):
	let x be 0;
	if the player is:
		-- tipsy:
			increase x by a random number between 0 and 1;
		-- groggy: 
			increase x by a random number between 0 and 2;
		-- drunk:
			increase x by a random number between 0 and 3;
		-- delirium tremens:
			increase x by a random number between 0 and 4;
	now x is x multiplied by -1;
	say "[if x <> 0] [x] ([drunklevel])[run paragraph on][end if]";
			increase the defence modifier by x.

To decide which text is the drunklevel:
	if hammeredturncounter > 0:
		decide on "delirium tremens";
	otherwise:
		decide on drunk state of the player.
		

Section - Tankard [The player may only fight with a tankard full of grog]

The tankard of grog is a weapon.

The description of the tankard of grog is "A heavy, stone beer tankard, engraved with the shield of Montenoir. In it, [If the drunkstate of the player is sober and the tankard is not empty]you find a rancid, foul smelling liquid. But perhaps it tastes better than it looks?[otherwise if the drunkstate of the player is tipsy and the tankard is not empty]you find something certainly not equal to a good wine, but you've had worse.[otherwise if the drunkstate of the player is drunk and the tankard is not empty]you find... wow... heavy stuff... [otherwise] a few drops of that heavy stuff.[end if] Drinking the liquid will make you hit your enemy harder, but will also make it harder to defend yourself.". Understand "grog" as the tankard of grog.

The damage die of the tankard is 6.
The weapon attack bonus of the tankard is -2.
The weapon damage bonus of the tankard is 1.
The dodge bonus of the tankard is 1.
The parry-against bonus of the tankard is -1.
The parry-with bonus of the tankard is -1.

The tankard of grog has a number called the current volume. The current volume of the tankard is 3. 

Definition: the tankard of grog is empty if the current volume of the tankard is 0.
Definition: the tankard of grog is full if the current volume of the tankard is 3. 


Understand "drink from [noun]" as drinking.

Instead of drinking the tankard of grog:
	if the tankard of grog is empty:
		say "You only see the bottom of the stein." instead;
	otherwise:
		unless the drunkstate of the player is drunk:
			now the drunkstate of the player is the drunkstate after the drunkstate of the player;
			now the maxdrunkstate is the drunkstate after the maxdrunkstate;
		now the current volume of the tankard is the current volume of the tankard minus 1;
		say "You take a firm gulp of the local liquor. It feels warm and burning to your throat.";
		if the drunkstate of the player is drunk:
			say "[run paragraph on] You feel a bit unsteady...".

Status attribute rule (this is the drunkstate status rule):
        if player is not sober:
                if long status is true:
                        say "You are [drunk state of the player]. [if drunkstate of the player is not delirium tremens]You generally do more damage and have less defence[otherwise]You are weak and unable to defend.[end if][line break][run paragraph on]";
                otherwise:
                        say "[@ check initial position of attribute][drunkstate of the player][run paragraph on]".

						
Section - A bar in Montenoir

A bar in Montenoir is a room. "Thick [clouds of smoke] and the [joyful sounds] of a [bard] and [numerous guests] fill this otherwise sleazy bar somewhere in Montenoir. There is [an ugly looking bartender] standing behind the [buffet]. [one of]Some of the guests seem to have a good time.[or]Some girls are dancing to the music of the bard.[or]One of the guests probably had just a drink too much... You'd better not keep standing here.[purely at random]".
 North of a bar in Montenoir is a bar in Montenoir. East of a bar in Montenoir is a bar in Montenoir. West of a bar in Montenoir is a bar in Montenoir. South of a bar in Montenoir is a bar in Montenoir.
 A bar in Montenoir is not placeable.

Clouds of smoke are plural and scenery in a bar in Montenoir. Understand "smoke" as the clouds of smoke. The description of the clouds of smoke is "A mixture of strong tobacco, mixed with sweat and alcoholic beverages.".

Instead of smelling when the location is a bar in Montenoir:
	try looking at the clouds of smoke instead.

Numerous guests are scenery in a bar in Montenoir. Its description is "Just a lot of people having a good time.". Understand "guests" and "guest" and "girl" and "girls" as numerous guests.

Instead of doing anything but talking or attacking to numerous guests:
	silently try talking instead.

Instead of talking to numerous guests:
	say "They are all to occupied to engage in any activity with you.".

Instead of attacking numerous guests:
	say "You enter a bar fight which is already going on: one of the guests lying down. He's looking at you, deadly scared and at the same time glad you claimed the attentino. A large guy takes up your challenge and starts pushing you through the bar...[paragraph break]";
	create a riot.

The buffet is a supporter and scenery in a bar in Montenoir. Its description is "A large, wooden buffet, filled with [list of things on the buffet] from the [numerous guests] sitting here. You have the feeling that stealing wouldn't be appreciated.". 
Filled steins are on the buffet and plural-named. Its indefinite article is "numerous". "Loads of [filled steins] from the guests around here. They are filled to the brim.". Understand "stein" and "filled stein" as filled steins.

Instead of taking the filled steins:
	say "Your little snatch is caught! You hear a buldering voice saying 'This will be your last steal forever!'. After looking up, you realise it's the local brute who was just extorting another customer. The customer is looking gratefully at you, aware of the mess he just got out of by your action.[paragraph break]";
	create a riot.
 
The bard is scenery in a bar in Montenoir.

Instead doing anything with the bard:
	say "He is too preoccupied with his songs.".
	
The joyful sounds are plural and scenery in a bar in Montenoir. Understand "sounds" and "sound" and "joyful" and "music" as the joyful sounds. The description of the joyful sounds is "The bard sings about adventurers who were foolish enough to try to take on Malygris: [paragraph break][sing a song].".

To sing a song:
	say "[italic type][one of]They tried to fled far[paragraph break]To a bar in Montenoir[or]Got lost in the maze[paragraph break]Hoped to get back in some days[or]Ended the life of a thug[paragraph break]Became entranced by a slug[or]Tried to behead[paragraph break]One of the undead[or]For his god he fought[paragraph break]But failed to dodge that last shot[or]Created his own tomb[paragraph break]Dodging on the Bridge of Doom[or]Chose to worship the god of dead[paragraph break]To her own grave his help just led[in random order][roman type]".
	
Instead of listening when the location is a bar in Montenoir:
	try looking at the joyful sounds.

Section - Events in A bar in Montenoir

Every turn when the location is a bar in Montenoir:
	if a random chance of 30 in 100 succeeds:
		sing a song.

Every turn when the location is a bar in Montenoir:
	let x be 30;
	if the drunkstate of the player is:
		--sober:
			increase x by 20; 
		--drunk:
			decrease x by 20; 
	if a random chance of x in 100 succeeds:
		say "[one of]Your throat feels sore...[or]You're bone-dry...[or]You're craving for some booze...[or]You've been juiceless for some time...[or]You feel cottonmouthed...[or]You're sure that tankard couldn't be that empty, but hell...[or]You surely could use some of that grog in there...[purely at random]";
		try drinking tankard of grog.

To create a riot:
	wait for any key;
	clear the screen;
	now the faction of the player is arena-faction;
	move the player to back alley of bar;
	move the bully to back alley of bar.
	

Every turn when the location is a bar in Montenoir:
	let x be 10;
	if the drunkstate of the player is:
		--tipsy: 
			increase x by 20;
		--groggy:
			increase x by 40;
		--drunk:
			increase x by 60;
	if a random chance of x in 100 succeeds:
		say "By accident, you bump into a brute, who was just hitting on another visitor who is watching the new situation with gratitude. After innumerous curses, he starts pushing you through the bar...[paragraph break]";
		create a riot.
		

Section - Back alley of Bar

Back alley of bar is a room. "A small, filthy alley, where no one wonders except the bravest, the toughest or the fooliest."

[Location where the bar fight takes place]
A damage multiplier rule (this is the no death in Back ally of Bar in Montenoir rule):
	if the location is the Back alley of Bar and the attack damage is equal to or greater than the health of the global defender:
		unless the drunkstate of the player is sober:
			now the drunkstate of the player is delirium tremens;
			increase hammeredturncounter by a random number between 1 and 3;
		wake the player up;
		if the global defender is a npc:
			say "Just as you are about to give the final blow to [the name of the global defender], you see a group of people intervening. 'Hold it right there...' Then, someone from the bystanders is walking towards you.  'Thank you so much, adventurer! I will never forget that you thought this punk a lesson. You will have my eternal gratitude! By the way, my name is [printed name of unnamed prisoner].'[paragraph break][bold type]As you wake up, you realise you can free [printed name of unnamed prisoner] by PUSHING the prison door GENTLY.[roman type]" ;
			fully heal the player;
			create the unnamed prisoner;
			let destination be a random placed placeable teleportable room;
			while destination is the location of the player:
				let destination be a random placed placeable teleportable room;
			now the strong prison door is enclosed by destination;
		otherwise:
			decrease the spirit score of the player by 5;
			let y be the current health of the player;
			let x be the permanent health of the player;
			now x is x divided by 4;
			if x is larger than the current health of the player:
				let y be x minus the current health of the player;
				heal the player for y health; 
			now the drunkstate of the player is delirium tremens;
			say "Just before [name of the bully] can give you the final blow, [if bully is male]he[otherwise if bully is female]she[otherwise]it[end if]  is hold back by a number of bystanders. 'Next time, I'll get you, you little punk!' [paragraph break][bold type]The dream made you realise you are not well prepared for this adventure: -5 spirit. Furthermore, the dream left a lot of bruises, leaving you only with [current health of the player] health.[roman type]";
		remove the bully from play;
		remove the tankard of grog from play;
		repeat with stuff running through things enclosed by the dream-chest:
			now the player carries stuff;
		exit.  
			
Section - unnamed prisoner

Unnamed prisoner is a person. The ID of unnamed prisoner is 42. Understand "[printed name of unnamed prisoner]" as unnamed prisoner.
Unnamed prisoner has a number variable called uppdr. Uppdr is 0.
Unnamed prisoner has a text variable called specialskill. special is "".

To create the Unnamed prisoner:
	[First stat boosts]
	if a random chance of 30 in 100 succeeds:
		now melee of unnamed prisoner is 1;
	if a random chance of 30 in 100 succeeds:
		now defence of unnamed prisoner is defence of unnamed prisoner + 1;
	let x be a random number between 2 and 8;
	increase permanent health of the unnamed prisoner by x;
	fully heal the unnamed prisoner;
	let statlijst be the list of faculties;
	sort statlijst in random order;
	repeat with faculteit running through statlijst:
		now x is a random number between -1 and +2;
		increase the faculteit score of unnamed prisoner with x;
	[Then deciding on a name]
	if a random chance of 1 in 2 succeeds:
		now unnamed prisoner is male;
		let naamlijst be {"Terrill","Rayford","Donny","Tony","Desmund","Darryl","Kurt","Jeremy","Dudley","Davis"};
		sort naamlijst in random order;
		now the printed name of unnamed prisoner is entry 1 of naamlijst;
	otherwise:
		now unnamed prisoner is female;
		let naamlijst be {"Sky","Lana","Paulina","Heidi","Carling","Jasmine","Angela","Mistee","Claudia","Kaela"};
		sort naamlijst in random order;
		now the printed name of unnamed prisoner is entry 1 of naamlijst;
	[Then deciding on a weapon]
	let getal be a random number between 1 and 3;
	if getal is:
		--1:
			now unnamed prisoner carries a random off-stage sword;
		--2:
			now unnamed prisoner carries a random off-stage dagger;
		--3:
			now unnamed prisoner carries a random minor off-stage scythe;
	[Last, decide on a power]
	now getal is a random number between 1 and 8;
	if getal is:
		--1:
			increase the stun probability of unnamed prisoner by 10;
			now the description of unnamed prisoner is "[printed name of unnamed prisoner] is a somewhat small, but cunning guy. [if unnamed prisoner is male]He[otherwise]She[end if] is trained to use weapons to temporarily disable any opponent [if unnamed prisoner is male]he[otherwise]she[end if] stumbles upon.";
			now the specialskill of unnamed prisoner is "stunner"; 
		--2:
			increase the disarm strength of unnamed prisoner by 2;
			now the description of unnamed prisoner is "[printed name of unnamed prisoner] seems to be always on the lookout for an attack. If possible, [if unnamed prisoner is male]he[otherwise]she[end if]'ll try to disarm your opponent.";
			now the first disarm text of unnamed prisoner is "[unnamed-disarm-1]";
			now the second disarm text of unnamed prisoner is "[unnamed-disarm-2]";
			now the specialskill of unnamed prisoner is "disarmer";
		--3:
			increase uppdr of unnamed prisoner by 1;
			now the description of unnamed prisoner is "Horridly deformed by experiments by the wizard Mendele, [printed name of unnamed prisoner]'s skin protects [if unnamed prisoner is male]him[otherwise]her[end if] from tiny bits of harm.";
			now the specialskill of unnamed prisoner is "deformed";
		--4:
			now unnamed prisoner is insane;
			now the description of unnamed prisoner is "The long stay in the horrid circumstances within this small prison cell has taken its toll for [printed name of unnamed prisoner]. [if unnamed prisoner is male]He[otherwise]She[end if] is only able to reason like a madman.".
	

To say unnamed-disarm-1: say "[printed name of unnamed prisoner] executes a fast attack, targeting the [disarm-weapon].".
 
To say unnamed-disarm-2: say "With [if unnamed prisoner is male]brutal[otherwise]gracious[end if] perfection, [printed name of unnamed prisoner] hits the [disarm-weapon], which flies across the room.".

A physical damage reduction rule (this is the unnamed prisoner rule):
	if the test subject is unnamed prisoner and uppdr of unnamed prisoner is greater than 0:
		increase the pdr by uppdr.

A damage modifier rule (this is the unnamed prisoner rule):
	if the global defender is unnamed prisoner and uppdr is greater than 0:
		say " - [uppdr] (deformed skin)[run paragraph on]";
		decrease attack damage by uppdr.

Section - Prose for unnamed prisoner

Report a npc hitting the dead unnamed prisoner:
	say "With a sad look in [if unnamed prisoner is male]his[otherwise]her[end if] eyes, [printed name of unnamed prisoner] looks at you, crying out:'Even you couldn't save me.'";
	rule succeeds.

Report the player hitting the dead unnamed prisoner:
	say "'Why did you even take the trouble to save me in the first place...' are the last words you'll hear from [printed name of unnamed prisoner].";
	rule succeeds.

Report unnamed prisoner hitting a dead pc:
	say "As [printed name of unnamed prisoner] delivers the final blow, [if unnamed prisoner is male]he[otherwise]she[end if] shows a strong feeling of regret as you scream:'Et tu, [printed name of unnamed prisoner]?'";
	rule succeeds.

Report unnamed prisoner dodging:
	if the specialskill of unnamed prisoner is:
		--stunner: say "[printed name of unnamed prisoner] hops aside.";
	    	--disarmer: say "[printed name of unnamed prisoner] prepares for evasive manoeuvres.";
		--deformed: say "[printed name of unnamed prisoner] leaps aside.";
		--insane: say "[printed name of unnamed prisoner] seems quite scared as he jumps away.";
		--otherwise: say "[printed name of unnamed prisoner] decides to dodge.";
	rule succeeds.

Report unnamed prisoner parrying:
	if the specialskill of unnamed prisoner is:
		--stunner: say "[printed name of unnamed prisoner] watches the opponent carefully, readying his weapon.";
    		--disarmer: say "[printed name of unnamed prisoner] braces himself for impact, ready to use his supreme weapon skills to parry the attack.";
		--deformed: say "[printed name of unnamed prisoner] attempts to parry the blow.";
		--otherwise: say "[printed name of unnamed prisoner] parries.";
	rule succeeds.
		
Report unnamed prisoner waiting when unnamed prisoner is insane:
	say "'I really want to be part of this grand experiment of life, doctor Malygris!' [printed name of unnnamed prisoner] exlclaims, as he stands motionlessly.";
	rule succeeds.

Report unnamed prisoner attacking:
	unless the actor is the noun:
		if the specialskill of unnamed prisoner is:
			--stunner: say "[printed name of unnamed prisoner] leaps into battle, trying to deliver a lethal blow.";
			--disarmer: say "[printed name of unnamed prisoner] places a secure attack to the [one of]head[or]leg[or]arm[or]body[purely at random].";
			--deformed: say "[printed name of unnamed prisoner] lumbers forward.";
			--otherwise: say "[printed name of unnamed prisoner] charges.";
		otherwise:
			say "'I cannot stand myself anymore', [printed name of unnamed prisoner] exclaims!";
	rule succeeds.

	
Section - Strong prison door
[Strong prison door ensures that the player may only reach the unnamed prisoner after he has fought sucessfully in this dream.]
Strong Prison door is portable. Its initial description is "Suddenly, you notice a prison door you certainly haven't noticed before...". 
Its description is "Why the hell you didn't see this humongous thing before still baffles you, but that clearly is a prison door.". 
Understand "door" and "prison door" as the strong prison door.

Instead of doing anything but looking or pushing the strong prison door:
	try looking instead.

Understand "push [noun] gently" as pushing.
	
instead of pushing the strong prison door:
	say "Gently pushing on the door, you suddenly notice a hidden switch...";
	wait for any key;
	move unnamed prisoner to the location of the player;
	say "'Thank you so much, adventurer! I actually believe you will be able to defeat Malygris and free me from this prison!', [printed name of unnamed prisoner] yells.";
	now unnamed prisoner is follower;
	now faction of the unnamed prisoner is faction of the player.
	
Kerkerkruip Dream of Montenoir ends here.
