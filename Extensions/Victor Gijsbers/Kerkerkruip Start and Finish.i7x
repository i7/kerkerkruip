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

When play begins (this is the set gender rule):
	if a random chance of 1 in 2 succeeds:
		now the player is male;
	otherwise:
		now the player is female.




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
			unless guy is player-enslaved:
				now counter is 1;
	if counter is 0:
		decide yes;
	if Malygris-lover is true:
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
		end the story saying "You have won... technically. The Nameless Horror will find you soon, and your end will not be pretty.";
		rule succeeds.

Victory message rule (this is the enslaved Malygris message rule):
	if Malygris is player-enslaved:		
		end the story saying "You have turned Malygris into your slave!";
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
	if the player is victorious:
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
		say "You have [bold type]unlocked[roman type] new content:[line break][run paragraph on]";
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
			[ R: rest]
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

Chapter - The asking for help action (for use without Basic Help Menu by Emily Short)

Asking for help is an action out of world.
Understand "help" or "hint" or "hints" or "about" or "info" as asking for help.
Carry out asking for help (this is the help request rule): do nothing.

Chapter - Help Menu

Understand "menu" as asking for help.

The help request rule is not listed in any rulebook.

Carry out asking for help:
	now the current menu is the Table of Kerkerkruip Help;
	carry out the displaying activity;
	clear the screen;
	try looking;
	stop the action.
	
Table of Kerkerkruip Help
title	subtable	description	toggle 
"Players new to Interactive Fiction"	Table of Newest Player Help		--
"Players new to Kerkerkruip"	Table of New Player Help	--
"Advanced concepts"	Table of Advanced Help	--
"Powers"			Table of Power Help	--
"Achievements"	Table of Achievement Menu	--
["System requirements"	--	"[system requirements text]"]
"Original credits"	--	"[original credits text]"
"Current credits"	--	"[current credits text]"
"Copyright"	--	"[copyright text]"
"Contact"	--	"[contact text]"

Table of Newest Player Help
title	subtable	description	toggle 
"Interactive Fiction basics"	--	"In [italic type]Kerkerkruip[roman type], you play the protagonist of a story which the computer tells to you in English prose (with some numbers added in the combat sequences). You make the protagonist do what you want by giving short English commands. For instance, the computer might say:[paragraph break][italic type]You can see a sword here.[roman type][paragraph break]A command prompt '>' will then appear, at which you might type the command:[paragraph break][italic type]> take sword[roman type][paragraph break]To which the computer will reply:[paragraph break][italic type]Taken.[roman type][paragraph break]The protagonist now possesses the sword. In this way, you will be able to move around the dungeon, examine, take, and drop things, attack monsters, and do many other things. The rest of this section of the help menu will introduce you to the standard interactive fiction commands. These will allows you to move around the game world, though if you want to have any success in combat, you will also need to read the part of the help menu that is about the specific [italic type]Kerkerkruip[roman type] commands."
"Looking and examining"	--	"Two of the most basic commands are 'look' and 'examine'. By typing 'look', you will get a description of the room you are currently in. By typing 'examine' and then the name of an object, you will get a description of that specific object. So typing 'examine sword' will give you a description of the sword, while typing 'examine me' will give you a description of yourself, the player character.[paragraph break]These commands can also be abbreviated: 'l' will work instead of 'look', while 'x sword' means that same as 'examine sword'."
"Moving around"	--	"The world is divided into rooms, and you will want to move from one room to the other. You can do this using the command 'go', followed by a direction. The six directions are north, south, west, east, up and down, so you might type 'go south' to move south.[paragraph break]The directions can be abbreviated to their first letter (n, s, w, e, u, d), and you can also drop the word 'go'. So the commands 'go south', 'go s', and 's' are all equivalent."
"Picking up stuff"	--	"You will want to interact with things in the dungeon. The most basic actions are taking and dropping stuff. Type 'take sword' to pick up the sword, and type 'drop sword' to drop it to the ground again. You can also take or drop multiple items, for instance with 'drop all' or 'take all scrolls'.[paragraph break]If at any time you want to see a list of what you are carrying, type 'inventory'. This last command, which is very useful, can also be abbreviated to 'i'."
"More advanced interactions"	--	"You'll be able to interact with some items in more specific ways. Here are a couple of commands that you will want to be aware of:[paragraph break]'wear', as in 'wear boots'[line break]'remove', as in 'remove boots'[line break]'open', as in 'open chest'[line break]'close', as in 'close chest'[line break]'lock', as in 'lock chest'[line break]'unlock', as in 'unlock chest'[line break]'eat', as in 'eat apple'[line break]'drink', as in 'drink wine'[line break]'read', as in 'read book'[line break]'put in', as in 'put sword in forge'[line break]'turn on', as in 'turn on machine'[line break]'turn off', as in 'turn off machine'[paragraph break]In general, if something seems the most obvious way to use an item, that command will probably work. If you can't figure out how to use an item, examining it may sometimes give a hint. ([italic type]Kerkerkruip[roman type] has been designed to rely on obvious or clearly clued commands only.)[paragraph break]All the commands previously listed are common interactive fiction commands. There is also a set of special commands used in [italic type]Kerkerkruip[roman type] that you will find described in a different section of the help menu."
"Is this information available out-of-game?"	--	"Of course. You might be interested in the reference card that can be found here: http://eblong.com/zarf/if.html"

