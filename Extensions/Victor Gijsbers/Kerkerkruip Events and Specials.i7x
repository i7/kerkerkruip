Kerkerkruip Events and Specials by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Elemental Plane of Smoke

There is a room called elemental plane of smoke. "Smoke is everywhere. You are completely disoriented."

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
		if temporary smoke timer is less than 15:
			now temporary smoke timer is 15.

Instead of digging in Elemental Plane of Smoke:
	take no time;
	say "You cannot dig tunnels in the smoke.".
	
A teleport impossible rule (this is the no teleportation in elemental plane of smoke rule):
	if the location of the test subject is elemental plane of smoke:
		rule succeeds.	

Instead of going in Elemental Plane of Smoke when the player can move:
	now concentration of the player is 0;
	repeat with item running through things in Elemental Plane of Smoke:
		unless item is a person or item is a backdrop:
			move item to Elemental Plane of Smoke Storage.;
	let lijst be a list of things;
	repeat with item running through things in Elemental Plane of Smoke Storage:
		if a random chance of 1 in 20 succeeds:
			move item to Elemental Plane of Smoke;
			add item to lijst;
			have the parser notice item;
	say "[if lijst is not empty]Running through the smoke, you stumble across [a list of things that list-inhabit lijst][otherwise][one of]You stumble blindly through the smoke[or]You run through an endless world of clouds[or]Nothing appears to change, no matter how long you run[as decreasingly likely outcomes][end if].".
			
Elemental Plane of Smoke Storage is a room.
Elemental Plane of Smoke Storage is not placeable.

The portal to Kerkerkruip is a stone thing. It is fixed in place. The portal to Kerkerkruip is in Elemental Plane of Smoke.  Understand "exit" as the portal to Kerkerkruip. The description of the portal to Kerkerkruip is "Presumably, this is the portal back to Kerkerkruip.".

Does the player mean entering the portal to Kerkerkruip: it is likely.

Instead of going outside in Elemental Plane of Smoke:
	try exiting.

Instead of exiting in Elemental Plane of Smoke when the player can move:
	if portal to Kerkerkruip is in the location:
		try entering the portal to Kerkerkruip;
	otherwise:
		say "If only you could find that portal again!".

Instead of entering the portal to Kerkerkruip when the player can move:
	consider the sudden combat reset rules;
	move player to Portal of Smoke;
	now the take no time boolean is false.
			

Section - Elemental Plane of Smoke label for the map (for use with Kerkerkruip Glimmr Additions by Erik Temple)
[Almost certainly not needed, but the label graphic exists, so what the heck.]

The map-label of Elemental Plane of Smoke is Figure of map_label_Smoke.






Chapter - Arena of the Fallen

The Arena of the Fallen is an arena. "The ruins of a formerly great arena. The ground is littered with remains, and there is definitely something unholy about this place. Playing around with the souls of the departed is probably not for the faint of heart. All around you demonic spectators cheer gleefully, excited once again to witness the game of death. You'd better keep them entertained and the blood flowing ..."

The Arena of the Fallen is faction-imposing.
The Arena of the Fallen is challenged-group-inviting.

[The Arena-waiting-room is a holding cell.] The staging area of the Arena of the Fallen is Arena of the Fallen.

The oppname is a text that varies. The oppname is "".
Challengelijst is a list of texts that varies.
Beestlijst is a list of monsters that varies.

Reviving is an action applying to nothing. Understand "revive" as reviving.

Check reviving when the player is not in the Entrance to the Arena:
	take no time;
	say "You don't have the power to revive the fallen here.";
	stop the action.

Carry out reviving:
	take no time;
	now Challengelijst is {};
	now Beestlijst is {};
	now current question is  "Which fallen warrior do you wish to fight? (Please enter a number):";
	repeat with Beest running through all dead not grouper persons:
		if Beest is not group leading or the group of Beest has been defeated: 
			repeat with P running through powers granted by Beest:
				if P is not granted:
					add Beest to Beestlijst;
					add printed name of Beest to Challengelijst;
	add "do not fight a fallen warrior" to Challengelijst;
	now current question menu is Challengelijst;
	ask a closed question, in menu mode.


