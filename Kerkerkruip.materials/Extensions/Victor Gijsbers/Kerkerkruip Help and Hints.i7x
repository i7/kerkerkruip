Kerkerkruip Help and Hints by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Help Menus
	
Section - Help

Table of Kerkerkruip Help
title	submenu	text	rule
"[bold type]Playing Kerkerkruip"	--	--	--
"Players new to Interactive Fiction"	Table of Newest Player Help	--	--
"Players new to [Kerkerkruip]"	Table of New Player Help	--	--
"Advanced concepts"	Table of Advanced Help	--	--
""	--	--	--
"[bold type]Dungeon almanac"	--	--	--
"Enemies and powers"	Table of Power Help	--	[the show the table of enemies and powers rule]
"Achievements"	Table of Achievement Menu	--	--
""	--	--	--
"Options"	Table of Options Menu	--	--
""	--	--	--
"Credits, Copyright & Afterword"	--	"[total credits]"	--
"Contact"	--	"[contact text]"	--

Table of Newest Player Help
title	text 
"Interactive Fiction basics"	"In [Kerkerkruip], you play the protagonist of a story which the computer tells to you in English prose (with some numbers added in the combat sequences). You make the protagonist do what you want by giving short English commands. For instance, the computer might say:[paragraph break][italic type]You can see a sword here.[roman type][paragraph break]A command prompt '>' will then appear, at which you might type the command:[paragraph break][italic type]> take sword[roman type][paragraph break]To which the computer will reply:[paragraph break][italic type]Taken.[roman type][paragraph break]The protagonist now possesses the sword. In this way, you will be able to move around the dungeon, examine, take, and drop things, attack monsters, and do many other things. The rest of this section of the help menu will introduce you to the standard interactive fiction commands. These will allows you to move around the game world, though if you want to have any success in combat, you will also need to read the part of the help menu that is about the specific [Kerkerkruip] commands."
"Looking and examining"	"Two of the most basic commands are 'look' and 'examine'. By typing 'look', you will get a description of the room you are currently in. By typing 'examine' and then the name of an object, you will get a description of that specific object. So typing 'examine sword' will give you a description of the sword, while typing 'examine me' will give you a description of yourself, the player character.[paragraph break]These commands can also be abbreviated: 'l' will work instead of 'look', while 'x sword' means that same as 'examine sword'."
"Moving around"	"The world is divided into rooms, and you will want to move from one room to the other. You can do this using the command 'go', followed by a direction. The six directions are north, south, west, east, up and down, so you might type 'go south' to move south.[paragraph break]The directions can be abbreviated to their first letter (n, s, w, e, u, d), and you can also drop the word 'go'. So the commands 'go south', 'go s', and 's' are all equivalent."
"Picking up stuff"	"You will want to interact with things in the dungeon. The most basic actions are taking and dropping stuff. Type 'take sword' to pick up the sword, and type 'drop sword' to drop it to the ground again. You can also take or drop multiple items, for instance with 'drop all' or 'take all scrolls'.[paragraph break]If at any time you want to see a list of what you are carrying, type 'inventory'. This last command, which is very useful, can also be abbreviated to 'i'."
"More advanced interactions"	"You'll be able to interact with some items in more specific ways. Here are a couple of commands that you will want to be aware of:[paragraph break]'wear', as in 'wear boots'[line break]'remove', as in 'remove boots'[line break]'open', as in 'open chest'[line break]'close', as in 'close chest'[line break]'lock', as in 'lock chest'[line break]'unlock', as in 'unlock chest'[line break]'eat', as in 'eat apple'[line break]'drink', as in 'drink wine'[line break]'read', as in 'read book'[line break]'put in', as in 'put sword in forge'[line break]'turn on', as in 'turn on machine'[line break]'turn off', as in 'turn off machine'[paragraph break]In general, if something seems the most obvious way to use an item, that command will probably work. If you can't figure out how to use an item, examining it may sometimes give a hint. ([Kerkerkruip] has been designed to rely on obvious or clearly clued commands only.)[paragraph break]All the commands previously listed are common interactive fiction commands. There is also a set of special commands used in [Kerkerkruip] that you will find described in a different section of the help menu."
"Is this information available out-of-game?"	"Of course. You might be interested in the reference card that can be found here: http://eblong.com/zarf/if.html"