Table of New Player Help
title	subtable	description	toggle 
"Instruction video and Beginner's Guide"	--	"You are of course free to read this manual, but if you're just looking to dive into [italic type]Kerkerkruip[roman type], you might prefer watching the series of short instruction videos or reading the 3-page Beginner's Guide. You can find everything you need at http://www.ifarchive.org/if-archive/games/competition2011/glulx/kerkerkruip/ ."
"What is Kerkerkruip?"	--	"[italic type]Kerkerkruip[roman type] is an interactive fiction roguelike. (You can find more information about both interactive fiction and roguelikes in the previous menu.) You will be guiding a nameless adventurer through a randomly generated dungeon, which is different every time you play. There are treasures to be found, monsters to be fought, and powers to be gained, as you attempt to defeat your ultimate opponent: Malygris, the Wizard of Kerkerkruip. Combat is handled by a powerful combat system that is explained in other parts of this manual."
"What is a roguelike?"	--	"Roguelikes are games that feature turn-based tactical combat in a randomly generated environment. In addition, death is final: if your character dies, there is no way to play on, not even by loading an earlier save. Permanent death makes for very tense games, where the stakes are high, while the random generation ensures that replaying the earlier parts of the game remains interesting. Famous roguelikes are [italic type]Nethack[roman type], [italic type]Angband[roman type], [italic type]Ancient Domains of Mystery[roman type] and [italic type]Dungeon Crawl Stone Soup[roman type]. Among mainstream games, [italic type]Diablo 2[roman type] played on hardcore mode (which is the only mode that features permanent death) comes quite close to being a roguelike, although it is not turn-based."
"Introduction to the combat system"	--	"Combat is a large part of [italic type]Kerkerkruip[roman type], so it is important to understand the basic concepts and commands. Every person in the game has a certain amount of health; you can see yours in the status bar above the normal game window. If someone's health drops to 0, that person is dead. Killing your enemies is your main goal, while the enemies want to kill you. (In some special circumstances, persons in the dungeon might team up with you, or may attack each other.)[paragraph break]The most important combat command is 'attack', which can be abbreviated to 'a'. If you attack, you attempt to hit the enemy. Whether the blow hits or not is partly determined by a random number, but the circumstances play a very important role as well. The entire calculation will be shown on the screen, so if you are curious, you can always see why you hit or missed.[paragraph break]The second most important combat command is 'concentrate', which can be abbreviated to 'c'. By concentrating, you can attain three stages of concentration, which give you progressively greater bonuses on your attacks and the damage you deal. Most fights cannot be won by just attacking over and over: you need to get at least one or two levels of concentration to make your attacks effective. However, if you get damaged, you lose your concentration -- so you'll have to weigh the advantages of higher concentration against the risk of losing it.[paragraph break]There are also two defensive moves: 'dodge' and 'parry', which can be abbreviated to 'do' and 'p' respectively. These two moves are useful when you must react to an attack of your opponent - they will make you harder to hit. Common sense will generally tell you which of the two is the best. (For instance, don't try to parry a huge warhammer if you are carrying a dagger.)[paragraph break]There are many other actions you can take: you can 'retreat', try to 'pray' in a temple, use your possessions, and so on. Some of these possibilities will be explained in further sections of this help menu. But 'attack', 'concentrate', 'dodge' and 'parry' are the four essential moves."
"Retreat!"	--	"Sometimes, you will find yourself in a fight you cannot handle. To check whether this is so, you can examine the monsters -- examining is always a free action, which does not cost you a turn. When you examine a monster, you will be told its level. In general, you don't want to attack a level 2 monster until you have killed a level 1 monster; you don't want to attack a level 3 monster until you have killed a level 2 monster; and so on.[paragraph break]If you decide the fight is too difficult for you, your best option is to 'retreat'. This lets you run back to the previous room, but the monster may attack you as you run. [italic type]You get a free retreat upon entering a room for the first time:[roman type] if you don't take any actions (except actions that take no time, like examining and looking), you can retreat without fear of being attacked. Use this to scout out the dungeon around you."
"Time and initiative"	--	"Kerkerkruip is a turn-based game, but that doesn't mean everyone gets their turn in an orderly fashion. It is possible for you, or for a monster, to get two (or even more) turns in a row. This is partly decided by the random generator, but also partly by actions and events that lower or raise your initiative. For instance, if you have high concentration, you will often be able to act sooner. If you attack and miss, or if you are hit by an attack, you will often be forced to act later. Some items in the dungeon may allow you to manipulate your initiative.[paragraph break]Another thing you should realise is that not every action costs time. Examining, looking and taking inventory all take no time, and neither do the special Kerkerkruip actions 'remember' and 'status'. Most actions that end in failure (like going in a direction you cannot go) don't take time either."
"Knowing the dungeon"	--	"As in other interactive fiction, you should examine everything. This will show you the levels of monsters, which is very useful, and it may allow you to find out what items in the dungeon -- either those you pick up or those that are situated in specific rooms -- do. Again as in other interactive fiction, you should experiment: try things out, and see what happens.[paragraph break]Kerkerkruip has three very important information-related actions. First, there is 'status', which gives you an overview of your health, your attributes, any special effects that are active, and all the skills you have gained during the game. Use it often![paragraph break]Then there is 'remember', which can be abbreviated to 'r'. This very handy actions tells you a lot of things: which exits you haven't explored yet; which rooms you have visited; which monsters you have seen, and where; and it also gives you a random tip about Kerkerkruip. Use this command even more often![paragraph break]Finally, there is the command 'sense', which only becomes available when you have defeated some powerful monsters. First, it gives you an indication of the location of Malygris, the final enemy. (You'll find out why that is useful.) Later, it gives you a sense for the location of any very powerful items. Be warned, however, that you may not always be able to find those; and be warned also that sensing does take a turn.[paragraph break]Finally, and less importantly, the 'trophies' command shows you a list of defeated enemies.[paragraph break]Do not forget: 'status' and 'remember' ('r') are your friends."
"Moving around"	--	"You can just 'go' into a direction, of course, but Kerkerkruip also allows you to 'go to' a specific location you have already visited. This will move you one room nearer to that location. If you want to continue your journey, just press enter: an empty command will be read as continuing the previous go to command.[paragraph break]So if you remember that you want to kill the chain golem, say, you first type 'r' (for 'remember') to see in what room the chain golem was; and then you type 'go to Temple of Sul' or something like that, and press enter until you are there."
"Using items"	--	"Generally, it should be obvious how you can use an item; if not, examining the item will often teach you the right verb. A special case are weapons, which you must 'ready' or (equivalently) 'wield' in order to use them. You can 'wear' clothing, 'read' scrolls, 'throw' grenades, and so on. The fact that you have found an item does not mean that it is useful to you, so think carefully and observe the effects of the item on the game."
"List of special verbs"	--	"You may find the 3-page Beginner's Guide more convenient, but here is a list of some of the special verbs of Kerkerkruip. (Verbs having to do with specific objects or skills will not be given: you can look these up through examining the object, or the 'status' command.)[paragraph break]Actions that [italic type]give information[roman type]: 'status', 'remember' ('r'), 'sense', 'trophies'.[paragraph break]Actions [italic type]used in combat[roman type]: 'attack <person>' ('a'), 'concentrate' ('c'), 'parry' ('p'), 'dodge' ('do').[paragraph break]Actions that [italic type]move the player[roman type]: 'retreat', 'go to <room>'.[paragraph break]Actions that [italic type]work in specific locations[roman type]: 'pray'.[paragraph break]Actions that [italic type]allow you to use objects[roman type]: 'ready <weapon>', 'throw <grenade>', 'read <scroll>', 'wear <clothing>', 'take off <clothing>'.[paragraph break]Actions that [italic type]bring you to this or another menu[roman type]: 'help', 'achievements'."