A menu question rule (this is the FallenFighting rule):
	if the current question is "Which fallen warrior do you wish to fight? (Please enter a number):":
		let n be the number of entries in Challengelijst;
		let m be the number understood;
		if m > 0:
			if m < n:
				have the player and entry m of Beestlijst fight in Arena of the Fallen;
			otherwise if m is n:
				say "You decide to let your fallen enemies enjoy eternal rest.";
			exit.


Carry out challenging someone in Arena of the Fallen:
	now oppname is the printed name of the noun.

Before arena arrival of Arena of the Fallen:
	repeat with guy running through persons in the Arena of the Fallen:
		challenge guy;
	Let count be the number of people enclosed by the Arena of the Fallen;
	say "The heavy doors open, where [if count is 1]the angry [end if][list of people enclosed by the Arena of the Fallen] await[if count is 1]s[end if], strengthened by evil magic!";

Carry out challenging someone in Arena of the Fallen:
	now oppname is the printed name of the noun;

To challenge (the guy - a person):
	let x be level of the guy;
	now x is x times 3 divided by 2 to the nearest 2;
	let d be a random number between 2 and 8;
	let g be a random number between 1 and 3;
	let hm be d times x;
	let s be g plus x;
	increase the permanent health of guy by hm;
	increase the body score of guy by g;
	increase the mind score of guy by g;
	increase the spirit score of guy by g;
	increase the melee of guy by 3;
	increase the defence of guy by 3;
	restore the health of the guy;
	now the concentration of the guy is 0;
	now offensive flow of the guy is 0;
	now defensive flow of the guy is 0;
	now guy is at-Inactive;

The demon boredom is a number which varies. The demon boredom is 0.
The current dissatisfaction is a number which varies. The current dissatisfaction is 0.

After not attacklike behaviour:
	if the location is the Arena of the Fallen:
		increase current dissatisfaction by 1;
	continue the action.

After attacklike behaviour:
	if the location is the Arena of the Fallen:
		decrease current dissatisfaction by 1;
	continue the action.

To decide which number is the distractionchance:
	let x be the current dissatisfaction;
	increase x by the demon boredom;
	let N be a random number between -5 and x;
	decide on N.

Every turn when the location is the Arena of the Fallen and the combat status is not peace:
	let guy be a random alive person in the Arena of the Fallen;
	if distractionchance > 3:
		if the concentration of guy > 0:
			decrease the concentration of guy by 1;
			say "Distracted by [one of]the strong sulfur smell[or]hundreds of prying, crimson eyes[or]gripping claws[or]the black figure towering above you[or]gruesome howling[purely at random], [if guy is the player]you are[otherwise][guy] [is-are][end if] unable to maintain this level of concentration. [if guy is the player]Your[otherwise][Possessive of guy][end if] current concentration is";
			if the concentration of guy is:
				-- 0:
					say " unconcentrated.";
				-- 1:
					say " mildly concentrated.";
				-- 2:
					say " quite concentrated.";
				-- 3:
					say " maximally concentrated.";
			now the current dissatisfaction is 0;
			increase the demon boredom by 2;
	otherwise if distractionchance > 6:
		let X be a random number between 1 and distractionchance - 2;
		decrease the health of guy by X;
		say "Disgruntled by  lack of blood, the spectators decide to lend a helping hand. [one of]Grippling claws tears away at[or]A small dagger, coated with a bit of blood, slices[or]Noxious fumes envelop[or]A small rock is flinged at[purely at random] you[if guy is not the player]r opponent[end if], doing [X] damage[if health of guy is less than 1] and killing [the guy][end if]!";
		now the current dissatisfaction is 0;
		increase the demon boredom by 2.