Table of New Player Help
title	text
"Instruction video and Beginner's Guide"	"You are of course free to read this manual, but if you're just looking to dive into [Kerkerkruip], you might prefer watching the series of short instruction videos or reading the 3-page Beginner's Guide. You can find everything you need at http://www.ifarchive.org/if-archive/games/competition2011/glulx/kerkerkruip/ ."
"What is Kerkerkruip?"	"[Kerkerkruip] is an interactive fiction roguelike. (You can find more information about both interactive fiction and roguelikes in the previous menu.) You will be guiding a nameless adventurer through a randomly generated dungeon, which is different every time you play. There are treasures to be found, monsters to be fought, and powers to be gained, as you attempt to defeat your ultimate opponent: Malygris, the Wizard of Kerkerkruip. Combat is handled by a powerful combat system that is explained in other parts of this manual."
"What is a roguelike?"	"Roguelikes are games that feature turn-based tactical combat in a randomly generated environment. In addition, death is final: if your character dies, there is no way to play on, not even by loading an earlier save. Permanent death makes for very tense games, where the stakes are high, while the random generation ensures that replaying the earlier parts of the game remains interesting. Famous roguelikes are [italic type]Nethack[roman type], [italic type]Angband[roman type], [italic type]Ancient Domains of Mystery[roman type] and [italic type]Dungeon Crawl Stone Soup[roman type]. Among mainstream games, [italic type]Diablo 2[roman type] played on hardcore mode (which is the only mode that features permanent death) comes quite close to being a roguelike, although it is not turn-based."
"Introduction to the combat system"	"Combat is a large part of [Kerkerkruip], so it is important to understand the basic concepts and commands. Every person in the game has a certain amount of health; you can see yours in the status bar above the normal game window. If someone's health drops to 0, that person is dead. Killing your enemies is your main goal, while the enemies want to kill you. (In some special circumstances, persons in the dungeon might team up with you, or may attack each other.)[paragraph break]Whenever you are in a combat situation, your prompt will change to the word 'Act>'. The presence of this prompt indicates that you have some extra commands available. The most important combat command is 'attack', which can be abbreviated to 'a'. If you attack, you attempt to hit the enemy. Whether the blow hits or not is partly determined by a random number, but the circumstances play a very important role as well. The entire calculation will be shown on the screen, so if you are curious, you can always see why you hit or missed.[paragraph break]The second most important combat command is 'concentrate', which can be abbreviated to 'c'. By concentrating, you can attain three stages of concentration, which give you progressively greater bonuses on your attacks and the damage you deal. Most fights cannot be won by just attacking over and over: you need to get at least one or two levels of concentration to make your attacks effective. However, if you get damaged, you lose your concentration -- so you'll have to weigh the advantages of higher concentration against the risk of losing it.[paragraph break]There are many other actions you can take: you can 'retreat', try to 'sacrifice' in a temple, use your possessions, and so on. Some of these possibilities will be explained in further sections of this help menu. But 'attack', and 'concentrate' are the two main moves you will need to use at the 'Act' prompt."
"Basic combat reactions"	"When someone attacks you in Kerkerkruip, you will get a special 'React>' prompt. There are four basic moves you can use at this prompt: 'dodge', 'parry', 'roll' and 'block'. The first two can be abbreviated to 'do' and 'p' respectively.[paragraph break]Dodge and parry will make you harder to hit by an amount that depends on the weapon of your enemy and -- in the case of parry -- your own weapon. You can examine weapons for more details, though common sense will also often tell you which of the two is the best. (For instance, don't try to parry a huge warhammer if you are carrying a dagger.) In addition, a successful dodge will give you a point of defensive flow, while a successful parry gives you a point of offensive flow. (You can read more about flow in the Advanced Concepts section.)[paragraph break]Blocking also makes you harder to hit, by an amount that only depends on your shield. In addition, it converts your offensive flow to defensive flow. A successful block may randomly increase your offensive or defensive flow, with both options having a 25% probability[paragraph break]Rolling towards your enemy doesn't give you any defense bonuses. However, at the end of a successful roll, your defensive flow will be converted to offensive flow, so it is the perfect set-up for an attack."
"Retreat!"	"Sometimes, you will find yourself in a fight you cannot handle. To check whether this is so, you can examine the monsters -- examining is always a free action, which does not cost you a turn. When you examine a monster, you will be told its level. In general, you don't want to attack a level 2 monster until you have killed a level 1 monster; you don't want to attack a level 3 monster until you have killed a level 2 monster; and so on.[paragraph break]If you decide the fight is too difficult for you, your best option is to 'retreat'. This lets you run back to the previous room, but the monster may attack you as you run. [italic type]You get a free retreat upon entering a room for the first time:[roman type] if you don't take any actions (except actions that take no time, like examining and looking), you can retreat without fear of being attacked. Use this to scout out the dungeon around you."
"Time and initiative"	"Kerkerkruip is a turn-based game, but that doesn't mean everyone gets their turn in an orderly fashion. It is possible for you, or for a monster, to get two (or even more) turns in a row. This is partly decided by the random generator, but also partly by actions and events that lower or raise your initiative. For instance, if you have high concentration, you will often be able to act sooner. If you attack and miss, or if you are hit by an attack, you will often be forced to act later. Some items in the dungeon may allow you to manipulate your initiative.[paragraph break]Another thing you should realise is that not every action costs time. Examining, looking and taking inventory all take no time, and neither do the special Kerkerkruip actions 'remember' and 'status'. Most actions that end in failure (like going in a direction you cannot go) don't take time either."
"Knowing the dungeon"	"As in other interactive fiction, you should examine everything. This will show you the levels of monsters, which is very useful, and it may allow you to find out what items in the dungeon -- either those you pick up or those that are situated in specific rooms -- do. Again as in other interactive fiction, you should experiment: try things out, and see what happens.[paragraph break]Kerkerkruip has several important information-related actions. First, there is 'status', which gives you an overview of your health, your attributes, any special effects that are active, and all the skills you have gained during the game. Use it often![paragraph break]In the graphical version of the game, the 'map' command will show you an overview of the dungeon and the monsters you have seen. In both the graphical and the non-graphical version, there is the 'remember' command, which can be abbreviated to 'r'. This action tells you a lot of things: which exits you haven't explored yet; which rooms you have visited; which monsters you have seen, and where; and it also gives you a random tip about Kerkerkruip.[paragraph break]Then, there is the command 'sense', which only becomes available when you have defeated some powerful monsters. First, it gives you an indication of the location of Malygris, the final enemy. (You'll find out why that is useful.) Later, it gives you a sense for the location of any very powerful items. Be warned, however, that you may not always be able to find those; and be warned also that sensing does take a turn.[paragraph break]Finally, and less importantly, the 'trophies' command shows you a list of defeated enemies.[paragraph break]Do not forget: 'status', 'map' and 'remember' ('r') are your friends."
"Moving around"	"You can just 'go' into a direction, of course, but Kerkerkruip also allows you to 'go to' a specific location you have already visited or a monster you have already seen. This will move you one room nearer to that location. If you want to continue your journey, just press enter: an empty command will be read as continuing the previous go to command."
"Using items"	"Generally, it should be obvious how you can use an item; if not, examining the item will often teach you the right verb. A special case are weapons, which you must 'ready' or (equivalently) 'wield' in order to use them. It is also possible to 'unready' a weapon, though it is usually smarter to just 'ready' another weapon instead. You can 'wear' clothing, 'read' scrolls, 'throw' grenades, and so on. The fact that you have found an item does not mean that it is useful to you, so think carefully and observe the effects of the item on the game."
"List of special verbs"	"You may find the 3-page Beginner's Guide more convenient, but here is a list of some of the special verbs of Kerkerkruip. (Verbs having to do with specific objects or skills will not be given: you can look these up through examining the object, or the 'status' command.)[paragraph break]Actions that [italic type]give information[roman type]: 'status', 'map', 'remember' ('r'), 'sense', 'trophies'.[paragraph break]Actions [italic type]used in combat[roman type] at the [italic type]Act>[roman type] prompt: 'attack <person>' ('a'), 'concentrate' ('c').[paragraph break]Actions [italic type]used in combat[roman type] at the [italic type]React>[roman type] prompt: 'parry' ('p'), 'dodge' ('do'), 'block', 'roll', 'expose'.[paragraph break]Actions that [italic type]move the player[roman type]: 'retreat', 'go to <room>'.[paragraph break]Actions that [italic type]work in specific locations[roman type]: 'sacrifice'.[paragraph break]Actions that [italic type]allow you to use objects[roman type]: 'ready <weapon>', 'unready <weapon>', 'throw <grenade>', 'throw <grenade> <direction>', 'read <scroll>', 'wear <clothing>', 'take off <clothing>'.[paragraph break]Actions that [italic type]bring you to this or another menu[roman type]: 'help', 'achievements'.[paragraph break]Actions that [italic type]change the cosmetics of the game[roman type]: 'panels'."