Table of Advanced Help
title	subtable	description	toggle 
"Tension"	--	"One important circumstance influencing combat is the tension, which goes up as the fight takes longer, but decreases when a hit is scored. The current tension is always visible in the status line. Every 2 points of tension give the attacker a +1 bonus, while every 3 points of tension add +1 to the damage dealt. Thus, if the tension is 10, an attack would happen with a +5 attack bonus and a +3 damage bonus."
"Ment"	--	"You start the game with three packages of ment, a powerful but highly addictive drug. When you snort ment for the first time, you will receive a +1 attack bonus, a +1 damage bonus, a +1 defence bonus, +1 damage reduction, and a +1 bonus on any attribute checks. The second time you snort ment, your body has become more attuned to the drug, and these bonuses increase to +2; and the third time, they increase to +3. This is a huge bonus. However, your body also becomes dependent on ment, and once its effects wear off you are left with a permanent penalty equal to the bonus you just got. You can get a temporary reprieve by snorting more ment -- but you only have three packages, and can never get more. On the one hand, you should make sure that you are not left with a -3 penalty, no more ment, and a Malygris who is still in good shape. On the other hand, ment can allow you to win fights you could not otherwise win. Using this dangerous resource carefully is one of the keys to success in [italic type]Kerkerkruip[roman type]."
"Powers and levels"	--	"Every monster in the game has a level, which you can see by examining the monster. Any monster with a non-zero level will trigger a special sequence of events when it is killed: you will absorb its soul, which fully heals you, increases your statistics (maximum health, attack bonus, and so on), and grants you a special power. You can review the powers you have been granted by using the 'status' command.[paragraph break]Level 0 monsters never grant you health or powers. Some monsters form groups, and you will have to kill the entire group before the power transferal happens.[paragraph break]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body. This means that you lose the statistics bonuses and the special powers granted by those souls. For example, suppose you kill Miranda, a level 1 monster. You absorb Miranda's soul, receive some bonuses, and get the stun ability. Next, you kill the level 2 chain golem. Absorbing the chain golem's soul will immediately repel Miranda's soul; so you lose the stun ability, and the bonuses given by Miranda's soul; but you gain the lash ability and the bonuses given by the chain golem. (These bonuses are bigger, because he is a higher level monster.) Next, you kill the blood ape, a level 1 monster. Because the soul of the chain golem is of a higher level than that of the blood ape, it does not get repelled, and you receive all the blood ape bonuses and the associated power while retaining those granted by the chain golem.[paragraph break]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5. The level 5 monster is Malygris, and you win by killing him.[paragraph break]As you can see, it would be advantageous to kill a level 4 monster first, and then a level 3, a level 2 and a level 1 monster: that way, you can face Malygris while you have the powers of four absorbed souls at you disposal. Unfortunately, killing a level 4 monster is hard, and should not be attempted lightly. You may also be thwarted by the lay-out of the dungeon.[paragraph break]Maximising the amount of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys of success in [italic type]Kerkerkruip[roman type]."
"What is happening to my health?"	--	"You may have seen that killing a monster will not always increase your maximum health, and you may have also encountered situations in which it actually lowers your maximum health. How is this possible?[paragraph break]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it. So if you have killed a level 1 creature which grants you a +5 health bonus, and you then kill another level 1 creature, you will lose the original power, including the health bonus. If the newly killed creature also grants +5 health, your maximum health will stay the same.[paragraph break]More dramatically, assume you have killed a level 3, a level 2 and a level 1 creature, in that order, for a total health bonus of 15 + 10 + 5 = 30. (Creatures generally grant 5 times their level in health, though there is some variation.) If you now kill another level 3 creature, you will lose all the previously granted powers. Your maximum health may drop by as many as 15 points![paragraph break]As you can see, the order in which you kill your enemies is exceedingly important."
"Difficulty and victory"	--	"[italic type]Kerkerkruip[roman type] has infinitely many difficulty settings (well, as many as can be fitted into a single integer variable), one of which is automatically chosen at the start of the game based on your previous performance. If you have never won a game before, [italic type]Kerkerkruip[roman type] will be in 'easy' mode, which gives you substantial bonuses. In addition, some of the more confusing monsters, items and locations will not appear in the dungeon.[paragraph break]Once you have won at least one game, the difficulty is determined by your current winning streak: the number of games you have won in a row. Every time you win the game, your winning streak will increase by 1; but it will be reset to 0 when you lose. As your winning streak goes up, the monsters in the game get progressively bigger bonuses, and winning becomes harder and harder. Getting a high winning streak is a challenge for experts!"
"Save, restore, quit, undo"	--	"[italic type]Kerkerkruip[roman type] features a system of permanent death, and as such some of the meta-game commands do not have the same effects they have in other interactive fiction. Undoing is simply disallowed: it would take all tension out of the game. Saving happens automatically every turn, and when you start the game again, you must continue the previous game. You can always restart, but this will reset your winning streak to 0.[paragraph break]Of course [italic type]Kerkerkruip[roman type] is not cheat-proof: if you really wish to backup your saved positions or gain incredible winning streaks, you can. The restrictions are just there to protect honourable people from their worser selves."

