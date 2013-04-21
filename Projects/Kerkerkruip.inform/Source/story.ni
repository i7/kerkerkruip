"Kerkerkruip - Release 8 - BETA" by Victor Gijsbers

The story headline is "An IF roguelike".
The story genre is "dungeon crawl".
The release number is 8.
[Release along with cover art.]

	
Include version 4/121111 of Menus by Emily Short. [Get this at https://github.com/i7/extensions]
Include Basic Screen Effects by Emily Short. 
Include Numbered Disambiguation Choices by Aaron Reed.
Include Glulx Entry Points by Emily Short.
Include Dynamic Objects by Jesse McGrew.
Include Epistemology by Eric Eve. [Doesn't work with moving people.]
Include Glulx Status Window Control by Erik Temple.

[Testing with Glimmr installed will be slower, due to compilation and graphics, so commits to story.ni would generally best be made with it commented out. Be sure to comment Flexible Windows in instead!]
Include Kerkerkruip Glimmr Additions by Erik Temple.
[Include Flexible Windows by Jon Ingold.]
[Include Kerkerkruip Windows by Erik Temple.]
Include Extended Debugging by Erik Temple.

Every turn (this is the mark items as seen every turn rule): 
	repeat with item running through things that are enclosed by the location:
		if the item is not enclosed by an opaque closed container, now the item is seen.
		
Include Kerkerkruip Permadeath by Victor Gijsbers.
The binary file of save data is called "KerkerkruipSaves".

Use undo prevention.

Include version 4/121110 of Inform ATTACK by Victor Gijsbers.
[You can get the latest ATTACK at https://github.com/i7/ATTACK ]

Include Kerkerkruip Persistent Data by Victor Gijsbers.
Include Kerkerkruip Dungeon Generation by Victor Gijsbers.
Include Kerkerkruip Events by Victor Gijsbers.
Include Kerkerkruip ATTACK Additions by Victor Gijsbers.
Include Kerkerkruip Systems by Victor Gijsbers.
Include Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers.
Include Kerkerkruip Monster Abilities by Victor Gijsbers.
Include Kerkerkruip Actions and UI by Victor Gijsbers.
Include Kerkerkruip Items by Victor Gijsbers.
Include Kerkerkruip Locations by Victor Gijsbers.
Include Kerkerkruip Scenery by Victor Gijsbers.
Include Kerkerkruip Monsters by Victor Gijsbers.
Include Kerkerkruip Events and Specials by Victor Gijsbers.
Include Kerkerkruip Ugly Special Cases by Victor Gijsbers.
Include Kerkerkruip Start and Finish by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.


Use MAX_PROP_TABLE_SIZE of 500000.
Use MAX_OBJ_PROP_COUNT of 256.
Use MAX_STATIC_DATA of 500000.
Use MAX_OBJECTS of 650.

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.

[This is for testing.]

Generation info is a truth state that varies. Generation info is [true]false.


Last when play begins:
	move magical spade to the player.

[Last when play begins:
	increase mind score of the player by 40.]
	

		

[Chapter - Scroll of mapping

Table of Scroll Names (continued)
scroll name
mapping
psycholocation

A scroll of mapping is a kind of scroll.
A scroll of mapping is mapping.
The description of a scroll of mapping is "Reading this scroll will instantaneously reveal the plan of the entire dungeon, including secret rooms (check the MAP to see it).".
The plural of scroll of mapping is scrolls of mapping.

Carry out reading a scroll of mapping (this is the reveal the map rule):
	now all placed not nogo rooms are map-revealed;
	say "The scroll is not a spell at all! It is a magically obfuscated blueprint of the Kerkerkruip dungeon! Type MAP to see the dungeon's complete floor plan."


Chapter - Scroll of psycholocation

A scroll of psycholocation is a kind of scroll.
A scroll of psycholocation is psycholocation.
The description of a scroll of psycholocation is "Reading this scroll will grant you the ability to sense all of the creatures whose souls you might be able to absorb (check the MAP to see their locations).".
The plural of scroll of psycholocation is scrolls of psycholocation.

Carry out reading a scroll of psycholocation (this is the reveal enemies rule):
	let adversary-count be 0;
	repeat with place running through placed not nogo rooms:
		repeat with adversary running through persons in place:
			if the adversary is not the player and the level of the adversary is greater than 0 and the level of the adversary is less than 6:
				now place is enemy-revealed;
				increment adversary-count;
	if the adversary-count is greater than 0:
		say "You enter a weird clairvoyant state: The psyche[if adversary-count is greater than 1]s[end if] of your enemies call[if adversary-count is less than 2]s[end if] out to you. For a short time, you will be able to sense the presence and location of creatures whose souls you can absorb. If there are other creatures in the same space, you will see them via soul-reflection. Type MAP to psycholocate.";
		psycholocator peters out in 10 turns from now;
	otherwise:
		say "The scroll's magic enfolds you, but you cannot sense the souls of any enemies. Perhaps there are none remaining."
	
At the time when the psycholocator peters out:
	now all enemy-revealed rooms are not enemy-revealed;
	say "Your clairvoyant sensation fades; you can no longer sense the psyches of your enemies."
	
The player carries one scroll of psycholocation and one scroll of mapping.]

When play begins:
	repeat with item running through scrolls carried by the player:
		identify item.
	

Chapter - Flexible Windows relisting
[Kerkerkruip's when play begin rules don't fire until after the menu is cleared. This means that extension such as Flexible Windows that have critical startup code in when play begins need to be adjusted. Due to weaknesses in Inform's extension interactions, this has to be in story.ni rather than the Kerkerkruip Glimmr Additions extension.]

The allocate rocks rule is not listed in the when play begins rules. The allocate rocks rule is listed before the show the title screen rule in the startup rules.
The initial hyperlink request rule is not listed in the when play begins rules. The initial hyperlink request rule is listed before the show the title screen rule in the startup rules.

Section - Relist rock validation rule (not for release)

The rock validation rule is not listed in the when play begins rules. The rock validation rule is listed before the show the title screen rule in the startup rules.


Chapter - Menu code adjustments

Before displaying:
	open the status window.
	
[After printing the name of a room (called the place):
	say " ([y-coordinate of place],[x-coordinate of place],[z-coordinate of place])";]

	