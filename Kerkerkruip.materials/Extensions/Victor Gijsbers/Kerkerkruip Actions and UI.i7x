Kerkerkruip Actions and UI by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - New cosmetic verbs

[For Inform to conjugate.]

To squash is a verb.
To ready is a verb.
To fly is a verb.
To crash is a verb.
To attack is a verb.
To receive is a verb.
To remain is a verb.
To fail is a verb.
To succeed is a verb.
To avoid is a verb.
To step is a verb.
To plunge is a verb.

Volume - Special actions

Chapter - Retreating


Section - Retreating action

Retreating is an action applying to nothing.
Understand "retreat" and "flee" and "run away" as retreating.

A person can be a retreater. A person is usually not a retreater.

The retreat location is a room that varies. The retreat location is the entrance hall.

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
	take no time;
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

Last check going (this is the going and retreating during combat rule):
	let current-location be the location;
	if the player is not hidden and the combat status is not peace:
		if player is retreater:
			unless forced-action is true:
				say "[if all enemies are asleep]You sneak back[otherwise]Deciding that discretion is the better part of valour, you bravely run away[end if].";
		otherwise:			
			unless forced-action is true:
				say "[if all enemies are asleep]You sneak past your enemies[otherwise]You decide to run past your enemies[end if].";
			now the player is runner;
		extract the player from combat, giving enemies a chance to hit;
		now the player is not runner;
		now the player is not retreater;				
		if the player is not mobile:
			do nothing instead;
		if location is not current-location:
			do nothing instead. [Something has changed the location, and we shouldn't do the move. For example, being mazed by the minotaur while retreating.]

Check looking when the player is dead:
	do nothing instead.

An attack modifier rule (this is the running is risky rule):
	if the global defender is a runner pc:
		say " + 3 (you are running)[run paragraph on]";
		increase the attack strength by 3.

An add specific damage rule (this is the running is very risky rule):
	if damage-by-hitting is true:
		if the victim is a runner pc:
			add 1 points of damage with reason "you are running".





Chapter - Going to

Going to is an action applying to one object.
Understand "go to [any visited room]" and "go [any visited room]" and "[any visited room]" as going to.
Understand "go to [any seen person]" and "go [any seen person]" and "[any seen person]" as going to.

Going to is bypassing-scope.

Does the player mean going to a not alive person: it is unlikely.
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
		say "[They]['re] right here!" instead.

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
		say "You don't know a safe path towards [regarding the noun][them]." instead;
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
		!	if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) {
		!		PARSER_ERROR_INTERNAL_RM('X', noun); new_line;
		!	}
		!	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	@pull etype;
		!	continue;
		!}
	
		! Unless the opening word was OOPS, return
		! Conveniently, a_table-->1 is the first word on both the Z-machine and Glulx
	
		w = a_table-->1;
		if (w == OOPS1__WD or OOPS2__WD or OOPS3__WD) {
			if (oops_from == 0) { PARSER_COMMAND_INTERNAL_RM('A'); new_line; continue; }
			if (nw == 1) { PARSER_COMMAND_INTERNAL_RM('B'); new_line; continue; }
			if (nw > 2) { PARSER_COMMAND_INTERNAL_RM('C'); new_line; continue; }
		
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
			IMMEDIATELY_UNDO_RM('E'); new_line;
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

Chapter - Extended Waiting

[This is an anti-grinding convenience, mainly so the player doesn't have to type "z" 15 times when they get a flash grenade thrown back at them or get stunned]

Intended wait-time is a number that varies.
Actual wait-time is a number that varies.

Before doing anything other than waiting (this is the normal actions interrupt waiting rule):
	now intended wait-time is 0.
	
Before printing a parser error (this is the typos interrupt waiting rule):
	now intended wait-time is 0.

After taking a player action (this is the all out of world actions interrupt waiting rule):
	if the meta flag is true:
		now intended wait-time is 0.

Last check waiting (this is the check for extended wait rule):
	unless the combat status is peace:
		now intended wait-time is 0;
		make no decision;
	if intended wait-time < 1:
		now intended wait-time is 1;
		make no decision;
	Now intended wait-time is intended wait-time * 2;
	say "You settle in for a longer wait...";
	While actual wait-time < intended wait-time:
		Carry out the extended waiting activity;
	if the player is dead:
		make no decision;
	otherwise if intended wait-time is 0:
		say "You stop waiting after [actual wait-time] turn[s].";
	otherwise:
		say "[actual wait-time] turns pass uneventfully.";
	Now actual wait-time is 0;
	take no [more] time;
	stop the action.
	
Extended waiting is an activity.

For extended waiting (this is the time passes silently during extended waiting rule):
	follow the every turn rules;
	follow the advance time rule.

After extended waiting (this is the mark extended time rule):
	increment actual wait-time;

After extended waiting (this is the stop waiting in combat rule):
	update the combat status; [should be safe if we started off at peace]
	if the combat status is combat:
		now intended wait-time is 0.
		
After extended waiting (this is the stop waiting for nomos bonus rule):
	if the nomos bonus is true and the nomos attacker is conscious in this world:
		now intended wait-time is 0.

After extended waiting (this is the stop waiting when dead rule):
	if the player is dead:
		now intended wait-time is 0.

An after damage rule (this is the any damage stops waiting rule):
	now intended wait-time is 0.
		
[TODO: stop when the armadillo eats?]

Actionable development is a kind of value. Some actionable developments are vision development, stun development, rust development, smoke development, health development, betrayal development, possessions development, occupancy development.

An actionable development has a number called the previous state.
To decide what number is the current state of (event - an actionable development): decide on 0.

To decide what number is the current state of (event - vision development):
	if the player is perceptive, decide on 1. [default 0]
	
To decide what number is the current state of (event - stun development):
	if the player is stunned, decide on 1.

To decide what number is the current state of (event - rust development):
	if the location is rust-spored, decide on 1 + the number of rusted things enclosed by the location.
	
To decide what number is the current state of (event - smoke development):
	decide on the smoke penalty of the location.

To decide what number is the current state of (event - health development):
	decide on the health of the player + (the permanent health of the player * 100);

To decide what number is the current state of (event - betrayal development):
	if vecna-betraying is true, decide on 1.

To decide what number is the current state of (event - possessions development):
	[catches things that were dropped from the player to the location]
	decide on the number of things enclosed by the player.

To decide what number is the current state of (event - occupancy development):
	decide on the number of things enclosed by the location.
	
Before extended waiting (this is the check initial state of actionable developments rule):
	Repeat with event running through actionable developments:
		now the previous state of event is the current state of event.
		
Last after extended waiting (this is the stop waiting if any actionable development takes effect rule):
	if the intended wait-time is not 0:
		Repeat with event running through actionable developments:
			if the previous state of event is not the current state of event:
				now intended wait-time is 0;
				make no decision.

Chapter - Status

Asking status is an action out of world. Understand "status" and "stat" and "stats" as asking status.

Carry out asking status (this is the show basic stats rule):
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

Carry out asking status:
	follow the status combat stats rules;
	follow the status attribute rules;
	follow the status skill rules;
	say "[line break][run paragraph on]".
	
The status combat stats rules are a rulebook.
The status attribute rules are a rulebook.
The status skill rules are a rulebook.
Long status is a truth state variable. Long status is true.

Status combat stats rule (this is the status concentration rule):
	if concentration of the player is not 0:
		let n be concentration of the player;
		if long status is true:
			say "[bold type]Concentration[roman type]: [if n is 1]+2[else if n is 2]+4[else if n is 3]+8[end if] attack bonus, [if n is 1]no[else if n is 2]+2[else if n is 3]+4[end if] damage bonus[line break][run paragraph on]";
		otherwise:
			say "[bold type]Concentration[roman type]: [if n is 1]+2[else if n is 2]+4[else if n is 3]+8[end if] attack, [if n is 1]no[else if n is 2]+2[else if n is 3]+4[end if] damage[line break][run paragraph on]";

Status combat stats rule (this is the status flow rule):
	if offensive flow of the player is not 0:
		let n be offensive flow of the player;
		if long status is true:
			say "[bold type]Offensive flow[roman type]: +[n] attack, +[n] damage[line break][run paragraph on]";
		otherwise:
			say "[bold type]Offensive flow[roman type]: +[n] attack, +[n] damage[line break][run paragraph on]";
	if defensive flow of the player is not 0:
		let n be defensive flow of the player;
		if long status is true:
			say "[bold type]Defensive flow[roman type]: +[n] defence[line break][run paragraph on]";
		otherwise:
			say "[bold type]Defensive flow[roman type]: +[n] defence[line break][run paragraph on]";	

Status combat stats rule (this is the status tension rule):
	if tension is greater than 1:
		if long status is true:
			say "[bold type]Tension[roman type]: +[tension divided by 2] attack bonus, +[tension divided by 3] damage bonus[line break][run paragraph on]";
		otherwise:
			say "[bold type]Tension[roman type]: +[tension divided by 2] attack, +[tension divided by 3] damage[line break][run paragraph on]";




Chapter - Monster information

Last carry out examining a person:
	unless the noun is the player:
		say "[The noun] [are] [if level of the noun is not 0]a level [level of the noun in words] [creature-type of the noun] [interesting faction of the noun] creature[otherwise]a levelless [creature-type of the noun] [interesting faction of the noun] creature[end if].[run paragraph on]";
		if (noun is group leading or noun is grouper) and level of noun is not 0:
			let guy be noun;
			if noun is not group leading:
				[this is inconsistent with other phrases - do we really want group leading
				to have a meaning independent from the accompaniment relation?]
				now guy is the leader of the noun;
			if guy is not defeated individually:
				let lijst be a list of people;
				add guy to lijst;
				repeat with F running through the people who accompany guy:
					add F to lijst;
				say " (For purposes of power absorption, a single group is formed by [lijst with definite articles].)[run paragraph on]";
		if the number of things carried by the noun is greater than 0:
			say " [The noun] carries [a list of things carried by the noun].[run paragraph on]"; 	
		if the number of things worn by the noun is greater than 0:
			say " [The noun] wears [a list of things worn by the noun].[run paragraph on]";
		let item be the current weapon of the noun;
		if item is a natural weapon:
			say " [The noun] [attack] using [item]: 1d[damage die of item] + [weapon damage bonus of the item] damage; [if weapon attack bonus of the item is less than 0]-[otherwise]+[end if][absolute value of weapon attack bonus of the item] attack modifier[if the item is ranged]; ranged[end if][natural parry and dodge info of the item][if the item is silver]; good against undead and demons[end if][special weapon info of the item][roman type].[run paragraph on]";
		otherwise:
			say " [The noun] [attack] using [the item].[run paragraph on]";
		say "[paragraph break][The noun] [have] [concentration of the noun] concentration, [offensive flow of the noun] offensive flow, and [defensive flow of the noun] defensive flow. [The noun] [are] of [size of the noun] size, and [have] [health of the noun] of [permanent health of the noun] health left.[run paragraph on]" ;
		say "[paragraph break]".
		
To say natural parry and dodge info of (item - a weapon):
	say "; getting a [parry-with bonus of item] bonus when parrying with [regarding item][them]; others get a [parry-against bonus of item] bonus when parrying, and a [dodge bonus of item] bonus when dodging against [regarding item][them][run paragraph on]".		
		
To say interesting faction of (guy - a person):
	say "[if faction of the player hates faction of guy and the guy is not enslaved and guy is not insane]hostile[otherwise if the guy is enslaved]enslaved[otherwise if the guy is insane]insane[otherwise]friendly[end if][run paragraph on]".



Section - Memory

Remembering is an action out of world. Understand "memory" and "remember" and "r" as remembering.

Check remembering:
	if the player is not denizen:
		take no time;
		say "You're not in the main Kerkerkruip dungeon right now." instead.

Carry out remembering:
	let n be 0;
	repeat with place running through unvisited not nogo rooms:
		repeat with further place running through placed visited rooms:
			if absolute distance between place and further place is 1:
				repeat with way running through cardinal directions:
					if place is the room the way of further place:
						now n is 1;
	if n is 0:
		say "All locations have been explored. [Map description]";
	otherwise:
		if the mapping boolean is true:
			say "[Map description]";
		say "You have not yet explored:[line break]";
		repeat with place running through unvisited not nogo rooms:
			repeat with further place running through placed visited rooms:
				if absolute distance between place and further place is 1:
					repeat with way running through cardinal directions:
						if place is the room the way of further place:
							say " - the [way] exit of [place-memory of the further place][line break]";
	say "[line break]You have visited the following rooms: ";
	let m be the number of visited memorable rooms;
	[ Sort the rooms in alphabetical order ]
	[let R be the list of visited rooms;
	sort R in printed name order;
	repeat with X running through R:]
	repeat with X running through visited memorable rooms:
		say "[the X] ([the road to X])[run paragraph on]";
		decrease m by 1;
		if m is greater than 0:
			say ", ";
		otherwise:
			say ".";
	if at least one person is memory-locatable:
		say "[line break]You have seen the following creatures in these locations:[line break]";
		repeat with guy running through memory-locatable persons:
			say "- [italic type][the guy][roman type] (level [if group level of the guy is not 0][group level of the guy][otherwise][level of the guy][end if]) [remembered location of the guy][line break]";
	if at least one person is memory-lost:
		say "[line break]You have also seen [the list of memorable not memory-locatable people], but you don't know where ";
		if the number of memory-lost people is 1:
			say "[regarding a random memory-lost person][they] [are][run paragraph on]";
		otherwise:
			say "they are[run paragraph on]";
		if psycholocation is active:
			say ". With your powers of psycholocation, you might be able to SENSE [if the number of memory-lost people is 1][regarding a random memory-lost person][them][otherwise]them[end if].";
		otherwise:
			say " now.";
	Let the tip text be the next tip text;
	say "[line break][italic type]Tip[roman type]: [tip text][paragraph break]".

Definition: a person (called guy) is memorable:
	if the guy is the player, no;
	if the guy is not denizen, no;
	if the guy is not seen, no;
	yes.

Definition: a person (called guy) is memory-locatable:
	if the guy is not memorable, no;
	if the last-seen-location of the guy is Null-Room, no;
	yes.

Definition: a person (called guy) is memory-lost:
	if the guy is not memorable, no;
	if the guy is memory-locatable, no;
	yes.

To say remembered location of (guy - a person):
	if the last-seen-location of the guy is Null-Room:
		say "not where you last saw [regarding the guy][them]";
	otherwise:
		say "in [place-memory of the last-seen-location of the guy]"

To say place-memory of (place - a room):
	say "[the place] ([if place is not the location]which lies [the road to place] from here[otherwise]where you currently are[end if])";

A person has a room called the last-seen-location. The last-seen-location of a person is usually Null-Room.

[Even acting fast?? TODO - Victor, is this rule right?]
[Victor: yes, it is right: this should be an "even acting fast" rule, i.e., a rule that happens evens when we skip the every turn rules. I have re-added the even acting fast logic to ATTACK (where you stripped it away).]
[I'm going to try "every turn", but I'm pretty sure this will lead to bugs.]

Every turn (this is the set last-seen-location rule):
	repeat with guy running through alive persons:
		if location of the guy is the location:
			now last-seen-location of guy is the location;
		otherwise:
			if last-seen-location of guy is the location: [the guy isn't here but is supposed to be here -- update accordingly]
				now last-seen-location of guy is the Null-Room.

After reporting an npc teleporting (this is the reset last-seen-location after teleporting rule):
	if teleportation-from is the location and teleportation-destination is not the location:
		now last-seen-location of the actor is Null-Room;

To say the road to (place - a room):
	if place is location of the player:
		say "here[run paragraph on]";
	otherwise:
		let Y be the best route from the location of player to place through visited rooms;
		if Y is a direction:
			say "[Y][run paragraph on]";
		otherwise:
			say "no known path[run paragraph on]".

Definition: a room is map-secret if it is unvisited and it is secretly placed and it is not nogo and it is not the location.

To say map description:
	calculate the extent of the dungeon;
	let x-adjust be (0 - extent-minimum-x) + 1;[These numbers will allow us to transform the coordinates so that each starts with 1]
	let y-adjust be (0 - extent-minimum-y) + 1;
	let z-adjust be (0 - extent-minimum-z) + 1;
	let x be the x-coordinate of the location + x-adjust;
	let y be the y-coordinate of the location + y-adjust;
	let z be the (0 - (z-coordinate of the location + z-adjust)) + (extent-maximum-z + z-adjust) + 1[this reverses the direction of the z vector so that we can increase downward as is usual for roguelike dungeons; otherwise, Kerkerkruip counts upward, as is usual for skyscrapers.];
	say "Based on [if the mapping boolean is true]the [bold type]map[roman type] you found[otherwise]your explorations[end if], you calculate that you are on the [ordinal of z] level down of a dungeon [(extent-maximum-z + z-adjust) in words] floor[s] deep. [run paragraph on]";
	say "You are in the [run paragraph on]";
	let dx be x grid-compared to (extent-maximum-x - extent-minimum-x) + 1;
	let dy be y grid-compared to (extent-maximum-y - extent-minimum-y) + 1;
	[say "(x-min: [extent-minimum-x], x-max: [extent-maximum-x]; y-min: [extent-minimum-y], y-max: [extent-maximum-y]; mx: [(extent-maximum-x - extent-minimum-x) + 1], my: [(extent-maximum-y - extent-minimum-y) + 1]; x: [x], y: [y]; dx: [dx], dy: [dy]) ";]
	if dx is 0 and dy is 0:
		say "central part ";
	otherwise:
		say "[if dx is -1]south[end if][if dx is 1]north[end if][if dy is -1]west[end if][if dy is 1]east[end if][if dy is 0 or dx is 0]-central[end if] part ";
	say "of the complex. [run paragraph on]";
	if the mapping boolean is true[i.e., this shows only if we've seen a map!]:
		let count be the number of map-secret rooms;
		if count is greater than 0:
			say "The map indicates that there [if count is greater than 1]are [count in words] secret rooms[otherwise]is a secret room[end if] in the dungeon[run paragraph on]";
			let max-count be count;
			repeat with place running through map-secret rooms:
				decrement count;
				say ", [if max-count is greater than 1]one [end if][triaxial way from location to place][run paragraph on]";
			say ". [run paragraph on]";
	say "[line break]"

[I'm just commenting out all the fixed/real stuff below. Hope that works in 6L02!]
To decide what number is (N - a number) grid-compared to (L - a number):
	if L is 1:
		decide on 0;[we're always at the center if the extent is 1.]
	if L is 2:
		decide on N - (3 - N);[there is no center with an extent of 2--we're on one side or the other.]
	let split be L / 3[ as a fixed point number];
	let spread be 0.0000;
	if L is even:
		now spread is 1.0000;[even widths will have a wider central zone]
	if (N is [real ]greater than split) and ((N is [real ]less than (spread [real ]plus (split [real ]times 2))) or (N [real ]is (spread [real ]plus (split [real ]times 2)))):
		decide on 0;
	if N is [real ]less than split or N [real ]is split:
		decide on -1;
	decide on 1.

To say triaxial way from (A - a room) to (B - a room):
	let N-S be "";
	let E-W be "";
	let U-D be "";
	if x-coordinate of A minus x-coordinate of B is less than 0:
		now N-S is "north";
	if x-coordinate of A minus x-coordinate of B is greater than 0:
		now N-S is "south";
	if y-coordinate of A minus y-coordinate of B is less than 0:
		now E-W is "east";
	if y-coordinate of A minus y-coordinate of B is greater than 0:
		now E-W is "west";
	if z-coordinate of A minus z-coordinate of B is less than 0:
		now U-D is "up";
	if z-coordinate of A minus z-coordinate of B is greater than 0:
		now U-D is "down";
	let vertical-distance be the integer absolute value of the z-coordinate of A minus the z-coordinate of B;
	if U-D is not "":
		say "[if vertical-distance is greater than 1][vertical-distance in words] floors [end if][U-D][run paragraph on]";
		if N-S is "" and E-W is "":
			say "ward from here";
		otherwise:
			say " and to the [run paragraph on]";
	otherwise:
		say "to the [run paragraph on]";
	if N-S is not "":
		say "[N-S][run paragraph on]";
	if E-W is not "":
		say "[E-W]".
	

An ordinal is a kind of value. Some ordinals are first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth, thirteenth, fourteenth, fifteenth, sixteenth, seventeeth, eighteenth, nineteenth, twentieth, twenty-first, twenty-second, twenty-third, twenty-fourth, twenty-fifth, twenty-sixth, twenty-seventh, twenty-eighth, twenty-ninth, thirtieth, thirty-first, thirty-second, thirty-third, thirty-fourth, thirty-fifth, thirty-sixth, thirty-seventh, thirty-eighth, thirty-ninth, fortieth.

To decide what ordinal is the ordinal of (N - a number):
	if N is greater than 40 or N is less than 1:
		decide on fortieth;
	decide on the ordinated N.

To decide what ordinal is the ordinated (N - a number):
	(- {N} -).


Section - Sensing

Sensing is an action applying to nothing. Understand "sense" as sensing.

[Sensing is acting fast.] [This makes the demon assassin a lot more fun, because you now have to decide whether or not you want to sense Malygris often.]

Check sensing (this is the do not sense when not in the dungeon rule):
	if x-coordinate of the location is 100:
		take no time;
		say "You do not seem to be in the dungeon, so your sensing power doesn't work." instead.

To decide whether (guy - a person) is soul-reflected:
	if level of guy is not 0:
		decide no;
	otherwise:
		let place be location of guy;
		repeat with guy2 running through people in place:
			if level of guy2 > 0:
				decide yes;
	decide no.

Definition: A person (called guy) is psycholocation-revealed:
	if guy is the player, no;
	if guy is not denizen, no;
	if the level of guy is greater than 0, yes;
	if guy is soul-reflected, yes;
	no.

Carry out sensing when psycholocation is active:
	take no time;
	if player is denizen:
		say "As if with a third eye, you can sense:[paragraph break]";
		let count be 0;
		repeat with adversary running through psycholocation-revealed persons:
			increment count;
			if the location of the player is the location of the adversary:
				say " - [italic type]the soul of [the adversary][roman type] here with you, like [soul description of adversary][line break]";
			otherwise:
				say " - [italic type][soul description of adversary][roman type], [soul directions to adversary][line break]";
	otherwise:
		say "Your psycholocation doesn't seem to work in your current location.".

To decide what object is the point of departure for (place - a room):
	Let the last point be the location;
	while the last point is not the place:
		Let the way be the best route from the last point to the place;
		if the way is not a direction:
			decide on nothing;
		Let the next point be the room way from the last point;
		If the next point is not visited:
			decide on the last point;
		Now the last point is the next point;
	decide on the last point;

To say soul directions to (adversary - a person):
	Let the destination be the location of the adversary;
	if the destination is a visited room:
		say "in [place-memory of the destination]";
		stop;
	let the waystation be the point of departure for the destination;
	if the waystation is a room and the waystation is not the location:
		say "[best route from the waystation to the destination] from [the waystation] (which lies [the road to the waystation] from here)";
		stop;
	let the way be the best route from the location to the destination;
	if way is a direction:
		say "[if way is not up and way is not down]from the [end if][way]";
	otherwise:
		say "somewhere [general direction from location of the player to location of the adversary]";

Carry out sensing when psycholocation is inactive:		
	if greatest power of the player is less than 3:
		take no time;
		say "You are not yet powerful enough to magically sense anything.";
	if greatest power of the player is greater than 2:
		let the way be the best route from the location of player to the location of Malygris;
		if way is a direction:
			say "You feel that the shortest route towards Malygris lies [way].";
		otherwise:
			if the location of the player is the location of Malygris:
				say "Malygris is right here.[line break]";
			otherwise:
				say "There seems to be no available route towards Malygris.[line break]";

Carry out sensing:
	if player is denizen:
		if greatest power of the player is greater than 3:
			now world test subject is player;
			Let report-count be 0;
			repeat with item running through worldsharer epic things:
				if location of item is not location of the player and location of item is placed:
					increment report-count;
					say "You sense an[if report-count > 1]other[end if] epic artefact that [directions to location of item].";
					

To say directions to (destination - a room):
	let the way be the best route from the location of player to destination;
	if way is a direction:
		say "can be found by going [way] from here";
	otherwise:
		say "is currently unreachable, but lies somewhere [general direction from location of the player to destination]".
	
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


Chapter - Trophy list (requesting the score)

Understand "trophy" and "trophies" and "list trophies" as requesting the score.

The announce the score rule is not listed in the carry out requesting the score rules.
Carry out requesting the score:
	if the number of dead persons is 0:
		say "You have not yet killed anyone, taking [turn count] turn[s] to do so, on difficulty level [difficulty level difficulty].[line break][paragraph break]";
	otherwise:
		say "The following beings have been vanquished:";
		repeat with guy running through dead seen persons:
			say "[line break]- [italic type][the name of the guy][roman type] (level [if group level of the guy is not 0][group level of the guy][otherwise][level of the guy][end if])";
		say "[paragraph break]You have accomplished this in [turn count] turn[s], on difficulty level [difficulty level difficulty].[line break][paragraph break]";

Chapter - Commands command

Showing commands is an action out of world.

Understand "commands" and "show commands" as showing commands.
	
Carry out showing commands:
		say "The most important special commands in [italic type]Kerkerkruip[roman type] are: attack (a), parry (p), dodge (do), concentrate (c), status, remember (r), sense, equip, go to. Some of the standard interactive fiction commands are: look (l), inventory (i), go, take, drop, wear, take off, read, put A in B.".

Chapter - Statistics command

Requesting rogue statistics is an action out of world. Understand "statistics" as requesting rogue statistics.

Carry out requesting rogue statistics:
	Say "You have battled the following creatures:[paragraph break]";
	Repeat with guy running through encountered people:
		say "[The guy] defeated you [kill count of guy] times, and was defeated [died count of guy] times[line break]";
	say conditional paragraph break;


Chapter - Jumping in a direction

Direction-jumping is an action applying to one object. Understand "jump [direction]" as direction-jumping.

Carry out direction-jumping:
	say "You hop around.".


Chapter - More synonyms

Understand "jump in/into [something]" as entering.
Understand "throw [something] in/into [something]" as inserting it into.
Understand "drop [something] in/into [something]" as inserting it into.

[ Allow "insert noun" to automatically choose the appropriate machine. ]
Understand "insert [something] into/in [something]" as inserting it into.
Does the player mean inserting into a container:
	it is likely.

Understand the command "equip" as "use".
Understand "use [clothing]" as wearing.
Understand "use [scroll]" as reading.
Understand "use [grenade]" as throwing.
Understand "use [fungicide contraption]" as spraying.
Understand "use [weapon]" as readying.

Understand "activate [something]" as switching on.
Understand "deactivate [something]" as switching off.
Understand the command "enable" as "activate".
Understand the command "disable" as "deactivate".
Understand the command "toggle" as "switch".



Chapter - Option commands

[An option is a kind of value.
The invalid option is an option.]

Understand "[option]" and "the [option]" as "[option token]".

Enabling is an action out of world applying to one option.
Understand "activate [option token]" as enabling.
Understand "turn [option token] on" as enabling.
Understand "turn on [option token]" as enabling.
Understand "switch on [option token]" as enabling.
Understand "switch [option token] on" as enabling.

Disabling is an action out of world applying to one option.
Understand "deactivate [option token]" as disabling.
Understand "turn [option token] off" as disabling.
Understand "turn off [option token]" as disabling.
Understand "switch off [option token]" as disabling.
Understand "switch [option token] off" as disabling.

Toggling is an action out of world applying to one option.
Understand "switch [option token]" as toggling.
Understand "[option]" as toggling.



Chapter - New standard responses

The description of yourself is "[if greatest power of the player is 0]You have fought many men and quite a few women, but fighting Malygris is something else. Your hairs are raised on end, and your body quivers with fear[otherwise if greatest power of the player is 1]Your victory, though small, has given you a little confidence. Perhaps you can survive long enough to escape this dungeon[otherwise if greatest power of the player is 2]This is going better than expected. Could it be that Malygris is not as invulnerable as you used to believe? You dare not yet hope[otherwise if greatest power of the player is 3]Flushed with success, you go boldly through the dungeon[otherwise if greatest power of the player is 4]History will remember you as one of the greatest of warriors! If you kill Malygris and manage to find a historian, that is[end if].[if the current weapon of the player is a natural weapon or the current weapon of the player is nothing][paragraph break][player natural attack].[line break][end if]".

To say player natural attack:
	let item be a random natural weapon part of the player;
	say "You currently attack using [item]: 1d[damage die of item] + [weapon damage bonus of the item] damage; [if weapon attack bonus of the item is less than 0]-[otherwise]+[end if][absolute value of weapon attack bonus of the item] attack modifier[if the item is ranged]; ranged[end if][natural parry and dodge info of the item][if the item is silver]; good against undead and demons[end if][special weapon info of the item][roman type]".

For natural weapon setup for the player:
	now printed name of the natural weapon described is "your fists".


Chapter - Singing

Singing is an action applying to nothing. Understand "sing" and "hum" as singing.

Carry out singing:
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
	say "'[one of]I'll get back at the prince.[run paragraph on][or]I will defeat all my enemies![run paragraph on][or]I am immortal.[run paragraph on][or]Pride cometh before the fall.[run paragraph on][at random]', you say[if the player is hidden], revealing your presence[end if].[run paragraph on][line break][paragraph break]";
	now the player is not hidden.



Chapter - Reading

Reading is an action applying to one thing. Understand the command "read" as something new. Understand "read [thing]" as reading.
A thing can be unreadable, silently-readable, or readable-aloud.
Definition: a thing is readable if it is not unreadable.

Does the player mean reading a readable thing: it is likely.

Check reading an unreadable thing (this is the can only read readable things rule):
	take no time;
	say "You cannot read that." instead.

Check reading (this is the cannot read when blind rule):
	unless the player is perceptive:
		take no time;
		say "[The noun] has not been written in braille." instead.


Chapter - Taking from sleepers

The can't take living people's possessions rule is not listed in any rulebook.

To decide which object is the keeper of (item - a thing) from (guy - a person):
	let the local ceiling be the common ancestor of the guy with the item;
	let the owner be the not-counting-parts holder of the item;
	while the owner is not nothing and the owner is not the local ceiling:
		if the owner is a person:
			decide on the owner;
		otherwise:
			now the owner is the not-counting-parts holder of the owner;

Check an actor taking (this is the can't take living awake people's possessions rule):
	Let the owner be the keeper of the noun from the actor;
	if the owner is a person and the owner is conscious in this world:
		if the actor is the player:
			say "[regarding the noun][Those] [seem] to belong to [the owner]." (A);
		stop the action;

Last check an actor taking (this is the pickpocket rule):
	Let the owner be the keeper of the noun from the actor;
	if owner is a person and owner is sleeping in this world:
		if a pickpocket check fails:
			do nothing instead;
		otherwise:
			if the noun is a weapon:
				now the noun is not readied.

Pickpocket chance is a number that varies.
The pickpocket rules are a rulebook.

To decide whether a pickpocket check fails:
	now pickpocket chance is 30;
	follow the pickpocket rules;
	say "You have a [pickpocket chance]% chance of successfully stealing [the noun] ... [run paragraph on]";
	if a random chance of pickpocket chance in 100 succeeds:
		say "success!";
		decide on false; [This is success.]
	otherwise:
		let guy be a random person enclosing the noun;
		now guy is not asleep;
		say "but you fail, waking [the guy]!";
		decide on true. [This is failure.]

A pickpocket rule (this is the increase by your faculties rule):
	increase pickpocket chance by final body of the player;
	increase pickpocket chance by final mind of the player;
	increase pickpocket chance by final spirit of the player.	

A pickpocket rule (this is the worn clothing pickpocket rule):
	if the noun is clothing:
		if at least one person wears the noun:
			decrease pickpocket chance by 20.

A pickpocket rule (this is the readied weapons pickpocket rule):
	if the noun is a weapon:
		if the noun is readied:
			decrease pickpocket chance by 10.

Section - Awaking

Awaking is an action applying to one thing.
Understand "wake [person]" and "wake up [person]" and "wake [person] up" and "awake [person]" and "awaken [person]" as awaking.

Check awaking:
	if the noun is the player:
		take no time;
		say "Perhaps you are in a dream, but you are unable to wake yourself." instead.

Check awaking:
	unless the noun is sleeping in this world:
		take no time;
		say "You can only awaken sleeping persons." instead.

Carry out awaking:
	now noun is not asleep.
	
Report awaking:
	say "With a swift kick, you wake up [the noun]. Not very subtle, perhaps, but it is certainly effective.".




Chapter - Options menu

Optionsmenuing is an action out of world. Optionsmenuing is in-game menu-checking.

Understand "options" and "settings" as Optionsmenuing.

Carry out optionsmenuing:
	display the (Table of Options Menu) menu with title "Options";
	say "Ok.";

Chapter - Achievements Menu

Achievemenuing is an action out of world. Achievemenuing is in-game menu-checking.

Understand "achieve" and "achievements" as achievemenuing.

Carry out achievemenuing:
	display the (Table of Achievement Menu) menu with title "Achievements";
	say "Ok.";

Chapter - Enemies and Powers Menu

Powermenuing is an action out of world. Powermenuing is in-game menu-checking.

Understand "enemies" and "powers" as powermenuing.

Carry out powermenuing:
	display the Table of Power Help menu with title "Enemies and powers";
	say "Ok.";

Chapter - The asking for help action (for use without Basic Help Menu by Emily Short)

Asking for help is an action out of world. Asking for help is in-game menu-checking.
Understand "help" or "hint" or "hints" or "about" or "info" as asking for help.
Carry out asking for help (this is the help request rule): do nothing.

Chapter - Help Menu

Understand "menu" as asking for help.

The help request rule is not listed in any rulebook.

Carry out asking for help:
	display the Table of Kerkerkruip Help menu with title "Kerkerkruip";
	say "Ok.";

Chapter - Credits menu

Understand "credit" or "credits" or "copyright" or "copyrights" or "licence" or "license" as requesting the story file version.

Requesting the story file version is in-game menu-checking.

The announce the story file version rule is not listed in any rulebook.

Carry out requesting the story file version:
	show menu page "[total credits]" with title "Credits, Copyright & Afterword";
	say "Ok.";



Chapter - Replacing "You can see" in case the player is blind

The you-can-also-see rule response (D) is "[regarding the player][can] also [run paragraph on][if player is perceptive]see[otherwise]feel[end if] ".

The you-can-also-see rule response (E) is "[regarding the player][can] [run paragraph on][if player is perceptive]see[otherwise]feel[end if] ".

Chapter - Whether all includes

Rule for deciding whether all includes a someone-held thing while taking: it does not.

Definition: a thing (called the item) is someone-held if item is enclosed by a person.

Chapter - Layout

Section - Status bar

Include Basic Screen Effects by Emily Short.

Table of Fancy Status
left	central	right
" [bold type][status location][roman type]"	"Tension: [tension]"	"Health: [health of the player]/[permanent health of the player]"
" Special powers: [powers of the player]"	""	"C/O/D: [concentration of the player]/[offensive flow of the player]/[defensive flow of the player]"

To say status location:
	 let phrase be indexed text;
	 now phrase is printed name of location of the player in title case;
	 say "[phrase][run paragraph on]".

Rule for constructing the status line:
	if window panels are disabled:
		fill status bar with Table of Fancy Status;
	otherwise:
		center "[bold type][status location][roman type]" at row 1;
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
The readied inventory listing rule is not listed in any rulebook.
The show ammo in inventory rule is not listed in any rulebook.

Carry out taking inventory: 
	take no time;

Stock-taking is an activity.

Inventory-avoid-more is a truth state that varies.
Inventory-shown-items-max is a number that varies. Inventory-shown-items-max is 27.

Carry out taking inventory (this is the full inventory rule):
	if the number of things had by the player is 0, say "You are empty-handed." instead;
	now inventory-avoid-more is false;
	carry out the stock-taking activity.

This is the full panel inventory rule:
	if the number of things had by the player is 0, say "You are empty-handed." instead;
	now inventory-avoid-more is true;
	carry out the stock-taking activity.

After printing the name of a readied weapon while stock-taking (this is the readied stock listing rule):
	say " (readied)".
	
After printing the name of a weapon (called item) while stock-taking (this is the show ammo in stock listing rule):
	if the maximum shots of item is not 0:
		if the current shots of item is not 0:
			say " ([current shots of item] of [maximum shots of item] [shots text of item] left)";
		otherwise:
			if the maximum load time of item is not -1:
				say " (no [shots text of item] left; [current load time of item] round[if current load time of item is not 1]s[end if] [infinitive of reload verb of item])";
			otherwise:
				say " (no [shots text of item] left; cannot be [past participle of reload verb of item])".

For stock-taking:
	let m be the number of things enclosed by the player;
	let abbreviate be false;
	if  inventory-avoid-more is true and (m > inventory-shown-items-max):
		now abbreviate is true;
	unless the number of weapons enclosed by the player is the number of natural weapons enclosed by the player:
		let n be 0;
		say "You are carrying[line break][italic type]-weapons[roman type]: [line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all weapons enclosed by the player are marked for listing; 
		now all natural weapons enclosed by the player are unmarked for listing;
		if abbreviate is true and (the number of marked for listing not readied weapons enclosed by the player > 1):
			repeat with item running through marked for listing weapons enclosed by the player:
				unless item is readied:
					now item is unmarked for listing;
					increase n by 1;
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
		if abbreviate is true and n > 0:
			say "  [n in words] unreadied weapons[line break]";
	unless the number of clothing enclosed by the player is 0:
		let n be 0;
		say "[italic type]-clothing[roman type]:[line break]";
		now all things enclosed by the player are unmarked for listing; 
		now all clothing enclosed by the player are marked for listing; 
		if abbreviate is true and (the number of marked for listing not worn clothing enclosed by the player > 1):
			repeat with item running through marked for listing clothing enclosed by the player:
				unless item is worn:
					now item is unmarked for listing;
					increase n by 1;
		list the contents of the player, with newlines, indented, giving inventory information, including contents, with extra indentation, listing marked items only;
		if abbreviate is true and n > 0:
			say "  [n in words] unworn items[line break]";
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
		
		
Chapter - Looking

[ We need to capitalise the room names! But we can cheat and skip some of the other stuff. ]
The alternative room description heading rule is listed instead of the the room description heading rule in the carry out looking rules.
Carry out looking (this is the alternative room description heading rule):
	say bold type;
	[if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			issue miscellaneous library message number 71;
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		say "[visibility ceiling]";
	otherwise:
		say "[The visibility ceiling]";]
	say printed name of visibility ceiling in title case;
	say roman type;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		if the intermediate level is a supporter or the intermediate level is an animal:
			say " (on [the intermediate level])" (B);
		otherwise:
			say " (in [the intermediate level])" (C);
		let the intermediate level be the visibility-holder of the intermediate level;
	say line break;
	say run paragraph on with special look spacing;

Definition: a direction (called way) is exit:
	Let further place be the room way from the location;
	unless further place is a room:
		no;
	if further place is nogo:
		no;
	yes.
	
Report looking (this is the room exits rule):
	let count be the number of exit directions;
	if count is not 0:
		if count is 1:
			Let way be a random exit direction;
			Let further place be the room way from the location;
			say "An exit leads [way][if further place is visited] (to [the further place])[end if].";
		otherwise:
			say "Exits lead ";
			repeat with way running through exit directions:
				let further place be the room the way from the location;
				if count is greater than 1:
					say "[way][if further place is visited] (to [the further place])[end if][if count is greater than 2],[end if] ";
					decrease count by 1;
				otherwise:
					say "and [way][if further place is visited] (to [the further place])[end if].".
	


Section - XYZZY

Xyzzying is an action applying to nothing.

Understand "xyzzy" as xyzzying.

Carry out xyzzying:
	say "You spend a moment fondly remembering your vector calculus classes.".



Chapter - Helping testers

Understand "* [text]" as a mistake ("(Your [if a random chance of 1 in 20 succeeds]wise [otherwise if a random chance of 1 in 50 succeeds]incredibly useful [end if]comment has been recorded[take no time].)").



Kerkerkruip Actions and UI ends here.
