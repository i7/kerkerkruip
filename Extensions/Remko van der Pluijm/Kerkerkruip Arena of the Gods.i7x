Kerkerkruip Arena of the Gods by Remko van der Pluijm begins here.

Use authorial modesty.

Book - Religion additions 

Section - Incarnating (for use with Kerkerkruip Religion by Victor Gijsbers)

[Test values!]
Incarnating relates one monster (called the monsteravatar) to one god. The verb to incarnate (he incarnates, they incarnate, he is incarnated by it, it is incarnated, it is incarnating) implies the incarnating relation.

The Healer of Aite incarnates Aite.
The Overmind incarnates Herm.
Bodmall incarnates Sul.
Drakul incarnates Chton.


Book - Location additions

Chapter - Arena of the Gods (for use with Kerkerkruip Locations by Victor Gijsbers)

Hall of Gods is a room. "A long hall, adorned with great statues of the [number of gods] great gods are here, together with pictures of the great battles already fought in this room. The last picture mentions [if Godfight boolean is true]you triumphing over [Chosenname][otherwise][random fight text][end if]. [if the Godfight boolean is false] If you are willing to fight, stand on the empty pedestal.[end if] Agnosticists and Atheists will not be tolerated!" 
	
Hall of Gods is connectable.
Hall of Gods is not connection-inviting.
Hall of Gods is not placeable.
Hall of Gods is not habitable.
Hall of Gods is not treasurable.
Hall of Gods is extra-accepting.
Hall of Gods is vp-agnostic.
Hall of Gods is religious.

The rarity of Hall of Gods is 5. 
The unlock level of Hall of Gods is 2.

The Arena of the Gods is a room. "The divine Arena; a plaything for the Gods, too numb to fight on their own, to let their Chosen Ones fight it out."

The Arena of the Gods is not connectable.
The Arena of the Gods is not connection-inviting.
The Arena of the Gods is not placeable.
The Arena of the Gods is not habitable.
The Arena of the Gods is not treasurable.
The Arena of the Gods is not teleportable.
The Arena of the Gods is not extra-accepting.
The Arena of the Gods is vp-agnostic.
The Arena of the Gods is religious.

The godfight pedestal is an enterable supporter and scenery in the Hall of Gods. Understand "pedestal" and "empty pedestal" as the godfight pedestal.

Godfightame1 is a text that varies.
Godfightame2 is a text that varies.


To decide which text is the random fight text:
	Let L be a list of objects;
	repeat with g running through gods:
		if (the player does not worship g) and (there is a monster incarnating g):
			add the monsteravatar of g to L;
	sort L in random order;
	now Godfightame1 is the printed name of entry 1 of L;
	now Godfightame2 is the printed name of entry 2 of L;
	let z be a text;
	now z is "[Godfightame1] triumphing over [Godfightame2]";
	decide on z.
	
	

The Godfight boolean is a truth state variable that varies. The Godfight boolean is false.

Chosenname is a text that varies.
Godname is a text that varies.
Chosenlijst is a list of monsters that varies.
Godlijst is a list of texts that varies.

ChosenFighting is an action applying to nothing.

Instead of entering the godfight pedestal:
	try ChosenFighting instead.

Carry out ChosenFighting:
	if the player worships a god:
		if the Godfight boolean is false:
			if the location is the Hall of Gods:
				take no time;
				now Chosenlijst is {};
				now Godlijst is {};
				now current question is  "The Chosen One of which god do you wish to fight? (Please enter a number):";
				repeat with Godnaam running through gods:
					unless player worships Godnaam:
						if Godnaam is incarnated by a monster:
							add (monsteravatar of Godnaam) to Chosenlijst;
							add the printed name of Godnaam to Godlijst;
				add "do not fight a Chosen One" to Godlijst;
				now current question menu is Godlijst;
				ask a closed question, in menu mode;
		otherwise:
			say "You have already fought for the honour of [a random god worshipped by the player]!  [If a random god worshipped by the player is female]She[else]He[end if] isn't willing to sit through another fight again.";
			take no time;
	otherwise:
		let x be a random number between 5 and 10;
		decrease the health of the player by x;
		say "A roaring voice answers your call:'YOU CANNOT DEFEND ANY HEATHEN RELIGION YOU MIGHT WORSHIP AT THIS HOLY PLACE, INFIDEL!' A ball of lightning shoots from the sky, doing [x] damage to you!";
		if the health of the player is less than 1:
			end the story saying "The Gods do not appreciate heathen worship. The dvine ball of lighting deprives you of your live.".
		
