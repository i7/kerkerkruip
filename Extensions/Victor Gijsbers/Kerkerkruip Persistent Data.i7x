Kerkerkruip Persistent Data by Victor Gijsbers begins here.

Use authorial modesty.

[ Kerkerkruip doesn't preserve much data between play throughs, but it's important that the data it does preserve be reliably stored for future play throughs, including for new versions of Kerkerkruip. This file contains the code to manage the persistent data.

Monster statistics are however mangaged in the Monsters extension. ]

Chapter - General data storage

[ We store data in a table (and file). Both keys and values are integers. Keys can be skipped freely.

The table length should be longer than we need in order to have a buffer in case the player decides to go back to an older version.

Data entries (careful, may not be up to date!):
	1: total victories count
	2: current difficulty level
	3: highest level achieved
	4: victories count for the purpose of unlocking content
	5: main menu graphics desired (1 = yes, -1 = no) [code in Kerkerkruip Glimmr Additions.i7x]
	6: session flag [code in Kerkerkruip Glimmr Additions.i7x]
]

The File of Data Storage is called "KerkerkruipStorage".
The File of Legacy Storage is called "KerkerkruipData".

Table of Data Storage
key (number)	value (number)
--	--
with 14 blank rows

Table of Victories
Victories	Level	Best-Level
0	0	0

Before showing the title screen (this is the load the file of data storage rule):
	if File of Data Storage exists:
		read File Of Data Storage into the Table of Data Storage;
	otherwise if File of Legacy Storage exists:
		read File Of Legacy Storage into the Table of Victories;
		choose row 1 in Table of Victories;
		set data value 1 to the Victories entry, table only;
		set data value 2 to the Level entry, table only;
		set data value 3 to the Best-Level entry, table only;
		set data value 4 to the Victories entry;

To decide which number is data value (X - a number):
	if there is a key of X in the Table of Data Storage:
		choose row with a key of X in the Table of Data Storage;
		decide on the value entry;
	otherwise:
		decide on 0;

To set data value (X - a number) to (Y - a number), table only (this is data-value setting):
	if there is a key of X in the Table of Data Storage:
		choose row with a key of X in the Table of Data Storage;
	otherwise:
		choose a blank row in the Table of Data Storage;
		now the key entry is X;
	now the value entry is Y;
	if not table only:
		write File of Data Storage from Table of Data Storage;



Chapter - Achievements

The File Of Achievements is called "KerkerkruipAchievements".

An achievement is a kind of value. Some achievements are defined by the Table of Achievements.

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
(an achievement)	(number)
with 20 blank rows [ Include some buffer rows in case the player goes back to an old version ]

Before showing the title screen (this is the load achievements rule):
	if File of Achievements exists:
		read File Of Achievements into the Table of Held Achievements;

To award achievement (current achievement - an achievement):
	if there is a held achievement of current achievement in the Table of Held Achievements:
		choose row with a held achievement of current achievement in the Table of Held Achievements;
	otherwise:
		choose a blank row in the Table of Held Achievements;
		now the held achievement entry is current achievement;
	if there is no held difficulty entry or the held difficulty entry is less than the difficulty:
		now held difficulty entry is difficulty;
		say "[line break]You have been awarded the [bold type][current achievement][roman type] achievement!";
		write File of Achievements from Table of Held Achievements;



[The first achievements are in the Systems / powers code.]

Section - Mageslayer

Before printing the player's obituary (this is the award Mageslayer achievement rule):
	if the player is victorious:
		unless Malygris is alive:
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



Kerkerkruip Persistent Data ends here.