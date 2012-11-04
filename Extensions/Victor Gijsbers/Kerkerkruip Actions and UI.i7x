Kerkerkruip Actions and UI by Victor Gijsbers begins here.

Use authorial modesty.

Volume - Special actions

Chapter - Retreating


Section - Retreating action

Retreating is an action applying to nothing.
Understand "retreat" and "flee" as retreating.

A person can be a retreater. A person is usually not a retreater.

The retreat location is a room that varies. The retreat location is Entrance Hall.

[A resetting the dungeon rule (this is the reset retreating rule):
	now retreat location is Entrance Hall;
	now the player is not retreater.]

First carry out going (this is the set retreat location rule):
	now the retreat location is the location.

Check retreating (this is the cannot retreat when no retreat location rule):
	if the retreat location is nothing:
		take no time;
		say "There is nowhere to retreat to." instead.

Check retreating (this is the cannot retreat when in the retreat location rule):
	if the retreat location is the location:
		take no time;
		say "There is nowhere to retreat to." instead.
		
Check retreating when the combat status is peace (this is the cannot retreat when there are no enemies rule):
	say "There's nothing here to retreat from." instead.
		
Check an at-React pc retreating (this is the cannot retreat as reaction rule):
	take no time;
	say "You cannot retreat as a reaction--try to survive and run away on your own turn." instead.

Carry out retreating (this is the standard carry out retreat rule):
	now the player is retreater;
	let way be the best route from location to retreat location;
	try going way; [See going in combat below]
	now the player is not retreater.


Section - Allow the player a free retreat whenever he first enters a room

[We implement this by automatically having the player win initiative -- which is a nice thing to do anyway. But only the first time he enters a room!]

A room can be initiative-conferring. A room is usually initiative-conferring.

[A resetting the dungeon rule (this is the reset initiative-conferring rule):
	repeat with place running through rooms:
		now place is initiative-conferring.]

Initiative update rule (this is the player wins initiative first time in a room rule):
	if the location is initiative-conferring:
		increase the initiative of the player by 10;
		now the location is not initiative-conferring.


Section - Going in combat

Check going (this is the cannot go as a reaction rule):
	if the combat state of the player is at-React:
		take no time;
		say "You cannot move as a reaction--try to survive and move away on your own turn." instead.

Last check going (this is the treat going as retreat when possible rule):
	if the player is not retreater and the combat status is not peace:
		let way be the direction from location to retreat location;
		if noun is way:
			try retreating instead.



A person can be a runner. A person is usually not a runner.

Last check going (this is the going and retreating in combat rule):
	if the player is not hidden and the combat status is not peace:
		if player is retreater:
			unless forced-action is true:
				say "Deciding that discretion is the better part of valour, you bravely run away.";
			repeat with X running through alive persons in the location:
				if the player is alive and the player is not hidden:
					if X presses the player or the player presses X or the concentration of X is greater than 0:
						now X does not press the player;
						now the player does not press X;
						if the faction of X hates the faction of the player:
							unless X is non-attacker:
								try X hitting the player;
				now concentration of X is 0;
		otherwise:			
			unless forced-action is true:
				say "You decide to run past your enemies.";
			now the player is runner;
			repeat with X running through alive persons in the location:
				now X does not press the player;
				now the player does not press X;
				if the player is alive:
					if the faction of X hates the faction of the player:
						unless X is non-attacker:
							try X hitting the player;
				now concentration of X is 0;
		now the player is not runner;
		now the player is not retreater;				
		if the player is dead:
			do nothing instead;
		unless the player can move:
			do nothing instead.

Check looking when the player is dead:
	do nothing instead.
	

An attack modifier rule (this is the running is risky rule):
	if the global defender is a runner pc:
		say " + 4 (you are running)[run paragraph on]";
		increase the attack strength by 4.

A damage modifier rule (this is the running is very risky rule):
	if the global defender is a runner pc:
		say " + 2 (you are running)[run paragraph on]";
		increase the attack damage by 2.