A menu question rule (this is the ChosenFighting rule):
	if the current question is "The Chosen One of which god do you wish to fight? (Please enter a number):":
		let n be the number of entries in Godlijst;
		let m be the number understood;
		if m > 0:
			if m < n:
				Let Pers be entry m of Chosenlijst;
				if Pers is group leading and Pers is not defeated individually:
					move Pers to the Arena-waiting-room;
					now chosenname is the printed name of Pers;
					now Godname is entry m of Godlijst;
					if Pers is initially accompanied:
						repeat with X running through people who accompany Pers:
							move X to the location of Pers;
					repeat with guy running through persons in the Arena-waiting-room:
						challenge guy;
						move guy to the Arena of the Gods;
						say "The heavy doors open, where the angry [guy] awaits, prepared to fight for the honour of [entry m of Godlijst]!";
					move the player to the Arena of the Gods;
					now the Godfight boolean is true;
				otherwise:
					now the chosenname is the printed name of Pers;
					challenge Pers;
					move Pers to the Arena of the Gods;
					say "The heavy doors open, where the angry [Pers] awaits, prepared to fight for the honour of [entry m of Godlijst]!";
					move the player to the Arena of the Gods;
					now the Godfight boolean is true;
			otherwise:
				say "You decide it is best to defend the honour of your God another time...".


Section - Godly intervention
[For each God, I'll be implementing some form of godly intervention here based on Victor's divine interventions
This system assumes that the divine favour of the monster is quite high and fixed; it then takes the difference 
between the monsters divine favour and the players and then checks whether the god will intervene for the monster]
Every turn when the location is the 
	let m be a random number between 1 and 20;
	increase m by 9;
	decrease m by the divine favour;
	If a random chance of m in 100 succeeds:
		have Godname arena-intervene. 

To have (guy - a text) arena-intervene:
	[TODO stuff]
	

Section - Awarding divine power 

ArenaAwardGranted is a truth state variable that varies. ArenaAwardGranted is false.

Every turn (this is the alternative award at the Arena of the Gods rule):
	if (the location is the Arena of the Gods) and (combat status is peace) and (ArenaAwardGranted is false):
		repeat with guy running through dead not off-stage persons:
			have guy disappear;
			if guy is grouper and guy is not group leading:
				let guy2 be a random person accompanied by guy; [Redirect absorption to group leader]
				unless guy2 is defeated individually:
					now guy is guy2;
			if guy is not group leading or group of guy has been defeated or guy is defeated individually:
				if  ArenaAwardGranted is false:
					Increase divine favour by 2;
					now ArenaAwardGranted is true;
					say "Your God grants you 2 divine favour!".

Killing rule (this is the killingalternative award at the Arena of the Gods rule):
	if (the killer-guy is the player) and (the location is the Arena of the Gods) and (ArenaAwardGranted is false):
		Increase divine favour by 2;
		now ArenaAwardGranted is true;
		have the killer-guy disappear;
		say "Your God grants you 2 divine favour!";
		rule fails.

The alternative award at the Arena of the Gods rule is listed before the remove all killed monsters from play rule in the every turn rules.
The killingalternative award at the Arena of the Gods rule is listed before the grant powers when a monster is slain rule in the killing rules.

Section - Getting out of the Arena


Every turn when the location is the Arena of the Gods(this is the teleport after killing rule):
	update the combat status;
	if no person is in the Arena-waiting-room and combat status is peace:
		now the Godfight boolean is true;
		say "You are [bold type]transported back[roman type] to the Hall of Gods.";
		repeat with item running through things in the Arena of the Gods:
			unless (item is player or item is backdrop):
				move item to Hall of Gods;
		move player to Hall of Gods.

The teleport after killing rule is listed after the alternative award at the Arena of the Gods rule in the every turn rules.

Kerkerkruip Arena of the Gods ends here.
