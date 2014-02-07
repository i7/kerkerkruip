Kerkerkruip Persistent Data by Victor Gijsbers begins here.

Use authorial modesty.

[ Kerkerkruip doesn't preserve much data between play throughs, but it's important that the data it does preserve be reliably stored for future play throughs, including for new versions of Kerkerkruip. This file contains the code to manage the persistent data.

Monster statistics are however mangaged in the Monsters extension. ]

Chapter - General data storage

[ We store data in a table (and file). Both keys and values are integers. Keys can be skipped freely.

The table length should be longer than we need in order to have a buffer in case the player decides to go back to an older version.]

Section - Loading Data Values

The File of Data Storage is called "KerkerkruipStorage".
The File of Legacy Storage is called "KerkerkruipData".

Before showing the title screen (this is the load the file of data storage rule):
	if File of Data Storage exists:
		read File Of Data Storage into the Table of Data Storage;
	otherwise if File of Legacy Storage exists:
		read File Of Legacy Storage into the Table of Victories;
		choose row 1 in Table of Victories;
		set total victories to the Victories entry, table only;
		set current difficulty to the Level entry, table only;
		set highest achieved difficulty to the Best-Level entry, table only;
		set unlocking victories to the Victories entry;

To save data storage:
	write File of Data Storage from Table of Data Storage;

Section - Low-level Access to Data Values

Table of Data Storage
key (number)	value (number)
--	--
with 14 blank rows

Table of Victories
Victories	Level	Best-Level
0	0	0

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
		save data storage;

Section - Accessing Data Values

data storage parameter is a kind of value. The data storage parameters are defined by the Table of Data Value Labels.

A data storage parameter has a number called enabled value. A data storage parameter has a number called disabled value. A data storage parameter has a number called data value index.

Table of Data Value Labels
data storage parameter	data value index	enabled value	disabled value
total victories	1	1	0
current difficulty	2	1	0
highest achieved difficulty	3	1	0
unlocking victories [victories for the purpose of unlocking]	4	1	0
main menu graphics	5	1	-1
session flag	6	1	0
window panels	7	0	1
menu hyperlinks	8	1	-1
sound	9	1	-1

To decide which number is (P - a data storage parameter) as a number: (- {P} -);

To decide which number is the/-- number/setting of (P - a data storage parameter):
	decide on data value (P as a number);

To decide whether (P - a data storage parameter) is/are unset:
	if disabled value of P is 0 or enabled value of P is 0, no;
	Decide on whether or not number of P is 0;

To decide whether (P - a data storage parameter) is/are enabled:
	decide on whether or not number of P is enabled value of P;

To decide whether (P - a data storage parameter) is/are disabled:
	decide on whether or not number of P is disabled value of P;

To increase the/-- (param - a data storage parameter) by (N - a number), table only:
	if table only:
		set param to (number of param) + N, table only;
	otherwise:
		set param to (number of param) + N;

To set the/-- (param - a data storage parameter) to (N - a number), table only:
	let P be param as a number;
	if table only:
		set data value P to N, table only;
	otherwise:
		set data value P to N;

To enable (param - a data storage parameter), table only:
	if table only:
		set param to enabled value of param, table only;
	otherwise:
		set param to enabled value of param;

To disable (param - a data storage parameter), table only:
	if table only:
		set param to disabled value of param, table only;
	otherwise:
		set param to disabled value of param;

To toggle (param - a data storage parameter), table only:
	if param is enabled:
		if table only:
			disable param, table only;
		otherwise:
			disable param;
	otherwise:
		if table only:
			enable param, table only;
		otherwise:
			enable param;

Chapter - Achievements

Section - File of Achievements

The File Of Achievements is called "KerkerkruipAchievements".

Before showing the title screen (this is the load achievements rule):
	if File of Achievements exists:
		read File Of Achievements into the Table of Held Achievements;

Section - Table of Achievements

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
Make love not war
Twice fallen
Give them blood
Royal fruit
Sixth heaven

Table of Held Achievements
held achievement	held difficulty
(an achievement)	(number)
with 20 blank rows [ Include some buffer rows in case the player goes back to an old version ]

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

[Section - Unmoved

The unmoved boolean is a truth state that varies. The unmoved boolean is true.

Carry out dodging:
	now the unmoved boolean is false.

Carry out parrying:
	now the unmoved boolean is false.

Before printing the player's obituary (this is the award Unmoved achievement rule):
	if the player is victorious:
		if unmoved boolean is true:
			award achievement Unmoved.]

Section - Nature's fragile vessel

Before printing the player's obituary (this is the award fragile vessel achievement rule):
	if the player is victorious:
		if permanent health of the player is less than 15:
			award achievement Nature's fragile vessel.

Section - Durin's bane

[Handled by the Nameless Horror code in Kerkerkruip Monsters.]

Section - Make love not war

[Handled by the Malygris code in Kerkerkruip Monsters]

Section - Twice fallen

[Handled by Arena of the Fallen code in Kerkerkruip Location]

Section - Gallons of the stuff

[Handled by blood magic code in Kerkerkruip Systems]

Section - Royal fruit

[Handled by Bodmall code in Kerkerkruip Monsters]

Section - Sixth Heaven

[Handled by ment code in Kerkerkruip Items]




Kerkerkruip Persistent Data ends here.