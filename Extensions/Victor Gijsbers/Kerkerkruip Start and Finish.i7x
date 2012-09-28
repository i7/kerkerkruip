Kerkerkruip Start and Finish by Victor Gijsbers begins here.

Use authorial modesty.


Chapter - Wins and difficulty

Section - Setting up the File of Victories

The File Of Victories is called "KerkerkruipData".

Table of Victories
Victories	Streak	Best-Streak[	Is-Save]
0	0	0[	0]

The number-of-victories is a number that varies.
The winning-streak is a number that varies.
The best-winning-streak is a number that varies.
[The Is-Save is a number that varies.]
The difficulty is a number that varies.

Section - Reading in the File of Victories

First when play begins:
	if File of Victories exists:
		read File Of Victories into Table of Victories;
	choose row 1 in the Table of Victories;
	now number-of-victories is the Victories entry;
	now winning-streak is the Streak entry;
	now best-winning-streak is the Best-Streak entry;
	now difficulty is winning-streak + 1;
[	now Is-Save is Is-Save entry;]
	if number-of-victories is 0:
		decrease difficulty by 1;
	set up initial scores for the player;
	apply the difficulty;
	if File of Achievements exists:
		read File of Achievements into Table of Held Achievements;
	update the achievements;
	write out the file of victories without reset.

Section - Writing out the File of Victories

To write out the file of victories:
	if the player is victorious:
		increase number-of-victories by 1;
		unless number-of-victories is 1:
			increase winning-streak by 1; [We want to go from easy to normal difficulty.]
		otherwise:
			say "[paragraph break][bold type]You have defeated Malygris on easy mode, proving that you understand the basics of the game! Next time, Kerkerkruip will start in normal mode. From now on, new items, monsters and locations will be available; and the game will start tracking your winning streak and will scale the difficulty accordingly. Have fun![roman type][paragraph break]";
		if winning-streak is greater than best-winning-streak:
			now best-winning-streak is winning-streak;
	otherwise:
		now winning-streak is 0;
	choose row 1 in the Table of Victories;
	now the Victories entry is number-of-victories;
	now the Streak entry is winning-streak;
	now the Best-Streak entry is best-winning-streak;
	write File of Victories from Table of Victories;
	write File of Achievements from Table of Held Achievements.

To write out the file of victories without reset:
	choose row 1 in the Table of Victories;
	now the Victories entry is number-of-victories;
	now the Streak entry is winning-streak;
	now the Best-Streak entry is best-winning-streak;
	write File of Victories from Table of Victories;
	write File of Achievements from Table of Held Achievements.


Section - Restarting resets the winning streak

First carry out restarting the game (this is the reset streak on restart rule):
	unless player is victorious:
		now winning-streak is 0;
		choose row 1 in the Table of Victories;
		now the Victories entry is number-of-victories;
		now the Streak entry is winning-streak;
		now the Best-Streak entry is best-winning-streak;
		write File of Victories from Table of Victories;
		write File of Achievements from Table of Held Achievements.


