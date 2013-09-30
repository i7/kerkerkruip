"Kerkerkruip - Release 9 - Alpha" by Victor Gijsbers

The story headline is "An IF roguelike".
The story genre is "dungeon crawl".
The release number is 9.
Release along with [cover art and] a file of "Gargoyle config file" called "Kerkerkruip.ini".



Section - 3rd Party Inclusions
	
Include Basic Screen Effects by Emily Short. 
Include Numbered Disambiguation Choices by Aaron Reed.
Include Glulx Entry Points by Emily Short.
Include version 7/130712 of Dynamic Objects by Jesse McGrew.
Include Glulx Status Window Control by Erik Temple.
Include Fixed Point Maths by Michael Callaghan.
Include Questions by Michael Callaghan.



Section - Graphics and Windows

[ Testing with Glimmr installed will be slower, due to compilation and graphics, so commits to story.ni would generally best be made with it commented out. It is not necessary to comment out Flexible Windows when Glimmr is commented in.

Check https://github.com/i7/extensions if the I7 site only has older versions ]

Include version 13/130925 of Flexible Windows by Jon Ingold.

[Include Kerkerkruip Glimmr Additions by Erik Temple.]

Include version 1/130925 of Menus by Dannii Willis.
Include Kerkerkruip Windows by Erik Temple.

[Include Extended Debugging by Erik Temple.]



Section - Include ATTACK

[ Get the latest ATTACK at https://github.com/i7/ATTACK ]
Include version 5/130930 of Inform ATTACK by Victor Gijsbers.



Section - Include all the Kerkerkruip extensions

Include Kerkerkruip Permadeath by Victor Gijsbers.
Include Kerkerkruip Persistent Data by Victor Gijsbers.
Include Kerkerkruip Dungeon Generation by Victor Gijsbers.
Include Kerkerkruip Events by Victor Gijsbers.
Include Kerkerkruip ATTACK Additions by Victor Gijsbers.
Include Kerkerkruip Systems by Victor Gijsbers.
Include Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers.
Include Kerkerkruip Monster Abilities by Victor Gijsbers.
Include Kerkerkruip Actions and UI by Victor Gijsbers.
Include Kerkerkruip Items by Victor Gijsbers.
Include Kerkerkruip Religion by Victor Gijsbers.
Include Kerkerkruip Locations by Victor Gijsbers.
Include Kerkerkruip Scenery by Victor Gijsbers.
Include Kerkerkruip Monsters by Victor Gijsbers.
Include Kerkerkruip Events and Specials by Victor Gijsbers.
Include Kerkerkruip Dreams by Victor Gijsbers.
Include Kerkerkruip Ugly Special Cases by Victor Gijsbers.
Include Kerkerkruip Start and Finish by Victor Gijsbers.
Include Kerkerkruip Tests by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.



Section - Increase memory settings

Use MAX_PROP_TABLE_SIZE of 800000.
Use MAX_OBJ_PROP_COUNT of 256.
Use MAX_STATIC_DATA of 500000.
Use MAX_OBJECTS of 800.
Use MAX_SYMBOLS of 30000.
Use MAX_ACTIONS of 250.



Section - Score

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.



Section - Generation info

Generation info is a truth state that varies. Generation info is [true]false.



Section - Testing - Not for release

[Lair of the Imp is testobject.]

[Last when play begins:
	move Fafhrd to Entrance Hall;
	now Fafhrd is asleep.]
	
[The player carries one scroll of psycholocation and one scroll of mapping.]

[The player carries six Morphean grenades.]

[One scroll of the blade is in Entrance Hall.]
[The Zen room is testobject.
Entrance to the Arena is testobject.]

[Angel of compassion is testobject.]
	
[Last when play begins:
	increase mind score of the player by 40.]



Section - Flexible Windows relisting

[Kerkerkruip's when play begin rules don't fire until after the menu is cleared. This means that extension such as Flexible Windows that have critical startup code in when play begins need to be adjusted. Due to weaknesses in Inform's extension interactions, this has to be in story.ni rather than the Kerkerkruip Glimmr Additions extension.]

The allocate rocks rule is not listed in the when play begins rules. The allocate rocks rule is listed before the show the title screen rule in the startup rules.
The initial hyperlink request rule is not listed in the when play begins rules. The initial hyperlink request rule is listed before the show the title screen rule in the startup rules.

Section - Relist rock validation rule (not for release)

The rock validation rule is not listed in the when play begins rules. The rock validation rule is listed before the show the title screen rule in the startup rules.



Section - Defining perform syntax (not for use with Glimmr Canvas Animation by Erik Temple)

To say perform/@ (ph - phrase): (- if (0==0) {ph} -).



Section - Plurality fix

[Let's see whether this works.]

To decide whether (item - an object) acts plural: 
	if the item is plural-named:
		yes;
	no.