Table of Advanced Help
title	text
"Tension"	"One important circumstance influencing combat is the tension, which goes up as the fight takes longer, but decreases when a hit is scored. The current tension is always visible in the status line. Every 2 points of tension give the attacker a +1 bonus, while every 3 points of tension add +1 to the damage dealt. Thus, if the tension is 10, an attack would happen with a +5 attack bonus and a +3 damage bonus."
"Offensive and defensive flow"	"[paragraph break]In addition to concentration and tension, two other numbers affect every attack in Kerkerkruip. These are 'offensive flow' and 'defensive flow'. Every point of offensive flow increases the chance of an attack hitting by 1 and increases attack damage by 1. Likewise, defensive flow reduces the chance of an attack hitting, although it doesn't reduce damage.[paragraph break]Offensive flow is increased by successfully parrying or rolling into combat. Defensive flow is increased by successfully dodging. A successful block may randomly increase either, with both options having a 25% probability.[paragraph break]The sum of offensive and defensive flow can never be greater than 3, and both are reset to 0 when attacking unsuccessfully or when getting damaged by an attack.[paragraph break]At the beginning of a block move, all your offensive flow is converted into defensive flow. At the end of a roll move, your defensive flow is converted into offensive flow. Use these actions to switch between attacking and defending!"
["Blocking and rolling"	"There are two reactions you can use to take special advantage of your flow: 'roll' and 'block'.[paragraph break]A [italic type]roll[roman type] counts as a dodge, with the same bonuses and penalties. But instead of adding to your defensive flow when you are not hit, it will cancel all your defensive flow and add it to your offensive flow, enabling you to make a stronger attack on a future turn. Be warned that this effect happens immediately, so if you had defensive flow before you rolled into combat, it will not protect you from the attack, and if the attack hits you, you will lose offensive flow as well.[paragraph break]A [italic type]block[roman type] is similar to a parry, except that you use a shield instead of your weapon. You must be wearing a shield to block. When you block, you get any bonus that your shield might give you, and in addition all your offensive flow is converted to defensive flow.[paragraph break]To decide which reaction you want to use, consider your current flow. If you don't have any offensive flow, blocking doesn't make sense unless your shield gives you a better bonus than dodging or parrying. Likewise, if you don't have any defensive flow, or your offensive flow is already 2 or more, rolling will not increase offensive flow any more than parrying would."]
"Exposing yourself to attacks"	"Normally, you would never want an attacker to hit you. But sometimes it makes sense - for example, if you want the blood ape to get bigger before you kill it. In that case, you can use the special reaction 'expose'. This will increase the likelihood of the attacker hitting you to near certainty."
"Ment"	"You start the game with three packages of ment, a powerful but highly addictive drug. When you snort ment for the first time, you will receive a +1 attack bonus, a +1 damage bonus, a +1 defence bonus, +1 damage reduction, and a +1 bonus on any attribute checks. The second time you snort ment, your body has become more attuned to the drug, and these bonuses increase to +2; and the third time, they increase to +3. This is a huge bonus. However, your body also becomes dependent on ment, and once its effects wear off you are left with a permanent penalty equal to the bonus you just got. You can get a temporary reprieve by snorting more ment -- but you only have three packages, and can never get more. On the one hand, you should make sure that you are not left with a -3 penalty, no more ment, and a Malygris who is still in good shape. On the other hand, ment can allow you to win fights you could not otherwise win. Using this dangerous resource carefully is one of the keys to success in [Kerkerkruip]."
"Powers and levels"	"Every monster in the game has a level, which you can see by examining the monster. Any monster with a non-zero level will trigger a special sequence of events when it is killed: you will absorb its soul, which fully heals you, increases your statistics (maximum health, attack bonus, and so on), and grants you a special power. You can review the powers you have been granted by using the 'status' command.[paragraph break]Level 0 monsters never grant you health or powers. Some monsters form groups, and you will have to kill the entire group before the power transferal happens.[paragraph break]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body. This means that you lose the statistics bonuses and the special powers granted by those souls. For example, suppose you kill Miranda, a level 1 monster. You absorb Miranda's soul, receive some bonuses, and get the stun ability. Next, you kill the level 2 chain golem. Absorbing the chain golem's soul will immediately repel Miranda's soul; so you lose the stun ability, and the bonuses given by Miranda's soul; but you gain the lash ability and the bonuses given by the chain golem. (These bonuses are bigger, because he is a higher level monster.) Next, you kill the blood ape, a level 1 monster. Because the soul of the chain golem is of a higher level than that of the blood ape, it does not get repelled, and you receive all the blood ape bonuses and the associated power while retaining those granted by the chain golem.[paragraph break]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5. The level 5 monster is Malygris, and you win by killing him.[paragraph break]As you can see, it would be advantageous to kill a level 4 monster first, and then a level 3, a level 2 and a level 1 monster: that way, you can face Malygris while you have the powers of four absorbed souls at you disposal. Unfortunately, killing a level 4 monster is hard, and should not be attempted lightly. You may also be thwarted by the lay-out of the dungeon.[paragraph break]Maximising the amount of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys of success in [Kerkerkruip]."
"Religion"	"The dungeon may contain several temples, in which you can sacrifice your powers to the gods. Just type 'sacrifice' to do so; you will see a list of the powers you can sacrifice. Each level of the power you sacrifice gives you a point of piety with that god. The benefits given by a god will increase with rising piety, with special gifts given at 1, 3, 6, and 9 piety. But beware: while these gifts can be quite powerful, they are generally not as good as the powers you have sacrificed. So it is often a good idea to sacrifice only those powers that you are bound to lose anyway."
"What is happening to my health?"	"You may have seen that killing a monster will not always increase your maximum health, and you may have also encountered situations in which it actually lowers your maximum health. How is this possible?[paragraph break]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it. So if you have killed a level 1 creature which grants you a +5 health bonus, and you then kill another level 1 creature, you will lose the original power, including the health bonus. If the newly killed creature also grants +5 health, your maximum health will stay the same.[paragraph break]More dramatically, assume you have killed a level 3, a level 2 and a level 1 creature, in that order, for a total health bonus of 15 + 10 + 5 = 30. (Creatures generally grant 5 times their level in health, though there is some variation.) If you now kill another level 3 creature, you will lose all the previously granted powers. Your maximum health may drop by as many as 15 points![paragraph break]As you can see, the order in which you kill your enemies is exceedingly important."
"Difficulty and victory"	"[Kerkerkruip] has infinitely many difficulty settings (well, as many as can be fitted into a single integer variable), one of which is automatically chosen at the start of the game based on your previous performance. If you have never won a game before, [Kerkerkruip] will be in 'easy' mode, which gives you substantial bonuses. In addition, some of the more confusing monsters, items and locations will not appear in the dungeon.[paragraph break]Once you have won at least one game, the difficulty is determined by your current winning streak: the number of games you have won in a row. Every time you win the game, your winning streak will increase by 1; but it will be reset to 0 when you lose. As your winning streak goes up, the monsters in the game get progressively bigger bonuses, and winning becomes harder and harder. Getting a high winning streak is a challenge for experts!"
"Save, restore, quit, undo"	"[Kerkerkruip] features a system of permanent death, and as such some of the meta-game commands do not have the same effects they have in other interactive fiction. Undoing is simply disallowed: it would take all tension out of the game. Saving happens automatically every turn, and when you start the game again, you must continue the previous game. You can always restart, but this will reset your winning streak to 0.[paragraph break]Of course [Kerkerkruip] is not cheat-proof: if you really wish to backup your saved positions or gain incredible winning streaks, you can. The restrictions are just there to protect honourable people from their worser selves."