[Section - Permadeath additions and replacements

The standard suicide rule is not listed in any rulebook.

A suicide rule (this is the custom suicide rule):
	say "Do you wish to commit suicide? (You will [bold type]not[roman type] be able to continue with this character, even if you have saved the game earlier.) ";
	if player consents:
		write out the file of victories;
		permanently kill the player;
		rule succeeds;
	otherwise:
		rule fails.

The permadeath report saving rule is not listed in any rulebook.

Report saving the game (this is the alternative permadeath report saving rule):
	if save-failed is false:
		consider the safe saving allowed rules;
		if rule failed:		
			if File of Adventurers exists:
				read File Of Adventurers into Table of Adventurers;
				repeat through the Table of Adventurers:
					if the ID-1 entry is First ID and the ID-2 entry is Second ID and the ID-3 entry is Third ID:
						if the Saving-state entry is 1: [this means we are saving]
							now the Saving-state entry is 0;
							write File Of Adventurers from the Table of Adventurers;
							try fast restarting;
						otherwise: [this means we are restoring]
							if the Save-ID entry is 0:
								consider the killed-before rules;
							otherwise if Unique-save-ID is not Save-ID entry:
								consider the wrong Save-ID rules;
							otherwise:
								clear the screen;
								try looking;
			otherwise:
				consider the missing-adventurer rules.

Fast restarting is an action out of world.

Carry out fast restarting (this is the standard carry out fast restarting rule):
	consider the immediately restart the VM rule.

The standard killed before rule is not listed in any rulebook.

A killed-before rule (this is the custom killed before rule):
	say "This character is already dead.";
	wait for any key;
	consider the immediately restart the VM rule.

The standard missing adventurer rule is not listed in any rulebook.

A missing-adventurer rule (this is the custom missing adventurer rule):
	say "A vital file appears to be missing!";
	wait for any key;	
	consider the immediately restart the VM rule.

The standard wrong Save-ID rule is not listed in any rulebook.

A wrong Save-ID rule (this is the custom wrong Save-ID rule):
	say "This save game is too far in the past.";
	wait for any key;	
	consider the immediately restart the VM rule.

]

Section - Applying the difficulty

To apply the difficulty:
	if the difficulty is 0:
		increase health of the player by 5;
		increase permanent health of the player by 5;
		increase melee of the player by 1;
		increase defence of the player by 1;
	if the difficulty is 1:
		increase health of the player by 2;
		increase permanent health of the player by 2;
	let k be 7 + difficulty;
	repeat with guy running through monsters:
		now health of guy is k times health of guy;
		now health of guy is health of guy divided by 10;
	if difficulty is greater than 1:
		let n be difficulty - 1;
		repeat with guy running through monsters:
			repeat with i running from 1 to n:
				buff guy.
			
To buff (guy - a person):
	let m be a random number between 1 and 5;
	if m is 1:
		increase melee of guy by 1;
	if m is 2:
		increase defence of guy by 1;
	if m is 3:
		increase body score of guy by 1;
	if m is 4:	
		increase mind score of guy by 1;
	if m is 5:	
		increase spirit score of guy by 1.


Chapter - Setting up initial scores for the player

To set up initial scores for the player:
	now permanent health of the player is 13;
	now melee of the player is 1;
	now defence of the player is 7;
	now body score of the player is 5;
	now mind score of the player is 5;
	now spirit score of the player is 5;
	give the player a stat bonus;
	give the player a stat bonus;
	give the player a stat penalty;
	restore the health of the player.

To give the player a stat bonus:
	let i be a random number between 1 and 4;
	if i is 1:
		increase permanent health of the player by 1;
	if i is 2:
		increase body score of the player by 1;
	if i is 3:
		increase mind score of the player by 1;
	if i is 4:
		increase spirit score of the player by 1.

To give the player a stat penalty:
	let i be a random number between 1 and 4;
	if i is 1:
		decrease permanent health of the player by 1;
	if i is 2:
		decrease body score of the player by 1;
	if i is 3:
		decrease mind score of the player by 1;
	if i is 4:
		decrease spirit score of the player by 1.


Chapter - Start and Finish



Section - Start

Started boolean is a truth state that varies. Started boolean is false.

Last when play begins (this is the introduction rule):
	say "[paragraph break]When you claimed that you were tough enough to take on Malygris single-handedly, everyone knew you had been drinking much more than was good for you. And the prince is not one to let an opportunity pass. Before you could so much as protest, his court mage opened a portal and you were shoved through. Predictably, the portal immediately disappeared. You doubt they're going to open it up again -- but at least you can try to make good on your boast and kill Malygris, the Wizard of Kerkerkruip!";
	now started boolean is true. [See right below here, in the definition of "victorious".]

Section - Victory message

The victory message rules are a rulebook.

To decide whether the player is victorious:
	if started boolean is false:
		decide no;
	let counter be 0;
	repeat with guy running through alive not off-stage monsters:
		if the level of guy is 5:
			now counter is 1;
	if counter is 0:
		decide yes;
	decide no.

