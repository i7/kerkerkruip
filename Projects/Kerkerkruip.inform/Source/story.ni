"Kerkerkruip - Release 5" by Victor Gijsbers

The story headline is "An IF roguelike".
The story genre is "dungeon crawl".
The release number is 5.
[Release along with cover art.]


Include Menus by Emily Short.
[Include Basic Help Menu by Emily Short.]
Include Basic Screen Effects by Emily Short. 
Include Epistemology by Eric Eve.
Include Numbered Disambiguation Choices by Aaron Reed.
[Include Real-Time Delays by Erik Temple.]
Include Glulx Entry Points by Emily Short.
[Include Default Messages by Ron Newcomb.]
Include Dynamic Objects by Jesse McGrew.

[Doesn't work with moving people.]

[ Epistemology - mark items as seen in the every turn rules rather than when looking.]
The mark items as seen when looking rule is not listed in any rulebook.

Every turn (this is the mark items as seen every turn rule): 
	repeat with item running through things that are enclosed by the location:
		if the item is not enclosed by an opaque closed container, now the item is seen.
		
Include Kerkerkruip Permadeath by Victor Gijsbers.
The binary file of save data is called "KerkerkruipSaves".

Use undo prevention.

Include version 4 of Inform ATTACK by Victor Gijsbers.
[You can get the latest ATTACK at https://github.com/i7/ATTACK ]

Include Kerkerkruip Dungeon Generation by Victor Gijsbers.
Include Kerkerkruip Events by Victor Gijsbers.
Include Kerkerkruip ATTACK Additions by Victor Gijsbers.
Include Kerkerkruip Systems by Victor Gijsbers.
Include Kerkerkruip Systems - Hiding Smoke Ethereal by Victor Gijsbers.
Include Kerkerkruip Items by Victor Gijsbers.
Include Kerkerkruip Locations by Victor Gijsbers.
Include Kerkerkruip Scenery by Victor Gijsbers.
Include Kerkerkruip Monsters by Victor Gijsbers.
Include Kerkerkruip Events and Specials by Victor Gijsbers.
Include Kerkerkruip Ugly Special Cases by Victor Gijsbers.
Include Kerkerkruip Actions and UI by Victor Gijsbers.
Include Kerkerkruip Help and hints by Victor Gijsbers.
Include Kerkerkruip Start and Finish by Victor Gijsbers.
Include Kerkerkruip Final Declarations by Victor Gijsbers.

Use MAX_PROP_TABLE_SIZE of 300000.
Use MAX_OBJ_PROP_COUNT of 128.

The maximum score is 18. [1 + 1 + 2 + 2 + 3 + 4 + 5 = 18]
The notify score changes rule is not listed in any rulebook.

[This is for testing.]

Generation info is a truth state that varies. Generation info is [true]false.

[When play begins:
	copy scroll of ghoulification to player;
	copy scroll of teleportation to player;
	copy scroll of teleportation to player.]
