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
		consider dreamable rule of potential dream;
		decide on dreamable test boolean.

A dream has a rule called the start the dream rule.

Section - Special option for testing

[But not "only for testing", because I reference it below.]

A dream can be current-test-dream. [Make a dream current-test-dream for guaranteed dreaming of it.]
	
Section - Starting dreams

Every turn when the player is asleep:
	do a dream.
	
Table of Candidate Dreams
Candidate
Dream of briar roses
with 20 blank rows
	
To do a dream:
	if at least one dream is current-test-dream:
		let item be a random current-test-dream dream;
		dream item;
	otherwise:
		blank out the whole of the Table of Candidate Dreams;
		repeat with item running through dreams:
			if item is dreamable:
				choose a blank row in Table of Candidate Dreams;
				now candidate entry is item;
		if number of filled rows in Table of Candidate Dreams is 0:
			say "You sleep a dreamless sleep.";
		otherwise:
			sort Table of Candidate Dreams in random order;
			choose row 1 in Table of Candidate Dreams;
			dream Candidate entry.

Dreamer-location is a room that varies.

To dream (item - a dream):
	now player is not asleep;
	now dreamer-location is the location;
	say "You are pulled towards a dream ...";
	wait for any key;
	clear the screen;
	consider start the dream rule of item.
			
To wake the player up:
	wait for any key;
	repeat with guy running through asleep people in the location:
		if a random chance of 1 in 4 succeeds:
			now guy is not asleep;
	now the player is not asleep;
	move the player to dreamer-location.

			

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


Kerkerkruip Dreams ends here.
