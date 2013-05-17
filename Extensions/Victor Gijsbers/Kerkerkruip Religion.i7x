Kerkerkruip Religion by Victor Gijsbers begins here.

Use authorial modesty.

Chapter - Gods

Section - The god kind

A god is a kind of person.

There is a god called Aite. Aite is female.
There is a god called Nomos. Nomos is male.
There is a god called Sul. Sul is female.
There is a god called Chton. Chton is male.

Section - Worship

Worshipping relates various persons to one god. The verb to worship (he worships, they worship, he worshipped it, it is worshipped, it is worshipping) implies the worshipping relation.

Section - Divine favour

Divine favour is a number that varies. Divine favour is 0.

Section - Dedication

[Being dedicated to a god means that you can sacrifice your powers there.]

Dedication relates various rooms to one god. The verb to be dedicated to implies the dedication relation.

The verb to infuse (he infuses, they infuse, he infused it, it is infused, it is infusing) implies the reversed dedication relation.

Section - Favour rules

The favour rules are a god based rulebook.


Section - Status and short status

Status rule (this is the religion status rule):
	if the player worships a god:
		if long status is true:
			say "You worship [bold type][a random god worshipped by the player][roman type], and have accrued a favour of [divine favour].[line break][run paragraph on]";
		otherwise:
			say "Worshipping [bold type][a random god worshipped by the player][roman type], with [divine favour] favour.";





Chapter - Commands

Section - Praying

[Praying is removed, but should give an apprproiate response for returning players.]

Praying is an action applying to nothing. Understand "pray" and "pr" as praying.

Carry out praying:
	take no time;
	say "You pray -- but it seems to have no effect. [italic type]Please note that the praying command has been removed from the game. You can now sacrifice powers in temples[roman type].".

Section - Sacrificing

[TODO: doesn't remove powers yet!] 

Sacrificing is an action applying to nothing. Understand "sacrifice" as sacrificing.

Check sacrificing (this is the cannot sacrifice when not in a dedicated room rule):
	unless the location of the player is dedicated to a god:
		take no time;
		say "You are not in a holy place." instead.

Check sacrificing (this is the cannot sacrifice to a new god rule):
	if the player worships a god:
		if the location of the player is dedicated to a god:
			let guy be a random god who infuses the location of the player;
			unless the player worships guy:
				take no time;
				say "[Guy] will not accept your sacrifice, since you already worship [a random god worshipped by the player]!" instead.
		
Carry out sacrificing:
	let guy be a random god who infuses the location of the player;
	now player worships guy;
	increase divine favour by 1;
	say "You now worship [guy], and have [divine favour] favour.";
	consider the favour rules for guy.




Chapter - Aite

Section - Favour rules

Favour rule for Aite (this is the Aite favour 1 rule):
	say "Aite grants you bloodlust! (If you damage someone with an attack, you will get a +1 attack bonus and a +1 damage bonus during your next turn.)";
	[now player is bloodlusty;
	now bloodlust strength of player is 1.]






Kerkerkruip Religion ends here.
