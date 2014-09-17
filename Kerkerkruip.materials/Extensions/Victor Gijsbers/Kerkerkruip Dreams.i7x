Kerkerkruip Dreams by Victor Gijsbers begins here.

Use authorial modesty.

Section - The dream kind

A dream is a kind of object. A dream can be dreamt or undreamt. A dream is usually undreamt. [Dreamt once dream.]
A dream can be redreamable. A dream is usually not redreamable. [Redreamable dreams can be dreamt more than once.]

Dreamable test boolean is a truth state that varies.

A dream has a rule called the dreamable rule.
The dreamable rule of a dream is usually the simple dreamable rule.

This is the simple dreamable rule:
	now dreamable test boolean is true.

To decide whether (potential dream - a dream) is dreamable:
	if potential dream is dreamt and potential dream is not redreamable:
		decide on false;
	otherwise:
		follow dreamable rule of potential dream;
		decide on dreamable test boolean.

A dream has a rule called the start the dream rule.

Section - Special option for testing

[But not "only for testing", because I reference it below.]

A dream can be current-test-dream. [Make a dream current-test-dream for guaranteed dreaming of it.]
	
Section - What is Real, What is a Dream

Dreamer-location is a room that varies.
Dreamer is a person that varies.

Dreaming is a truth state that varies. Dreaming is false.

To decide which person is the/-- true body of (guy - a person):
	if guy is the player and dreaming is true:
		decide on the dreamer;
	decide on guy;

Section - Starting dreams

Every turn when the player is asleep and dreaming is false (this is the start a dream rule):
	do a dream.

Table of Candidate Dreams
Candidate Dream
(a dream)
with 20 blank rows
	
To do a dream:
	extract the player from combat;
	if at least one dream is current-test-dream:
		let item be a random current-test-dream dream;
		dream item;
	otherwise:
		blank out the whole of the Table of Candidate Dreams;
		repeat with item running through dreams:
			if item is dreamable:
				choose a blank row in Table of Candidate Dreams;
				now candidate dream entry is item;
		if number of filled rows in Table of Candidate Dreams is 0:
			say "You sleep a dreamless sleep.";
		otherwise:
			sort Table of Candidate Dreams in random order;
			choose row 1 in Table of Candidate Dreams;
			dream Candidate dream entry.

To dream (item - a dream):
	now dreaming is true;
	now item is dreamt;
	now dreamer-location is the location;
	now the dreamer is the player;
	say "You are pulled towards a dream ...";
	wait for any key;
	clear the screen;
	follow start the dream rule of item.
			
To wake the player up:
	wait for any key;
	clear the screen;
	repeat with guy running through asleep people in the location:
		if a random chance of 1 in 4 succeeds:
			now guy is not asleep;
	now dreaming is false;
	now the player is the dreamer;
	now the player is not asleep;
	now main actor is the player;
	extract the player from combat;
	if the player is not in dreamer-location:
		move the player to dreamer-location;
	otherwise:
		try looking;
	now the take no time boolean is false.
[
Section - Stripping player of possessions

The dream-chest is a container.

To strip the dreamer:
	repeat with item running through things enclosed by the dreamer:
		unless item is part of the dreamer:
			move item to dream-chest.

To restore the dreamer:
	repeat with item running through things enclosed by the player:
		if item is a weapon:
			if at least one readied weapon is in dream-chest:
				now item is not readied;
		if item is clothing:
			if at least one worn clothing is in dream-chest:
				now item is not worn;
	repeat with item running through things in the dream-chest:
		move item to the dreamer.

]


Chapter - Dream of Briar Roses

Dream of briar roses is a dream.

The start the dream rule of dream of briar roses is the start dream of briar roses rule.

This is the start dream of briar roses rule:
	move player to garden of thorns.
	
Garden of thorns is a room. "Roses scale the castle walls, all the way up to the window above, behind which your true love lies sleeping."
Garden of thorns is not placeable.

The castle walls are scenery in garden of thorns. The description of the castle walls is "Once their white stones shone proudly in the morning sun. Now they merely support the monstrous rose bushes.". Instead of climbing the castle walls: try going up.