Table of Power Help
title	subtable	description	toggle 
"Body, mind, and spirit"		--		"Your character has three basic faculties: body, mind, and spirit. They influence your performance in two ways. First, each of the faculties has its own individual effect. Second, all powers in the game depend upon one or more of the faculties for their effect.[paragraph break][bold type]Body[roman type] is a measure of your physical strength and agility. Whenever you are attacked, you have a body * 2% chance of receiving a +3 defence bonus.[paragraph break][bold type]Mind[roman type] is a measure of your intelligence and willpower. Whenever damage is dealt to you, each point of mind increases your chance of remaining concentrated by 2%.[paragraph break][bold type]Spirit[roman type] measures how attuned you are to magic and the souls of others. Every point of spirit gives you a 2.5% chance of receiving an intiative bonus on any combat turn.[paragraph break]Truly exceptional feats are only possible for those who [bold type]balance[roman type] body, mind and spirit. Whenever a random number is rolled for an attack or a faculty check, your chance of rolling 20 is a percentage equal to the [italic type]lowest[roman type] of your three faculties."
"Level 1 -- Swarm of daggers (body & spirit)"		--		"Type: active combat ability.[paragraph break]Command: pierce [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 2 + body/5 extra damage. This ability has a cooldown of 12 - spirit/3 turns."
"Level 1 -- Blood ape (body)"		--		"Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: Whenever one of your attacks deals damage, you grow. This growth lasts until the end of combat, and you can never grow bigger than the blood ape was when you killed it. In addition to the usual benefits and penalties of growing, you regain 1 + body/3 points of health whenever you grow."
"Level 1 -- Ravenous armadillo (body & spirit)"		--		"Type: reactive combat ability.[paragraph break]Command: scales.[paragraph break]Effect: As a reaction, you can use the scales skill to cover yourself in damage absorbing scales. The damage of the current attack will be reduced by 5 + body/3 points. This ability has a cooldown of 10 - spirit/4 turns."
"Level 1 -- Miranda (mind)"		--		"Type: active combat ability.[paragraph break]Command: stun [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 1 less damage, but it stuns the target for a number of turns equal to your mind score. A stunned person has a -1 attack penalty, and a penalty on body, mind and spirit equal to your mind/2."
"Level 2 -- Chain golem (spirit)"		--		"Type: reactive combat ability.[paragraph break]Command: lash.[paragraph break]Effect: As a reaction, you attack your attacker. Whether you get to strike first is determined randomly, but the probability increases with your spirit score. (It is 50% at a spirit score of 8.) This ability has a cooldown of 10 - spirit/5 turns."
"Level 2 -- Jumping bomb (body)"		--		"Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: If you are killed by someone's attack, your body will explode and deal damage to the attacker. The amount of damage dealt is a random number between 5 and your body score. (But it is never less than 5, even if your body is less than 5.) If the amount of damage you deal is enough to kill the attacker, and the attacker has a soul you can absorb, you will survive and the attacker is killed."
"Level 2 -- Reaper (spirit)"		--		"Type: active ability.[paragraph break]Command: reap [italic type]someone[roman type].[paragraph break]Effect: You can reap anyone you have seen, and this ability will instantly teleport you to their location. It can even be used as a reaction in combat. Reaping will reduce your health and maximum health by an amount equal to the level of the highest power you have absorbed; but you have a spirit * 3% probability of avoiding that penalty."
"Level 2 -- Demon of rage (mind)"		--		"Type: active ability.[paragraph break]Command: howl.[paragraph break]Effect: You make your next attack with a +4 attack bonus and a damage bonus equal to 2 + mind/3. Your defence is permanently decreased by 1 point."
"Level 3 -- Mindslug (mind & spirit)"		--		"Type: active ability.[paragraph break]Command: enslave [italic type]someone[roman type].[paragraph break]Effect: You attempt to enslave an enemy, turning him or her into your thrall. Your attempt is successful if you succeed at a mind check against 5 + mind of your enemy + health of your enemy + (2 * concentration of your enemy) - (2 * your concentration). In general, it will be necessary to decrease your enemy's health before trying to enslave him or her. This ability has a cooldown of 9 - (spirit / 3) turns."
"Level 3 -- Giant tentacle (mind)"		--		"Type: active ability.[paragraph break]Command: sprout [italic type]a number[roman type].[paragraph break]Effect: You sprout between 1 and 4 horrifying tentacles, which may turn anyone else in the room insane. You yourself will permanently lose as many points of mind as you sprout tentacles. Everyone else has to make a mind check against 4 + (4 * number of tentacles) - (that person's health / 3) + your concentration. If they fail the mind check, they go insane, and will start attacking random people including themselves. As additional effects, if you sprout at least 2 tentacles, everyone will lose their concentration; if you sprout at least 3 tentacles, all current attacks against you will be interrupted; and if you sprout 4 tentacles, everyone except for yourself will be stunned for 6 turns."
"Level 3 -- Minotaur (body)"		--		"Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: You can use the minotaur's axe to maze people. In the maze, you will get a +3 bonus to body, mind and spirit. Furthermore and independent of your location, you get special proficiency with axes, granting you a (your body)% probability of dealing 10 bonus damage when you hit someone with an axe."
"Level 4 -- Fanatics of Aite (spirit)"	--	"Type: active ability.[paragraph break]Command: pray (while not in another god's temple).[paragraph break]Effect: You can pray to Aite even when you are not in her temple, though the effect will not work in the temples of other gods. The probability that Aite's power will help you and harm your enemies also increases, with the increase being more pronounced if your spirit is higher. When Aite sends a divine weapon to skewer people, these also do more damage: huge weapons get a damage bonus of spirit / 5, and gigantic weapons get this bonus twice."
"Level 4 -- Bodmall (body)"		--	"Type: active combat ability.[paragraph break]Command: brambles; launch.[paragraph break]The 'brambles' command will summon bushes of thorns that impede the movement of your enemies, giving them a -2 attack penalty. After a few turns, these branches will start growing thorns. If you wait longer, they will also grow different types of fruit.[paragraph break]The 'launch' command launches these thorns and fruit at your enemies (or, for some fruits, yourself). The thorns will deal between 1 and [italic type]n[roman type] damage, where [italic type]n[roman type] is the number of times the thorns have grown (tiny = 1, terrible = 5). In addition, the thorns have an [italic type]n[roman type] * 20% chance of breaking concentration. Different types of fruits have different effects; experiment with them! Both the brambles and the launch command can be used as an action or a reaction.[paragraph break]Your body score has several effects on how fast the thorns and the fruit will grow; a higher body score means that both will appear sooner and have less chance of disappearing again.[paragraph break]In addition, as a druid you are immune to smoke, and get a +1 attack bonus with wooden weapons."