Chapter - Going to

Going to is an action applying to one object.
Understand "go to [any visited room]" and "go [any visited room]" and "[any visited room]" as going to.
Understand "go to [any seen person]" and "go [any seen person]" and "[any seen person]" as going to.
[ Should we also allow going to things? ]

Null-Room is a room. "You should never see this text. That would be a BUG." Null-Room is not placeable.

The location-to-go is a room that varies. The location-to-go is Null-Room.

Check going to a room:
	if the noun is the location:
		take no time;
		say "You're already here." instead.
		
Check going to a thing:
	if the location of the noun is the location:
		take no time;
		say "[It-they]['s-'re] right here!" instead.

Definition: a room (called place) is safe if place is safe-1 and place is not nogo.
Definition: a room (called place) is safe-1 if the number of alive hater persons in place is 0 or place is the location or place is location-to-go. [We do not count the starting and end points.]

Definition: a person (called guy) is hater if the guy opposes the player.

Carry out going to a room:
	now location-to-go is the noun;
	let way be the best route from the location of player to the noun through visited safe rooms;
	unless way is a direction:
		take no time;
		say "You don't know how to go there safely." instead;
	try going way instead.

Carry out going to a thing:
	now location-to-go is the last-seen-location of the noun;
	let way be the best route from the location of player to location-to-go through visited safe rooms;
	unless way is a direction:
		take no time;
		say "You don't know a safe path towards [it-them]." instead;
	say "You last saw [the noun] in [the location-to-go], so you [one of]strike out[or]head[at random] towards there.";
	try going way instead;

Shorter going to is an action applying to nothing. Understand "go to" and "go on" as shorter going to.

Instead of shorter going to:
	if location-to-go is Null-Room:
		take no time;
		say "Unable to go automatically: you haven't provided a destination yet. Please use a command like 'go to Entrance Hall' or 'go to Malygris' first.";
	otherwise:
		try going to the location-to-go.

[And now, mapping the empty command to "go to". Not easy, we need an ugly I6 substitution.]