The rose bushes are scenery in garden of thorns. Understand "rose" and "roses" and "thorn" and "thorns" as the rose bushes. The description of the rose bushes is "A rose by any other name would smell as sweet -- as sweet as death, sickness, and decay.". Before smelling the rose bushes: say "The sickly sweet smell makes you dizzy." instead. Instead of climbing the rose bushes: try going up.

The window above is scenery in garden of thorns. The description of the window above is "The roses cover everything except that one window, as if they mean for you to enter.".

Instead of going up in garden of thorns:
	if health of player is less than 4:
		say "You must climb the roses. You must. Weakened as you are, it is a suicidal mission -- but what is life worth if a [if the player is male]man[otherwise if the player is female]woman[otherwise]being[end if] gives up the attempt to find [if the player is male]his[otherwise if the player is female]her[otherwise]its[end if] true love? So you start climbing. The thorns prick you, and soon blood trickles down your hands and arms. But you climb on ...[paragraph break]";
		wait for any key;
		say "You climb, and climb, but the window seems to grow no nearer. Blood streams down your forehead and into your eyes. You cannot feel the pain in your hands any more. And when your fingers refuse to go on, when your hands can no longer maintain their grip, when you topple backwards and fall down into the courtyard below, when you feel the air rush past you for the last few seconds of your life -- at that moment, you feel happy.";
		now health of the player is 0;
		end the story saying "You never abandoned your true love. Few people can say that.";
	otherwise:
		say "You must climb the roses. You must. What is life worth if a [if the player is male]man[otherwise if the player is female]woman[otherwise]being[end if] gives up the attempt to find [if the player is male]his[otherwise if the player is female]her[otherwise]its[end if] true love? So you start climbing. The thorns prick you, and soon blood trickles down your hands and arms. But you climb on ...[paragraph break]";
		decrease health of the player by 3;  [Not using the damage system; this dream damage bypasses all effects.]
		wait for any key;
		let n be a random number between 1 and 2;
		say "At long last you reach the window, and collapse into the tower room. There, on the stately bed, lies the [if n is 1]man[otherwise]woman[end if] you have been longing for all your life. And [if n is 1]his[otherwise]her[end if] beauty is ...[paragraph break]";
		wait for any key;
		now current question is "(What do you see?)";
		now current question menu is {"... so heartbreaking and pure that it alone makes life worth living.", "... all withered and gone, replaced by the horrific smile of death."};
		ask a closed question, in menu mode.

A menu question rule (this is the sleeping beauty rule):
	if the current question is "(What do you see?)":
		let m be the number understood;
		if m is 1:
			decrease spirit score of the player by 10;
			say "Here are the joy and peace that you have always searched for; here is the secret core of all your yearnings and the blessing which turns all that's past to beautiful remembrance. You embrace your love -- and the scene immediately dissolves, returning you to the harsh and ugly world of Kerkerkruip.[paragraph break][bold type]The will to live under such circumstance has deserted you: -10 spirit.[roman type][paragraph break]";
			wake the player up;
		if m is 2:
			decrease mind score of the player by 10;
			say "The secret promise that you never doubted; the certainty that every ill will lead to good, that no matter how hard and difficult the path, love and life lie at the end of it -- that promise and that certainty are shattered as you look at the skull grinning from your lover's bed. You scream, and wake to the harsh world of Kerkerkruip.[paragraph break][bold type]The meaninglessness of existence will haunt your thoughts forever: -10 mind.[roman type][paragraph break]";
			wake the player up;
		exit.

Chapter - Dream of Tungausy Shaman

Dream of Tungausy Shaman is a dream. [Dream of Tungausy Shaman is current-test-dream.]

The start the dream rule of dream of Tungausy Shaman is the start dream of Tungausy Shaman rule.

This is the start dream of Tungausy Shaman rule:
	now player is the tungausy warrior;
	now main actor is tungausy warrior;
	try looking.

Before the meditation hut is a room. "Around you are the barren wastes of the Tungausy homeland. The sound of loud drum comes from the meditation hut. It sooths and enchants you."
Before the meditation hut is not placeable.

A person called the Tungausy warrior is in Before the meditation hut. The description of the tungausy warrior is "Your body is strong. Your spirit is even stronger.". The body score of the Tungausy warrior is 10. The spirit score of the Tungausy warrior is 15. The ID of the Tungausy warrior is 39.