[To say system requirements text:
	say "[italic type]Kerkerkruip[roman type] is a much more computation intensive game than the average piece of interactive fiction. Both the random dungeon generation at the beginning of the game and the different systems that run every turn take some computing power. While [italic type]Kerkerkruip[roman type] runs well on all reasonably recent computers, including netbooks and even tablets and some phones, older hardware and smaller devices may not be able to run it.[paragraph break]If [italic type]Kerkerkruip[roman type] turns out to be too slow for your computer, there are a few things you can try. First, closing some other programs may help. Second, using another interpreter can make a difference: for instance, currently [italic type]Gargoyle[roman type] runs the game faster than [italic type]Spatterlight[roman type] and [italic type]Filfre[roman type] (but that may have changed when you read this). Using a mobile interpreter like [italic type]Glulxe[roman type] is not recommended! If neither of these strategies work, your device is not powerful enough to run [italic type]Kerkerkruip[roman type]. My apologies.".]

To say original credits text:
	say "[italic type]These are the credits of the original version of the game as released in the Interactive Fiction Competition 2011.[roman type][paragraph break]Most of all, I would like to thank my alpha- and beta-testers: Matt Weiner, Michael Fransioli, Erik Temple, Michiel Hermes, Lance Camelot, Wasse Asmlash, Vyacheslav Dobranov, Dannii Willis, Captain Mikee, and Bora Bosna. (If I have forgotten you, let me know!) Any piece of interactive fiction needs testers, but one as complicated as [italic type]Kerkerkruip[roman type] doubly so.[paragraph break]I would also like to thank the makers of Inform 7, everyone whose extensions I have used or misused, and everyone who has helped me on the forums and the newsgroups -- there are a lot of you, and you may know who you are. Andrew Plotkin has answered perhaps more of my technical questions than anyone else, so a special thanks to him.[paragraph break]Thanks also to Captain Orange for allowing me to use his photo for the cover image.[paragraph break]This game has been inspired by many works of interactive fiction, computer roleplaying games and roguelikes. I want to single out [italic type]Desktop Dungeons[roman type] for special mention, since it was that game that gave me the idea of making a 'coffee break' roguelike -- finally a project I could finish! Apart from the fact that a roguelike is never finished, of course.".

