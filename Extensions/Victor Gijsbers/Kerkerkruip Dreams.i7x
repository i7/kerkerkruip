Kerkerkruip Dreams by Victor Gijsbers begins here.

Use authorial modesty.

Section - The dream kind

A scene can be dream. [A dream can be dreamt or undreamt. A dream is usually undreamt. [Dreamt once dream.]
A dream can be redreamable. A dream is usually not redreamable. [Redreamable dreams can be dreamt more than once.]]

Definition: a scene is dreamt rather than undreamt if it has happened.

Dreamable test boolean is a truth state that varies.

A scene has a rule called the dreamable rule.
The dreamable rule of a scene is usually the simple dreamable rule.

This is the simple dreamable rule:
	now dreamable test boolean is true.

Definition: a scene (called potential dream) is dreamable:
	if potential dream is not dream, decide on false;
	if potential dream is dreamt and potential dream is not recurring:
		decide on false;
	otherwise:
		consider dreamable rule of potential dream;
		decide on dreamable test boolean.

The selected dream is a scene that varies. 

Definition: a scene is ready to dream if the player is asleep and it is the selected dream.

Section - Special option for testing

A scene can be current-test-dream. [Make a dream current-test-dream for guaranteed dreaming of it. Best to make it recurring as well, or there may be trouble]
	
Section - Starting dreams

Every turn when the player is asleep:
	select a dream.
	
To decide which scene is the null dream: (- 0 -);

To select a dream:
	if at least one scene is current-test-dream:
		let item be a random current-test-dream scene;
		now the selected dream is item;
	otherwise:
		now the selected dream is a random dreamable scene;
		if the selected dream is the null dream:
			say "You sleep a dreamless sleep.";
			now the player is not asleep;

Dreamer-location is a room that varies.

First when a dream scene begins:
	now player is not asleep;
	now dreamer-location is the location;
	say "You are pulled towards a dream ...";
	wait for any key;
	clear the screen;
			
Last when a dream scene ends:
	wait for any key;
	clear the screen;
	repeat with guy running through asleep people in the location:
		if a random chance of 1 in 4 succeeds:
			now guy is not asleep;
	now the player is yourself;
	if the player is not in dreamer-location:
		move the player to dreamer-location;
	otherwise:
		try looking.

Section - Ending Dreams

[This mechanism only allows one dream at a time - no dreams within dreams]

Definition: a scene is over:
	if it is dream and it is not the selected dream, yes;
	no;

To wake the player up:
	Now the selected dream is the null dream;
	Follow the scene changing rules;

Chapter - Dream of Briar Roses

dream-of-briar-roses is a dream scene.

dream-of-briar-roses begins when dream-of-briar-roses is ready to dream. dream-of-briar-roses ends when dream-of-briar-roses is over.

When dream-of-briar-roses begins:
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
		end the game saying "You never abandoned your true love. Few people can say that.";
	otherwise:
		say "You must climb the roses. You must. What is life worth if a [if the player is male]man[otherwise if the player is female]woman[otherwise]being[end if] give's up the attempt to find [if the player is male]his[otherwise if the player is female]her[otherwise]its[end if] true love? So you start climbing. The thorns prick you, and soon blood trickles down your hands and arms. But you climb on ...[paragraph break]";
		decrease health of the player by 3;
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

dream-of-tungausy-shaman is a recurring dream scene. dream-of-tungausy-shaman begins when dream-of-tungausy-shaman is ready to dream. dream-of-tungausy-shaman ends when dream-of-tungausy-shaman is over.

When dream-of-tungausy-shaman begins:
	now player is the Tungausy warrior;
	try looking.

Before the meditation hut is a room. "Around you are the barren wastes of the Tungausy homeland. The sound of loud drum comes from the meditation hut. It sooths and enchants you."
Before the meditation hut is not placeable.

A person called the Tungausy warrior is in Before the meditation hut. The description of the tungausy warrior is "Your body is strong. Your spirit is even stronger.". The body score of the Tungausy warrior is 10. The spirit score of the Tungausy warrior is 15.

The barren wastes are scenery in Before the meditation hut. Understand "homeland" as the barren wastes. The description of the barren wastes is "A vast, barren landscape. The monotony is only broken by large rock formations in the distance."
The large rock formations are scenery in Before the meditation hut. The description of the large rock formations is "The gods created them to house the spirits of ancestors."
The soothing drums are scenery in Before the meditation hut. Understand "music" and "soothing" and "enchanting" and "sounds" and "drums" as the soothing drums. The description of the soothing drums is "The slow, monotonous sound of the drums eases your soul." Instead of listening to in Before the meditation hut: try examining the soothing drums.
A thing called the lodge is scenery in Before the meditation hut. Understand "hut" and "meditation hut" as the lodge. The description of the lodge is "The enticing smell of spicy herbs lures you to the hut."
The indigenous herbs are scenery in Before the meditation hut. The description of the indigenous herbs is "These herbs smell familiar. You have been here often." Instead of smelling in Before the meditation hut: try examining the indigenous herbs.

Instead of smelling the indigenous herbs:
	try examining the indigenous herbs instead.

Instead of going inside in Before the meditation hut:
	try going to the lodge.

Instead of entering the lodge:
	try going to the lodge instead.
	
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
			decrease body score of yourself by 5;
			increase spirit score of yourself by 5;
			say "You walk towards the shaman, knowing what you must sacrifice and what you will gain. 'I will give you my strength, in exchange for your spirit.' The shaman eagerly puts his hands on your biceps. His muscles grow beyond human proportion while yours shrink to nothing. He will now be able to defend the tribe in the Everlasting War, while you will join the ancestor spirits.[paragraph break][bold type]You have lost much of your bodily strength: -5 body. But you have sapped much of the shaman's spirit: +5 spirit.[roman type][paragraph break]";
			wake the player up;
		if m is 2:
			decrease spirit score of yourself by 5;
			increase body score of yourself by 5;
			say "You walk towards the shaman, knowing what you must sacrifice and what you will gain. 'I will give you my spirit, in exchange for your strength.' The shaman eagerly puts his hands on your breast. As he absorbs your spirit, you see your muscles growing beyond human proportions. You will now be able to defend the tribe in the Everlasting War, but you will never join the ancestor spirits.[paragraph break][bold type]You have lost your soul: -5 spirit. Your muscles have grown exceedingly strong: +5 body.[roman type][paragraph break]";
			wake the player up;
		exit.

Kerkerkruip Dreams ends here.