Every turn (this is the victory rule):
	if the player is victorious:
		consider the victory message rules.
		
Last victory message rule (this is the normal victory message rule):		
	end the story saying "You have defeated Malygris! With his immense magical powers now at your disposal, it is time to teleport back to Montenoir and pay a little visit to the prince.";
	rule succeeds.

Victory message rule (this is the Nameless Horror message rule):
	if the Nameless Horror is follower:		
		end the story saying "You have won... technically. The Nameless Horror will find you soon, and you end will not be pretty.";
		rule succeeds.
	
To do the level 10 victory with (guy - a person):
	say "In slaying [the guy], you have done the impossible. You absorb its soul, and though this process leaves little of your own personality intact, your powers increase a thousandfold. Even the gods bow to you.";
	end the story saying "You reign eternally!".
	

Section - Death message

Every turn (this is the player death rule):
	if the player is dead:
		unless the global attacker is the player:
			end the story saying "You were killed by [the name of the global attacker]";
		otherwise:
			end the story saying "You committed suicide. How unseemly!".

Section - What happens after the obituary

After printing the player's obituary:
	write out the file of victories;
	consider the unlock stuff rule.


This is the unlock stuff rule:
	let X be a list of objects; [We cannot repeat through objects, so:]
	repeat with Y running through rooms:
		if unlock level of Y is number-of-victories:
			if unlock hidden switch of Y is not true:
				add Y to X;
	repeat with Y running through persons:
		if unlock level of Y is number-of-victories:
			if unlock hidden switch of Y is not true:		
				add Y to X;
	repeat with Y running through things:
		if Y is not a person:
			if unlock level of Y is number-of-victories:
				if unlock hidden switch of Y is not true:			
					add Y to X;
	if X is not empty:
		say "You have [bold type]unlocked[roman type] new content:[paragraph break]";
		repeat with item running through X:
			say "* [the item] ([unlock text of item])[line break]";
		say "[line break]".

When play begins: 
	choose row with a final response rule of immediately restore saved game rule in the Table of Final Question Options; 
	blank out the final question wording entry;
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options; 
	blank out the final question wording entry. 


Chapter - Doing a reset

To do the reset:
	choose row 1 in the Table of Victories;
	now the Victories entry is 0;
	now the Streak entry is 0;
	now the Best-Streak entry is 0;
	write File of Victories from Table of Victories;
	now number-of-victories is 0;
	now winning-streak is 0;
	now best-winning-streak is 0;
	now difficulty is 0.

To do the achievement reset:
	repeat through Table of Held Achievements:
		now held difficulty entry is -1;
	write File of Achievements from Table of Held Achievements.	


Chapter - Introduction Menu