Section - Getting out of the Arena


For arena exit of Arena of the Fallen:
	say "You are [bold type]transported back[roman type] to the Entrance of the Arena.";
	award achievement Twice fallen.


Chapter - Arena of the Gods

The Arena of the Gods is an arena. "The divine Arena; a plaything for the Gods, too numb to fight on their own, to let their Chosen Ones fight it out. Fighting here is at the whim of the Gods, who will regularly intervene when they think the battle becomes dull ([italic type]divine intervention is determined by the tension[roman type])."

The staging area of Arena of the Gods is Arena of the Gods.
The Arena of the Gods is faction-imposing.
The Arena of the Gods is challenged-group-inviting.

The godfight pedestal is an enterable supporter and scenery in the Hall of Gods. Understand "pedestal" and "empty pedestal" and "platform" as the godfight pedestal.

Godfightname1 is a text that varies.
Godfightname2 is a text that varies.


To decide which text is the random fight text:
	Let L be a list of objects;
	repeat with g running through gods:
		if (the player does not worship g) and (there is a monster incarnating g):
			add the monsteravatar of g to L;
	sort L in random order;
	now Godfightname1 is the printed name of entry 1 of L;
	now Godfightname2 is the printed name of entry 2 of L;
	let z be a text;
	now z is "[Godfightname1] triumphing over [Godfightname2]";
	decide on z.
	
Section - Incarnating 

Incarnating relates one monster (called the monsteravatar) to one god. The verb to incarnate (he incarnates, they incarnate, he incarnated, it is incarnated, it is incarnating) implies the incarnating relation.

The Healer of Aite incarnates Aite.
Israfel incarnates Sul.
Drakul incarnates Chton.

Section - Choosing an avatar

Chosenname is a text that varies.
Chosenlijst is a list of monsters that varies.
Godlijst is a list of texts that varies.

The challenged god is an object that varies.

ChosenFighting is an action applying to nothing.

Instead of entering the godfight pedestal:
	try ChosenFighting instead.

Check ChosenFighting (this is the how did we find the pedestal rule):
	if the location is not Hall of Gods:
		take no time;
		say "ERROR: The player should never be able to ChosenFight here.";
		stop the action.