To say current credits text:
	say "[italic type]Current Kerkerkruip Team[roman type][paragraph break]Victor Gijsbers -- lead game design & general contributor[line break]Dannii Willis -- lead technical design & general contributor[paragraph break]See the Contact section for more information on contributing to [italic type]Kerkerkruip[roman type]! We welcome submission of ideas and code."

To say copyright text:
	say "[italic type]Kerkerkruip[roman type] is copyright 2012 by Victor Gijsbers. It is released under the GPL version 3 or any later version. The extensions used are copyright by their respective authors; some of them were released under the Creative Commons Attribution license. The cover image is a photo by Captain Orange, modified by Victor Gijsbers. It is used with permission for this game, but should not be used for other games. (Unless you get permission yourself.)".

To say contact text:
	say "This is where stuff is going on:[paragraph break]* Updates to the game are announced on the IFDB, which is also where you can get the latest version: http://ifdb.tads.org[line break]* The source code can be found on github: https://github.com/i7/kerkerkruip[line break]* Design discussions, programming tutorials and help from other gamers are at the IF Forum: http://www.intfiction.org/forum/index.php[paragraph break]The forum is the preferred place for interaction, but you can also contact Victor with comments, bug reports, and anything else at victor@lilith.cc."


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

Kerkerkruip Start and Finish ends here.

Section - Achievements Menu

Achievemenuing is an action out of world.

Understand "achieve" and "achievements" as achievemenuing.

Carry out achievemenuing:
	now the current menu is the Table of Achievement Menu;
	carry out the displaying activity;
	clear the screen;
	try looking;