The barren wastes are scenery in Before the meditation hut. Understand "homeland" as the barren wastes. The description of the barren wastes is "A vast, barren landscape. The monotony is only broken by large rock formations in the distance."
The large rock formations are scenery in Before the meditation hut. The description of the large rock formations is "The gods created them to house the spirits of ancestors."
The soothing drums are scenery in Before the meditation hut. Understand "music" and "soothing" and "enchanting" and "sounds" and "drums" as the soothing drums. The description of the soothing drums is "The slow, monotonous sound of the drums eases your soul." Instead of listening to in Before the meditation hut: try examining the soothing drums.
A thing called the lodge is scenery in Before the meditation hut. Understand "hut" and "meditation hut" as the lodge. The description of the lodge is "The enticing smell of spicy herbs lures you to the hut."
The indigenous herbs are scenery in Before the meditation hut. The description of the indigenous herbs is "These herbs smell familiar. You have been here often." Instead of smelling in Before the meditation hut: try examining the indigenous herbs.

Instead of smelling the indigenous herbs:
	try examining the indigenous herbs.

Instead of going inside in before the meditation hut:
	try going to the lodge.

Instead of entering the lodge:
	try going to the lodge.

Does the player mean entering the lodge:
	it is very likely.
	
Instead of going to the lodge:
	say "Though the drums and herbs sooth and encourage you, your knees still shake as you walk into the hut.";
	wait for any key;
	say "The shaman is sitting on a pile of hides, each of them ripped from the carcass of a ferocious beast. He is deep in a trance, and takes no notice of you. A large pool of water, vibrating slowly to the rhythm of invisible drums, beckons you forward. As you bend towards it, you can clearly discern an image.";
	wait for any key;
	now current question is "(What do you see in the pool?)";
	now current question menu is {"Your spirit floating away from your shrivelled body.", "Your body fighting the tribe's enemies, unable to feel anything."};
	ask a closed question, in menu mode.

A menu question rule (this is the vibrating pool rule):
	if the current question is "(What do you see in the pool?)":
		let m be the number understood;
		if m is 1:
			decrease body score of the dreamer by 5;
			increase spirit score of the dreamer by 5;
			say "You walk towards the shaman, knowing what you must sacrifice and what you will gain. 'I will give you my strength, in exchange for your spirit.' The shaman eagerly puts his hands on your biceps. His muscles grow beyond human proportion while yours shrink to nothing. He will now be able to defend the tribe in the Everlasting War, while you will join the ancestor spirits.[paragraph break][bold type]You have lost much of your bodily strength: -5 body. But you have sapped much of the shaman's spirit: +5 spirit.[roman type][paragraph break]";
			wake the player up;
		if m is 2:
			decrease spirit score of the dreamer by 5;
			increase body score of the dreamer by 5;
			say "You walk towards the shaman, knowing what you must sacrifice and what you will gain. 'I will give you my spirit, in exchange for your strength.' The shaman eagerly puts his hands on your breast. As he absorbs your spirit, you see your muscles growing beyond human proportions. You will now be able to defend the tribe in the Everlasting War, but you will never join the ancestor spirits.[paragraph break][bold type]You have lost your soul: -5 spirit. Your muscles have grown exceedingly strong: +5 body.[roman type][paragraph break]";
			wake the player up;
		exit.
			


Chapter - Dream of the Banquet

Dream of the Banquet is a dream. Dream of the Banquet is redreamable. The dreamable rule of Dream of the Banquet is the must see two diners before dreaming rule. The start the dream rule of Dream of the Banquet is the start the dream of the banquet rule.

Definition: a person (called guy) is banquet-dining if guy opposes the true body of the player and (guy and the true body of the player share a world).

Definition: a person (called guy) is banquet-menu if guy is seen and guy is banquet-dining.

Definition: Malygris is banquet-menu if Malygris is banquet-dining and the location of Malygris is the location of the true body of the player.



This is the must see two diners before dreaming rule:
	now dreamable test boolean is whether or not the number of banquet-menu people is at least two;