Table of Power Help
title	text
"Body, mind, and spirit"	"Your character has three basic faculties: body, mind, and spirit. They influence your performance in two ways. First, each of the faculties has its own individual effect. Second, all powers in the game depend upon one or more of the faculties for their effect.[paragraph break][bold type]Body[roman type] is a measure of your physical strength and agility. Whenever you are attacked, you have a body * 2% chance of receiving a +3 defence bonus.[paragraph break][bold type]Mind[roman type] is a measure of your intelligence and willpower. Whenever damage is dealt to you, each point of mind increases your chance of remaining concentrated by 2%.[paragraph break][bold type]Spirit[roman type] measures how attuned you are to magic and the souls of others. Every point of spirit gives you a 2.5% chance of receiving an intiative bonus on any combat turn.[paragraph break]Truly exceptional feats are only possible for those who [bold type]balance[roman type] body, mind and spirit. Whenever a random number is rolled for an attack or a faculty check, your chance of rolling 20 is a percentage equal to the [italic type]lowest[roman type] of your three faculties."
""	--
"[bold type]Level 1"	--
"Swarm of daggers (body & spirit)"	"Level: 1[paragraph break][description of the power of the daggers]"
"Blood ape (body)"	"Level: 1[paragraph break][description of the power of the ape]"
"Ravenous armadillo (body & spirit)"	"Level: 1[paragraph break][description of the power of the armadillo]"
"Miranda (mind)"	"Level: 1[paragraph break][description of the power of miranda]"
"Wisps of pain (spirit)"	"Level: 1[paragraph break][description of the power of the wisps]"
""	--
"[bold type]Level 2"	--
"Chain golem (spirit)"	"Level: 2[paragraph break][description of the power of the chains]"
"Jumping bomb (body)"	"Level: 2[paragraph break][description of the power of the bomb]"
"Reaper (spirit)"	"Level: 2[paragraph break][description of the power of the reaper]"
"Demon of rage (mind)"	"Level: 2[paragraph break][description of the power of rage]"
"Hound (mind)"	"Level: 2[paragraph break][description of the power of the hound]"
"Angel of compassion (spirit)"	"Level 2:[paragraph break][description of the power of compassion]"
""	--
"[bold type]Level 3"	--
"Mindslug (mind & spirit)"	"Level: 3[paragraph break][description of the power of the mindslug]"
"Giant tentacle (mind)"	"Level: 3[paragraph break][description of the power of the tentacle]"
"Minotaur (body)"	"Level: 3[paragraph break][description of the power of the minotaur]"
""	--
"[bold type]Level 4"	--
"Fanatics of Aite (spirit)"	"Level: 4[paragraph break][description of the power of the fanatics]"
"Bodmall (body)"	"Level: 4[paragraph break][description of the power of Bodmall]"
"Overmind (mind)"	"Level: 4[paragraph break][description of the power of the overmind]"
"Israfel (spirit)"	"Level: 4[paragraph break][description of the power of Israfel]"