Include (- [ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
	sline1 = score; sline2 = turns;

	while (true) {
		! Save the start of the buffer, in case "oops" needs to restore it
		for (i=0 : i<64 : i++) oops_workspace->i = a_buffer->i;
	
		! In case of an array entry corruption that shouldn't happen, but would be
		! disastrous if it did:
		#Ifdef TARGET_ZCODE;
		a_buffer->0 = INPUT_BUFFER_LEN;
		a_table->0 = 15;  ! Allow to split input into this many words
		#Endif; ! TARGET_
	
		! Print the prompt, and read in the words and dictionary addresses
		PrintPrompt();
		DrawStatusLine();
		KeyboardPrimitive(a_buffer, a_table);
	
		! Set nw to the number of words
		#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
	
		! If the line was blank, get a fresh line
		!if (nw == 0) {
		!	@push etype; etype = BLANKLINE_PE;
		!	players_command = 100;
		!	BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) L__M(##Miscellany,10);
		!	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	@pull etype;
		!	continue;
		!}
	
		! Unless the opening word was OOPS, return
		! Conveniently, a_table-->1 is the first word on both the Z-machine and Glulx
	
		w = a_table-->1;
		if (w == OOPS1__WD or OOPS2__WD or OOPS3__WD) {
			if (oops_from == 0) { L__M(##Miscellany, 14); continue; }
			if (nw == 1) { L__M(##Miscellany, 15); continue; }
			if (nw > 2) { L__M(##Miscellany, 16); continue; }
		
			! So now we know: there was a previous mistake, and the player has
			! attempted to correct a single word of it.
		
			for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer2->i = a_buffer->i;
			#Ifdef TARGET_ZCODE;
			x1 = a_table->9;  ! Start of word following "oops"
			x2 = a_table->8;  ! Length of word following "oops"
			#Ifnot; ! TARGET_GLULX
			x1 = a_table-->6; ! Start of word following "oops"
			x2 = a_table-->5; ! Length of word following "oops"
			#Endif; ! TARGET_
		
			! Repair the buffer to the text that was in it before the "oops"
			! was typed:
			for (i=0 : i<64 : i++) a_buffer->i = oops_workspace->i;
			VM_Tokenise(a_buffer,a_table);
		
			! Work out the position in the buffer of the word to be corrected:
			#Ifdef TARGET_ZCODE;
			w = a_table->(4*oops_from + 1); ! Start of word to go
			w2 = a_table->(4*oops_from);    ! Length of word to go
			#Ifnot; ! TARGET_GLULX
			w = a_table-->(3*oops_from);      ! Start of word to go
			w2 = a_table-->(3*oops_from - 1); ! Length of word to go
			#Endif; ! TARGET_
		
			! Write spaces over the word to be corrected:
			for (i=0 : i<w2 : i++) a_buffer->(i+w) = ' ';
		
			if (w2 < x2) {
				! If the replacement is longer than the original, move up...
				for (i=INPUT_BUFFER_LEN-1 : i>=w+x2 : i-- )
					a_buffer->i = a_buffer->(i-x2+w2);

				! ...increasing buffer size accordingly.
				#Ifdef TARGET_ZCODE;
				a_buffer->1 = (a_buffer->1) + (x2-w2);
				#Ifnot; ! TARGET_GLULX
				a_buffer-->0 = (a_buffer-->0) + (x2-w2);
				#Endif; ! TARGET_
			}
		
			! Write the correction in:
			for (i=0 : i<x2 : i++) a_buffer->(i+w) = buffer2->(i+x1);
		
			VM_Tokenise(a_buffer, a_table);
			#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
		
			return nw;
		}

		! Undo handling
	
		if ((w == UNDO1__WD or UNDO2__WD or UNDO3__WD) && (nw==1)) {
			Perform_Undo();
			continue;
		}
		i = VM_Save_Undo();
		#ifdef PREVENT_UNDO; undo_flag = 0; #endif;
		#ifndef PREVENT_UNDO; undo_flag = 2; #endif;
		if (i == -1) undo_flag = 0;
		if (i == 0) undo_flag = 1;
		if (i == 2) {
			VM_RestoreWindowColours();
			VM_Style(SUBHEADER_VMSTY);
			SL_Location(); print "^";
			! print (name) location, "^";
			VM_Style(NORMAL_VMSTY);
			L__M(##Miscellany, 13);
			continue;
		}
		return nw;
	}
]; -) instead of "Reading the Command" in "Parser.i6t".

After reading a command (this is the blank line is go to rule):
	let T be indexed text;
	now T is the player's command;
	if T is "", change the text of the player's command to "go to".

[Finally, we want to empty the go-to location once we have reached it.]

Last report going (this is the check whether destination reached rule):
	if the location is the location-to-go:
		now the location-to-go is Null-Room.


Chapter - Status

Asking status is an action out of world. Understand "status" and "stat" and "stats" as asking status.

Carry out asking status:
	say "[bold type]Health[roman type]: [health of the player] of [permanent health of the player][line break][run paragraph on]";
	say "[bold type]Attack[roman type]: [melee of the player][line break][run paragraph on]";
	say "[bold type]Defence[roman type]: [defence of the player][line break][run paragraph on]";
	let fb be final body of the player;
	let bb be fb - body score of the player;
	let fm be final mind of the player;
	let mb be fm - mind score of the player;
	let fs be final spirit of the player;
	let sb be fs - spirit score of the player;	
	say "[bold type]Body[roman type]: [run paragraph on][fb][if fb is greater than body score of the player] ([body score of the player] inherent + [bb] bonus)[end if][if fb is less than body score of the player] ([body score of the player] inherent - [bb * -1] penalty)[end if][line break][run paragraph on]";
	say "[bold type]Mind[roman type]: [run paragraph on][fm][if fm is greater than mind score of the player] ([mind score of the player] inherent + [mb] bonus)[end if][if fm is less than mind score of the player] ([mind score of the player] inherent - [mb * -1] penalty)[end if][line break][run paragraph on]";
	say "[bold type]Spirit[roman type]: [run paragraph on][fs][if fs is greater than spirit score of the player] ([spirit score of the player] inherent + [sb] bonus)[end if][if fs is less than spirit score of the player] ([spirit score of the player] inherent - [sb * -1] penalty)[end if][line break][run paragraph on]";
	consider the status rules;
	consider the status skill rules;
	say "[line break][run paragraph on]".
	
The status rules are a rulebook.
The status skill rules are a rulebook.

Status rule (this is the status concentration rule):
	if concentration of the player is not 0:
		let n be concentration of the player;
		say "[bold type]Concentration[roman type]: [if n is 1]+2[else if n is 2]+4[else if n is 3]+8[end if] attack bonus, [if n is 1]no[else if n is 2]+2[else if n is 3]+4[end if] damage bonus[line break][run paragraph on]";

Status rule (this is the status tension rule):
	if tension is greater than 1:
		say "[bold type]Tension[roman type]: +[tension divided by 2] attack bonus, +[tension divided by 3] damage bonus[line break][run paragraph on]";




Chapter - Monster information

Last carry out examining a person:
	unless the noun is the player:
		say "[The noun] is [if level of the noun is not 0]a level [level of the noun in words] [type of the noun] [interesting faction of the noun] creature[otherwise if the group level of the noun is not 0]part of a level [group level of the noun in words] group, [type of the noun], and [interesting faction of the noun][otherwise]a levelless [type of the noun] [interesting faction of the noun] creature[end if].[run paragraph on]";
		if the number of things carried by the noun is greater than 0:
			say " [The noun] carries [a list of things carried by the noun].[run paragraph on]"; 	
		if the number of things worn by the noun is greater than 0:
			say " [The noun] wears [a list of things worn by the noun].[run paragraph on]"; 				
		say "[paragraph break]".
		
To say interesting faction of (guy - a person):
	say "[if faction of the player hates faction of guy and the guy is not enslaved and guy is not insane]hostile[otherwise if the guy is enslaved]enslaved[otherwise if the guy is insane]insane[otherwise]friendly[end if][run paragraph on]".



Section - Memory

Remembering is an action out of world. Understand "memory" and "remember" and "r" as remembering.

Carry out remembering:
	if the number of unvisited placed placeable not nogo rooms is zero:
		say "All locations have been explored.";
	otherwise:
		say "You have not yet explored:[line break]";
		repeat with place running through placed unvisited not nogo rooms:
			repeat with further place running through placed visited rooms:
				if absolute distance between place and further place is 1:
					repeat with way running through cardinal directions:
						if place is the room the way of further place:
							say " - the [way] exit of [the further place] ([if further place is not the location]which lies [the road to further place] from here[otherwise]where you currently are[end if])[line break]";
	say "[line break]You have visited the following rooms: ";
	let m be the number of visited rooms minus the number of visited tunnels;
	[ Sort the rooms in alphabetical order ]
	[let R be the list of visited rooms;
	sort R in printed name order;
	repeat with X running through R:]
	repeat with X running through visited rooms:
		unless X is a tunnel:
			say "[X] ([the road to X])[run paragraph on]";
			decrease m by 1;
			if m is greater than 0:
				say ", ";
			otherwise:
				say ".";
	if at least two seen persons are alive: [because one of them is the player]
		say "[line break]You have seen the following creatures in these locations:[line break]";
		repeat with guy running through alive seen persons:
			unless player is guy:
				unless last-seen-location of guy is Null-Room:
					say "- [italic type][the guy][roman type] (level [if group level of the guy is not 0][group level of the guy][otherwise][level of the guy][end if]) in [italic type][last-seen-location of the guy][roman type] ([if last-seen-location of the guy is not the location]which lies [the road to last-seen-location of the guy] from here[otherwise]where you currently are[end if])[line break]";
	say "[line break][italic type]Tip[roman type]: [one of]additional information can be gotten with 'status', 'trophies' and (once you have defeated enough monsters) 'sense'[or]you can move one room towards a location by typing 'go to [italic type]location[roman type]'[or]you can 'pray' in any temple[or]'look', 'examine' and 'inventory' are free actions, so use them often[or]if a fight proves too much for you, try to 'retreat'. On entering a room for the first time, you can always retreat for free[or]remember how powers work. If you kill a level 3 creature, you will lose all powers of level 3 and lower; so if you want to have more than one power at the same time, you'll have to kill a lower level creature after defeating a higher level creature[at random].".

A person has a room called the last-seen-location. The last-seen-location of a person is usually Null-Room.

[Even acting fast?? TODO - Victor, is this rule right?]
[Victor: yes, it is right: this should be an "even acting fast" rule, i.e., a rule that happens evens when we skip the every turn rules. I have re-added the even acting fast logic to ATTACK (where you stripped it away).]
[I'm going to try "every turn", but I'm pretty sure this will lead to bugs.]

Every turn (this is the set last-seen-location rule):
	repeat with guy running through alive persons in the location:
		now last-seen-location of guy is the location.

A teleportation event rule (this is the reset last-seen-location after some teleports rule):
	if teleportation-guy is not the player:
		if teleportation-from is the location of the player:
			if teleportation-destination is not the location of the player:
				now last-seen-location of teleportation-guy is Null-Room.

To say the road to (place - a room):
	if place is location of the player:
		say "here[run paragraph on]";
	otherwise:
		let Y be the best route from the location of player to place through visited rooms;
		if Y is a direction:
			say "[Y][run paragraph on]";
		otherwise:
			say "no known path[run paragraph on]".




Section - Sensing

Sensing is an action applying to nothing. Understand "sense" as sensing.

[Sensing is acting fast.] [This makes the demon assassin a lot more fun, because you now have to decide whether or not you want to sense Malygris often.]

Carry out sensing:
	if greatest power of the player is less than 3:
		take no time;
		say "You are not yet powerful enough to magically sense anything.";
	if greatest power of the player is greater than 2:
		let the way be the best route from the location of player to the location of Malygris;
		if way is a direction:
			say "You feel that the shortest route towards Malygris lies [way].[line break]";
		otherwise:
			if the location of the player is the location of Malygris:
				say "Malygris is right here.[line break]";
			otherwise:
				say "There seems to be no available route towards Malygris.[line break]";
	if greatest power of the player is greater than 3:
		repeat with item running through not off-stage epic things:
			if location of item is not location of the player and location of item is placed:
				let the way be the best route from the location of player to the location of item;
				if way is a direction:
					say "[line break]You sense an epic artefact that can be found by going [way] from here.[line break]";
				otherwise:
					say "[line break]You sense an epic artefact that is currently unreachable, but lies somewhere [general direction from location of the player to location of the item].[line break]".

To say general direction from (place1 - a room) to (place2 - a room):
	let K be a list of directions;
	if x-coordinate of place1 is less than x-coordinate of place2:
		add north to K;
	if x-coordinate of place1 is greater than x-coordinate of place2:
		add south to K;
	if y-coordinate of place1 is less than y-coordinate of place2:
		add east to K;
	if y-coordinate of place1 is greater than y-coordinate of place2:
		add west to K;
	if z-coordinate of place1 is less than z-coordinate of place2:
		add up to K;
	if z-coordinate of place1 is greater than z-coordinate of place2:
		add down to K;
	say "[K]".


Chapter - Trophy list

Trophylisting is an action out of world.

Understand "trophy" and "trophies" and "list trophies" as trophylisting.

Carry out trophylisting:
	if the number of dead persons is 0:
		say "Nobody has died yet.";
	otherwise:
		say "The following creatures have been vanquished:";
		repeat with guy running through dead seen persons:
			say "[line break]- [italic type][the name of the guy][roman type] (level [if group level of the guy is not 0][group level of the guy][otherwise][level of the guy][end if])";
		say "[paragraph break]".

Chapter - Commands command

Showing commands is an action out of world.

Understand "commands" and "show commands" as showing commands.
	
Carry out showing commands:
		say "The most important special commands in [italic type]Kerkerkruip[roman type] are: attack (a), parry (p), dodge (do), concentrate (c), status, remember (r), sense, pray, equip, go to. Some of the standard interactive fiction commands are: look (l), inventory (i), go, take, drop, wear, take off, read, put A in B.".

Chapter - Praying

Praying is an action applying to nothing. Understand "pray" and "pr" as praying.

Carry out praying:
	increase detection probability by 50.

Carry out praying:
	say "You send a quick prayer to the [one of]Maiden[or]Crone[or]Knight[or]Smith[at random], but you're afraid your gods are too young to have power here.".




Chapter - Jumping in a direction

Direction-jumping is an action applying to one object. Understand "jump [direction]" as direction-jumping.

Carry out direction-jumping:
	say "You hop around.".


Chapter - Equipping

Equipping is an action applying to one thing. Understand "equip [something]" as equipping.

Check equipping:
	if the noun is not a weapon and the noun is not clothing:
		take no time;
		say "You can only equip weapons and clothing.".

Carry out equipping a weapon:
	try readying the noun instead.

Carry out equipping clothing:
	try wearing the noun instead.


Chapter - More synonyms

Understand "jump in [something]" as entering.
Understand "jump into [something]" as entering.
Understand "throw [something] in [something]" as inserting it into.
Understand "throw [something] into [something]" as inserting it into.
Understand "drop [something] in [something]" as inserting it into.

Understand "use [clothing]" as wearing.
Understand "use [scroll]" as reading.
Understand "use [grenade]" as throwing.
Understand "use [fungicide contraption]" as spraying.

Understand "activate [something]" as switching on.
Understand "deactivate [something]" as switching off.

Chapter - New standard responses

The description of yourself is "[if greatest power of the player is 0]You have fought many men and quite a few women, but fighting Malygris is something else. Your hairs are raised on end, and your body quivers with fear[otherwise if greatest power of the player is 1]Your victory, though small, has given you a little confidence. Perhaps you can survive long enough to escape this dungeon[otherwise if greatest power of the player is 2]This is going better than expected. Could it be that Malygris is not as invulnerable as you used to believe? You dare not yet hope[otherwise if greatest power of the player is 3]Flushed with success, you go boldly through the dungeon[otherwise if greatest power of the player is 4]History will remember you as one of the greatest of warriors! If you kill Malygris and manage to find a historian, that is[end if].".

When play begins:
	let X be a random natural weapon part of yourself;
	now printed name of X is "your fists".

Instead of singing:
	say "You hum a battle hymn.".




Chapter - Talking

Talking to is an action applying to one thing. Understand "talk to [person]" and "speak to [person]" and "boast" as talking to.

Instead of answering that:
	say "You enjoy an idle boast as much as the next person, but this is hardly the time for an in-depth conversation.".

Instead of telling about:
	say "You enjoy an idle boast as much as the next person, but this is hardly the time for an in-depth conversation.".

Instead of asking about:
	say "You enjoy an idle boast as much as the next person, but this is hardly the time for an in-depth conversation.".

Instead of asking something for:
	say "You enjoy an idle boast as much as the next person, but this is hardly the time for an in-depth conversation.".

Report talking to:
	say "'[one of]I'll get back at the prince.[or]I will defeat all my enemies![or]I am immortal.[or]Pride cometh before the fall.[at random]', you say[if the player is hidden], revealing your presence[end if].[run paragraph on][line break][paragraph break]";
	now the player is not hidden.



Chapter - Reading

Reading is an action applying to one thing. Understand the command "read" as something new. Understand "read [thing]" as reading.
A thing can be readable.
Does the player mean reading a readable thing: it is likely.

Check reading a not readable thing (this is the can only read readable things rule):
	take no time;
	say "You cannot read that." instead.

Check reading when the player is blind (this is the cannot read when blind rule):
	take no time;
	say "[The noun] has not been written in braille." instead.





Chapter - Replacing "You can see" is not a joke

[All this just because the player can be blind... and it probably stops working in the next release of Inform.]

The you-can-also-see rule is not listed in any rulebook.

For printing the locale description (this is the alternative-you-can-also-see rule):
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		[say "[notable-object entry] - [locale description priority entry].";]
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity:
				if the domain is a room:
					if the domain is the location, say "You ";
					otherwise say "In [the domain] you ";
				otherwise if the domain is a supporter:
					say "On [the domain] you ";
				otherwise if the domain is an animal:
					say "On [the domain] you ";
				otherwise:
					say "In [the domain] you ";
				say "can [if the locale paragraph count is greater than 0]also [end if][run paragraph on][unless player is blind][run paragraph on]see[otherwise]feel[end if] ";
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing,
					list the contents of the common holder, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
				otherwise say "[a list of marked for listing things including contents]";
				if the domain is the location, say " here";
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.


Chapter - Layout

Section - Status bar

Include Basic Screen Effects by Emily Short.

Table of Fancy Status
left	central	right
"[bold type][location of the player][roman type]"	"Tension: [tension]"	"Health: [health of the player]/[permanent health of the player]"
"Special powers: [powers of the player]"

Rule for constructing the status line:
	fill status bar with Table of Fancy Status;
	rule succeeds. 

To say powers of the player:
	let n be 0;
	repeat with stuff running through powers:
		if stuff is granted:
			unless command text of stuff is "":
				say "[if n is 1], [end if][command text of stuff][run paragraph on]";
				now n is 1;
	if n is 0:
		say "none".


Section - Inventory

The print empty inventory rule is not listed in any rulebook.
The print standard inventory rule is not listed in any rulebook.

Carry out taking inventory: 
	take no time;
	if the number of things had by the player is 0, say "You are empty-handed." instead; 
	unless the number of weapons enclosed by the player is the number of natural weapons enclosed by the player:
		say "You are carrying[line break][italic type]-weapons[roman type]: [line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all weapons enclosed by the player are marked for listing; 
		now all natural weapons enclosed by the player are unmarked for listing;
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
	unless the number of clothing enclosed by the player is 0:
		say "[italic type]-clothing[roman type]:[line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all clothing enclosed by the player are marked for listing; 
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
	unless the number of scrolls enclosed by the player is 0:
		say "[italic type]-scrolls[roman type]:[line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all scrolls enclosed by the player are marked for listing; 
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
	unless the number of grenades enclosed by the player is 0:
		say "[italic type]-grenades[roman type]:[line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all grenades enclosed by the player are marked for listing; 
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
	let m be the number of things enclosed by the player;
	decrease m by the number of weapons enclosed by the player;
	decrease m by the number of clothing enclosed by the player;
	decrease m by the number of scrolls enclosed by the player;
	decrease m by the number of grenades enclosed by the player;			
	unless m is 0:
		say "[italic type]-other[roman type]:[line break]";
		now all things enclosed by the player are marked for listing; 
		now all weapons enclosed by the player are unmarked for listing; 		
		now all clothing enclosed by the player are unmarked for listing; 
		now all scrolls enclosed by the player are unmarked for listing; 
		now all grenades enclosed by the player are unmarked for listing; 				
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only.
		
Section - Andrew Plotkin's mini list extension

List-membership relates a thing (called T) to a list of things (called L) when T is listed in L.

The verb to list-inhabit (it list-inhabits, they list-inhabit) implies the list-membership relation.
		
[And now we can say "a list of things that list-inhabit named-list".]
		
		
Chapter - Map-related actions and commands

Section - Showing the entrances

Report looking:
	let count be 0;
	repeat with way running through direction:
		let further place be the room the way from the location;
		if further place is a room and further place is not nogo:
			increase count by 1;
	if count is not 0:
		if count is 1:
			repeat with way running through direction:
				let further place be the room the way from the location;
				if further place is a room and further place is not nogo:
					say "An exit leads [way][if further place is visited] (to [further place])[end if].";
		otherwise:
			say "Exits lead ";
			repeat with way running through direction:
				let further place be the room the way from the location;
				if further place is a room and further place is not nogo:
					if count is greater than 1:
						say "[way][if further place is visited] (to [further place])[end if][if count is greater than 2],[end if] ";
						decrease count by 1;
					otherwise:
						say "and [way][if further place is visited] (to [further place])[end if].".
	







Chapter - Helping testers

Understand "* [text]" as a mistake ("(Your [if a random chance of 1 in 20 succeeds]wise [otherwise if a random chance of 1 in 50 succeeds]incredibly useful [end if]comment has been recorded[take no time].)").




Chapter - Test commands - Not for release

[When play begins, seed the random-number generator with 1081.]

Section - I still need em



Plunking is an action applying to one thing.
Understand "plunk [something]" as plunking.

Carry out plunking:
	say "You plunk [the noun].";
	now the health of the noun is -5.

Plonking is an action applying to nothing.
Understand "plonk" as plonking.

Carry out plonking:
	say "These fools are no match for you!";
	repeat with X running through all alive persons enclosed by the location:
		if the faction of the player hates the faction of X:
			now the health of X is -5.

Ramboing is an action applying to nothing. Understand "rambo" as ramboing.

Carry out ramboing:
	say "RAMBO!";
	now permanent health of the player is 100;
	now health of the player is 100;
	now melee of the player is 100;
	now damage die of gilded rapier is 100.


Meatboying is an action applying to nothing. Understand "meatboy" as meatboying.

Carry out meatboying:
	say "Meatboy!";
	now health of the player is 1000.


Reducing is an action applying to one thing. Understand "reduce [person]" as reducing.

Carry out reducing:
	say "Set to 1 HP.";
	now health of the noun is 1.

Winning is an action applying to nothing. Understand "win" as winning.

Carry out winning:
	say "Sure.";
	now health of Malygris is -2.


Section - Miscellaneous tests

Testreadying is an action applying to nothing. Understand "testready" as testreadying.

Carry out testreadying:
	repeat with guy running through not off-stage persons:
		let item be a random readied weapon enclosed by guy;
		say "[guy] - [item][line break]".

Section - Unlock Table

Table of Unlocks
stuff		unllevel
(an object)	(a number)
with 200 blank rows

Unlocktabling is an action applying to nothing. Understand "showunlock" as unlocktabling.

Carry out unlocktabling:
	let X be a list of objects; [We cannot repeat through objects, so:]
	repeat with Y running through rooms:
		if Y is unlockable:
			add Y to X;
	repeat with Y running through persons:
		if Y is unlockable:
			add Y to X;
	repeat with Y running through things:
		if Y is not a person:
			if Y is unlockable:
				add Y to X;
	repeat with item running through X:
		choose a blank row in Table of Unlocks;
		now stuff entry is item;
		now unllevel entry is unlock level of item;
	sort Table of Unlocks in unllevel order;
	repeat through Table of Unlocks:
		say "[unllevel entry]: [stuff entry] ([if unlock hidden switch of stuff entry is false][unlock text of stuff entry][otherwise]hidden[end if])[line break]".


Kerkerkruip Actions and UI ends here.