[Much of this code has been stolen from Jon Ingold's Title Page.]

Figure opening figure is the file "smallercover.jpg".

The first when play begins rule (this is the title screen rule):
	while 1 is 1:
		clear the screen;
		redraw status line;
		say paragraph break;		
		if Glulx graphics is supported:
			display figure opening figure[ centered];
		otherwise:
			say "[bold type]Kerkerkruip[roman type] -- by Victor Gijsbers";
		say paragraph break;			
		say fixed letter spacing;		
		[say "'[story title]' by [story author]";
		say paragraph break;]
		say " SCORES:[line break]";
		say "   Your total victories         : [unless number-of-victories is greater than 9] [end if][unless number-of-victories is greater than 99] [end if]    [number-of-victories][line break]";
		say "   Your current winning streak  :    [unless winning-streak is greater than 9] [end if][unless winning-streak is greater than 99] [end if] [winning-streak][line break]";
		say "   Your best winning streak     :  [unless best-winning-streak is greater than 9] [end if][unless best-winning-streak is greater than 99] [end if]   [best-winning-streak][paragraph break]";
		say "   Current difficulty           :  [difficulty level difficulty] (level [difficulty])";
		say line break;
		say paragraph break;
		say " OPTIONS:[line break]";
		say "   [if the file of save data exists]Continue the game[otherwise]Start a new game [end if]            :    (SPACE)[line break]";
		if the file of save data exists:
			say "   Start a new game             :       S[line break]";
		if difficulty is 0:
			say "   Skip to Normal difficulty    :       N[line break]";	
		say "   Display help menu            :       M[line break]";
		say "   Reset victories              :       R[line break]";
		say "   Quit                         :       Q[line break]";  
		say variable letter spacing;
		let redraw be 0;
		while redraw is 0:
			let k be the chosen letter;
			[ Space/Enter: continue ]
			if k is 32 or k is -6:
				clear the screen; 
				make no decision;
			[ S: Start a new game ]
			otherwise if k is 115 or k is 83:
				delete file of save data;
				clear the screen;
				make no decision;	
			[ N: go to normal difficult ]	
			otherwise if (k is 110 or k is 78) and difficulty is 0:
				now number-of-victories is 1;
				now difficulty is 1;
				write out the file of victories without reset;
				set up initial scores for the player;
				apply the difficulty;
				delete file of save data;
				clear the screen; 
				make no decision;
			[ Q: quit ]
			otherwise if k is 113 or k is 81:
				stop game abruptly;
			[ R: reset]
			otherwise if k is 114 or k is 82:
				now the current menu is Table of Reset Menu;
				carry out the displaying activity;
				now redraw is 1;
			[ M: menu ]
			otherwise if k is 109 or k is 77:
				now the current menu is Table of Kerkerkruip Help;
				carry out the displaying activity;
				now redraw is 1;

To say difficulty level (m - a number):
	if m is 0:
		say "EASY[run paragraph on]";
	if m is 1:
		say "NORMAL[run paragraph on]";
	if m is 2:
		say "HARD[run paragraph on]";
	if m is 3:
		say "VERY HARD[run paragraph on]";
	if m is 4:
		say "NIGHTMARE[run paragraph on]";
	if m is 5:
		say "INSANE[run paragraph on]";
	if m is 6:
		say "HELL[run paragraph on]";
	if m is 7:
		say "BEYOND HELL[run paragraph on]";
	if m is greater than 7:
		say "IMPOSSIBLE[run paragraph on]".


Chapter - Reset Menu

Table of Reset Menu
title		subtable		description		toggle 
"No, do not reset the number of victories."		--	--	quit rule
"Yes, I am sure: reset the number of victories."	--	--	the resetting rule
"Please reset the achievements list instead."	--	--	the achievement resetting rule

This is the resetting rule:
	do the reset;
	consider the quit rule.

This is the achievement resetting rule:
	do the achievement reset;
	consider the quit rule.




Chapter - Achievements

The File Of Achievements is called "KerkerkruipAchievements".

Achievement is a kind of value. Some achievements are defined by the Table of Achievements.

Table of Achievements
achievement
Assistant dungeoneer
Adventurer
Hunter
Destroyer
Mageslayer
Deathblow
I return to serve
From the shadows I come
Stunning performance
Detox
Injury to insult
Unmoved
Nature's fragile vessel
Durin's bane

Table of Held Achievements
held achievement	held difficulty
(an achievement)	(a number)
with 14 blank rows

To update the achievements:
	repeat through Table of Achievements:
		let current achievement be the achievement entry;
		unless there is a held achievement of current achievement in the Table of Held Achievements:
			choose a blank row in the Table of Held Achievements;
			now held achievement entry is current achievement;
			now held difficulty entry is -1.


Table of Achievement Menu
title	subtable	description	toggle
"Assistant Dungeoneer    [achievement assistant dungeoneer]"	--	"Kill a level 1 creature."
"Adventurer              [achievement adventurer]"	--	"Kill a level 2 creature."
"Hunter                  [achievement hunter]"	--	"Kill a level 3 creature."
"Destroyer               [achievement destroyer]"	--	"Kill a level 4 creature."
"Mageslayer              [achievement mageslayer]"	--	"Kill Malygris, the wizard of Kerkerkruip."
"Deathblow               [achievement deathblow]"	--	"Deal at least 20 damage with a single blow."
"I return to serve       [achievement I return to serve]"	--	"Have an undead creature that is allied to you kill someone."
"From the shadows I come [achievement From the shadows I come]"	--	"Kill an enemy at full health with one hit, while striking from the shadows."
"Stunning performance    [achievement Stunning performance]"	--	"Stun three different creatures in a single game."
"Detox                   [achievement detox]"	--	"Win the game without using ment."
"Injury to insult        [achievement injury to insult]"	--	"Kill Malygris with your bare hands."
"Unmoved                 [achievement unmoved]"	--	"Win the game without using 'dodge' and 'parry'."
"Nature's fragile vessel [achievement nature's fragile vessel]"	--	"Win the game with less than 15 maximum health."
"Durin's bane            [achievement durin's bane]"	--	"Wake up an unbeatable foe."

To say achievement (current achievement - an achievement):
	if there is a held achievement of current achievement in the Table of Held Achievements:
		choose row with a held achievement of current achievement in the Table of Held Achievements;
		let m be held difficulty entry;
		if m is -1:
			say " -- not yet achieved";
		otherwise:
			say " -- achieved on [difficulty level m] ([m])";
	otherwise:
		say " -- not yet achieved".

To award achievement (current achievement - an achievement):
	if there is a held achievement of current achievement in the Table of Held Achievements:
		choose row with a held achievement of current achievement in the Table of Held Achievements;
		if held difficulty entry is less than difficulty:
			now held difficulty entry is difficulty;
			say "[line break]You have been awarded the [bold type][current achievement][roman type] achievement!".

[The first achievements are in the Systems / powers code.]

Section - Mageslayer

Before printing the player's obituary (this is the award Mageslayer achievement rule):
	if the player is victorious:
		award achievement Mageslayer.

Section - Deathblow

Last aftereffects rule (this is the award Deathblow achievement rule):
	if global attacker is player and the attack damage is greater than 19:
		award achievement Deathblow.

Section - I return to serve

Killing rule (this is the award I return to serve achievement rule):
	if killer-guy is undead and the player is undead and killer-guy is not the player:
		award achievement I return to serve.

Section - From the shadows I come

From-the-shadows boolean is a truth state that varies. From-the-shadows boolean is false.

First carry out a hidden pc hitting (this is the set up from the shadows I come rule):
	if health of the global defender is not less than permanent health of the global defender:
		now from-the-shadows boolean is true.

Last aftereffects rule (this is the award from the shadows achievement rule):
	if from-the-shadows boolean is true:
		if global defender is dead:
			award achievement From the shadows I come;
		now from-the-shadows boolean is false.

Section - Stunning performance

[Handled by the Miranda code in Kerkerkruip Monsters.]

Section - Detox

Before printing the player's obituary (this is the award Detox achievement rule):
	if the player is victorious:
		if ment addiction is 0:
			award achievement Detox.
			
Section - Injury to insult

Last aftereffects rule (this is the award injury to insult achievement rule):
	if global attacker is the player and global defender is Malygris:
		if Malygris is dead and global attacker weapon is a natural weapon:
			award achievement Injury to insult.

Section - Unmoved

The unmoved boolean is a truth state that varies. The unmoved boolean is true.

Carry out dodging:
	now the unmoved boolean is false.

Carry out parrying:
	now the unmoved boolean is false.

Before printing the player's obituary (this is the award Unmoved achievement rule):
	if the player is victorious:
		if unmoved boolean is true:
			award achievement Unmoved.

Section - Nature's fragile vessel

Before printing the player's obituary (this is the award fragile vessel achievement rule):
	if the player is victorious:
		if permanent health of the player is less than 15:
			award achievement Nature's fragile vessel.

Section - Durin's bane

[Handled by the Nameless Horror code in Kerkerkruip Monsters.]

Kerkerkruip Start and Finish ends here.

Section - Achievements Menu

Achievemenuing is an action out of world.

Understand "achieve" and "achievements" as achievemenuing.

Carry out achievemenuing:
	now the current menu is the Table of Achievement Menu;
	carry out the displaying activity;
	clear the screen;
	try looking;