This is the start the dream of the banquet rule:
	now the health of Chef is the health of the player;
	now the permanent health of Chef is permanent health of the player;
	now player is the Chef;
	if a random chance of 1 in 2 succeeds:
		now the kitchen servant is male;
	otherwise:
		now the kitchen servant is female;
	now every person in Dining Hall is not asleep;
	try looking.

The Dining Hall is a room. "Cold drafts flow through this vast, gloomy hall. In the centre, a single chandelier casts a pool of light over a massive oaken table."

The Dining Hall is not placeable.

A chandelier is scenery in the dining hall. The description is "Ancient and ornate, this chandelier is wrought from solid silver. It supports dozens of fat candles.". Understand "silver", "candle/candles", "light/lamp", "fat" as the chandelier.

A massive oaken table is scenery in the Dining Hall. The description is "There are places set for [the number of banquet-dining people in words]. Among the names, you recognize [the list of banquet-menu people]." Understand "chair/chairs" and "places" as the table.

The nametags are scenery in the Dining Hall. The description is "There are nametags arranged at places around the table. The names are [the list of banquet-menu people][if there is at least one not banquet-menu person], and [the number of banquet-dining not banquet-menu people in words] that you can't read[end if].". Understand "name/names" and "nametags/tag/tags" as the nametags. Understand "[something related by table-place-naming]" as the nametags.

table-place-naming relates a thing (called the identifier) to a person (called the guest) when the guest is banquet-menu and the identifier is the nametags.

A kitchen servant is a person in Dining Hall. "A kitchen servant stands at the edge of the light, awaiting your instructions." Understand "slave", "boy/girl", "waiter/waitress" as the kitchen servant. The ID of kitchen servant is 40.


A person called the Chef is in The Dining Hall. The description of the Chef is "You are elegantly dressed, and ready to plan the menu for tonight's feast.". The ID of Chef is 41.

banquet-menu-text is a list of texts that varies.
banquet-items is a list of people that varies.

To ask is a verb.

Instead of doing anything when the current action involves the kitchen servant:
	say "The servant approaches you. 'Which guest are we serving tonight?' [regarding the kitchen servant][they] [ask].";
	now the current question is "(Which enemy do you select?)";
	now banquet-menu-text is {};
	now banquet-items is {};
	repeat with entree running through banquet-menu people:
		add entree to banquet-items;
		add printed name of entree to banquet-menu-text;
	now the current question menu is banquet-menu-text;
	ask a closed question, in menu mode.

A menu question rule (this is the banquet selection rule):
	if the current question is "(Which enemy do you select?)":
		Let m be the number understood;
		if m > 0 and m <= (the number of entries in banquet-items):
			let entree be entry m of banquet-items;
			prepare a feast of the entree;
			if the entree is dead:
				have an event of the true body of the player killing the entree;
			if Malygris is dead:
				if the true body of the player is dead:
					end the story saying "You and Malygris have both been consumed. Technically, that counts as a win.";
				otherwise:
					end the story saying "Malygris has been consumed by his own minions!"; 
			otherwise:
				if the true body of the player is dead:
					end the story saying "You have been consumed.";
				otherwise:
					wake the player up;
					exit;

To prepare a feast of (the entree - a person):
	say "You make your choice, and two large butchers enter carrying a large serving platter with [bold type][the entree][roman type] strapped to it. They set the platter down on the table.[paragraph break]The other denizens of Kerkerkruip file in behind and take their places. As the butchers hack off pieces of [the entree] with heavy cleavers, the guests grab them eagerly and stuff them into their drooling orifices. [paragraph break]";
	let the serving size be a random number between 5 and 10;
	let overflow be the serving size - health of entree; [Not using the damage system; dream damage bypasses all realistic systems.]
	decrease health of entree by the serving size;
	if overflow > 0:
		say "The guests consume their victim completely, and then they [bold type]turn on you![roman type][paragraph break]";
		decrease health of the true body of the player by overflow;
	say "[The entree] suffers [bold type][serving size] damage[roman type][if entree is dead], which is [bold type]lethal[roman type][end if]";
	if overflow > 0:
		say ". In addition, you suffer [bold type][overflow] damage[roman type]";
		if the true body of the player is dead:
			say ", which [bold type]kills you[roman type].";
	Repeat with guy running through banquet-dining people who are not the entree:
		increase health of guy by the serving size;
	if the true body of the player is not dead:
		say ". All of the diners [bold type]gain [serving size] health![roman type]";
		[a bit of a hack - allowing every turn rules to run normally might be better here:]
		follow the remove all killed monsters from play rule.
		