Check ChosenFighting (this is the can't ChosenFight twice rule):
	if the Arena of the Gods is conquered:
		take no time;
		say "You have already fought for the honour of [the patron of the player]!  [It-they] [is-are]n't willing to sit through another fight again.";
		stop the action.	

Check ChosenFighting (this is the must be religious to fight gods rule):
	if the player does not worship a god:
		let x be a random number between 3 and 7;
		decrease the health of the player by x;
		say "A roaring voice answers your call: 'YOU CANNOT DEFEND ANY RELIGION YOU MIGHT WORSHIP AT THIS HOLY PLACE, INFIDEL!' A ball of lightning shoots from the sky, doing [x] damage to you!";
		if the health of the player is less than 1:
			end the story saying "The Gods do not appreciate nonbelievers. The divine ball of lightning deprives you of your life.";
		stop the action.

Carry out ChosenFighting:
	take no time;
	now Chosenlijst is {};
	now Godlijst is {};
	now current question is  "The Chosen One of which god do you wish to fight? (Please enter a number):";
	repeat with Godnaam running through gods:
		unless player worships Godnaam:
			if an alive off-stage monster incarnates Godnaam:
				add (monsteravatar of Godnaam) to Chosenlijst;
				add printed name of Godnaam to Godlijst;
	add "do not fight a Chosen One" to Godlijst;
	now current question menu is Godlijst;
	ask a closed question, in menu mode;
		
A menu question rule (this is the ChosenFighting rule):
	if the current question is "The Chosen One of which god do you wish to fight? (Please enter a number):":
		let n be the number of entries in Godlijst;
		let m be the number understood;
		if m > 0:
			if m < n:
				have the player and entry m of Chosenlijst fight in Arena of the Gods;
			otherwise if m is n:
				say "You decide it is best to defend the honour of your God another time...";
			exit.

Carry out challenging someone in Arena of the Gods:
	now chosenname is the printed name of the noun;
	now the challenged god is a random god incarnated by the noun.
	
Before arena arrival of Arena of the Gods:
	repeat with guy running through persons in the Arena of the Gods:
		challenge guy to fight for the challenged god;
	say "You are transported to the Arena of the Gods, where the angry ";
	if the number of people in Arena of the Gods is greater than 1:
		say "group, consisting of [list of persons in the Arena of the Gods], prepare themselves ";
	otherwise:
		say "[random person in Arena of the Gods] awaits, preparing [it-them]self"; 
	say "to fight for the honour of [the challenged god]!";

To challenge (guy - a person) to fight for (benefactor - a god):
	now faction of guy is arena-faction;
	now guy worships benefactor;
	now the favour of guy is 9;

Section - Godly intervention
[For each God, I'll be implementing some form of godly intervention here based on Victor's divine interventions
This system assumes that the divine favour of the monster is quite high and fixed; it then takes the difference 
between the monsters divine favour and the players and then checks whether the god will intervene for the monster]

Arena-turncounter is a number that varies. Arena-turncounter is -1.
OppHerm is a person that varies.
OppHermBonus is a number that varies. OppHermbonus is 0.


Every turn when (the location is the Arena of the Gods) and (the combat status is not peace):
	let m be the tension;
	now m is m times 2;
	increase m by 35;
	let x be the divine favour times 5;
	if x is greater than m:
		now m is 0;
	otherwise:
		decrease m by x;
	if a random chance of m in 100 succeeds:
		if at least one alive monster is enclosed by the Arena of the Gods:
			Let the supplicant be a random alive monster enclosed by the Arena of the Gods;
			Let the benefactor be the patron of the supplicant;
			If the benefactor is:
				-- Aite:
					have Aite intervene on behalf of the supplicant;
				-- Nomos:
					have Nomos intervene on behalf of the supplicant;
				[-- Sul: Sul's interventions are not every turn effects]
				-- Chton:
					have Chton intervene on behalf of the supplicant;
				-- Herm:
					now oppHerm is a random hostile alive person enclosed by the location;
					if Arena-turncounter is less than 0:
						now Arena-turncounter is a random number between 1 and 3;
						now oppHermBonus is a random number between 2 and 4;
						say "Suddenly, your opponent blurs and is much harder to discern in this environment!".

An attack modifier rule (this is the much harder to discern by Herm bonus rule):
	if (the Arena-turncounter is greater than 0) and (the global defender is oppHerm) and (the location is the Arena of the Gods):
		if the numbers boolean is true, say " - [oppHermBonus] (Herm's blur bonus) [run paragraph on]";
		decrease attack strength by oppHermBonus;
		decrease Arena-turncounter by 1.

Section - Faction interactions

After changing form to an undead player form when the challenged god is Chton:
	Let the opponent be a random alive arena-faction person who worships Chton; [Drakul]
	say "You turn into a [form-name of current form], but your opponent do[es of the opponent]n't care that you're undead. [It-they of the opponent] fight[s] on for the honour of Chton!";

[handle summoning here too?]

Section - Awarding divine power 

An absorption stopping rule (this is the alternative award at the Arena of the Gods rule):
	if the location is the Arena of the Gods:
		rule succeeds.

Section - Getting out of the Arena

For arena exit of Arena of the Gods:
	say "Your God grants you 2 divine favour!";
	raise the favour of the player by 2;
	say "You are [bold type]transported back[roman type] to the Hall of Gods.";
	remove the godfight pedestal from play;
	now the challenged god is nothing.

Kerkerkruip Events and Specials ends here.