To say total credits:
	say "[banner text]http://kerkerkruip.org
	[paragraph break][bold type]The Kerkerkruip team[roman type]
	[line break][italic type]created by[roman type] Victor Gijsbers
	[line break][italic type]with[roman type] Mike Ciul, 
	[line break]Dannii Willis, 
	[line break]Erik Temple [italic type]and[roman type]
	[line break]Remko van der Pluijm
	[paragraph break][bold type]Additional contributions by[roman type]
	[line break]Brady Garvin
	[paragraph break][bold type]Kerkerkruip theme music[roman type]
	[line break][italic type]an original composition by[roman type] Wade Clarke
	[paragraph break][bold type]Testers[roman type]
	[line break]Thank you to our alpha- and beta-testers: Bora Bosna, Lance Camelot, Matt Weiner, Michael Fransioli, Michiel Hermes, Vyacheslav Dobranov, and Wasse Asmlash. (If we've forgotten you, let us know!) Any work of interactive fiction needs testers, but one as complicated as [Kerkerkruip] doubly so.
	[paragraph break][bold type]Free software[roman type]
	[line break][Kerkerkruip] is free and open source software. It is copyright 2014 and released under the GNU GPL version 3 licence, or any later version.
	[paragraph break]At the core of [Kerkerkruip] is Inform ATTACK, a combat library for Inform 7, by Victor Gijsbers. It too is released under the GNU GPL 3.
	[paragraph break][Kerkerkruip] includes many other extensions, which are used under the Creative Commons Attribution licence:
	[line break][the hand written list of extensions]
	[paragraph break]You can get the source code for [Kerkerkruip] at https://github.com/i7/kerkerkruip
	[paragraph break][bold type]Art credits[roman type]
	[line break][the monster portrait credits]
	[paragraph break][bold type]Afterword by Victor Gijsbers[roman type]
	[line break]I would like to thank the makers of Inform 7, everyone whose extensions I have used or misused, and everyone who has helped me on the forums and the newsgroups -- there are a lot of you, and you may know who you are. Andrew Plotkin has answered perhaps more of my technical questions than anyone else, so a special thanks to him.[paragraph break]This game has been inspired by many works of interactive fiction, computer roleplaying games and roguelikes. I want to single out [italic type]Desktop Dungeons[roman type] for special mention, since it was that game that gave me the idea of making a 'coffee break' roguelike -- finally a project I could finish! Apart from the fact that a roguelike is never finished, of course --";

To say the hand written list of extensions:
	say "the Inform 7 Standard Rules by Graham Nelson
	[line break]Numbered Disambiguation Choices by Aaron Reed
	[line break]Glulx Text Effects by Emily Short
	[line break]the Glimmr suite by Erik Temple
	[line break]Undo Output Control by Erik Temple
	[line break]Dynamic Objects by Jesse McGrew
	[line break]Dynamic Tables by Jesse McGrew
	[line break]Flexible Windows by Jon Ingold
	[line break]Fixed Point Maths by Michael Callaghan
	[line break]Questions by Michael Callaghan";

To say the monster portrait credits:
	say "All illustrations by Erik Temple. The rogue portraits incorporate the following resources:
	[paragraph break]Armadillo: Background texture courtesy of Shadowhouse Creations (shadowhousecreations.blogspot.com);
	[line break]Chain Golem: Background texture courtesy of Got3d - 3d Models and Textures (http://www.got3d.com/index.html);
	[line break]Fanatics of Aite: Background texture courtesy of deviantArt user cloaks (Michelle Bretland, cloaks.deviantart.com);
	[line break]Mindslug: Background texture courtesy of Flickr user rubyblossom (CC BY-NC-SA 2.0);
	[line break]Minotaur: Background texture in the public domain, courtesy photos-public-domain.com;
	[line break]Miranda: Background texture courtesy of deviantART user Esther-Sanz (esther-sanz.deviantart.com);
	[line break]Reaper: Background texture courtesy of wildtextures (wildtextures.com);
	[line break]Swarm of Daggers: Background texture courtesy of Dalibor Levíček, Flickr user daliborlev (CC BY-NC-SA 2.0);
	[line break]Tentacle of Tooloo: Background texture courtesy of deviantART user Insan-Stock (insan-stock.deviantart.com);
	[line break]Wisps of Pain: Background image of microalgae courtesy Flickr user Learn 2 Teach, Teach 2 Learn (CC BY-NC 2.0);
	[line break]Placeholder cards: Background texture courtesy of deviantART user Esther-Sanz (esther-sanz.deviantart.com).";

To say contact text:
	say "This is where stuff is going on:[paragraph break]* Updates to the game are announced on the current website, which is also where you can find the latest version of the game: http://kerkerkruip.org[line break]* Updates are also announced on the IFDB, which is the ideal venue for reviewing interactive fiction: http://ifdb.tads.org[line break]* The source code and current design discussions can be found on github: https://github.com/i7/kerkerkruip[line break]* Design discussions, programming tutorials and help from other gamers are at the IF Forum: http://www.intfiction.org/forum/index.php[paragraph break]Github and the forum are the preferred places for interaction, but you can also contact Victor with comments, bug reports, and anything else at victor@lilith.cc."

Section - Achievements

Table of Achievement Menu
title	text
"[run paragraph on][setup achievement menu][fixed letter spacing]Assistant Dungeoneer    [achievement assistant dungeoneer]"	"Kill a level 1 creature."
"[fixed letter spacing]Adventurer              [achievement adventurer]"	"Kill a level 2 creature."
"[fixed letter spacing]Hunter                  [achievement hunter]"	"Kill a level 3 creature."
"[fixed letter spacing]Destroyer               [achievement destroyer]"	"Kill a level 4 creature."
"[fixed letter spacing]Mageslayer              [achievement mageslayer]"	"Kill Malygris, the wizard of Kerkerkruip."
"[fixed letter spacing]Deathblow               [achievement deathblow]"	"Deal at least 20 damage with a single blow."
"[fixed letter spacing]I return to serve       [achievement I return to serve]"	"Have an undead creature that is allied to you kill someone."
"[fixed letter spacing]From the shadows I come [achievement From the shadows I come]"	"Kill an enemy at full health with one hit, while striking from the shadows."
["Stunning performance    [achievement Stunning performance]"	"Stun three different creatures in a single game."]
"[fixed letter spacing]Detox                   [achievement detox]"	"Win the game without using ment."
"[fixed letter spacing]Injury to insult        [achievement injury to insult]"	"Kill Malygris with your bare hands."
["Unmoved                 [achievement unmoved]"	"Win the game without using 'dodge' and 'parry'."]
"[fixed letter spacing]Nature's fragile vessel [achievement nature's fragile vessel]"	"Win the game with less than 15 maximum health."
"[fixed letter spacing]Make love not war       [achievement make love not war]"	"Achieve the romantic ending."
"[fixed letter spacing]Twice fallen            [achievement twice fallen]"	"Achieve victory in the Arena of the Fallen."
"[fixed letter spacing]Give them blood         [achievement give them blood]"	"Feed 50 blood to blood magic items in a single game."
"[fixed letter spacing]Royal fruit             [achievement royal fruit]"	"Receive the fabled Fruit of Kings."
"[fixed letter spacing]Sixth heaven            [achievement sixth heaven]"	"Get a +6 ment bonus."
"[fixed letter spacing]Durin's bane            [achievement durin's bane][variable letter spacing]"	"Wake up an unbeatable foe."
"[fixed letter spacing]Blood never lies        [achievement blood never lies][variable letter spacing]"	"Get a vampire to reveal his plans."

To say setup achievement menu:
	if Table of Held Achievements is empty:
		follow the load achievements rule.

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


Chapter - Tips

Table of Beginner Tips
tip
"Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5."
"When you absorb an enemy's soul, it fully heals you, increases your statistics, and grants you a special power."
"Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it."
"When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body."
"Level 0 monsters never grant you health or powers."
"Some monsters form groups, and you will have to kill the entire group before power transferal happens."
"Maximising the number of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys to success in [Kerkerkruip]."
"In the graphical version of the game, typing 'map' will show you the map."
"Additional information can be gotten with 'status', 'trophies' and (once you have defeated enough monsters) 'sense.'"
"You can move one room towards a location by typing 'go to [italic type]location[roman type].'"
"'Look', 'examine' and 'inventory' are free actions, so use them often."
"If a fight proves too much for you, try to 'retreat'. On entering a room for the first time, you can always retreat for free."
"If you want to have more than one power at the same time, you'll have to kill a lower level creature after defeating a higher level creature."

Table of Expert Tips
tip
"You can now snort ment in combat."
"Examining a monster will reveal its health and tell you what weapon it wields."
"Balance body, mind and spirit to maximise your chance of rolling 20."
"Most scrolls won't hurt you, so experimenting can pay off."
"The goddess Sul can help you with cursed items."
"Fragmentation grenades will break people's concentration."
"The power of the bomb will automatically choose the best victim."
"If you want to see all items and monsters, use the unlock everything option in the menu."
"The [italic type]roll[roman type] reaction is a more risky, but potentially more rewarding, version of the [italic type]dodge[roman type] reaction."
"If you wear a shield, you can [italic type]block[roman type] attacks, converting offensive flow to defensive flow."
"You can [italic type]expose[roman type] yourself to an attack if you actually want to get hit."
"Offensive flow and defensive flow can never total more than 3."

To decide which text is the next tip text:
	if a random chance of 3 in ((number of total victories) + 4) succeeds: [Expert tips show up more often when number of victories is higher.]
		choose a random row from the Table of Beginner Tips;
		decide on tip entry;
	otherwise:
		choose a random row from the Table of Expert Tips;
		decide on tip entry; 

Kerkerkruip Help and Hints ends here.