An absorption stopping rule (this is the chef can't absorb souls rule):
	if the player is chef:
		wait for any key;
		clear the screen;
		say "As you come unmoored from your dream, you feel the soul of [the name of the test subject] slipping past you, to be lost between worlds...";
		rule succeeds;

Chapter - Dream of Monty Hall

Monty Hall is a room. "The large, circular hall is completely empty except for [if Monty-Hall-voice is not 2]three[otherwise]two[end if] chests[if the marble black chest is in Monty Hall]. One chest is made of black marble[end if][if the pure gold chest is in Monty Hall]. One chest is made of pure gold[end if][if the iridiscent pearl chest is in Monty Hall]. One chest is made of iridiscent pearl[end if]."
Monty Hall is not placeable.

Dream of Monty Hall is a dream.

The start the dream rule of dream of Monty Hall is the start dream of Monty Hall rule.

This is the start dream of Monty Hall rule:
	move player to Monty Hall.

Monty-Hall-voice is a number that varies. Monty-Hall-voice is 0.
	
Every turn when the location is Monty Hall:
	if Monty-Hall-voice is 0:
		now Monty-Hall-voice is 1;
		say "'Welcome to my game show, puny mortal!' a deep, disembodied voice announces. 'You must open one of these chests. One of them contains a great treasure, while two of them contain [bold type]death[roman type]! So choose wisely.'[paragraph break]After a few seconds it adds: 'Admittedly, I've put the treasure in a completely random chest, so your wisdom isn't going to be any help. But hey, nobody promised that life would be fair.'"
		
The marble black chest is a scenery closed openable container in Monty Hall. The description of the marble black chest is "This chest is cool and smooth to the touch. Patterns in the marble suggest fantastic landscapes full of horror and wonder.".

The iridiscent pearl chest is a scenery closed openable container in Monty Hall. The description of the iridiscent pearl chest is "This chest flaunts a million shades of colour, like a peacock. Its smooth whiteness promises both everlasting beauty and death.".

The pure gold chest is a scenery closed openable container in Monty Hall. The description of the pure gold chest is "This chest has been polished so well that you can see your own face in it, made infinitely more precious by the noble metal. People would die for such richness.".

The Monty-list is a list of things that varies. The Monty-list is {marble black chest, iridiscent pearl chest, pure gold chest}.

When play begins:
	sort Monty-list in random order.

Instead of taking a scenery container in Monty Hall:
	try opening the noun.

Understand "choose [text]" as a mistake ("To choose a chest, open it.") when the location is Monty Hall. 

Before opening a scenery container in Monty Hall:
	if Monty-Hall-voice < 2:
		now Monty-Hall-voice is 2;
		let item be entry 2 in Monty-list;
		if item is noun:
			let item be entry 3 in Monty-list;
		remove item from play;
		say "'You're going to open [the noun]? A fine choice, absolutely fine. But I've decided to make things a little fairer for you, so I will pick one of the other chests -- one that contains death -- and I will remove it. It's up to you to decide whether to open your original choice, or the other remaining chest!'[paragraph break]With a soft sucking sound, [the item] disappears." instead.

Instead of opening a container in Monty Hall:
	let winning chest be entry 1 in Monty-list;
	if the noun is winning chest:
		move the lion's shield to the player;
		say "As you carefully open [the noun], a fierce growl emanates from within. You hesitate, but the lid continues to rise even without your assistance. Inside the chest, you see a beautiful shield with the head of a lion painted on it. As you grab the shield, the lion's tongue comes out and licks your affectionately.";
	otherwise:
		now permanent health of the dreamer is 1;  [Bypassing the damage system.]
		now health of the dreamer is 1;
		say "As you carefully open [the noun], the glow of gold and gems welcomes you. Filled with joy you throw open the lid -- and a demonic being with golden skin and glowing eyes jumps out and starts tearing you apart with its monstrous claws.[paragraph break][bold type]When you wake up, the wounds have not healed.[roman type][paragraph break]";
	wake the player up.
[

Chapter - Dream of the Rapier

[The rapier's description is "You took it from the body of the young Count of Poitier, that fateful night in Maurice's whorehouse. He would nevermore plot against you." That is what this dream is going to be about.]

Dream of the rapier is a dream.

The start the dream rule of dream of the rapier is the start dream of the rapier rule.

This is the start dream of the rapier rule:
	strip the dreamer;
	say "You had already noticed that Julian was tenser than usual, not his normal easy-going self. Well. We all have our off-days. But when you see him glancing towards the door, as if he's expecting someone to burst in, you realise what's going on. With a quick and silent movement, you get off of him. He opens his mouth as if to say something, but you clasp your hand over his face and whisper ...";
	now current question is "(What do you whisper to Julian?)";
	now current question menu is {"'One sound and I will break your neck. You know I can.'", "'Who has paid you?'", "'Keep grunting and panting.'"};
	ask a closed question, in menu mode.
	
Julian's room is a room. "Maurice's whorehouse isn't the most classy establishment in town, but it is the favourite of more adventurous pleasure seekers. Julian's bedroom is entirely draped in pink satin."
Julian's room is not placeable.

A menu question rule (this is the ordering Julian rule):
	if the current question is "(What do you say to Julian?)":
		let m be the number understood;
		if m is 1:
			say "";
		if m is 2:
			say "";
		if m is 3:
			say "";
		move the player to Julian's room;
		exit.]


Chapter - Dream of Sleeping

Dream of Sleeping is a dream. Dream of Sleeping is redreamable. The start the dream rule of Dream of Sleeping is the waking up into a dream rule.

This is the waking up into a dream rule:
	Say "Dark, churning nightmares suck you down into a troubled sleep. But at last the sun rises and the fears of the night slough away. You awake, glad that you are above ground and the torment is over.";
	Now the player is the untroubled sleeper;
	try looking.

Bedroom is a room. "Warm sunlight streams through the window and across your bed. Your chamber in the Inn is sparsely appointed, but provides all of the simple comforts you desire."

Bedroom is not placeable.

The bed is an enterable scenery supporter in Bedroom. "Your bed is large and exceedingly soft and piled high with warm blankets. It is so comfortable that it makes rising in the morning a daily challenge.". Understand "blanket/blankets/sheet/sheets" as the bed.

The untroubled sleeper is a person. "You are in your night-dress, comfortably tucked underneath the covers of your sumptuous bed. You're not really ready to get up." The untroubled sleeper is on the bed. The id of the untroubled sleeper is 15;

The bedroom window is scenery in the Bedroom. "The curtains are closed, but blindingly bright sunlight illuminates them from outside and casts a yellow glow around the room." Understand "curtains", "window", "sun", and "sunlight" as the bedroom window.

Instead of getting off the bed:
	say "You attempt to throw off the covers, but they are heavier than you anticipated. Your arms, too, are heavy, and so is your head. As you try again to lift yourself, you find that your eyes are not even open! You strain to open them, but you're not even sure these eyes are your own. At last, a voice calls you back to your own body. The voice is cold and cruel...";
	Let Malygris-woke be whether or not Malygris is asleep;
	let Malygris-moved be whether or not Malygris is not enclosed by dreamer-location;
	now Malygris is not asleep;
	move Malygris to dreamer-location;
	wake the player up;
	say "You awake, for real this time, to find Malygris standing over you[if Malygris-woke is true and malygris-moved is false]. He has woken up before you[end if], and he is [bold type]quite concentrated[roman type]. '[if Malygris-moved is true]Look who I found napping in my dungeon[otherwise]You seem to have drifted off in the middle of our contest[end if]!' he chuckles.";
	now the concentration of Malygris is 2;
	now the true body of the player is just-woken;

Instead of sleeping when the player is on the bed:
	say "You close your eyes again, postponing the cold of the outside for another moment's rest. But as you drift away, the nightmares return. Perhaps you had better get out of bed after all.";

Instead of waking the player when the player is on the bed:
	try waking up;

Instead of waking up when the player is on the bed:
	try getting off the bed.

Instead of waiting when the player is on the bed:
	try sleeping;

Kerkerkruip Dreams ends here.
