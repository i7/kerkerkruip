Kerkerkruip Items by Victor Gijsbers begins here.

Use authorial modesty.

Book - Treasures





Chapter - Rules for placement

Section - Valuation

Valuation is a kind of value. The valuations are minor, major, epic, unique, special and non-treasure.
[The number of treasures of each valuation which is placed is set at the end of Dungeon Generation.]
[Valuation also determines how far from Entrance Hall a treasure will generally be found.]

A thing has a valuation. A thing is usually non-treasure.

A treasure scoring rule (this is the better treasures farther away rule):
	if considered treasure is major:
		increase current room score by distance of considered room;
	if considered treasure is epic:
		increase current room score by two times distance of considered room;
	if considered treasure is special:
		increase current room score by two times distance of considered room.

The verb to value (it values, they value, it is valuing) implies the valuation property.

Section - Mood

A thing has a mood. The mood of a thing is usually non-mood.
		
A treasure scoring rule (this is the mood rule):
	if mood of considered treasure is mood of considered room:
		increase current room score by 2;
	if mood of considered treasure is non-mood:
		say "BUG: forgot to set mood of [considered treasure].".






Chapter - Treasure packs
		
[Suppose we want to put three potions of X together as a treasure. First, we probably don't want to make all tokens of a type into placeable treasures. Second, how do we get three together? The solution to both is the treasure pack: a dummy item that gets placed, and is then turned into whatever it contains.]

A treasure pack is a kind of container.

Dungeon finish rule (this is the remove treasure packs rule):
	repeat with item running through treasure packs:
		if item is not off-stage:
			let X be a random thing that contains item;
			if the location of item contains item, let X be the location of item; 
			repeat with Y running through things contained by item:
				move Y to X;
			remove item from play.






Chapter - Basic item properties

Section - Incorruptible

[Incorruptible objects are immune from all effects adversely affecting them.]

A thing can be corruptible or incorruptible. A thing is usually corruptible.

Section - Hidden identity

[Some objects appear to be A, but are actually B. In order to do handle this smoothly, including references to it, we just use object A, and replace it with object B as soon as it is used.]

The non-thing is a thing. [This is a dummy object.]
The non-thing is incorruptible.

A thing has a thing called the hidden identity. The hidden identity of a thing is usually the non-thing.
Definition: a thing (called item) is hidden-identifiable if hidden identity of item is not the non-thing.

Report wearing:
	unless the hidden identity of the noun is the non-thing:
		now the hidden identity of the noun is curse-identified;
		now the player is wearing the hidden identity of the noun;
		set pronouns from the hidden identity of the noun;
		remove the noun from play;
		say "As soon as you put on [the noun], your flesh crawls. You realise that [the noun] [is-are] actually the [bold type][hidden identity of the noun][roman type]!" instead.

Report readying:
	unless the hidden identity of the noun is the non-thing:
		remove the noun from play;
		now the hidden identity of the noun is curse-identified;
		now the player carries the hidden identity of the noun;
		now the hidden identity of the noun is readied;
		set pronouns from the hidden identity of the noun;
		say "As soon as you ready [the noun], a chilling feeling goes through your arms. [The noun] [is-are] actually the [bold type][hidden identity of the noun][roman type]!" instead.

Last dungeon interest rule (this is the hidden identities also revealed by enemies rule):
	repeat with item running through wearable hidden-identifiable things:
		if a person wears item:
			let guy be a random person wearing item;
			now guy is wearing hidden identity of item;
			remove item from play;
	repeat with item running through hidden-identifiable weapons:
		if item is readied:
			let guy be a random person enclosing item;
			now guy carries hidden identity of item;
			now hidden identity of item is readied;
			now item is not readied;
			remove item from play.
	

Section - Cursed

A thing can be cursed. A thing is usually not cursed.
A thing can be curse-identified. A thing is usually not curse-identified.

Understand the cursed property as describing a thing.

Section - Cursed clothing

Check taking off something:
	if the noun is cursed:
		say "A curse makes the item unmovable." instead.

After wearing a cursed not curse-identified thing:
	 say "As soon as you put on [the noun], a chill goes through your body. You realise that [the noun] [is-are] cursed and cannot be removed with normal means.";
	now the noun is curse-identified.
		
Before printing the name of a cursed curse-identified thing:
	say "cursed ".

A treasure placement rule:
	repeat with item running through corruptible clothing:
		if a random chance of 1 in 5 succeeds and a random chance of difficulty in 5 succeeds:
			now item is cursed;
			if generation info is true, say "* Cursed [item].";			
		if item is cursed and a random chance of 1 in 5 succeeds:
			now item is curse-identified.
			
Section - Cursed weapons

After readying something cursed:
	say "As soon as you ready [the noun], a chill goes through your body. You realise that [the noun] [is-are] cursed and that you cannot let go.";
	now the noun is curse-identified.

Check readying (this is the cannot ready when holding a cursed weapon rule):
	if the player has a readied cursed weapon:
		let item be a random readied cursed weapon had by the player;
		say "You cannot ready a new weapon until you have gotten rid of [the item]." instead.

Check dropping (this is the cannot drop a cursed readied weapon rule):
	if the noun is a readied cursed weapon had by the player:
		say "You cannot let go of [the noun]." instead.

Check putting it on (this is the cannot put on a cursed readied weapon rule):
	if the noun is a readied cursed weapon had by the player:
		say "You cannot let go of [the noun]." instead.
		
Check inserting it into (this is the cannot insert a cursed readied weapon rule):
	if the noun is a readied cursed weapon had by the player:
		say "You cannot let go of [the noun]." instead.

A treasure placement rule:
	repeat with item running through corruptible weapons:
		unless item is the gilded rapier or item is a natural weapon:
			if a random chance of 1 in 10 succeeds and a random chance of difficulty in 5 succeeds:
				now item is cursed;
				if generation info is true, say "* Cursed [item].";
			if item is cursed and a random chance of 1 in 4 succeeds:
				now item is curse-identified.







Chapter - Essences

Section - The Essence Kind

An essence is a kind of thing. Understand "essence" and "small" and "metal" and "bottle" as an essence.
An essence is usually magical.
An essence is usually iron.
The unlock level of an essence is usually 1.
The unlock hidden switch of an essence is usually true.

Inhaling is an action applying to one carried thing. Understand "inhale [thing]" as inhaling.
Does the player mean inhaling an essence: it is very likely.

Check inhaling:
	if the noun is not an essence:
		take no time;
		say "Only magical essences can be consumed through inhaling.".

First carry out inhaling:
	say "You uncork the little bottle and push its mouth deep into your [one of]left[or]right[at random] nostril, pressing the other side of your nose closed with your fingers. You inhale deeply -- and with a burning sensation, the magical essence flows up and into your brain.[run paragraph on]"

Last carry out inhaling:
	remove the noun from play.

Instead of opening an essence:
	take no time;
	say "The minute amount of magical essence would immediately evaporate and be lost forever. To use an essence, [italic type]inhale[roman type] it.".

Instead of drinking an essence:
	take no time;
	say "The gaseous essence is no fluid, and cannot be drunk. You could, however, [italic type]inhale[roman type] it.".


Section - Essence of Caution (minor)

The essence of caution is a minor essence. The indefinite article is "the".
The essence of caution is magical.
The essence of caution is iron.


A person can be cautious. A person is usually not cautious.

The description of the essence of caution is "This small metal bottle contains the magical essence of caution, distilled from the brain of [one of]the only councilor of Hargo the Furious of Yahvinna who lived to die of old age[or]the famous Algirian general al-Hawabi, who fought only two battles in a forty year campaign -- and won both[or]an unknown rogue, whose exploits would be legendary if only they were known[sticky random]. When inhaled, it confers this mindset to the user. [italic type](+3 defence bonus when retreating, -1 spirit.)[roman type]".

Carry out inhaling the essence of caution:
	say " The decision to do this suddenly seems exceedingly rash.";
	now the player is cautious;
	decrease spirit score of the player by 1.
	
An attack modifier rule (this is the caution grants better retreat rule):
	if the global defender is the player and the player is retreater:
		if the player is cautious:
			say " - 3 (essence of caution)[run paragraph on]";
			decrease the attack strength by 3.

Status attribute rule (this is the cautious status rule):
	if player is cautious:
		if long status is true:
			say "You are [bold type]cautious[roman type]: +3 defence bonus when retreating.[line break][run paragraph on]".

Section - Essence of Rage (minor)

The essence of rage is a minor essence. The indefinite article is "the".
The essence of rage is magical.
The essence of rage is iron.

The description of the essence of rage is "This small metal bottle contains the magical essence of rage, distilled from the brain of [one of]a berserk warrior from the far north[or]Charles IV of Averoigne, who, at the moment of his greatest victory, was poisoned by the brother he had always cherished[sticky random]. When inhaled, it confers this mindset to the user. [italic type](+2 body, +2 spirit, -2 mind, +1 attack, unable to retreat.)[roman type]".

Carry out inhaling the essence of rage:
	say " You will show them all that you are not to be toyed with!";
	increase body score of the player by 2;
	increase spirit score of the player by 2;
	decrease mind score of the player by 2;
	increase melee of the player by 1;
	now the player is enraged.



Section - Essence of Patience (minor)

The essence of patience is a minor essence. The indefinite article is "the".
The essence of patience is magical.
The essence of patience is iron.

A person can be patient. A person is usually not patient.

The description of the essence of patience is "This small metal bottle contains the magical essence of patience, distilled from the brain of [one of]a High Priest of Yahvinna who endured fifty-three years of torture just to hear the news of his enemy's death[or]the author of 'A Careful Calculation of the first Twenty Thousand Decimals of the Squared Circle'[sticky random]. When inhaled, it confers this mindset to the user. [italic type](Whenever you wait, the tension is halved.)[roman type]".

Carry out inhaling the essence of patience:
	say " You relish the smell. There is no need to hurry.";
	now the player is patient.

Carry out waiting:
	if player is patient:
		now tension is tension divided by 2.

First report waiting:
	if player is patient:
		say "You wait patiently. You feel no tension." instead.

Status attribute rule (this is the patient status rule):
	if player is patient:
		if long status is true:
			say "You are [bold type]patient[roman type]: when you wait, the tension is halved.[line break][run paragraph on]".


Section - Essence of Greed (major)

The essence of greed is a major essence. The indefinite article is "the".
The essence of greed is magical.
The essence of greed is iron.

The unlock level of essence of greed is 4.
The unlock text of essence of greed is "an essence which allows you to gain more health, at the cost of your safety".
The unlock hidden switch of essence of greed is false.

A person can be greedy. A person is usually not greedy.

The description of the essence of greed is "This small metal bottle contains the magical essence of greed, distilled from the bones of the legendary thief Mithaldo, whose hunger for treasure was so great that he let himself be swallowed by a dragon in order to get at the jewels the beast had eaten through the centuries. When the dragon was slain some decades later, Mithaldo's bony fingers were found in the dragon's stomach, still clinging to a large diamond. [italic type](When absorbing a soul, the player receives much more health, but permanently loses one or more points of defence.)[roman type]".

Carry out inhaling the essence of greed:
	say " You want to absorb souls. Lots of souls. Now.";
	now the player is greedy.
	
The greed-health-variable is a number that varies.	
	
First absorbing a power:
	now greed-health-variable is permanent health of the player.

Last absorbing a power (called the granted power):
	if the player is greedy:
		let greed bonus be permanent health of the player minus greed-health-variable;
		increase permanent health of the player by greed bonus;
		let guy be a random person that grants the granted power;
		let n be 0;
		if level of guy is less than 3:
			now n is 1;
		otherwise:
			now n is 2;
		decrease defence of the player by n;
		say "Your greed causes you to absorb an extra [greed bonus] health, but it also gives you a permanent -[n] defence penalty.[paragraph break]".
		
Status attribute rule (this is the greedy status rule):
	if player is greedy:
		if long status is true:
			say "You are [bold type]greedy[roman type]: absorbing a power decreases your defence, but grants you more health.[line break][run paragraph on]".	

Section - Essence of Addiction (epic)

The essence of addiction is an epic essence. The indefinite article is "the".
The essence of addiction is magical.
The essence of addiction is iron.

The unlock level of essence of addiction is 6.
The unlock text of essence of addiction is "an essence which will greatly enhance both the positive and negative effects of ment".
The unlock hidden switch of essence of addiction is false.

The description of the essence of addiction is "This small metal bottle contains the magical essence of addiction, distilled from the brain of a ment user. When inhaled, it greatly increases you addiction to ment -- increasing both the positive effects of a high and the negative effects of a low.".

Carry out inhaling the essence of addiction:
	say " You feel very [if ment timer is less than 1]low[otherwise]high[end if]!";
	increase ment addiction by 2.


















Chapter - Clothing

Section - Clothing kinds

Clothing is a kind of thing. Clothing is usually wearable.
Does the player mean wearing clothing: it is very likely.

A necklace is a kind of clothing.
A hat is a kind of clothing.
A shirt is a kind of clothing.
A cloak is a kind of clothing.
Shoes are a kind of clothing.
Trousers are a kind of clothing.
A belt is a kind of clothing.
Gauntlets are a kind of clothing.
A mask is a kind of clothing. [Includes masks, goggles, and anything else that covers the face.]
A suit is a kind of clothing. [Suits include hat, shirt, shoes, trousers, gauntlets. Furthermore, you cannot put on a suit if you wear a cursed cloak or a cursed belt.]

Last check wearing a necklace:
	if the player wears a necklace:
		let item be a random necklace worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead. 

Last check wearing a hat:
	if the player wears a hat:
		let item be a random hat worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;
	[abide by the suit check rule]. 
		
Last check wearing a shirt:
	if the player wears a shirt:
		let item be a random shirt worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;
	abide by the suit check rule.

Last check taking off a shirt:
	if the player wears a cursed cloak:
		let item be a random cloak worn by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead.
		
Last check wearing a cloak:
	if the player wears a cloak:
		let item be a random cloak worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead. 
		
Last check wearing shoes:
	if the player wears shoes:
		let item be a random shoes worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;
	[abide by the suit check rule]. 
		
Last check wearing a trousers:
	if the player wears a trousers:
		let item be a random trousers worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;
	abide by the suit check rule. 
		
Last check wearing a belt:
	if the player wears a belt:
		let item be a random belt worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead. 
		
Last check wearing gauntlets:
	if the player encloses at least one cursed readied weapon:
		let item be a random cursed readied weapon enclosed by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead;
	if the player wears gauntlets:
		let item be a random gauntlets worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead.
	[abide by the suit check rule]. 

Last check taking off gauntlets:
	if the player encloses at least one cursed readied weapon:
		let item be a random cursed readied weapon enclosed by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead.
				
Last check wearing a mask:
	if the player wears a mask:
		let item be a random mask worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead. 

Last check wearing a suit:
[	if the player wears a hat:
		let item be a random hat worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead; ]
	if the player wears a shirt:
		let item be a random shirt worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;
	if the player wears a cursed cloak:
		let item be a random cloak worn by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead; 
[	if the player wears shoes:
		let item be a random shoes worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead; ]
	if the player wears a trousers:
		let item be a random trousers worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead; 
	if the player wears a cursed belt:
		let item be a random belt worn by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead;
[	if the player wears gauntlets:
		let item be a random gauntlets worn by the player;
		take no time;
		say "You will first have to take off [the item]." instead;]
	abide by the suit check rule. 
	
This is the suit check rule:
	if the player wears a suit:
		let item be a random suit worn by the player;
		take no time;
		say "You will first have to take off [the item].";
		rule fails.

Last check taking off a suit:
	if the player wears a cursed cloak:
		let item be a random cloak worn by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead;
	if the player wears a cursed belt:
		let item be a random belt worn by the player;
		take no time;
		say "You will first have to uncurse [the item]." instead.

Does the player mean taking off something worn:
	it is very likely.
	
Does the player mean taking off something not worn:
	it is very unlikely.	

Does the player mean wearing something worn:
	it is very unlikely.

Does the player mean wearing something not worn:
	it is very likely.


Chapter - Necklaces

Section - Tormenting necklace (major)

The tormenting necklace is a major necklace.
The tormenting necklace is deathly.
The tormenting necklace is iron.

The description of the tormenting necklace is "This monstrous necklace is made of shards of glass, fossilised teeth, broken points of daggers and thorns. It is imbued with a magic that deals paralysing pain to those who are wounded in combat. [italic type](The necklace is activated in two circumstances: when the wearer is dealt damage by an attack, and when an attack by the wearer deals damage to someone else. The person who has been dealt damage will writhe in agony and must skip the next [if blood magic level of tormenting necklace is 0]turn. Feeding the necklace will increase this to two turns[otherwise]two turns[end if].)[roman type]".

The blood magic cost of tormenting necklace is 15.
The blood magic level of tormenting necklace is 0.
The blood magic maximum of tormenting necklace is 1.

The unlock level of tormenting necklace is 6.
The unlock text of tormenting necklace is "a necklace that paralyses those who get damaged in combat".

A person has a number called the necklace-torment-counter. The necklace-torment-counter of a person is usually 0.
Definition: a person (called guy) is necklace-torment-affected if necklace-torment-counter of guy is not 0.

Aftereffects rule (this is the tormenting necklace rule):
	if the global defender wears the tormenting necklace or the global attacker wears the tormenting necklace:
		if the attack damage is greater than 0:
			now necklace-torment-counter of global defender is (1 + blood magic level of tormenting necklace).

This is the necklace of torment rule:
	if necklace-torment-counter of the main actor is not 0 and combat status is combat:
		say "[The main actor] writhe[s] in [bold type]agony[roman type]!";
		decrease necklace-torment-counter of main actor by 1;
		now combat status is concluding.

The necklace of torment rule is listed before the the main actor chooses an action rule in the combat round rules.

Every turn when at least one person is necklace-torment-affected:
	if combat status is peace:
		repeat with guy running through necklace-torment-affected people:
			now necklace-torment-counter of guy is 0.

[Torment should be canceled outside combat.]

Section - Miranda's amulet (monster)

Miranda's amulet is a necklace. Miranda's amulet is proper-named.
Miranda's amulet is magical.
Miranda's amulet is silver.

The description of Miranda's amulet is "This silver amulet, shaped like the sun and imbued with magic, was given to Miranda by her father when she set out on a life of adventure. It will reflect ranged attacks back to the attacker 10% of the time.".

Check an actor hitting when the noun wears Miranda's amulet (this is the Miranda's amulet rule):
	if the global attacker weapon is ranged:
		unless the actor is the noun: [No infinite reflection cascade!]
			if a random chance of 1 in 10 succeeds:
				say "The magic of Miranda's amulet [bold type]reflects[roman type] the attack back to [the actor]!";
				try the actor hitting the actor instead.


Section - Periapt of prophecy (epic)

The periapt of prophecy is an epic necklace.
The periapt of prophecy is magical.
The periapt of prophecy is silver.

The description of the periapt of prophecy is "In most circumstances, this tiny amulet hanging from a delicate silver necklace is merely decorative. But when you are under the influence of ment, it will reveal its powers of precognition.".

The periapt attack strength is a number that varies.

This is the periapt rule:
	if the player wears the periapt of prophecy and the ment timer is greater than 0:
		if the combat status is combat:
			if the main actor is the player:
				if tome-of-law-number is not 0:
					now periapt attack strength is tome-of-law-number;
				otherwise:
					now the periapt attack strength is a roll of the dice;
				say "If you choose to attack, your performance will be [if periapt attack strength is less than 4]weak[otherwise if periapt attack strength is less than 8]average[otherwise if periapt attack strength is not 20]strong[otherwise]heroic[end if].".

The periapt rule is listed before the main actor chooses an action rule in the combat round rules.

A special set attack strength rule (this is the periapt attack roll rule):
	if the player wears the periapt of prophecy and the ment timer is greater than 0:
		if the main actor is the player:
			now attack strength is periapt attack strength.


Chapter - Hats

Section - Crown of the empire (minor)

The crown of the empire is a minor hat. The indefinite article is "the". 
The crown of the empire is civilised.
The crown of the empire is iron.

A treasure placement rule (this is the crown of empire can be crown of Hargo rule):
	if a random chance of 1 in 5 succeeds:
		now the hidden identity of the crown of the empire is the crown of Hargo.

A mind bonus rule (this is the mind bonus of the crown of the empire rule):
	if the test subject wears the crown of the empire:
		increase faculty bonus score by 2.

The description of the crown of the empire is "This harsh and heavy crown was once worn by one of the emperors of Yahvinna, a line of rulers known for their unbending willpower. [italic type](It grants a +2 mind bonus.)[roman type]".

Section - Crown of Hargo (cursed)

The crown of Hargo is a cursed curse-identified hat. The indefinite article is "the". 
The crown of Hargo is iron.

An attack modifier rule (this is the crown of Hargo rule):
	if the global defender wears the crown of Hargo:
		say " + 1 (defender is overconfident)[run paragraph on]";
		increase the attack strength by 1.

Chance to win rule when the global defender wears the crown of Hargo (this is the CTW crown of Hargo bonus rule):
	increase the chance-to-win by 1.

A mind bonus rule (this is the mind bonus of crown of Hargo rule):
	if the test subject wears the crown of Hargo:
		increase faculty bonus score by 4.

The description of Crown of Hargo is "Of all the emperors of Yahvinna, Hargo was the most arrogant and the most obstinate. This was both the foundation of his military successes and the cause of his eventual downfall. [italic type](The crown grants a +4 mind bonus, but a -1 penalty to defence.)[roman type]".

Section - Diadem of the priestess (minor)

The diadem of the priestess is a minor hat. The indefinite article is "the". 
The diadem of the priestess is religious.
The diadem of the priestess is silver.

A spirit bonus rule (this is the spirit bonus of the diadem of the priestess rule):
	if the test subject wears the diadem of the priestess:
		increase faculty bonus score by 2.

A treasure placement rule (this is the diadem of the priestess can be devil's diadem rule):
	if a random chance of 1 in 4 succeeds:
		now the hidden identity of the diadem of the priestess is the demon lord's diadem.

The description of the diadem of the priestess is "This graceful diadem has been used thousands of times in rites for gods now long dead. [italic type](It grants a +2 spirit bonus.)[roman type]".

Section - The demon lord's diadem (cursed)

The demon lord's diadem is a cursed curse-identified hat. The indefinite article is "the". 
The demon lord's diadem is silver.

A spirit bonus rule (this is the spirit bonus of the demon lord's diadem rule):
	if the test subject wears the demon lord's diadem:
		increase faculty bonus score by 4.

The description of the demon lord's diadem is "Everyone agreed that this magical necklace helped Marcia Gracewood rise to the rank of high priestess, but only her enemies believed the rumours that if was gifted to her by a powerful demon lord in exchange for her eternal service. The manner of her 'death' proved them right in the most dramatic way possible. [italic type](It grants a +4 spirit bonus. As for the demon... well... who knows?)[roman type]".

The demon-diadem-number is a number that varies.

A treasure placement rule (this is the demon's diadem calibration rule):
	if a random chance of 1 in 3 succeeds:
		now the demon-diadem-number is 0;
	otherwise:
		now the demon-diadem-number is a random number between 10 and 80.

Every turn when the player wears the demon lord's diadem:
	if the main actor is the player:
		if the demon-diadem-number is not 0:
			decrease the demon-diadem-number by 1;
			if the demon-diadem-number is 0:
				do the claim of the demon.

To do the claim of the demon:
	remove demon lord's diadem from play;
	say "With a sudden flash, a [bold type]demoness carrying a bright red whip[roman type] appears in the room. She gestures, and the silver diadem you've been wearing disappears. 'I don't think you'll need that anymore,' she states in a harsh whisper. 'Seeing how you will be spending the rest of eternity serving my master.'";
	move the demonic mistress to the location.


Section - Metastasio's hat (minor)

Metastasio's hat is a minor hat. The description of Metastasio's hat is "Metastasio envisioned whole armies that would lob grenades at the enemy, and he designed this hat to help soldiers succeed. When worn, it decreases the chance that grenades get thrown back at you by 15%.". Metastasio's hat is proper-named.
Metastasio's hat is alchemical.
Metastasio's hat is cloth.

Grenade returning rule (this is the Metastasio's hat rule):
	if player wears Metastasio's hat:
		decrease grenade-return-percentage by 15.


Section - Crown of the god-king (major)

The crown of the god-king is a major hat. The indefinite article is "the". 
The crown of the god-king is religious.
The crown of the god-king is iron.

The blood magic cost of crown of the god-king is 5.
The blood magic level of crown of the god-king is 0.
The blood magic maximum of crown of the god-king is 99.

The description of the crown of the god-king is "This terrible crown, made of magical iron needles, can grant immense powers to its wearer. But they have to be bought at a high price. [italic type](Current bonus: +[blood magic level of the crown of the god-king] to body, mind and spirit. This bonus will increase to +[blood magic level of the crown of the god-king + 1] if you feed the crown [current blood cost of crown of the god-king] blood.)[roman type]".

A faculty bonus rule (this is the crown of the god-king bonus rule):
	if the test subject wears the crown of the god-king:
		increase faculty bonus score by blood magic level of the crown of the god-king.


Section - The inquisitor's hood (special)

[Gifted by Nomos.]

The inquisitor's hood is a hat. The description of the inquisitor's hood is "Dedication to Nomos requires discipline and concentration. To avoid being distracted by the blows of their enemies and the screams of tortured heretics, the inquisitors wear these magical hoods. This particular one gives you a +15% chance of remaining concentrated when damaged."

A remain concentrated rule (this is the inquisitor's hood concentration rule):
	if global defender wears the inquisitor's hood:
		increase remain concentrated chance by 15.


Section - Pale phylactery

The pale phylactery is an epic hat.
The pale phylactery is magical.
The pale phylactery is silver.

The description of the pale phylactery is "A small silver amulet inlaid with colourless stones that were not formed on our planet. When worn on the forehead, the phylactery gives you a +10% chance of remaining concentrated when damaged. But its true power is only revealed when you are under the influence of ment: for in that state, it ensures that you do not lose your concentration when you attack.".

A remain concentrated rule (this is the pale phylactery concentration rule):
	if global defender wears the pale phylactery:
		increase remain concentrated chance by 10.

After an actor hitting (this is the alternative lose concentration after attacking rule):
	unless (global attacker is the player and player wears pale phylactery and ment timer is greater than 0):
		now the concentration of the global attacker is 0;
		continue the action.

The lose concentration after attacking rule is not listed in any rulebook.


Chapter - Shirts

Section - Smoky robe (minor)

The smoky robe is a minor shirt.
The smoky robe is alchemical.
The smoke robe is cloth.

The description of the smoky robe is "This robe is adorned with smoke-like, cloudy patterns.".

An attack modifier rule (this is the smoky robe is better when smoke rule):
	if the global defender wears the smoky robe:
		unless the global attacker is smoke immune:
			if the smoke penalty of the location is not 0:
				let n be the smoke penalty of the location;
				say " - [n] (the smoky robe is hard to see)[run paragraph on]";
				decrease the attack strength by n.

Chance to win rule (this is the CTW smoky robe penalty rule):
	if the global defender wears the smoky robe:
		unless the global attacker is smoke immune:
			if the smoke penalty of the location is not 0:
				let n be the smoke penalty of the location;
				decrease the chance-to-win by n.
				
Section - Bodice of physique (minor)

The bodice of physique is a minor shirt. The indefinite article is "the". 
The bodice of physique is civilised.
The bodice of physique is cloth.

A body bonus rule (this is the body bonus of the bodice of physique rule):
	if the test subject wears the bodice of physique:
		increase faculty bonus score by 2.

The description of the bodice of physique is "This magical item is an elegant green and black garment, stiffened with whalebone and laced in front. It makes the wearer's body supple and responsive as never before. [italic type](It grants a +2 body bonus.)[roman type]".	

A treasure placement rule (this is the bodice of physique can be bodice of breathlessness rule):
	if a random chance of 1 in 6 succeeds:
		now the hidden identity of the bodice of physique is the bodice of breathlessness.

Section - Bodice of breathlessness (cursed)

The bodice of breathlessness is a cursed curse-identified shirt. The indefinite article is "the".
The bodice of breathlessness is cloth.

A body bonus rule (this is the body bonus of the bodice of breathlessness rule):
	if the test subject wears the bodice of breathlessness:
		let m be (concentration of the test subject * 2);
		let n be (2 - m);
		increase faculty bonus score by n.

The description of the bodice of breathlessness is "This magical item is an elegant green and black garment, stiffened with whalebone and laced in front. While it makes the wearer's body supple and responsive as never before, it has a hidden defect: when you concentrate, the lace tightens and pushes the breath from your body.[paragraph break][italic type](The bodice of breathlessness grants a +2 body bonus when not concentrated, but this is reduced by 2 for every level of concentration. Thus, you will have a -4 body penalty when you have 3 levels of concentration.)[roman type]".

To decide whether breathlessness is the case:
	if the player wears the bodice of breathlessness:
		decide yes;
	otherwise:
		decide no.

Report concentrating when breathlessness is the case (this is the bodice of breathlessness reporting rule):
	if the concentration of the actor is:
		-- 1:
			say "You are now mildly concentrated. The lace of your bodice tightens uncomfortably.";
		-- 2:
			say "You are now quite concentrated.  Your bodice tightens even more, making it hard to breath.";
		-- 3:
			say "You are now maximally concentrated.  You struggle to get air as the bodice almost crushes your ribs.";
	rule fails.

[
[Too boring right now, because there are almost no flaming weapons.]

Section - Asbestos vest (minor)

The asbestos vest is a minor shirt. The description of asbestos vest is "While it doesn't provide much protection against weapons, this vest could be useful for its fire resistance. It bears the signs of the Montenoir alchemist guild.".
Asbestos vest is alchemical.
Asbestos vest is other-material.

Heat resistance rule (this is the asbestos vest heat resistance rule):
	if test subject wears asbestos vest:
		increase temp-heat by 4.]


Section - Monk's robe (monster)

The monk's robe is a shirt. The monk's robe is cloth.

The description of monk's robe is "A plain and simple brown robe. Years of being worn by deniers of the flesh has instilled ascetic virtues in the fabric. [italic type](-2 body, +2 mind, +2 spirit)[roman type]".

A body bonus rule (this is the body penalty of the monk's robe rule):
	if the test subject wears the monk's robe:
		decrease faculty bonus score by 2.

A mind bonus rule (this is the mind bonus of the monk's robe rule):
	if the test subject wears the monk's robe:
		increase faculty bonus score by 2.		

A spirit bonus rule (this is the spirit bonus of the monk's robe rule):
	if the test subject wears the monk's robe:
		increase faculty bonus score by 2.



Section - Mendele's robe (major)

Mendele's robe is a major shirt. Mendele's robe is proper-named, alchemical and cloth.

The description of Mendele's robe is "The mad monk Mendele gained notoriety for his fanatical belief in the malleability of the human body. This cloak is one of his most insane creations: whenever the wearer absorbs a soul, his or her body will mutate in unpredictable ways.".

Last absorbing a power (called the granted power):
	if the player wears Mendele's robe:
		say "The robe of the mad monk lights up in a flash of mutagenic glow.[paragraph break]";
		consider the mutating rules.


Section - Robe of the Dead Mage (epic)

[Concentration not broken on hit; damage increased by 33% per point of concentration.]

The robe of the dead mage is an epic shirt.
The robe of the dead mage is magical.
The material of the robe of the dead mage is cloth.
The indefinite article of the robe of the dead mage is "the".
The unlock level of the robe of the dead mage is 7.
The unlock text of the robe of the dead mage is "a piece of clothing that allows you to remain concentrated when hit... at a price".

The description of the robe of the dead mage is "Dominique, marquis of Savon, one of the great mages of his generation, was so fed up with losing his concentration when he was hit that he developed this robe. When the wearer is damaged in combat, he will not lose his concentration; but the protection comes from his life force, and the damage dealt to him is increased by 25% for every level of concentration. Nobody ever died with as much concentration as Dominique.".

A damage multiplier rule when the global defender wears the robe of the dead mage (this is the robe of the dead mage damage multiplier rule):
	if concentration of the global defender is:
		-- 1:
			say " + 25% (robe of the dead mage)[run paragraph on]";
			increase the attack damage by the attack damage divided by 4;
		-- 2:
			say " +50% (robe of the dead mage)[run paragraph on]";
			increase the attack damage by the attack damage divided by 2;		
		-- 3:
			say " + 75% (robe of the dead mage)[run paragraph on]";
			let n be the attack damage divided by 4;
			now the attack damage is the attack damage times 2;
			decrease the attack damage by n;
		-- 4:
			say " + 100% (robe of the dead mage)[run paragraph on]";
			now the attack damage is the attack damage times 2.

An attack modifier rule (this is the robe of the dead mage protects you rule):
	if the global defender wears the robe of the dead mage:
		say " - 1 (robe of the dead mage)[run paragraph on]";
		decrease the attack strength by 1.		

Chance to win rule (this is the CTW robe of the dead mage rule):
	if the global defender wears the robe of the dead mage:
		decrease the chance-to-win by 1.

A remain concentrated rule (this is the robe of the dead mage concentration rule):
	if global defender wears the robe of the dead mage:
		increase remain concentrated chance by 1000.


An AI action selection rule for an at-Act person (called P) (this is the robe of the dead mage discourages attacking rule):
	if chosen target wears the robe of the dead mage:
		choose row with an Option of the action of P attacking the chosen target in the Table of AI Action Options;
		decrease the Action Weight entry by the concentration of the chosen target.

Section - Gown of the red court (Nomos)

The gown of the red court is a shirt. The gown of the red court is cloth. The description of the gown of the red court is "Citizens of Montenoir who have been accused of a capital offence are always judged by a special court comprised of their female relatives. Foreigners often scoff at this system, assuming that nobody is ever convicted. They do not understand that the love of law is greater than the love of family, and that the sight of one's own mother or wife in the blood red judge's gown will make even the most hardened criminals tremble. [italic type](Wearing the gown gives you one level of dreadful presence.)[roman type]".

A dread rule (this is the gown of the read court dread rule):
	if test subject wears gown of the red court:
		increase dread dummy by 1.


Chapter - Cloaks

Section - Cloak of shadows (epic)

The cloak of shadows is an epic cloak.
The cloak of shadows is civilised.
The cloak of shadows is cloth.

The description of the cloak of shadows is "Wearing this powerful cloak allows you to become hidden and sneak through the dungeon undetected. You cannot hide in the presence of enemies, though.".

Every turn when the player wears the cloak of shadows (this is the blend into shadows rule):
	if combat status is peace:
		if the player is not hidden and the player is alive and the player is the main actor:
			hide.

After taking off the cloak of shadows when the player is hidden:
	now player is not hidden;
	say "You reveal your presence to the world.".

Section - Cloak of reflection (minor)

The cloak of reflection is a minor cloak.
The cloak of reflection is magical.
The cloak of reflection is cloth.

The unlock level of cloak of reflection is 8.
The unlock text of cloak of reflection is "a cloak that sometimes reflects ranged attacks back to the attacker".

The blood magic cost of cloak of reflection is 4.
The blood magic level of cloak of reflection is 0.
The blood magic maximum of cloak of reflection is 3.

To decide which number is the cloak of reflection percentage:
	let n be 15 * blood magic level of cloak of reflection;
	increase n by 15;
	decide on n.

The description of the cloak of reflection is "A piece of silk with thousands of small magical mirrors sewn on it, this cloak is both beautiful and useful. It will reflect ranged attacks back to the attacker [cloak of reflection percentage]% of the time[if blood magic level of cloak of reflection is not blood magic maximum of cloak of reflection]. This will increase by 15% if the cloak is fed[end if].".

Check an actor hitting when the noun wears the cloak of reflection (this is the cloak of reflection rule):
	if the global attacker weapon is ranged:
		unless the actor is the noun: [No infinite reflections]
			let n be 15 * (1 + blood magic level of cloak of reflection);
			if a random chance of n in 100 succeeds:
				say "[if the noun is the player]The[otherwise][Possessive of the noun][end if] cloak of reflection [bold type]reflects[roman type] the attack back to [the actor]!";
				try the actor hitting the actor instead.

A dungeon interest rule (this is the Malygris sometimes wears the cloak of reflection rule):
	if a random chance of 1 in 10 succeeds:
		if Malygris does not wear a cloak:
			now Malygris wears the cloak of reflection;
			if generation info is true, say "* Malygris wears the cloak of reflection.".


Section - Psychedelic cloak (minor)

The psychedelic cloak is a minor cloak.
The psychedelic cloak is magical.
The psychedelic cloak is cloth.

The description of the psychedelic cloak is "[if ment timer is 0]Despite its name, it is just a boring square cloak.[otherwise]Bright patches of colour move chaotically across the psychedelic cloak. Groovy! [italic type](The distracting presence of this object is bound to temporarily lower the mind scores of those who see it -- you excluded.)[roman type][end if]"

A mind bonus rule (this is the psychedelic cloak rule):
	if the test subject can see the psychedelic cloak and test subject is not the player:
		if the player wears the psychedelic cloak and the ment timer is not 0:
			decrease faculty bonus score by (1 + ment bonus).

Last carry out snorting a package of ment:
	if the player wears the psychedelic cloak:
		say "Your cloak suddenly becomes very psychedelic!".

[Last carry out rules fires even when silently taking off, e.g., when doing "drop cloak". First report rule stops normal report rule.]

Last carry out wearing the psychedelic cloak:
	if the ment timer is not 0:
		say "As you fasten it, the cloak suddenly becomes very psychedelic!".
	
First report wearing the psychedelic cloak:
	if the ment timer is not 0:
		rule succeeds.
	
Last carry out taking off the psychedelic cloak:
	if the ment timer is not 0:
		say "The cloak returns to its dull, grey state.".
	
First report taking off the psychedelic cloak:
	if the ment timer is not 0:
		rule succeeds.
	

Chapter - Shoes

Section - Soft slippers (minor)

The soft slippers are minor shoes. The soft slippers are plural-named. The description of the soft slippers is "A pair of comfortable slippers, looking like cute [one of]pink[or]yellow[or]mint green[or]baby blue[or]turquoise[sticky random] [one of]mindslugs[or]Tooloos[or]blood apes[or]armadillos[or]demons of rage[or]minotaurs[or]abysses of the soul[or]imps[sticky random]. They will allow you to remain hidden more easily.".
Soft slippers are civilised.

Detection rule (this is the soft slippers detection rule):
	if the player wears the soft slippers:
		say " + 1 (soft slippers)[run paragraph on]";
		increase the hiding roll by 1.


Section - Boots of the war dance (major)

The boots of the war dance are major shoes. The boots of the war dance are plural-named. The indefinite article of the boots of the war dance is "the". The description of boots of the war dance is "These graceful boots, supposedly made by the master of Algir, will grant you impeccable footwork in combat. [italic type](They give you a +1 bonus to dodging.)[roman type]".
Boots of the war dance are civilised.

This is the boots of the wardance rule:
	if the global defender is at dodge and the global defender wears the boots of the war dance:
		if the numbers boolean is true:
			say " - 1 (boots of the war dance)[run paragraph on]";
		decrease the attack strength by 1.

The boots of the wardance rule is listed before the standard tension attack modifier rule in the attack modifier rules.
		
A treasure placement rule (this is the war dance can be wandering rule):
	if a random chance of 1 in 4 succeeds:
		now the hidden identity of the boots of the war dance is boots of wandering.

Section - Boots of wandering (cursed)

The boots of wandering are cursed curse-identified shoes. The boots of wandering are plural-named. The indefinite article of boots of wandering is "the". The description of boots of wandering is "These graceful boots were supposed to grant their wearer impeccable footwork in combat. Unfortunately, when a prince of Algir wore these boots in the War of the Woods, they were cursed by a dying druid. They are now exceedingly unsafe.".

Before doing anything when the player wears the boots of wandering (this is the boots of wandering weirdness rule):
	if the player can move:
		if a random chance of 1 in 40 succeeds:
			if at least one room is adjacent to the location of the player:
				let place2 be the location of the player; [needed because of a bug in inform]
				let place be a random room which is adjacent to place2;
				let way be the direction from the location of the player to place;
				say "Before you can do anything, the [bold type]boots of wandering[roman type] attempt to run [way]!";
				now forced-action is true;
				try going way instead.





Chapter - Trousers


Chapter - Belts


Chapter - Gauntlets

Section - Gauntlets of grip (major)

The gauntlets of grip are major gauntlets. The gauntlets of grip are plural-named. The indefinite article is "the".
The gauntlets of grip are civilised.
The gauntlets of grip are iron.
The description of the gauntlets of grip is "These sturdy armoured gloves make it easier to parry your opponent's attacks.".

This is the gauntlets of grip rule:
	if the global defender is at parry and the global defender wears the gauntlets of grip:
		if the gauntlets of grip are not rusted:
			if the numbers boolean is true:
				say " - 1 (gauntlets of grip)[run paragraph on]";
			decrease the attack strength by 1.

The gauntlets of grip rule is listed before the dodge defence bonus rule in the attack modifier rules.

A treasure placement rule (this is the grip can be greasy rule):
	if a random chance of 1 in 4 succeeds:
		now the hidden identity of the gauntlets of grip is greasy gauntlets.

Section - Greasy gauntlets (cursed)

The greasy gauntlets are cursed curse-identified gauntlets. The greasy gauntlets are plural-named. The indefinite article is "the".
The greasy gauntlets are iron.
The description of the greasy gauntlets is "These armoured gloves are supernaturally slick and greasy. It might be hard to hold on to a weapon while wearing them.".

Last aftereffects rule (this is the greasy gauntlets rule):
	if the global attacker wears the greasy gauntlets and the attack damage is greater than 0:
		if the global attacker weapon is not ranged:
			if a random chance of 1 in 6 succeeds:
				do the grease drop with the global attacker;
	if the global defender wears the greasy gauntlets and the global defender is at parry and the attack damage is 0:
		if the parry-against bonus of the global attacker weapon is greater than -1:
			if a random chance of 1 in 4 succeeds:
				do the grease drop with the global defender.

To do the grease drop with (guy - a person):
	let item be a random readied weapon enclosed by guy;
	unless item is a natural weapon:
		now item is not readied;
		move item to the location of guy;
		if guy is the player:
			say "Because of the force of the blow and the slipperiness of the gauntlets, you [bold type]drop [the item][roman type].";
		otherwise:
			say "[The guy] drop[s] [the item].".


Chapter - Masks
[Includes masks, goggles, and anything else that covers the face.]

Section - War mask (minor)

The war mask is a minor mask. The description of the war mask is "This warlike metal mask is painted with the holy symbols of Aite, and is a sacred object of her religion.".
The war mask is religious.
The war mask is iron.

A beloved of Aite rule (this is the war mask Aite rule):
	if the test subject wears the war mask:
		rule succeeds.

Section - Blindfold (minor)

The blindfold is a minor mask. The description of the blindfold is "Wearing this blindfold will prevent you from seeing anything.".
The blindfold is civilised.
The blindfold is cloth.

A blindness rule (this is the blindfold rule):
	if the test subject wears the blindfold:
		rule succeeds.

Section - Goggles of acuity (major)

The goggles of acuity are a major mask. They are plural-named. The indefinite article is "the". 
The goggles of acuity are civilised.
The goggles of acuity are leather.

A treasure placement rule (this is the acuity can be blindness rule):
	if a random chance of 1 in 6 succeeds:
		now the hidden identity of the goggles of acuity is the goggles of blindness.

A faculty bonus rule (this is the faculty bonus of the goggles of acuity rule):
	if the test subject wears the goggles of acuity:
		increase faculty bonus score by 1.

The description of the goggles of acuity is "These goggles have been magically enchanted to make the wearer more aware of anything that happens around him. They were originally made for the marquis of Savon, who wasted his eyes poring over ancient tomes in his ill-lit library, but their use extends far beyond that of reading glasses. [italic type](They grant a +1 bonus to body, mind and spirit.)[roman type]".

Section - Goggles of blindness (cursed)

The goggles of blindness are a cursed curse-identified mask. They are plural-named. The indefinite article is "the". 
The goggles of blindness are leather.

A blindness rule (this is the goggles of blindness rule):
	if the test subject wears the goggles of blindness:
		rule succeeds.

The description of goggles of blindness is "These goggles prevent the wearer from seeing anything at all. A free-for-all fight between condemned criminals forced to wear such goggles is one of the most beloved shows during the Feast of Flesh; you smile as you recall the spectacle.".



Chapter - Suits

[Suits include hat, shirt, shoes, trousers, gauntlets. Furthermore, you cannot put on a suit if you wear a cursed cloak or a cursed belt.]

Section - Suit of plate mail (major)

The suit of plate mail is a major suit.
Suit of plate mail is alchemical.
Suit of plate mail is iron.

Constriction prevention of suit of plate mail is 3.

The description of the suit of plate mail is "Functional rather than beautiful, this suit has been made for a true warrior. It will protect you from harm, although it also slows you down. [italic type](-2 damage from attacks, -1 attack, -2 body.)[roman type]".			
			
A damage modifier rule (this is the plate mail damage modifiers rule):
	if the global defender is wearing the suit of plate mail:
		if the global attacker weapon is armour-stoppable:
			say " - 2 (plate mail)[run paragraph on]";
			decrease the attack damage by 2.

A physical damage reduction rule (this is the plate mail physical damage reduction rule):
	if the test subject is wearing the suit of plate mail:
		increase the pdr by 2.

An attack modifier rule (this is the plate mail attack modifiers rule):
	if the global defender wears suit of plate mail:
		if the global defender is retreater or the global defender is runner:
			say " + 2 (slowed down by plate mail)[run paragraph on]";
			increase the attack strength by 2;
	if the global attacker wears suit of plate mail:
		say " - 1 (slowed down by plate mail)[run paragraph on]";
		decrease the attack strength by 1.

A body bonus rule (this is the body penalty of the suit of plate mail rule):
	if the test subject wears the suit of plate mail:
		decrease faculty bonus score by 2.

Chance to win rule (this is the CTW plate mail rule):
	if the global attacker wears suit of plate mail:
		decrease the chance-to-win by 1.

An attack modifier rule (this is the plate mail running rule):
	if the global defender is the player and the player carries the suit of plate mail:
		if the player is retreater or the player is runner:
			say " + 2 (you are slowed down by carrying a suit of plate mail)[run paragraph on]";
			increase the attack strength by 2.

An AI action selection rule for a person (called P) (this is the concentrate to compensate for the suit of plate mail rule):
	if the chosen target is wearing the suit of plate mail:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		increase the Action Weight entry by 3.

Section - Suit of dragon armour (epic)

The suit of dragon armour is an epic suit.
Suit of dragon armour is magical.
Suit of dragon armour is dragon skin.
Understand "armor" as the suit of dragon armour.

[The difficulty level of suit of dragon armour is 3.]

The description of the suit of dragon armour is "This lovely suit has been made of dragon leather, the most durable and most magical substance known to man. It protects the wearer against most kinds of damage, but continuously drains his or her health. Use with extreme caution.".
			
Heat resistance rule (this is the dragon armour heat resistance rule):
	if test subject is wearing the suit of dragon armour:
		increase temp-heat by 4.			

[The internal heat of the suit of dragon armour is 4.]

A damage modifier rule (this is the dragon armour damage modifiers rule):
	if the global defender is wearing the suit of dragon armour:
		if the main actor is not undead:
			say " - 4 (dragon armour)[run paragraph on]";
			decrease the attack damage by 4;
		otherwise:
			say " - 2 (dragon armour)[run paragraph on]";
			decrease the attack damage by 2.

A physical damage reduction rule (this is the dragon armour damage reduction rule):
	if the test subject is wearing the dragon armour:
		increase the pdr by 2;
		if the test subject is not undead:
			increase the pdr by 2.

[Before printing the name of suit of dragon armour:
	now not-mentioning-hotness is true.

After printing the name of suit of dragon armour:
	now not-mentioning-hotness is false.]

An AI action selection rule for a person (called P) (this is the concentrate to compensate for the dragon armour rule):
	if the chosen target is wearing the suit of dragon armour:
		choose row with an Option of the action of P concentrating in the Table of AI Action Options;
		increase the Action Weight entry by 4.

Every turn when the main actor wears the dragon armour:
	if the health of the main actor is greater than 0:
		if the main actor is not undead or a random chance of 1 in 3 succeeds:
			if a random chance of 1 in 2 succeeds:
				decrease the health of the main actor by 1;
		if the health of the main actor is less than 1:
			end the story saying "The dragon armour has claimed your life".












Chapter - Grenades

Section - The grenades kind

A grenade is a kind of thing.
A grenade is usually alchemical.
A grenade is usually iron.

A grenade is either damaging or not-damaging. A grenade is usually not-damaging.

Exploding-location is a room that varies.
Exploding-grenade is a thing that varies.

The exploding rules are a rulebook.

First exploding rule (this is the exploding wakes people up rule):
	repeat with guy running through asleep persons in exploding-location:
		now guy is not asleep.

Section - Normal throwing

Instead of throwing a grenade at something:
	try throwing the noun instead.

Understand the command "throw" as something new.	
Throwing is an action applying to one carried thing. Understand "throw [something]" as throwing.
Does the player mean throwing a grenade: it is likely.

Check throwing:
	if the noun is not a grenade:
		move the noun to the location;
		say "You throw [the noun] away." instead.

Carry out throwing:
	now exploding-location is the location;
	now exploding-grenade is the noun;
	follow the exploding rules.
	
Section - Throwing in a direction

Directional throwing is an action applying to one carried thing and one visible thing. Understand "throw [something] [a direction]" and "throw [something] to [a direction]" as directional throwing.

Check directional throwing:
	if the noun is not a grenade:
		take no time;
		say "That is only possible with grenades." instead.
		
Check directional throwing:		
	if the second noun is not a direction:
		take no time;
		say "You can either simply throw a grenade, or throw it in one of the cardinal directions (north, west, south, east, up, down)." instead.
		
Check directional throwing:
	let place be the room second noun from the location;
	unless place is a room:
		take no time;
		say "There is no passage in that direction." instead.

Grenade-return-percentage is a number that varies.
The grenade returning rules are a rulebook.
	
Carry out directional throwing:
	now exploding-location is the room second noun from the location;
	now exploding-grenade is the noun;
	if the number of alive thrower persons in exploding-location is 0:
		now grenade-return-percentage is 0;
	otherwise:
		follow the grenade returning rules;
	if a random chance of grenade-return-percentage in 100 succeeds:
		say "You throw [the noun] [second noun] -- but before it can explode, it is thrown back towards you!";
		now exploding-location is the location;
		follow the exploding rules;		
	otherwise:
		say "You throw [the noun] [second noun], where you hear it explode.";
		follow the exploding rules;
		if (exploding-grenade is damaging and a random chance of 2 in 7 succeeds) or a random chance of 1 in 15 succeeds:
			repeat with guy running through alive persons in exploding-location:
				now guy is follower;
				if follower percentile chance of guy is less than 90:
					increase follower percentile chance of guy by 10;
	if the room second noun of location collapses location:
		if a random chance of 1 in 20 succeeds:
			let X be room second noun of location;
			change the second noun exit of location to nothing;
			let reverse be the opposite of second noun;
			change the reverse exit of X to nothing;
			say "That grenade seems to have hit the walls of the passage [second noun] with a little too much force. With a huge crash, the [if second noun is up or second noun is down]staircase[otherwise]corridor[end if] [bold type]collapses[roman type]!";
			now X does not collapse location;
			now location does not collapse X.
	
First grenade returning rule:
	now grenade-return-percentage is 25.

Grenade returning rule (this is the people throw back grenades rule):
	let q be the number of alive thrower persons in exploding-location;
	increase grenade-return-percentage by (10 * q).
	
Grenade returning rule (this is the up and down direction grenade throwing rule):
	if direction from exploding-location to location is down:
		increase grenade-return-percentage by 20;
	if direction from exploding-location to location is up:
		decrease grenade-return-percentage by 20.
	

Section - Flash grenades

A flash grenade is a kind of grenade. The description of a flash grenade is "When thrown, this magical grenade emits a pulse of searing light so strong that it will blind anyone in its vicinity, even if they close their eyes. The device is universally judged to be Metastasio's most useless invention.".
A flash grenade is iron.

A person has a number called the flash-grenade-timer.

Every turn (this is the recover from flash rule):
	if the flash-grenade-timer of the main actor is greater than 0:
		decrease flash-grenade-timer of the main actor by 1;
		if flash-grenade-timer of the main actor is 0:
			unless main actor is blind:
				say "[The main actor] can [bold type]see again[roman type]!".
				
A blindness rule (this is the blind if flashed rule):
	if flash-grenade-timer of test subject is greater than 0:
		rule succeeds.				

An exploding rule:
	if the exploding-grenade is a flash grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the flash grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			let lijst be a list of person;
			repeat with guy running through alive persons in exploding-location:
				unless guy is blind:
					let n be 15;
					decrease n by (final body of guy / 3);
					unless guy is smoke immune:
						decrease n by smoke penalty of the exploding-location;
					if n is less than 0:
						now n is 0;
					if n is not 0:
						add guy to lijst;
						now flash-grenade-timer of guy is n;
			if exploding-location is location:
				say "The flash grenade explodes, and a blinding light [unless lijst is empty]burns away the retinae of anyone unlucky enough to see it clearly, namely, [lijst with definite articles][otherwise]flashes through the room[end if].";
		remove exploding-grenade from play.

Section - Rust grenade

A rust grenade is a kind of grenade. The description of a rust grenade is "When thrown, this grenade will release a thick cloud of rust spores -- a nasty fungus that rusts away iron. Its use is forbidden in all civilised and most uncivilised countries.".
A rust grenade is iron.

An exploding rule:
	if the exploding-grenade is a rust grenade:
		if exploding-location is the location:
			say "The rust grenade explodes, and it immediately releases a cloud of rust spores!";
		remove noun from play;
		now the exploding-location is rust-spored.

Section - Smoke grenade

A smoke grenade is a kind of grenade. The description of a smoke grenade is "When thrown, this grenade will release thick clouds of smoke. You once used such devices to help the prince escape from a confrontation with the henchmen of the vengeful countess of Poitier; that was long before your relationship soured.".
A smoke grenade is iron.

An exploding rule:
	if the exploding-grenade is a smoke grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the smoke grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			if exploding-location is location:
				say "The smoke grenade explodes, releasing a large cloud of smoke.";
			let n be a random number between 6 and 8;
			increase the smoke timer of the exploding-location by n;
		remove noun from play.

Section - Fragmentation grenade

A fragmentation grenade is a kind of grenade. The description of a fragmentation grenade is "When thrown, the [if the fragmentation grenade is silver]silver [end if]fragmentation grenade will explode into many sharp fragments. These are guaranteed to deal damage to everyone in the location[if the fragmentation grenade is silver], but especially to undead and demons[end if]. You cannot handle these items without a feeling of national pride; for it was this invention of Metastasio's that allowed the outnumbered forces of Louis VIII to defeat the Algirian hordes.".
A fragmentation grenade is iron.
A fragmentation grenade is damaging.
Understand "frag" as a fragmentation grenade.

An exploding rule:
	if the exploding-grenade is a fragmentation grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the fragmentation grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			if exploding-location is the location:
				say "The grenade explodes, dealing [run paragraph on]";
			have a fragmentation event in exploding-location with noun by player.

Section - Blessed Grenade (major)

The Blessed Grenade is a major grenade. The indefinite article of the Blessed Grenade is "the". The description of Blessed Grenade is "This grenade is rumoured to be extremely effective against undead.".

An exploding rule:
	if the exploding-grenade is a Blessed Grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:	
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the Blessed Grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			if the number of alive undead persons in the exploding-location is less than 1:
				if the location is the exploding-location:
					say "As the grenade explodes you hear the singing of angels. But nothing further appears to happen.";
			otherwise:
				let K be the list of alive undead persons in the location;
				if the location is the exploding-location:
					say "As the grenade explodes you hear the singing of angels, several of whom swoop down from the heavens with huge swords and eviscerate [K with definite articles].";
				repeat with guy running through K:
					now health of guy is -1;
					clean the table of delayed actions for the guy;
				if the player is dead:
					end the story saying "The undead should not seek blessings.";
		remove the noun from play.

Section - Teleportation grenade

A teleportation grenade is a kind of grenade. The description of a teleportation grenade is "When thrown, this grenade will release powerful magic that randomly teleports everyone in the room.".
A teleportation grenade is iron.
Understand "tele" and "teleport" as a teleportation grenade.

An exploding rule:
	if the exploding-grenade is a teleportation grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the teleportation grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			if exploding-location is location:
				say "The teleportation grenade explodes in a dazzling, multi-coloured flash!";
			repeat with guy running through alive people in exploding-location:
				if guy is not the player:
					let n be teleport amount of guy;
					try the guy teleporting;
					now teleport amount of guy is n; [compensating]
					if follower percentile chance of guy is greater than 20:
						decrease follower percentile chance of guy by 10; [disoriented]
			if exploding-location is location:
				unless teleportation is impossible for the player:
					teleport the player;
				otherwise:
					say "Something has stopped you from teleporting.";
		remove noun from play.

Section - Morphean grenade

A Morphean grenade is a kind of grenade. The description of a Morphean grenade is "When thrown, this grenade will release a sleeping gas that drives everyone into the embrace of Morpheus."
A Morphean grenade is iron.

An exploding rule:
	if the exploding-grenade is a Morphean grenade:
		if the noun is rusted and a random chance of 1 in 2 succeeds:
			if exploding-location is the location:
				say "There is only a feeble explosion. The rust must have rendered the Morphean grenade useless.";
			otherwise:
				say "The explosion does seem to be very feeble, though.";
		otherwise:
			if exploding-location is location:
				say "The Morphean grenade explodes, and you are immediately overwhelmed by sleep.";
				repeat with guy running through alive people in exploding-location:
					if guy is sleeper:
						now guy is asleep;
			otherwise:
				repeat with guy running through alive people in exploding-location:
					if guy is sleeper:
						now guy is asleep;
		remove noun from play.


Section - Grenade packs

The small-flash-grenade-pack is a minor treasure pack. Two flash grenades are in the small-flash-grenade-pack.
The small-flash-grenade-pack is elemental.

The large-flash-grenade-pack is a major treasure pack. Three flash grenades are in the large-flash-grenade-pack.
The large-flash-grenade-pack is elemental.

The small-rust-grenade-pack is a minor treasure pack. One rust grenade is in the small-rust-grenade-pack.
The small-rust-grenade-pack is barren. The rarity of the small-rust-grenade-pack is 1.

The small-smoke-grenade-pack is a minor treasure pack. One smoke grenade is in the small-smoke-grenade-pack.
The small-smoke-grenade-pack is alchemical.

The large-smoke-grenade-pack is a major treasure pack. Three smoke grenades are in the large-smoke-grenade-pack.
The large-smoke-grenade-pack is alchemical.

The small-fragmentation-grenade-pack is a minor treasure pack. One fragmentation grenade is in the small-fragmentation-grenade-pack.
The small-fragmentation-grenade-pack is alchemical.

The large-fragmentation-grenade-pack is a major treasure pack. Two fragmentation grenades are in the large-fragmentation-grenade-pack.
The large-fragmentation-grenade-pack is alchemical.

The small-teleportation-grenade-pack is a minor treasure pack. One teleportation grenade is in the small-teleportation-grenade-pack.
The small-teleportation-grenade-pack is magical.

The large-teleportation-grenade-pack is a major treasure pack. Two teleportation grenades are in the large-teleportation-grenade-pack.
The large-teleportation-grenade-pack is magical.

The small-Morphean-grenade-pack is a minor treasure pack. One Morphean grenade is in the small-Morphean-grenade-pack.
The small-Morphean-grenade-pack is magical.

The large-Morphean-grenade-pack is a major treasure pack. Two Morphean grenades are in the large-Morphean-grenade-pack.
The large-Morphean-grenade-pack is magical.

The first-misc-grenade-pack is a major treasure pack. One fragmentation grenade is in the first-misc-grenade-pack. One teleportation grenade is in the first-misc-grenade-pack. One flash grenade is in the first-misc-grenade-pack.
The first-misc-grenade-pack is alchemical.

The second-misc-grenade-pack is a major treasure pack. One fragmentation grenade is in the second-misc-grenade-pack. One Morphean grenade is in the second-misc-grenade-pack. One rust grenade is in the second-misc-grenade-pack.
The second-misc-grenade-pack is alchemical.




Chapter - Salves

Section - The salves kind

A salve is a kind of thing.
A salve is usually alchemical.
A salve can be reusable. A salve is usually not reusable.

Applying it to is an action applying to one carried thing and one thing. Understand "apply [something] to [something]" as applying it to. Understand "rub [something] on [something]" as applying it to.
Does the player mean applying a salve to something: it is very likely.

Check putting a salve on something:
	try applying the noun to the second noun instead.

Check applying it to:
	if the second noun is enclosed by a person:
		let guy be a random person enclosing the second noun;
		if faction of the guy hates faction of the player:
			take no time;
			say "You cannot rub a salve on the weapon held by someone who is hostile to you." instead.

Before applying something to a person (this is the putting a salve on someone is risky rule):
	if the faction of the second noun hates the faction of the player:
		if player is not hidden:
			say "The salve at the ready, you attempt to reach [the second noun].";
			now player is risky;
			try the second noun hitting the player;
			now player is not risky;
			if player is dead:
				stop the action;
		now player is not hidden.

Carry out applying something to something:
	say "Nothing particular seems to happen.";
	unless the noun is reusable:
		remove the noun from play.

Section - Unguentum argenti

An unguentum argenti is a kind of salve. The plural of unguentum argenti is unguenta argenti. The description of unguentum argenti is "An expensive alchemical salve that can be rubbed on iron objects to turn them into silver.". Understand "salve" as unguentum argenti.

Carry out applying unguentum argenti to an iron weapon:
	say "You carefully apply the salve to [the second noun], turning it into a silver weapon.";
	now the second noun is silver;
	remove noun from play;
	rule succeeds.

Carry out applying unguentum argenti to an alive iron person:
	say "You apply the salve wherever you can, significantly weakening [the second noun].";
	now the second noun is silver;
	remove noun from play;
	now permanent health of the second noun is permanent health of the second noun divided by 2;
	now health of the second noun is health of the second noun divided by 2;
	if health of the second noun is less than 1:
		now health of the second noun is 1;
	rule succeeds.

Carry out applying unguentum argenti to an iron thing:
	say "You carefully apply the salve to [the second noun], turning it into silver.";
	now second noun is silver;
	remove noun from play;
	rule succeeds.
		
The small-unguentum-argenti-pack is a minor treasure pack. One unguentum argenti is in the small-unguentum-argenti-pack.
The small-unguentum-argenti-pack is alchemical.

The large-unguentum-argenti-pack is a major treasure pack. Two unguenta argenti are in the large-unguentum-argenti-pack.
The large-unguentum-argenti-pack is alchemical.


Section - Unguentum crescendi (minor)

[Growing and shrinking are now reversible, so we can allow the player to use both salves on the same weapon. We keep immunities for stuff like the mace of the ape king.] 

A thing can be crescendi-immune. A thing is usually not crescendi-immune.

An unguentum crescendi is a kind of salve. The plural of unguentum crescendi is unguenta crescendi. The description of unguentum crescendi is "An expensive alchemical salve that can be rubbed on weapons to make them grow. It can be used multiple times.". Understand "salve" as unguentum crescendi.

Carry out applying unguentum crescendi to something:
	unless the second noun is a weapon:
		say "The salve will only work on weapons.";
		take no time;
	otherwise:
		if the second noun is gargantuan:
			say "You cannot make that any bigger.";
			take no time;
		otherwise:
			if the second noun is crescendi-immune:
				say "Some magic seems to protect [the second noun] from the salve.";
			otherwise:
				say "You carefully apply the salve to [the second noun], ";
				increase the size of the second noun;
				say "turning it [size of the second noun].";
	rule succeeds.

The small-unguentum-crescendi-pack is a minor treasure pack. One unguentum crescendi is in the small-unguentum-crescendi-pack.
The small-unguentum-crescendi-pack is alchemical.

Section - Unguentum diminuendi (minor)

A thing can be diminuendi-immune. A thing is usually not diminuendi-immune.

An unguentum diminuendi is a kind of salve. The plural of unguentum diminuendi is unguenta diminuendi. The description of unguentum diminuendi is "An expensive alchemical salve that can be rubbed on weapons to make them shrink. It can be used multiple times.". Understand "salve" as unguentum diminuendi.

Carry out applying unguentum diminuendi to something:
	unless the second noun is a weapon:
		say "The salve will only work on weapons.";
		take no time;
	otherwise:
		if the second noun is tiny:
			say "You cannot make that any smaller.";
			take no time;
		otherwise:
			if the second noun is diminuendi-immune:
				say "Some magic seems to protect [the second noun] from the salve.";
			otherwise:		
				say "You carefully apply the salve to [the second noun], ";
				decrease the size of the second noun;
				say "turning it [size of the second noun].";
	rule succeeds.

The small-unguentum-diminuendi-pack is a minor treasure pack. One unguentum diminuendi is in the small-unguentum-diminuendi-pack.
The small-unguentum-diminuendi-pack is alchemical.


Chapter - Sprayables

Section - The sprayables kind

A sprayable is a kind of thing.
A sprayable is usually alchemical.

Spraying is an action applying to one carried thing. Understand "spray [something]" as spraying.
Does the player mean spraying a sprayable: it is very likely.

Check spraying:
	if noun is not a sprayable:
		take no time;
		say "That cannot be sprayed." instead.

Section - Fungicide contraption

The fungicide contraption is a minor sprayable. The description of the fungicide contraption is "This weird contraption contains a powerful fungus killing substance. Spraying it will immediately clear a room of all spores.".

Carry out spraying fungicide contraption:
	if location is rust-spored:
		say "You spray the fungicide all around. The rust spores blacken and wither.";
		now location is not rust-spored;
	otherwise:
		say "You spray the fungicide all around.";
	repeat with way running through cardinal directions:
		let place be the room way from the location;
		unless place is nothing:
			now place is not rust-spored.








Chapter - Scrolls

Section - The scrolls kind

A scroll is a kind of thing. There is a scroll. [So that iterating through scroll subkinds works!]
A scroll is usually improper-named.
A scroll is usually civilised.
A scroll is usually paper.
A scroll is readable.
Understand "scroll" as a scroll.
Understand "scrolls" as the plural of a scroll.

Carry out reading a scroll:
	remove the noun from play.

Section - Unidentified Scrolls

[ Scroll names are used for printing and parsing scrolls. Each kind of scroll needs a corresponding scroll name value.
If the scroll kind is just one word, it's easy - follow the example of the scroll of teleportation.
If it has more than one word you'll need to add extra understand phrases - see the scroll of curse removal. ]

A scroll name is a kind of value.
Some scroll names are defined by the Table of Scroll Names.

Table of Scroll Names
scroll name	printed name	obfuscated	unhealthy
mort	"MORT EILYSH"	true	false
naar	"NAAR OD ERAE"	true
dolp	"DOLP ZEEZ"	true
chetnak	"CHETNAK"	true
cistrob	"CISTROB JIRSGEV"	true
twan	"TWAN METIER"	true
hermei	"HERMEI LE SCHIM"	true
lonsifira	"LONSIFIRA"	true
kripmeteel	"KRIPMETEEL"	true
souspenot	"SOUSPENOT"	true
shalm	"SHALM SAWESAS"	true
petrichor	"PETRICHOR"	true
malleote	"MALLEOTE"	true
paven	"PAVEN"	true
ancholain	"ANCHOLAIN"	true

Definition: a scroll name is obfuscated if obfuscated of it is true.
Definition: a scroll name is unhealthy if unhealthy of it is true.
Definition: a scroll name is healthy if obfuscated of it is false and unhealthy of it is false.

Understand "mort" and "eilysh" as mort.
Understand "naar" and "od" and "erae" as naar.
Understand "dolp" and "zeez" as dolp.
Understand "cistrob" and "jirsgev" as cistrob.
Understand "twan" and "metier" as twan.
Understand "hermei" and "le" and "schim" as hermei.
Understand "shalm" and "sawesas" as shalm.

A scroll is usually privately-named.
A scroll can be identified or unidentified. A scroll is usually identified.
A scroll has a scroll name.
A scroll has a scroll name called obfuscated name.
A scroll has a scroll name called true name.

Understand the scroll name property as describing a scroll.
Understand the obfuscated name property as describing a scroll.

Understand "labelled" as a scroll when the scroll is unidentified.
Understand "of" as a scroll when the scroll is identified.

Rule for printing the name of a scroll (called S) (this is the printing the name of scrolls rule):
	let name be printed name of scroll name of S;
	if S is unidentified:
		say "scroll labelled [name]";
	otherwise if the name is not "":
		say "scroll of [name]";
	otherwise:
		say "scroll of [scroll name of S]";

Rule for printing the plural name of a scroll (called S) (this is the printing the plural name of scrolls rule):
	let name be printed name of scroll name of S;
	if S is unidentified:
		say "scrolls labelled [name]";
	otherwise if the printed name of the scroll name of S is not "":
		say "scrolls of [name]";
	otherwise:
		say "scrolls of [scroll name of S]";
	
Instead of examining an unidentified scroll:
	say "You'll have to read this scroll to find out what it does."

[ Some I6 for iterating through the scroll subkinds ]
Include (-

! Find the kind of an object
[ KindOfObj obj;
	return KindHierarchy-->( ( obj.KD_Count ) * 2 );
];

! Test if a kind is a subkind of another kind
[ TestSubkind subclass superclass	i;
	! These classes are outside the kind heirarchy and must be dealt with first
	if ( subclass == Class or Object or Routine or String or VPH_Class )
		rfalse;
	
	while (1)
	{
		if ( KindHierarchy-->i == subclass )
			return KindHierarchy-->( KindHierarchy-->(i + 1) * 2 ) == superclass;
		i = i + 2;
	}
];

-).

To decide what object is the kind of (obj - object):
	(-  KindOfObj( {obj} ) -).

To repeat with (loopvar - nonexisting K variable) running through the/-- kinds of (kind - name of kind of value of kind K) begin -- end:
	(- objectloop( {loopvar} && metaclass({loopvar}) == Class && TestSubkind({loopvar}, KindOfObj({-default-value-for:kind})) ) -).
	
To repeat with (loopvar - nonexisting object variable) running through the/-- instances of (kind - object) begin -- end:
	(- objectloop( {loopvar} && {loopvar} ofclass {kind} ) -).

When play begins (this is the obfuscate scrolls rule):
	let names be the list of obfuscated scroll names;
	sort names in random order;
	repeat with S running through the kinds of scroll:
		let N be entry 1 of names;
		remove entry 1 from names;
		repeat with I running through the instances of S:
			now I is unidentified;
			now the true name of I is the scroll name of I;
			now the obfuscated name of I is N;
			now the scroll name of I is N;

To identify (S - a scroll):
	repeat with I running through the instances of the kind of S:
		now I is identified;
		now the scroll name of I is the true name of I;

First carry out reading an unidentified scroll:
	identify the noun;
	say "It is [a noun]!";




Section - Scroll of teleportation

Table of Scroll Names (continued)
scroll name
teleportation

A scroll of teleportation is a kind of scroll.
A scroll of teleportation is teleportation.
The description of a scroll of teleportation is "Reading this scroll will instantaneously transport the reader to another location.".
The plural of scroll of teleportation is scrolls of teleportation.

Carry out reading a scroll of teleportation:
	unless teleportation is impossible for the player:
		teleport the player;
	otherwise:
		say "The scroll disappears, but something has stopped you from teleporting.";


Section - Scroll of Ghoulification		

Table of Scroll Names (continued)
scroll name	unhealthy
ghoulification	true

A scroll of ghoulification is a kind of scroll.
A scroll of ghoulification is ghoulification.
The description of a scroll of ghoulification is "Reading this scroll will turn you into an undead ghoul.".
The plural of scroll of ghoulification is scrolls of ghoulification.

Carry out reading a scroll of ghoulification:
	ghoulify the player;


Section - Scroll of Knowledge

Table of Scroll Names (continued)
scroll name
knowledge

A scroll of knowledge is a kind of scroll.
A scroll of knowledge is knowledge.
The description of a scroll of knowledge is "Reading this scroll will grant you knowledge about all other scrolls.".
The plural of scroll of knowledge is scrolls of knowledge.

Carry out reading a scroll of knowledge:
	say "The nature of scrolls suddenly becomes clear to you.";
	repeat with S running through the kinds of scroll:
		repeat with I running through the instances of S:
			if I is unidentified:
				identify I;
				break;


Section -  Scroll of Curse Removal

Table of Scroll Names (continued)
scroll name
curse removal

Understand "curse" and "removal" as curse removal.

A scroll of curse removal is a kind of scroll.
A scroll of curse removal is curse removal.
The description of a scroll of curse removal is "Reading this scroll will remove any curses from the item you are carrying."
The plural of scroll of curse removal is scrolls of curse removal.

Definition: a thing (called the item) is uncurseable if (item is cursed and item is corruptible) or (hidden identity of item is not non-thing and hidden identity of item is cursed and hidden identity of item is corruptible).

Carry out reading a scroll of curse removal:
	if the player has at least one uncurseable thing:
		let K be a list of things;
		repeat with item running through uncurseable things had by the player:
			if hidden identity of item is not non-thing and hidden identity of item is corruptible:
				now hidden identity of item is not cursed;
			if item is corruptible:
				now item is not cursed;
			add item to K; [we uncurse the hidden identity, but we do not reveal it!]
		say "The scroll removes the curse[s] from [K with definite articles].";
	otherwise:
		say "The scroll does nothing, since you had no cursed items.";
	now the player is not death-cursed;


Section - Scroll of Shadows

[ The scroll of shadows conflicts with the cloak of shadows, so we must call the scroll name shadows-name. ]
Table of Scroll Names (continued)
scroll name	printed name
shadows-name	"shadows"

Understand "shadows" and "shadow" as shadows-name.

A scroll of shadows is a kind of scroll.
A scroll of shadows is shadows-name.
The description of a scroll of shadows is "Reading this scroll will make you hidden, though it may fail if enemies are nearby."
The plural of scroll of shadows is scrolls of shadows.

Carry out reading a scroll of shadows:
	if the player is hidden:
		say "The scroll disappears and you remain hidden.";
	otherwise:
		hide;


Section - Scroll of Summoning

Table of Scroll Names (continued)
scroll name	unhealthy
summoning	true

A scroll of summoning is a kind of scroll.
A scroll of summoning is summoning.
The description of a scroll of summoning is "Reading this scroll will summon an undead monster. Be careful, for it does not make the creature friendly."
The plural of scroll of summoning is scrolls of summoning.

Carry out reading a scroll of summoning:
	if at least one alive not super-undead undead person is off-stage:
		let guy be a random alive off-stage not super-undead undead person;
		move guy to location of the player;
		say "You speak the awful spell, and [a guy] appears before you!";
		now guy is follower;
		unless the follower percentile chance of guy is greater than 60:
			now follower percentile chance of guy is 60;
	otherwise:
		say "You speak the awful spell, but nothing happens. The planes must not be well-aligned.";


[Section - Scroll of fireworks

The description of a scroll of fireworks is "Who knows what this weird scroll will do?". The plural of scroll of fireworks is scrolls of fireworks.
A scroll of fireworks is paper.
The printed name of a scroll of fireworks is "scroll of fireworks". [Circumventing bug 459: http://inform7.com/mantis/view.php?id=459.]

Carry out reading a scroll:
	if scroll-effect of the noun is scroll-fireworks:
		remove noun from play;
		say "Gratuitous purple fireworks fill the room, spelling the words [bold type]YOU HAVE LOST THE GAME[roman type].";
		rule succeeds.]


Section - Scroll of the blade

Table of Scroll Names (continued)
scroll name	printed name
the-blade	"the blade"

Understand "blade" and "the blade" as the-blade.

A scroll of the blade is a kind of scroll.
A scroll of the blade is the-blade.
The description of a scroll of the blade is "Reading this scroll will make a temporary adamantine blade appear in your hands.".
The plural of scroll of the blade is scrolls of the blade.

Carry out reading a scroll of the blade:
	repeat with item running through weapons enclosed by the player:
		if item is readied:
			now item is not readied;
	move adamantine blade to player;
	now adamantine blade is readied;
	do the adamantine blade shuffle;
	if the player is not ethereal:
		say "A magical sword formed of adamant suddenly appears in your hands!";
	otherwise:
		say "A magical sword formed of adamant suddenly appears in your hands -- and falls through them to the ground!";
		move adamantine blade to the location;

The adamantine blade is an adamant weapon. The description of the adamantine blade is "This is a magical blade made of the hardest substance in the universe. You wonder how long the spell will last." Understand "sword" as the adamantine blade.

The adamantine blade timer is a number that varies.

To do the adamantine blade shuffle:
	now the damage die of the adamantine blade is a random number between 5 and 10;
	now the weapon attack bonus of the adamantine blade is a random number between -1 and 4;
	now the weapon damage bonus of the adamantine blade is a random number between 0 and 2;
	now the dodge bonus of the adamantine blade is a random number between -1 and 2;
	now the parry-against bonus of the adamantine blade is a random number between -1 and 2;
	now the parry-with bonus of the adamantine blade is a random number between -1 and 2;
	now the adamantine blade timer is a random number between 12 and 20.

Every turn when the adamantine blade is not off-stage (this is the adamantine blade countdown rule):
	if the main actor is the player:
		now adamantine blade timer is adamantine blade timer minus 1;
		if the adamantine blade timer is less than 1:
			if the adamantine blade is enclosed by the player and the adamantine blade is readied:
				say "The adamantine blade [bold type]vanishes[roman type] as suddenly as it appeared!";
			otherwise if the adamantine blade is visible:
				say "The adamantine blade suddenly vanishes.";
			remove the adamantine blade from play.


Section - Scroll of Protection

A person has a number called the hit protection. The hit protection of a person is usually 0.

Table of Scroll Names (continued)
scroll name
protection

A scroll of protection is a kind of scroll.
A scroll of protection is protection.
The description of a scroll of protection is "Reading this scroll will protect you against all damage from the next one or two attacks."
The plural of scroll of protection is scrolls of protection.

Carry out reading a scroll of protection:
	say "You feel protected.";
	if hit protection of the player is less than 2:
		now hit protection of the player is 1;
		if a random chance of 4 in 10 succeeds:
			now hit protection of the player is 2;

Status attribute rule (this is the protection status rule):
	if hit protection of the player is greater than 0:
		if long status is true:
			say "You are [bold type]protected[roman type] from damage dealt by attacks.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]protected from damage[run paragraph on]";

A damage multiplier rule when the hit protection of the global defender is greater than 0 (this is the hit protection damage multiplier rule):
	say " - 100% (protection)[run paragraph on]";
	now the attack damage is 0;
	decrease hit protection of the global defender by 1.


[Section - Scroll of Etherealness

Table of Scroll Names (continued)
scroll name
etherealness

A scroll of etherealness is a kind of scroll.
A scroll of etherealness is etherealness.
The description of a scroll of etherealness is "Reading this scroll will temporarily turn you ethereal."
The plural of scroll of etherealness is scrolls of etherealness.

Carry out reading a scroll of etherealness:
	say "You become ethereal[if the player has a not radiance thing]; your possessions drop to the ground[end if]!";
	make the player ethereal;
	now ethereal timer of the player is a random number between 10 and 15;]
		

Section - Scroll of Skill

Table of Scroll Names (continued)
scroll name
skill

A scroll of skill is a kind of scroll.
A scroll of skill is skill.
The description of a scroll of skill is "Reading this scroll will give you a temporary bonus to body, mind and spirit."
The plural of scroll of skill is scrolls of skill.

Carry out reading a scroll of skill:
	say "You suddenly feel very skilled!";
	increase the player skill bonus timer by a random number between 15 and 20;

The player skill bonus timer is a number that varies. The player skill bonus timer is 0.

Every turn when the player is the main actor (this is the decrease player skill bonus timer rule):
	if player skill bonus timer is greater than 0:
		decrease player skill bonus timer by 1;
		if player skill bonus timer is 0:
			say "You suddenly feel [bold type]unskilled[roman type].".

Status attribute rule (this is the skilled status rule):
	if player skill bonus timer is greater than 0:
		if long status is true:
			say "You are [bold type]skilled[roman type]: +3 bonus to body, mind and spirit.[line break][run paragraph on]";
		otherwise:
			say "[@ check initial position of attribute]skilled[run paragraph on]";

A faculty bonus rule (this is the faculty bonus of being skilled rule):
	if the test subject is the player and the player skill bonus timer is greater than 0:
		increase faculty bonus score by 3.



Section - Scroll of Death

The unholy wave rules are a rulebook.

An unholy wave rule (this is the standard unholy wave rule):
	say "A wave of unholy energy is released, dealing [run paragraph on]";
	let n be the number of alive not undead persons in the location;
	let original n be n;
	if n is greater than 0:
		repeat with guy running through all alive not undead persons in the location:
			let m be a random number between 3 and 6;
			if guy is deathly-resistant:
				decrease m by 2;
			decrease health of guy by m;
			say "[if n is 1 and original n is not 1]and [end if][m] damage to [the name of the guy][if guy is dead] (which is [bold type]lethal[roman type])[end if][roman type][if concentration of the guy is greater than 0 and guy is alive] (which breaks [possessive of the guy] concentration)[end if][if n is not 1]; [otherwise].[line break][end if][run paragraph on]";
			now concentration of the guy is 0;
			decrease n by 1;
			if n is 0:
				say ""; [For an extra newline. Don't ask.]
	otherwise:
		say "no damage to anyone.";
	if health of the player is less than 1:
		end the story saying "Your life force has been negated".

Table of Scroll Names (continued)
scroll name	unhealthy
death	true

A scroll of death is a kind of scroll.
A scroll of death is death.
The description of a scroll of death is "Reading this scroll will deal damage to all non-undead creatures in the room."
The plural of scroll of death is scrolls of death.

Carry out reading a scroll of death:
	consider the unholy wave rules;


Section - Scroll of Alteration

Table of Scroll Names (continued)
scroll name
alteration

A scroll of alteration is a kind of scroll.
A scroll of alteration is alteration.
The description of a scroll of alteration is "Reading this scroll can radically alter your body."
The plural of scroll of alteration is scrolls of alteration.



Carry out reading a scroll of alteration:
	consider the mutating rules;
	if mutated boolean is false:
		say "Nothing happened!".
	


Section - Scroll of mapping

Table of Scroll Names (continued)
scroll name
mapping

Mapping boolean is a truth state variable.

A scroll of mapping is a kind of scroll.
A scroll of mapping is mapping.
The description of a scroll of mapping is "Reading this scroll will instantaneously reveal the plan of the entire dungeon, including secret rooms ([if the map can be shown]check the MAP to see it, or if you prefer not to use the graphical map, [end if]type REMEMBER for more).".
The plural of scroll of mapping is scrolls of mapping.

Carry out reading a scroll of mapping (this is the reveal the map rule):
	now all placed not nogo rooms are map-revealed;
	now the mapping boolean is true;
	say "As you read the scroll, a complete floor plan of the dungeon of Kerkerkruip imprints itself on your mind! [if the map can be shown]Type MAP to see it. [end if]A description of where you are has [if the map can be shown]also [end if]been added to the REMEMBER command."


Section - Scroll of psycholocation

Table of Scroll Names (continued)
scroll name
psycholocation

Psycholocation boolean is a truth state variable.

A scroll of psycholocation is a kind of scroll.
A scroll of psycholocation is psycholocation.
The description of a scroll of psycholocation is "Reading this scroll will grant you the ability to sense all of the creatures whose souls you might be able to absorb (check the MAP to see their locations, or use the SENSE command).".
The plural of scroll of psycholocation is scrolls of psycholocation.

Carry out reading a scroll of psycholocation (this is the reveal enemies rule):
	let adversary-count be 0;
	repeat with place running through placed not nogo rooms:
		repeat with adversary running through persons in place:
			if the adversary is not the player and the level of the adversary is greater than 0:
				now place is enemy-revealed;
				increment adversary-count;
	if the adversary-count is greater than 0:
		say "You enter a weird clairvoyant state: The psyche[if adversary-count is greater than 1]s[end if] of your enemies call[if adversary-count is less than 2]s[end if] out to you. For a short time, you will be able to sense the presence and location of creatures whose souls you can absorb. If there are other creatures in the same space, you will see them via soul-reflection. Type [if the map can be shown]MAP[otherwise]SENSE[end if] to psycholocate.";
		now the psycholocation boolean is true;
		psycholocator peters out in 10 turns from now;
	otherwise:
		say "The scroll's magic enfolds you, but you cannot sense the souls of any enemies. Perhaps there are none remaining."
	
At the time when the psycholocator peters out:
	now all enemy-revealed rooms are not enemy-revealed;
	now the psycholocation boolean is false;
	unless psycholocation is active:
		say "Your clairvoyant sensation fades; you can no longer sense the psyches of your enemies."

The psycholocation rules are a rulebook.

To decide whether psycholocation is active:
	consider the psycholocation rules;
	if rule succeeded:
		decide yes;
	otherwise:
		decide no.	

A psycholocation rule (this is the psycholocation boolean rule):
	if psycholocation boolean is true:
		rule succeeds.


Chapter - Scroll packs

Section - Teleportation, small (minor)

The small-scroll-of-teleportation-pack is a minor treasure pack.
The small-scroll-of-teleportation-pack is civilised.
One scroll of teleportation is in the small-scroll-of-teleportation-pack.

The second-small-scroll-of-teleportation-pack is a minor treasure pack.
The second-small-scroll-of-teleportation-pack is civilised.
One scroll of teleportation is in the second-small-scroll-of-teleportation-pack.
	
Section - Teleportation, large (major)	
	
The large-scroll-of-teleportation-pack is a major treasure pack.
Two scrolls of teleportation are in the large-scroll-of-teleportation-pack. [Stock the large-scroll-of-teleportation-pack with 2 clones of scroll of teleportation.]
The large-scroll-of-teleportation-pack is civilised.

Section - Knowledge (minor)

The small-scroll-of-knowledge-pack is a minor treasure pack.
The small-scroll-of-knowledge-pack is civilised.
One scroll of knowledge is in the small-scroll-of-knowledge-pack.

The second-small-scroll-of-knowledge-pack is a minor treasure pack. 
The second-small-scroll-of-knowledge-pack is civilised.
One scroll of knowledge is in the second-small-scroll-of-knowledge-pack.

Section - Ghoulification (minor)

The small-scroll-of-ghoulification-pack is a minor treasure pack.
One scroll of ghoulification is in the small-scroll-of-ghoulification-pack.
The small-scroll-of-ghoulification-pack is civilised.
The unlock level of the small-scroll-of-ghoulification-pack is 1.
The unlock hidden switch of the small-scroll-of-ghoulification-pack is true.

Section - Curse removal, small (minor)

The small-scroll-of-remove-curse-pack is a minor treasure pack.
The small-scroll-of-remove-curse-pack is civilised.
One scroll of curse removal is in the small-scroll-of-remove-curse-pack.

The second-small-scroll-of-remove-curse-pack is a minor treasure pack.
The second-small-scroll-of-remove-curse-pack is civilised.
One scroll of curse removal is in the second-small-scroll-of-remove-curse-pack.

Section - Mapping (minor)

The small-scroll-of-mapping-pack is a minor treasure pack.
The small-scroll-of-mapping-pack is civilised.
One scroll of mapping is in the small-scroll-of-mapping-pack.

Section - Psycholocation (minor)

The small-scroll-of-psycholocation-pack is a minor treasure pack.
The small-scroll-of-psycholocation-pack is civilised.
One scroll of psycholocation is in the small-scroll-of-psycholocation-pack.

Section - Remove curse, large (major)

The large-scroll-of-remove-curse-pack is a major treasure pack.
The large-scroll-of-remove-curse-pack is civilised.
Two scrolls of curse removal is in the large-scroll-of-remove-curse-pack.
The rarity of large-scroll-of-remove-curse-pack is 1.
The unlock hidden switch of the small-scroll-of-remove-curse-pack is true.

Section - Shadows, small (minor)

The small-scroll-of-shadows-pack is a minor treasure pack.
The small-scroll-of-shadows-pack is civilised.
One scroll of shadows is in small-scroll-of-shadows-pack.

The second-small-scroll-of-shadows-pack is a minor treasure pack.
The second-small-scroll-of-shadows-pack is civilised.	
One scroll of shadows is in second-small-scroll-of-shadows-pack.

Section - Shadows, large (major)

The large-scroll-of-shadows-pack is a major treasure pack.
The large-scroll-of-shadows-pack is civilised.
Two scrolls of shadows is in large-scroll-of-shadows-pack.

Section - Summoning (minor)

The small-scroll-of-summoning-pack is a minor treasure pack.
The small-scroll-of-summoning-pack is magical.	
The unlock level of the small-scroll-of-summoning-pack is 1.
The unlock hidden switch of the small-scroll-of-summoning-pack is true.
One scroll of summoning is in the small-scroll-of-summoning-pack.

[Section - Fireworks (minor)

The small-scroll-of-fireworks-pack is a minor treasure pack.
The small-scroll-of-fireworks-pack is magical.	
The rarity of small-scroll-of-fireworks is 5.

A treasure placement rule:
	copy scroll of fireworks to small-scroll-of-fireworks-pack.]

Section - Blade, small (minor)

The small-scroll-of-the-blade-pack is a minor treasure pack.
The small-scroll-of-the-blade-pack is civilised.
One scroll of the blade is in the small-scroll-of-the-blade-pack.

Section - Blade, large (major)

The large-scroll-of-the-blade-pack is a major treasure pack.
The large-scroll-of-the-blade-pack is civilised.
Two scrolls of the blade is in the large-scroll-of-the-blade-pack.

Section - Protection (major)

The small-scroll-of-protection-pack is a major treasure pack.
The small-scroll-of-protection-pack is civilised.
One scroll of protection is in the small-scroll-of-protection-pack.

Section - Skill, small (minor)

The small-scroll-of-skill-pack is a minor treasure pack.
The small-scroll-of-skill-pack is civilised.	
One scroll of skill is in the small-scroll-of-skill-pack.

Section - Skill, large (major)

The large-scroll-of-skill-pack is a major treasure pack.
The large-scroll-of-skill-pack is civilised.
Two scrolls of skill is in the large-scroll-of-skill-pack.
The rarity of large-scroll-of-skill-pack is 1.

Section - Death, small (minor)

The small-scroll-of-death-pack is a minor treasure pack.
The small-scroll-of-death-pack is civilised.
The unlock level of small-scroll-of-death-pack is 1.
The unlock hidden switch of the small-scroll-of-death-pack is true.
One scroll of death is in the small-scroll-of-death-pack.

Section - Death, large (major)

The large-scroll-of-death-pack is a major treasure pack.
The large-scroll-of-death-pack is civilised.
The unlock level of large-scroll-of-death-pack is 1.
The unlock hidden switch of the large-scroll-of-death-pack is true.
Two scrolls of death are in the large-scroll-of-death-pack.

Section - Alteration, small (minor)

The small-scroll-of-alteration-pack is a minor treasure pack.
The small-scroll-of-alteration-pack is magical.
One scroll of alteration is in the small-scroll-of-alteration-pack.

The large-scroll-of-alteration-pack is a minor treasure pack.
The large-scroll-of-alteration-pack is magical.
Two scrolls of alteration are in the large-scroll-of-alteration-pack.

Section - Deathly [summon, ghoul, death], (major)

The deathly-pack is a major treasure pack.
The deathly-pack is deathly.
The unlock level of deathly-pack is 1.
The unlock hidden switch of the deathly-pack is true.
One scroll of summoning is in the deathly-pack.
One scroll of ghoulification is in the deathly-pack.
One scroll of death is in the deathly-pack.

Section - Combat [blade, protection], (major)

The combat-scroll-pack is a major treasure pack.
The combat-scroll-pack is civilised.
One scroll of the blade is in the combat-scroll-pack.
One scroll of protection is in the combat-scroll-pack.

Section - Thief [shadows, teleport, ethereal], (major)

The thief-scroll-pack is a major treasure pack.
The thief-scroll-pack is civilised.
The unlock level of thief-scroll-pack is 1.
The unlock hidden switch of the thief-scroll-pack is true.
Two scrolls of shadows are in the thief-scroll-pack.
One scroll of teleportation is in the thief-scroll-pack.
[One scroll of etherealness is in the thief-scroll-pack.]

Section - Knowing [knowledge, mapping, psycholocation], (major)

The knowing-scroll-pack is a major treasure pack.
The knowing-scroll-pack is civilised.
One scroll of knowledge is in the knowing-scroll-pack.
One scroll of mapping is in the knowing-scroll-pack.
One scroll of psycholocation is in the knowing-scroll-pack.


Chapter - Magical guides

A magical guide is a kind of thing. A magical guide is readable. Understand "book" and "manual" as a magical guide.

Last before printing the name of a magical guide:
	say "[italic type]".

First after printing the name of a magical guide:
	say "[roman type]".

A magical guide has a list of scroll names called the guide list.

Instead of examining a magical guide:
	say "Reading this little manual of magic will teach you how to recognise scrolls of [readable guide list of the noun].";
	take no time.

Carry out reading a magical guide:
	say "From now on, you will recognise scrolls of [readable guide list of the noun].";
	repeat with S running through the kinds of scroll:
		repeat with I running through the instances of S:
			if true name of I is listed in guide list of noun:
				if I is unidentified:
					identify I;
					break.

To say readable (list-to-print - a list of scroll names):
	let n be the number of entries in list-to-print;
	repeat with stuff running through list-to-print:
		if printed name of stuff is not "":
			say "[printed name of stuff]";
		otherwise:
			say "[stuff]";
		if n is greater than 2:
			say ", ";
		if n is 2:
			say " and ";
		decrease n by 1.


Section - Introduction to Necromancy (minor)

The Introduction to Necromancy is a minor magical guide.
The Introduction to Necromancy is magical.

The guide list of the Introduction to Necromancy is {death, ghoulification, summoning}.

Section - Battle Magic of Beginners (minor)

Battle Magic for Beginners is a minor magical guide. Battle Magic for Beginners is proper-named.
Battle Magic for Beginners is magical.

The guide list of Battle Magic for Beginners is {the-blade, protection}.

Section - Handbook of Subtle Magics (minor)

The Handbook of Subtle Magics is a minor magical guide.
The Handbook of Subtle Magics is magical.

The guide list of the Handbook of Subtle Magics is {skill, shadows-name, teleportation}.

Section - Miscellanea Magica (minor)

Miscellanea Magica is a minor magical guide. Miscellanea Magica is proper-named.
Miscellanea Magica is magical.

When play begins:
	let names be the list of not obfuscated scroll names;
	sort names in random order;
	add (entry 1 of names) to guide list of Miscellanea Magica;
	add (entry 2 of names) to guide list of Miscellanea Magica;		
	add (entry 3 of names) to guide list of Miscellanea Magica.









Part - Weapons

Chapter - Sword

A sword is a kind of weapon. 
A sword is usually iron.
The parry-with bonus of a sword is usually 1.

Understand "blade" as a sword.

Section - Smoky blade (minor)

The smoky blade is a minor sword.
The smoky blade is alchemical.
The smoky blade is iron.

The description of the smoky blade is "While otherwise a normal sword, it has been enchanted to look like smoke or fog.".

The unlock level of smoky blade is 2.
The unlock text of smoky blade is "a sword that is hard to see in smoke-filled areas"

An attack modifier rule (this is the smoky blade is better when smoke rule):
	if the global attacker weapon is the smoky blade:
		unless the global defender is smoke immune:
			if the smoke penalty of the location is not 0:
				let n be the smoke penalty of the location;
				say " + [n] (the smoky blade is hard to see)[run paragraph on]";
				increase the attack strength by n.

Chance to win rule (this is the CTW smoky blade penalty rule):
	if the chosen weapon is the smoky blade:
		unless the chosen target is smoke immune:
			if the smoke penalty of the location is not 0:
				let n be the smoke penalty of the location;
				increase the chance-to-win by n.

Section - Sneaking sword (monster)

[Mouser carries it]

There is a sword called sneaking sword. The description of sneaking sword is "This sword is especially suitable for making sneaky attacks, dealing [blood magic level of sneaking sword] extra damage. This damage bonus will increase by 1 if the sword is fed." Sneaking sword is not proper-named.

The special weapon info of the sneaking sword is "; +[blood magic level of sneaking sword] damage when hidden[run paragraph on]"

The blood magic cost of sneaking sword is 2.
The blood magic level of sneaking sword is 1.
The blood magic maximum of sneaking sword is 99.

A damage modifier rule (this is the sneaking sword damage bonus rule):
	if the global attacker weapon is the sneaking sword:
		if the global attacker is hidden:
			say " + [blood magic level of sneaking sword] (sneaky attack)[run paragraph on]";
			increase the attack damage by blood magic level of sneaking sword.

A treasure placement rule (this is the sneaking sword can be singing sword rule):
	if a random chance of 1 in 5 succeeds:
		now the hidden identity of the sneaking sword is the singing sword.

Section - Singing sword (cursed)

The singing sword is a cursed curse-identified sword. The description of the singing sword is "When you wield it, this sword hums all the time, and sometimes breaks out into song. This will make it hard to hide. You wonder how Mouser tamed it...".

Every turn (this is the singing sword fun rule):
	if the singing sword is readied and the player is the main actor and the player encloses the singing sword:
		if the combat status is peace or the singing sword is not tamed:
			if a random chance of 1 in 15 succeeds:
				say "'[one of]We are the champions![run paragraph on][or]Who wants to live forever?[run paragraph on][or]Stay true to your dungeon.[run paragraph on][or]We don't need no teleportation![run paragraph on][or]O, the wars, they will be fought again.[run paragraph on][or]I'll take you to the candy shop.[run paragraph on][or]I wanna take a ride on your disco stick![run paragraph on][as decreasingly likely outcomes]' sings your sword.[line break][paragraph break]"

Detection rule (this is the singing sword detection rule):
	if the singing sword is readied and the player encloses the singing sword and the singing sword is not tamed:
		say " - 5 (singing sword)[run paragraph on]";
		decrease the hiding roll by 5.

The singing sword can be tamed. The singing sword is not tamed.
The singing contest is a number that varies. The singing contest is 0.

Instead of singing when the player encloses the readied not tamed singing sword:
	if singing contest is 0:
		say "You start singing a soft tune. 'Ha, is that the best you can do?' your sword asks. 'Beat this!' And he breaks out in a loud and boisterous battle song.";
	if singing contest is 1:
		say "There is no way this sword is going to outdo you. You give a fine rendition of a popular aria. But the sword isn't impressed. 'I bet you can't do the really [italic type]high[roman type] notes!' he says, and continues to show off his impressive falsetto.";
	if singing contest is 2:
		if the player is female:
			say "You smirk. Your coloratura is second to none; and if your social position had allowed it, you would have been the star of the opera house. So you sing a brilliant rendition of the queen of the night, rising higher and higher, utterly confident.[paragraph break]'Yeah? Think I can't do that just as well?' the sword asks you.[paragraph break]'No, you can't.'[paragraph break]'Yeah, well, well, let me show you! Ahum.'[paragraph break]'I'm waiting.'[paragraph break]'Okay, I can't do it. You win.'[paragraph break]'And now be quiet when I'm battle, you understand?' The sword meekly acquiesces.";
			now the singing sword is tamed;
		otherwise:
			say "You'll show that sword. If he can use his falsetto, so can you. So you embark on an ambitious alto aria -- but after a couple of notes, you come to a sputtering halt. There's no way you can reach that high.[paragraph break]'Bwahaha, loser!' the sword laughs.";
	if singing contest is 3:
		say "You're not going to take on the singing sword again.";
	if singing contest is less than 3:
		increase singing contest by 1.


Section - Claymore (monster)

[Fafhrd carries it.]

The claymore is a sword. The description of claymore is "This big sword is mainly used by barbarian tribes. Depending on your body score, it has a chance of destroying any weapon that parries it or is parried by it. (The probability is 5% for every 4 points of body; i.e., 5% at 4 body, 10% at 8 body, and so on.)"

The special weapon info of the claymore is "; shatters weapons[run paragraph on]"

An aftereffects rule (this is the claymore can cause weapons to break rule):
	if global attacker weapon is the claymore or global defender weapon is the claymore: [using claymore]
		if global defender is at parry and attack damage is 0 and global attacker weapon is not ranged: [parry successful]
			let target be the claymore;
			let n be 0;
			if global attacker weapon is the claymore:
				now target is global defender weapon;
				now n is (final body of the global attacker / 4);
			otherwise:
				now target is global attacker weapon;
				now n is (final body of the global defender / 4);
			if target is corruptible:
				if target is not a natural weapon:
[					say "TEST: running with n = [n] and target is [target].";]
					if a random chance of n in 20 succeeds:
						say "The claymore [bold type]shatters [the target][roman type]!";
						remove target from play.
						
Section - Holy sword (monster)

[The healer of Aite carries it.]						

The holy sword is a sword. The description of the holy sword is "This sword shines with a clear white light. It deals additional damage to undead and demons. (It deals 1 extra damage for each 6 points of spirit; i.e., 1 damage at 6 spirit, 2 damage at 12 spirit, and so on.)".

The special weapon info of the holy sword is "; deals extra damage to undead and demons; shines with light, making it harder to hide[run paragraph on]".

Detection rule (this is the holy sword detection rule):
	if the holy sword is readied and the player encloses the holy sword:
		say " - 2 (holy sword)[run paragraph on]";
		decrease the hiding roll by 2.

A damage modifier rule (this is the holy sword damage bonus rule):
	if the global attacker weapon is the holy sword:
		if the global defender is undead or global defender is demonic:
			let n be (final spirit of global attacker / 6);
			if n > 0:
				say " + ", n, " (holiness)[run paragraph on]";
				increase the attack damage by n.

Section - Immaculate sword (monster)

[The defender of Aite carries it.]

The immaculate sword is a sword. The description of the immaculate sword is "Absolutely stainless."
The immaculate sword is incorruptible.

The special weapon info of the immaculate sword is "; cannot be corrupted[run paragraph on]".

Section - Demon blade (monster)

[Carried by the demonic assassin.]

The demon blade is a sword. The description of the demon blade is "A jagged sword covered in evil-looking runes. It was never meant to be used by humans.".

The demon blade is cursed.
The internal heat of the demon blade is 4.

Check attacking (this is the attacking with the demon blade is a bad idea rule):
	if the player carries the demon blade and the demon blade is readied:
		if a random chance of 3 in 5 succeeds:
			say "The [bold type]demonic blade[roman type] turns on you!";
			try the player hitting the player instead;

Section - Sword of light (monster)

[Carried by the angel of compassion.]

The sword of light is a sword. It is radiance. The description of the sword of light is "It seems to consist of pure radiance.".

The special weapon info of the sword of light is "; damage increases with the wielder's angelic radiance[run paragraph on]".

A damage modifier rule (this is the sword of light damage bonus rule):
	if the global attacker weapon is the sword of light:
		let n be radiation of the global attacker;
		if n > 0:
			say " + ", n, " (sword of light radiance bonus)[run paragraph on]";
			increase the attack damage by n.


Chapter - Rapier

A rapier is a kind of weapon. 
A rapier is usually iron.

Understand "blade" as a rapier.

The damage die of a rapier is usually 5.

Section - Gilded rapier

The gilded rapier is a rapier. The player carries the gilded rapier. The gilded rapier is readied.
The gilded rapier is iron.

The description of the gilded rapier is "You took it from the body of the young Count of Poitier, that fateful night in Maurice's whorehouse. He would nevermore plot against you.".





Chapter - Dagger

A dagger is a kind of weapon. 
A dagger is usually iron.

The damage die of a dagger is usually 3.
The weapon attack bonus of a dagger is usually -1.
The dodge bonus of a dagger is usually 1.
The parry-with bonus of a dagger is usually -1.
The parry-against bonus of a dagger is usually -1.
The weapon damage bonus of a dagger is usually 0.

An attack modifier rule (this is the dagger extra tension attack bonus rule):
	if the global attacker weapon is a dagger:
		let n be 0;
		now n is the tension divided by 2;
		if n is not 0:
			say " + ", n, " (dagger benefits from tension)[run paragraph on]";
			increase the attack strength by n.

Chance to win rule when the chosen weapon is a dagger (this is the CTW dagger concentration bonus rule):
	let n be the tension divided by 2;
	increase the chance-to-win by n.
		
A damage modifier rule (this is the dagger extra tension damage bonus rule):
	if the global attacker weapon is a dagger:
		let n be 0;
		now n is the tension divided by 4;
		if n is not 0:
			say " + ", n, " (dagger benefits from tension)[run paragraph on]";
			increase the attack damage by n.

The special weapon info of a dagger is usually "; benefits from tension[run paragraph on]".

Section - Gorgeous dagger (minor)

The gorgeous dagger is a minor dagger.
The gorgeous dagger is civilised.
The gorgeous dagger is iron.

The description of the gorgeous dagger is "Adorned with gold and a large emerald at the end of the hilt, this dagger is not only beautiful, but also perfect for precise attacks in tense situations. The decadence of its design proves it to be of Yahvinnean origin.".

Section - Evil dagger (major)

The evil dagger is a major dagger.
The evil dagger is deathly.
The evil dagger is iron.

The blood magic cost of evil dagger is 2.
The blood magic level of evil dagger is 0.
The blood magic maximum of evil dagger is 99.

The description of evil dagger is "This dagger was once used as a ritual weapon by a Yahvinnean death cult. Whenever it hits someone, its evil magic has a [2 + blood magic level of evil dagger]% chance of killing the target outright. This percentage will increase by 1% when the dagger is fed."

A contact rule (this is the evil dagger bonus rule):
	if the global attacker weapon is the evil dagger:
		if a random chance of (2 + blood magic level of evil dagger) in 100 succeeds:
			now health of global defender is -1;
			say "[roman type]The evil magic of the dagger [bold type]immediately kills[roman type] [no dead property][the global defender][dead property]!";
			rule fails.

Section - Dagger of the double strike (major)

The dagger of the double strike is a major dagger.
The dagger of the double strike is civilised.
The dagger of the double strike is iron.

The damage die of the dagger of the double strike is 2.
The weapon attack bonus of the dagger of double strike is -2.

The description of the dagger of the double strike is "The dagger looks dull and far from dangerous. But appearances deceive, for this weapon has been imbued with a dangerous magic.".

The special weapon info of the dagger of the double strike is "; allows its wielder to strike again immediately if the first attack did no damage[run paragraph on]".

Making-double-strike is a truth state that varies. Making-double-strike is false.

Last after reporting an actor hitting (this is the hit again with the dagger of double strike rule):
	if the global attacker weapon is the dagger of double strike:
		if making-double-strike is false:
			if the attack damage is 0:
				if the global attacker is alive and the global defender is alive:
					now making-double-strike is true;
					say "The dagger of the double strike slashes out again!";
					try the global attacker hitting the global defender;
					now making-double-strike is false.

Section - The backstabber (cursed)

The backstabber is a cursed curse-identified dagger. The backstabber is proper-named.
The backstabber is iron.

A treasure placement rule (this is the double strike can be backstabber rule):
	if a random chance of 1 in 4 succeeds:
		now the hidden identity of the dagger of double strike is the backstabber.

The description of the backstabber is "This treacherous blade sometimes strikes out at random people -- including yourself.".
The special weapon info of the backstabber is "; sometimes attacks a random person instead of the intended target[run paragraph on]"

Making-backstab is a truth state that varies. Making-backstab is false.

Check an actor hitting when the global attacker weapon is the backstabber (this is the hitting with the backstabber rule):
	if making-backstab is false:
		if a random chance of 1 in 2 succeeds:
			let X be a random alive person in the location of the actor;
			unless X is the noun:
				say "The [bold type]backstabber[roman type] attacks [the X] instead!";
				now making-backstab is true;
				try the actor hitting X;
				now making-backstab is false;
				stop the action;


Section - Vampiric dagger (major)

The vampiric dagger is a major dagger.
The vampiric dagger is deathly.
The vampiric dagger is iron.

The description of the vampiric dagger is "This sleek dagger will magically transfer some of the damage dealt to the target as health to its owner.".

The special weapon info of the vampiric dagger is "; leeches some health (works much better for vampires)[run paragraph on]".

The damage die of the vampiric dagger is 3.
The weapon attack bonus of the vampiric dagger is 0.
The weapon damage bonus of the vampiric dagger is 0.

An aftereffects rule (this is the vampiric dagger leeches rule):
	if the global attacker weapon is the vampiric dagger and the the attack damage is greater than 0:
		let n be a random number between 1 and the attack damage;
		unless the global attacker is the player and the current form is vampire-form:
			if n is greater than 1:
				now n is a random number between 1 and 2;
			let m be permanent health of the global attacker;
			decrease m by health of the global attacker;
			if m is less than n:
				now n is m;
			if n is less than 0:
				now n is 0;
		increase health of the global attacker by n;
		unless n is 0:
			say "The vampiric dagger [bold type]transfers [n] health[roman type] to [the global attacker].".

Section - Giantbane (major)

Giantbane is a major dagger.
Giantbane is civilised.
Giantbane is iron.
Giantbane is proper-named.
Giantbane is small.

A dungeon interest rule (this is the set giantbane size rule):
	if a random chance of 1 in 5 succeeds:
		now giantbane is medium;
	if a random chance of 2 in 5 succeeds:
		now giantbane is tiny.

The description of Giantbane is "This dagger deals massive damage to big creatures, the damage bonus increasing as the size of the wielder and that of the victim differ more.".

A damage modifier rule (this is the Giantbane damage bonus rule):
	if the global attacker weapon is Giantbane:
		let n be the size difference of the global attacker and the global defender;
		if n is greater than 0:
			now n is n * 2;
			say " + ", n, " (Giantbane's special)[run paragraph on]";
			increase the attack damage by n.

			
Section - Dagger of draining (monster)

[Used by Malygris]

The dagger of draining is a dagger. The description of the dagger of draining is "This magical dagger saps the powers of any enemy it hits, and transfers it to the wielder.".
The damage die of the dagger of draining is 8.

The special weapon info of the dagger of draining is "; drains statistics[run paragraph on]".

An aftereffects rule (this is the dagger of draining aftereffects rule):
	if the global attacker weapon is the dagger of draining and the attack damage is greater than 0:
		say "The magical dagger saps ";
		if a random number between 1 and 4 is:
			-- 1:
				decrease defence of the global defender by 1;
				increase defence of the global attacker by 1;
				say "[possessive of the global defender] defensive reflexes, transferring them to [the global attacker].";
			-- 2:
				decrease mind score of the global defender by 1;
				increase mind score of the global attacker by 1;
				say "[possessive of the global defender] mind score, transferring it to [the global attacker].";
			-- 3:
				decrease body score of the global defender by 1;
				increase body score of the global attacker by 1;
				say "[possessive of the global defender] body score, transferring it to [the global attacker].";
			-- 4:
				decrease spirit score of the global defender by 1;
				increase spirit score of the global attacker by 1;
				say "[possessive of the global defender] spirit score, transferring it to [the global attacker].";.

An AI weapon selection rule for the dagger of draining (this is the Malygris prefers the dagger of draining rule):
	increase the Weight by 10.
							




Chapter - Axe

An axe is a kind of weapon. 
An axe is usually iron.

The damage die of an axe is usually 4.
The weapon attack bonus of an axe is usually -1.
The weapon damage bonus of an axe is usually 2.
The dodge bonus of an axe is usually 1.
The parry-against bonus of an axe is usually -2.


Section - Fearsome axe (minor)

The fearsome axe is a minor axe.
The fearsome axe is deathly.
The fearsome axe is iron.

The damage die of the fearsome axe is 5.
The parry-with bonus of the fearsome axe is -1.

The description of the fearsome axe is "While not exactly a nimble weapon, this axe is certainly able to deal out some punishment. It also has a chance of striking fear in the hearts of your enemies. (When you attack with the fearsome axe, there is a chance that they will not be able to react. The probability of this happening is (your mind - their mind) * 4%.)".

Last carry out an actor attacking (this is the fearsome axe rule):
	if the actor encloses the fearsome axe and the fearsome axe is readied:
		let n be the final mind of the actor;
		decrease n by the final mind of the noun;
		if n is greater than 0:
			if a random chance of n in 25 succeeds:
				now combat state of noun is at-Inactive;
				say "[The noun] cower[s] in fear before the attack.".

The special weapon info of the fearsome axe is "; inspires fear[run paragraph on]".

A treasure placement rule (this is the fearsome can be fearful rule):
	if a random chance of 1 in 6 succeeds:
		now the hidden identity of the fearsome axe is the fearful axe.

Section - Fearful axe (cursed)

The fearful axe is a cursed curse-identified axe. The fearful axe is iron.

The damage die of the fearful axe is 5.
The parry-with bonus of the fearful axe is -1.

The description of the fearful axe is "While not exactly a nimble weapon, this axe is certainly able to deal out some punishment. Unfortunately, the weapon is cursed with an enchantment that sometimes strikes fear into the heart of the wielder, making him forego his attack. (The probability of not attacking because of fear is (20 - your mind)%.)".

The special weapon info of the fearful axe is "; makes the wielder a coward[run paragraph on]".

Last check an actor attacking (this is the fearful axe rule):
	if the actor encloses the fearful axe and the fearful axe is readied:
		let n be (20 - final mind of the actor);
		if n is greater than 0:
			if a random chance of n in 100 succeeds:
				if the actor is the player:
					say "You are suddenly too afraid to attack!" instead;
				otherwise:
					say "[The actor] [if the actor is plural-named]are[otherwise]is[end if] overcome by fear!" instead.


Section - Executioner's axe (major)

The executioner's axe is a major axe.
The executioner's axe is deathly.
The executioner's axe is iron.

The description of the executioner's axe is "This is the blade that chopped off the head of Philip the Traitor after he had been found guilty of murdering his brother, Charles IV. Ever since, pilgrims have flocked to Montenoir's temple of Nomos to see and revere it. How it has ended up in this dungeon is anyone's guess. Feeding the axe will increase its attack modifier by +1.".

The unlock level of the executioner's axe is 10.
The unlock text of the executioner's axe is "an unwieldy axe that deals massive damage".

The blood magic cost of executioner's axe is 15.
The blood magic level of executioner's axe is 0.
The blood magic maximum of executioner's axe is 99.

Carry out feeding (this is the feed the executioner's axe rule):
	if the noun is the executioner's axe:
		increase the weapon attack bonus of the executioner's axe by 1.

The damage die of the executioner's axe is 7.
The weapon damage bonus of the executioner's axe is 4.
The parry-with bonus of the executioner's axe is -2.
The weapon attack bonus of the executioner's axe is -3.

A damage modifier rule (this is the executioner's axe extra tension damage bonus rule):
	if the global attacker weapon is the executioner's axe:
		let n be 0;
		now n is the tension divided by 3;
		if n is not 0:
			if the numbers boolean is true, say " + ", n, " (executioner's axe benefits from tension)[run paragraph on]";
			increase the attack damage by n.

An attack modifier rule (this is the executioner's axe is better in temple of Nomos rule):
	if the global attacker weapon is the executioner's axe and the location is the Temple of Nomos:
		if the numbers boolean is true, say " + 3 (Nomos likes the executioner's axe)[run paragraph on]";
		increase the attack strength by 3.

Chance to win rule (this is the CTW executioner's axe in temple of Nomos rule):
	if chosen weapon is the executioner's axe and the location is the Temple of Nomos:
		increase the chance-to-win by 3.

The special weapon info of the executioner's axe is "; better tension damage bonus[run paragraph on]".

Section - Minotaur's axe (monster)

The minotaur's axe is an axe. The description of the minotaur's axe is "A [size of minotaur's axe] axe covered in mystic runes.".

The minotaur's axe is large.

The damage die of the minotaur's axe is 6.
The weapon attack bonus of the minotaur's axe is -3.
The weapon damage bonus of the minotaur's axe is 3.
The parry-with bonus of the minotaur's axe is -2.


An attack modifier rule:
	if the location of the global attacker is the maze and the global attacker weapon is the minotaur's axe:
		say " + 3 (minotaur's axe stronger in the maze)[run paragraph on]";
		increase the attack strength by 3.
	
The special weapon info of the minotaur's axe is "; when damage is dealt and the wielder has the power of the minotaur, casts attacker and defender in a magical maze[run paragraph on]".

Last aftereffects rule (this is the minotaur's axe maze rule):
	if the global attacker weapon is the minotaur's axe:
		if the global attacker is the minotaur or (the global attacker is the player and the power of the minotaur is granted):
			if the attack damage is greater than 0:
				if the location of the player is not the maze:
					maze the global attacker and the global defender.
					



Chapter - Scythe

A scythe is a kind of weapon. 
A scythe is usually iron.

The damage die of a scythe is usually 10.
The weapon attack bonus of a scythe is usually -2.
The dodge bonus of a scythe is usually 1.
The parry-with bonus of a scythe is usually -1.
The parry-against bonus of a scythe is usually -1.
The weapon damage bonus of a scythe is usually 0.


Section - Scythe of flame (monster)

The scythe of flaming is a scythe. The description of the scythe of flaming is "Enchanted with a spell of heat, this scythe always remains unnaturally hot.".
The internal heat of scythe of flaming is 3.

Section - Scythe of slaying (monster)

The scythe of slaying is a scythe. The scythe of slaying is silver. The description of the scythe of slaying is "Ages ago, the monks of Averoigne forged these weapons, imbuing them with powerful enchantments against the living dead.".

A damage modifier rule (this is the scythe of slaying deals great damage to undead rule):
	if global attacker weapon is the scythe of slaying and global defender is undead:
		if the numbers boolean is true, say " + 5 (slaying undead)[run paragraph on]";
		increase the attack damage by 5.

The special weapon info of the scythe of slaying is "; massive damage against undead[run paragraph on]".

Section - Scythe of oxidation (monster)

The scythe of oxidation is a scythe. The scythe of oxidation is iron. The scythe of oxidation is rusted. The description of the scythe of oxidation is "Some entropic demon or deity has given this scythe the ability to rust the opponent's weapons in combat.".

The special weapon info of the scythe of oxidation is "; rusts weapons[run paragraph on]".

An aftereffects rule (this is the scythe of oxidation rusts stuff rule):
	if the global attacker weapon is the scythe of oxidation:
		if the global defender is at parry and the attack damage is 0:
			if the global defender weapon is iron and the global defender weapon is not rusted:
				say "Having been in contact with the scythe of oxidation, [the global defender weapon] [bold type]rusts[roman type].";
				now the global defender weapon is rusted;
	if the global defender weapon is the scythe of oxidation:
		if the global defender is at parry and the attack damage is 0:
			if the global attacker weapon is iron and the global attacker weapon is not rusted:
				if the global attacker weapon is not a part of the global attacker:
					say "Having been in contact with the scythe of oxidation, [the global attacker weapon] [bold type]rusts[roman type].";
					now the global attacker weapon is rusted;
				otherwise:
					if the global defender is not rusted and the global defender is alive:
						say "Having hit the scythe of oxidation, [the global defender] [bold type]rusts[roman type]!";			
						now the global defender is rusted;
	if the global attacker weapon is the scythe of oxidation:
		if the global defender is iron and the attack damage is greater than 0:
			if the global defender is not rusted and the global defender is alive:
				say "Having been hit with the scythe of oxidation, [the global defender] [bold type]rusts[roman type]!";			
				now the global defender is rusted.





Chapter - Staves

Section - Staff of pain (monster)

[One of these is used by the tormentor of Aite.]

A staff of pain is a kind of weapon. The plural of staff of pain is staves of pain.
A staff of pain is usually wood. A staff of pain is ranged.
A staff of pain is size-agnostic.
The description of a staff of pain is "The staff of pain wounds with magic that can be neither parried nor dodged.".

The damage die of a staff of pain is usually 4.
The weapon attack bonus of a staff of pain is usually 0.
The dodge bonus of a staff of pain is usually -2.
The parry-with bonus of a staff of pain is usually -1.
The parry-against bonus of a staff of pain is usually -2.
The weapon damage bonus of a staff of pain is usually 0.


Section - Druidic staff (reward)

The druidic staff is a weapon.

The description of druidic staff is "A simple wooden staff, but very well balanced.".

The druidic staff is wood.

The damage die of the druidic staff is 6.
The weapon attack bonus of the druidic staff is 1.
The dodge bonus of the druidic staff is 0.
The parry-with bonus of the druidic staff is 1.
The parry-against bonus of the druidic staff is 0.
The weapon damage bonus of the druidic staff is 1.

Section - Was sceptre (monster)

[Carried by the mummified priest.]

The was sceptre is a weapon.

The description of the was sceptre is "This long staff has the stylised head of an ibis on top, and ends in a fork. While not a great tool for combat, it is a carrier of much spiritual power. [italic type](-2 body, -2 mind, +4 spirit)[roman type]".

The was sceptre is wood.

A dungeon interest rule (this is the maybe curse was sceptre rule):
	if a random chance of 1 in 3 succeeds:
		unless was sceptre is incorruptible:
			now was sceptre is cursed.

The damage die of the was sceptre is 4.
The weapon attack bonus of the was sceptre is 0.
The weapon damage bonus of the was sceptre is 0.

A body bonus rule (this is the body penalty of the was sceptre rule):
	if the test subject carries the readied was sceptre:
		decrease faculty bonus score by 2.

A mind bonus rule (this is the mind penalty of the was sceptre rule):
	if the test subject carries the readied was sceptre:
		decrease faculty bonus score by 2.

A spirit bonus rule (this is the spirit bonus of the was sceptre rule):
	if the test subject carries the readied was sceptre:
		increase faculty bonus score by 4.

Section - Caduceus  (Herm gift)

The caduceus is a weapon. The indefinite article of the caduceus is "the".

The description of the caduceus is "A short staff entwined by two serpents and surmounted by wings. [italic type]Anyone hit by the caduceus has a chance equal to (attacker's mind * 2)% to fall asleep.[roman type]".

The caduceus is wood.

The damage die of the caduceus is 4.
The weapon attack bonus of the caduceus is 2.
The parry-with bonus of the caduceus is 1.
The weapon damage bonus of the caduceus is 0.

Aftereffects rule (this is the caduceus may put people asleep rule):
	if the global attacker weapon is the caduceus and the global defender is not the player:
		if the attack damage is greater than 0 and the global defender is sleeper:
			let n be final mind of the global attacker;
			if a random chance of n in 50 succeeds:
				say "[The global defender] [bold type]fall[s] asleep[roman type]!";
				now global defender is asleep.

Section - Staff of insanity (epic)

The staff of insanity is an epic wood magical weapon. The description of the staff of insanity is "Swirling bands of red, blue, orange and green dazzle the eyes and boggle the mind. Wielding this weapon is immensely distracting, but if you do manage to hit someone with it, they will become insane.".

The special weapon info of the staff of insanity is "; -2 attack and defence penalty; -3 penalty to body, mind and spirit; anyone damaged by it becomes insane[run paragraph on]".

The damage die of the staff of insanity is 2.
The weapon attack bonus of the staff of insanity is 0.
The weapon damage bonus of the staff of insanity is 0.

Aftereffects rule (this is the staff of insanity makes people insane rule):
	if the global attacker weapon is the staff of insanity and the global defender is not the player:
		if the attack damage is greater than 0:
			say "As soon as the bizarre staff strikes, [the global defender] goes [bold type]insane[roman type]!";
			now faction of the global defender is insane.

An attack modifier rule (this is the staff of insanity weakens the wielder rule):
	if the global defender encloses the staff of insanity and the staff of insanity is readied:
		say " + 2 (defender wields staff of insanity)[run paragraph on]";
		increase the attack strength by 2;
	if the global attacker encloses the staff of insanity and the staff of insanity is readied:
		say " - 2 (attacker wields staff of insanity)[run paragraph on]";
		decrease the attack strength by 2.	

A faculty bonus rule (this is the staff of insanity faculty penalty rule):
	if the test subject encloses the staff of insanity and the staff of insanity is readied:
		decrease faculty bonus score by 3.


Chapter - Maces

A mace is a kind of weapon. 
A mace is usually iron.

The damage die of a mace is usually 5.
The weapon attack bonus of a mace is usually 0.
The weapon damage bonus of a mace is usually 1.
The dodge bonus of a mace is usually 0.
The parry-with bonus of a mace is usually 0.
The parry-against bonus of a mace is usually 0.

Section - Spiked mace of the ape king (major)

The spiked mace of the ape king is a major mace.
The spiked mace of the ape king is barren.
The spiked mace of the ape king is iron.

The spiked mace of the ape king is crescendi-immune. The spiked mace of the ape king is diminuendi-immune.

Table of Spiked Mace of the Ape King
Blood	Dam	WDB	DOD	PAB		PWB	Size
0		3		0		-1		0		0		tiny
1		3		0		-1		0		0		tiny
2		4		0		0		0		0		small
3		5		1		0		0		0		small
4		5		1		0		0		0		medium
5		6		2		0		0		0		medium
6		7		2		0		0		-1		large
7		8		3		1		-1		-1		large
8		8		3		1		-1		-1		huge
9		9		4		1		-1		-2		huge
10		10		4		1		-2		-2		gargantuan
11		11		4		1		-2		-2		gargantuan

Spiked-mace-blood is a number that varies. Spiked-mace-blood is 0.

To set stats for the spiked mace of the ape king:
	now the spiked mace of the ape king is iron;
	now the spiked mace of the ape king is not rusted;
	if spiked-mace-blood is less than 12:
		choose row with a blood of spiked-mace-blood in the Table of Spiked Mace of the Ape King;
		now the damage die of the spiked mace of the ape king is Dam entry;
		now the weapon damage bonus of the spiked mace of the ape king is WDB entry;
		now the dodge bonus of the spiked mace of the ape king is DOD entry;
		now the parry-with bonus of the spiked mace of the ape king is PWB entry;
		now the parry-against bonus of the spiked mace of the ape king is PAB entry;
		now the size of the spiked mace of the ape king is Size entry;
	otherwise:
		let guy be a random person who has the spiked mace of the ape king;
		unless guy is nothing: [who knows whether we program animated weapons at some point?]
			say "The [bold type]spiked mace of the ape king[roman type] suddenly grows so big that [guy] cannot hold on to it. It [bold type]crashes[roman type] to the floor!";
			move spiked mace of the ape king to location of guy;
		otherwise:
			say "The [bold type]spiked mace of the ape king[roman type] suddenly [bold type]crashes[roman type] to the floor!";
			move spiked mace of the ape king to location of spiked mace of the ape king;
		now spiked mace of the ape king is not readied;
		now spiked mace of the ape king is fixed in place;
		now description of spiked mace of the ape king is "The mace has grown to such proportions that not even the strongest man in the world would be able to lift it.".
	
Last dungeon interest rule (this is the spiked mace stat set rule): [this puts us after the rule that may randomly change the size of a weapon]
		set stats for the spiked mace of the ape king.
		
The description of spiked mace of the ape king is "A ball studded with sharp spikes and put at the end of a stick makes a simple but effective weapon. It is currently of [size of spiked mace of the ape king] size.".

An aftereffects rule (this is the spiked mace grows rule):
	if the global attacker weapon is the spiked mace of the ape king:
		if the attack damage is greater than 0:
			increase spiked-mace-blood by 1;
			set stats for the spiked mace of the ape king;
			if spiked-mace-blood is less than 12:
				say "The spiked mace of the ape king grows!"
				

Chapter - Hammer

Section - Stunning weapon

A weapon can be stunning-weapon. A weapon is usually not stunning-weapon. [A stunning weapon always stuns, without damage penalty. When combined with the stun action, it is extra effective.]

Section - The hammer kind

A hammer is a kind of weapon.
A hammer is usually iron.

The damage die of a hammer is usually 4.
The weapon attack bonus of a hammer is usually -1.
The weapon damage bonus of a hammer is usually 2.
The dodge bonus of a hammer is usually 1.
The parry-with bonus of a hammer is usually -1.
The parry-against bonus of a hammer is usually -1.

A hammer is usually stunning-weapon.
The special weapon info of a hammer is usually "; stuns opponents[run paragraph on]".

Section - Malleus Maleficarum

The Malleus Maleficarum is a hammer. The indefinite article is "the". The description of the Malleus Maleficarum is "To kill witches and other creatures of chaos, one needs to be accurate and methodical. This hammer is an excellent tool for the task." Understand "hammer" as the Malleus Maleficarum.

The weapon attack bonus of Malleus Maleficarum is 1.
The damage die of Malleus Maleficarum is 5.
The weapon damage bonus of Malleus Maleficarum is 3.

The special weapon info of the Malleus Maleficarum is "; stuns opponents; does not benefit from tension; grants one level of dreadful presence[run paragraph on]".

Malleus-tension-dummy is a number that varies.

First attack modifier rule (this is the Malleus remove tension rule):
	if global attacker weapon is Malleus Maleficarum:
		now malleus-tension-dummy is tension;
		now tension is 0.

First aftereffects rule (this is the Malleus reset tension rule):
	if global attacker weapon is Malleus Maleficarum:
		now tension is malleus-tension-dummy.
	
A dread rule (this is the malleus dread rule):
	if test subject carries Malleus Maleficarum and Malleus Maleficarum is readied:
		increase dread dummy by 1.
		

Chapter - Other weapons

Section - Magical pickaxe (major)

The pickaxe is a major iron barren weapon.
The pickaxe is a digging tool.

Understand "axe" as the pickaxe.

The description of the pickaxe is "Used by wizards to construct their dungeons, a magical pickaxe can be used to dig tunnels in whatever direction you wish. Just dig north, for instance. In a pinch, it can also serve as a weapon.".

The unlock level of the magical pickaxe is 9.
The unlock text of the magical pickaxe is "an item that functions both as a weapon and as a tool for digging tunnels".

The damage die of the pickaxe is 5.
The weapon attack bonus of the pickaxe is -1.
The weapon damage bonus of the pickaxe is 2.
The dodge bonus of the pickaxe is 1.
The parry-against bonus of the pickaxe is -1.
The parry-with bonus of the pickaxe is 0.

Section - Glass Cannon (epic)

[Very good weapon which halves you permanent health.]

The glass cannon is an epic weapon.
The glass cannon is magical.
The material of the glass cannon is glass.

The glass cannon is ranged.
The glass cannon is size-agnostic.

The description of the glass cannon is "At first sight this seems to be nothing but a foot-long tube of glass. However, it is a very powerful weapon, the shots of which can quickly destroy even the most powerful enemy. But be warned: not only does the glass cannon make you an easier target, it is also the case that when you ready the weapon, you [bold type]permanently[roman type] lose half of your health.".

The damage die of the glass cannon is 0.
The weapon attack bonus of the glass cannon is 3.
The weapon damage bonus of the glass cannon is 10.
The dodge bonus of the glass cannon is 0.
The parry-with bonus of the glass cannon is 2.
The parry-against bonus of the glass cannon is -5.

An attack modifier rule (this is the being a glass cannon rule):
	if the global defender weapon is the glass cannon:
		say " + 3 (you are a glass cannon)[run paragraph on]";
		increase the attack strength by 3.		

Chance to win rule (this is the CTW glass cannon bonus rule):
	if the global defender weapon is the glass cannon:
		increase the chance-to-win by 3.

After readying the glass cannon:
	say "You feel fragile.";
	now permanent health of player is permanent health of the player divided by 2;
	now health of the player is health of the player divided by 2;
	if player is dead:
		end the story saying "You were a little too fragile for that.".

An aftereffects rule (this is the glass cannon shatters when used to parry rule):
	if the global defender weapon is the glass cannon:
		if the global defender is at parry and the attack damage is 0:
			if a random chance of attack damage in 10 succeeds:
				say "The impact [bold type]shatters the glass cannon[roman type].";
				remove the glass cannon from play;
			otherwise:
				say "The glass cannon [bold type]survives the impact[roman type], but barely.";
				decrease weapon damage bonus of glass cannon by 2.

The special weapon info of the glass cannon is "; makes you easier to hit; halves your health[run paragraph on]".

Section - Nunchuck (monster)

[Carried by Miranda.]

The pair of nunchucks are a weapon. The pair of nunchucks is wood. Understand "nunchuck" and "nunchuk" and "nunchuks" as the pair of nunchucks. The pair of nunchucks is ambiguously plural.
The description of the pair of nunchucks is "These two pieces of wood with a metal chain between them can be surprisingly dangerous.".
The parry-with bonus of the pair of nunchucks is 1.

Section - Demon whip (monster)

[Carried by the demonic mistress]


The demon whip is a weapon.
The demon whip is ranged.

The damage die of the demon whip is 3.
The weapon attack bonus of the demon whip is 1.
The weapon damage bonus of the demon whip is 2.
The dodge bonus of the demon whip is 0.
The parry-against bonus of the demon whip is -1.
The parry-with bonus of the demon whip is -2.

The demon whip is cursed.

The description of the demon whip is "The demons of the lower hells use these savage whips to break the minds of their slaves.".

An aftereffects rule (this is the demon whip rule):
	if the global attacker weapon is the demon whip:
		if the attack damage is greater than 0:
			if the global defender is alive:
				say "The demon whip [bold type]breaks [possessive of the global defender] will[roman type] (-2 mind score)![paragraph break]";
				decrease mind score of global defender by 2;
				if global defender is the player and global attacker is the demonic mistress:
					if final mind of the player is less than 1:
						say "'Come. You will serve my master,' the demon mistress breathes in your ear. Your will broken entirely, you meekly kneel as she chains your hands together, puts a collar around your neck, and pulls you along into the depths of hell.";
						end the game saying "This is infinitely worse than being enslaved by a mindslug.";
						rule fails.







Chapter - Miscellaneous Items


Section - Dimensional anchor (minor)

A dimensional anchor is a minor thing. The description of the dimensional anchor is "The tiny anchor made of marble may seem nothing but a sailor's souvenir, but appearances deceive. It has been imbued with a powerful spell that makes it impossible to teleport away from the room it is in. An ornate 'N' at the bottom designates it as the work of the mysterious sorcerer Ningauble.".
The dimensional anchor is magical.
The dimensional anchor is stone.

A teleport impossible rule (this is the dimensional anchor rule):
	if the location of the test subject encloses the dimensional anchor:
		rule succeeds.

Section - Magical spade (major)

The magical spade is a major thing. The magical spade is a digging tool. The description of the magical spade is "Used by wizards to construct their dungeons, a magical spade can be used to dig tunnels in whatever direction you wish. Just dig north, for instance.".
The magical spade is magical.
The magical spade is iron.

Last dungeon interest rule (this is the extra magical spade placement rule):
	if magical spade is off-stage:
		if a random chance of 3 in 10 succeeds:
			let place be a random placed treasurable room;
			move magical spade to place.

Section - Vial of Purification (minor)

The vial of purification is a minor religious glass thing. Understand "water" and "waters" as vial of purification. The description of vial of purification is "Drinking the water in this small vial might cure you of some unfortunate afflictions.".

Instead of eating vial of purification:
	try drinking vial of purification.
	
Instead of drinking vial of purification:
	remove noun from play;
	unless the player worships Chton:
		say "The waters purify you of all undead influences.";
		repeat with shape running through player forms:
			choose a row with player form of shape in Table of Form Properties;
			if turn-type entry is undead:
				now shape is not form-active;
		turn the player into human-form;
	otherwise:
		say "Chton prevents the vial of purification from doing its work; but your attempt at escaping undeath did not amuse him. A wave of extreme cold racks your body, dealing [bold type]15 damage[roman type]!";
		decrease health of player by 15;
		if the player is dead:
			end the story saying "Don't worry; Chton will soon raise you as a mindless zombie.".

Section - Rod of the Master Builder (epic)

The rod of the master builder is an epic thing.
The rod of the master builder is barren.
The rod of the master builder is stone.

The description of the rod of the master builder is "This powerful artefact looks like a smooth tube of white stone. It can be used to [italic type]dig[roman type] new tunnels and [italic type]collapse[roman type] old passages; and it also allows its possessor to walk away from combat in relative safety.".

The rod of the master builder is a digging tool.
The rod of the master builder is a collapsing tool.

An attack modifier rule (this is the rod of master builder attack modifiers rule):
	if the global defender is the player and the player has the rod of the master builder:
		if the player is retreater or the player is runner:
			say " - 2 (rod of the master builder)[run paragraph on]";
			decrease the attack strength by 2.

A damage multiplier rule when the player has the rod of the master builder (this is the rod of master builder damage multiplier rule):
	if the global defender is the player and (the player is retreater or the player is runner):
		say " - 50% (rod of the master builder)[run paragraph on]";
		now the attack damage is the attack damage divided by 2.

Instead of readying the rod of the master builder:
	say "It is not weapon. You can use it without readying it.".
			
Section - Drakul's Lifeblood (epic)

Drakul's lifeblood is an epic deathly glass thing. Understand "blood" and "vial" as Drakul's lifeblood. The description of Drakul's lifeblood is "This small vial holds the blood of a powerful vampire. Drinking it might have far-reaching consequences.".
The unlock level of Drakul's lifeblood is 11.
The unlock text of Drakul's lifeblood is "an small vial of blood that can turn you into a vampire".

Instead of eating Drakul's lifeblood:
	try drinking Drakul's lifeblood.
	
Instead of drinking Drakul's lifeblood:
	remove noun from play;
	say "As you gulp down the blood, you feel your whole body changing -- it becomes cold and fragile, but also swift and lean. Magical power courses through your veins.";
	vampirise the player.








Chapter - Ment

A package of ment is a kind of thing. The plural of package of ment is packages of ment. The description of a package of ment is "Carefully folded in paper, this is just enough ment to get you pumped up for combat. You could snort it whenever you wish[if the ment addiction is 0] -- though you are a little hesitant to start your habit again[end if].".
A package of ment is paper.

[There are ten packages of ment.] The player carries three packages of ment.

The ment addiction is a number that varies. The ment addiction is 0.

To decide which number is the ment bonus:
	let n be ment addiction;
	decide on n.

The ment timer is a number that varies. The ment timer is 0.

Every turn when the main actor is the player:
	if the ment timer is greater than 0:
		decrease the ment timer by 1;
		if the ment timer is 0:
			say "As suddenly as it began, the rush given by the [bold type]ment[roman type] falls away. You are left feeling empty and only half alive.".

The OD timer is a number that varies. The OD timer is 0.

Every turn when the main actor is the player:
	if the OD timer is greater than 0:
		decrease the OD timer by 1;
		if the OD timer is 7:
			say "Your breathing is becoming heavy and irregular.";
		if the OD timer is 3:
			say "Respiration becomes more difficult by the second. Your heartbeat feels very irregular.";
		if the OD timer is 0:
			end the story saying "You OD'ed".

A faculty bonus rule (this is the ment ability bonus rule):
	if the test subject is the player:
		if ment timer is greater than 0:
			increase faculty bonus score by ment bonus;
			[say " + [ment bonus] (ment)[run paragraph on]"].
				
A faculty bonus rule (this is the feeling down ability penalty rule):
	if the test subject is the player:
		if the ment addiction is greater than 0:
			if the ment timer is 0:
				decrease faculty bonus score by ment addiction;
				[say " - [ment addiction] (feeling down)[run paragraph on]"].				
				
An attack modifier rule (this is the ment attack and defence bonus rule):
	if the global attacker is the player:
		if ment timer is greater than 0:
			if the numbers boolean is true, say " + [ment bonus] (ment)[run paragraph on]";
			increase the attack strength by ment bonus;
	if the global defender is the player:
		if ment timer is greater than 0:
			if the numbers boolean is true, say " - [ment bonus] (your defence increased by ment)[run paragraph on]";
			decrease the attack strength by ment bonus.
			
Chance to win rule (this is the CTW ment penalty rule): [To make sure the AI correctly guesses its chance to win.]
	if the ment timer is greater than 0:
		decrease the chance-to-win by ment bonus.			

A damage modifier rule (this is the ment damage bonus rule):
	if the global attacker is the player:
		if ment timer is greater than 0:
			if the numbers boolean is true, say " + [ment bonus] (ment)[run paragraph on]";
			increase the attack damage by ment bonus;
	if the global defender is the player:
		if ment timer is greater than 0:
			if the numbers boolean is true, say " - [ment bonus] (ment makes you shrug off damage)[run paragraph on]";
			decrease the attack damage by ment bonus.

An attack modifier rule (this is the feeling down attack penalty rule):
	if the global attacker is the player:
		if the ment addiction is greater than 0:
			if the ment timer is 0:
				if the numbers boolean is true, say " - [ment addiction] (feeling down)[run paragraph on]";
				decrease the attack strength by ment addiction.	


Snorting is an action applying to one carried thing. Understand "snort [thing]" and "sniff [thing]" as snorting. Understand "use [package of ment]" as snorting.

Check snorting:
	if the noun is an essence:
		try inhaling the noun instead;
	otherwise:
		if the noun is not a package of ment:
			take no time;
			say "You cannot snort that." instead.

[Check snorting a package of ment when the combat status is not peace:
	unless player is hidden:
		take no time;
		say "There is absolutely no way you could pull that off in a combat situation. The ment would get spilled everywhere." instead.]

Carry out snorting a package of ment:
	if the ment addiction is 0 or at least three packages of ment are on-stage:
		say "You take a small mirror, a razor and a straw from one of your pockets, and carefully cut the ment on the surface of the mirror. The light blue powder is looking very good. Using the straw, you manage to get almost all of it in your nose. You inhale sharply a few times -- and feel the ment do its awesome work.[paragraph break]Everything becomes clear, sharp, easy. You feel strong. You feel focused.";
	otherwise:
		say "You repeat the ritual: cutting, forming into a line, snorting through the straw, inhaling sharply. The ment kicks in immediately.";
	have the ment kick in;
	if ment addiction is 6:
		award achievement Sixth heaven.

To have the ment kick in:
	increase the ment addiction by 1;
	unless ment timer is 0:
		if a random chance of 1 in 2 succeeds:
			if the OD timer is 0:
				now the OD timer is 12;
			otherwise:
				end the game saying "You OD'ed.";
	now the ment timer is a random number between 10 and 15;
	remove the noun from play.
	


Status combat stats rule (this is the ment status rule):
	if ment timer is greater than 0:
		if long status is true:
			say "You are under the influence of [bold type]ment[roman type]: +[ment bonus] attack, +[ment bonus] damage, -[ment bonus] enemy damage, +[ment bonus] defence, +[ment bonus] to all abilities.[line break][run paragraph on]";
		otherwise:
			say "[bold type]Ment[roman type]: +[ment bonus] attack, +[ment bonus] damage, -[ment bonus] enemy damage, +[ment bonus] defence, +[ment bonus] abilities.[line break][run paragraph on]";
	if ment timer is 0 and ment addiction is greater than 0:
		if long status is true:
			say "You feel [bold type]down[roman type]: -[ment addiction] attack, -[ment addiction] to all abilities[line break][run paragraph on]";
		otherwise:
			say "[bold type]Down[roman type]: -[ment addiction] attack, -[ment addiction] abilities[line break][line break][run paragraph on]";

Instead of eating a package of ment (this is the ment cannot be eaten rule):
	take no time;
	say "Ment has to be taken through the nose, not the mouth. Try snorting it.".











Chapter - Tomes

A tome is a kind of thing.
A tome is readable.
The indefinite article of a tome is usually "the".

The description of a tome is usually "Who knows what will happen if you decide to read this legendary work of magic?"

Section - Tome of Transmutation

The Tome of Transmutation is a tome. First-trans-material is a material that varies. Second-trans-material is a material that varies.
Tome of Transmutation is paper.
Tome of Transmutation is magical.


When play begins (this is the set tome of transmutation rule):
	let n be a random number between 1 and 10;
	choose row n in Table of Tome Possibilities;
	now first-trans-material is the first-material entry;
	now second-trans-material is the second-material entry.

Table of Tome Possibilities
first-material		second-material
wood			iron
wood			silver
wood			adamant
iron				wood
iron				silver
iron				adamant
iron				glass
silver			iron
silver			wood
silver			adamant

[The description of tome of transmutation is "When read, this powerful book will turn all [material-adjective of first-trans-material] objects into [second-trans-material].".]

Carry out reading the tome of transmutation:
	say "You speak the mighty words of power. In a flare of magical light, the tome disappears -- and all [material-adjective of first-trans-material] objects have turned into [second-trans-material]!";
	remove tome of transmutation from play;
	repeat with item running through things:
		if material of item is first-trans-material:
			now material of item is second-trans-material;


Section - Tome of Sudden Death

The Tome of Sudden Death is a tome.
Tome of Sudden Death is paper.
Tome of Sudden Death is magical.

The sudden-death-boolean is a truth state that varies. Sudden-death-boolean is false.

Every turn when sudden-death-boolean is true:
	repeat with guy running through alive persons:
		now health of guy is 1.

Carry out reading the tome of sudden death:
	say "Life is fragile. A single blow could kill a man.";
	remove tome of sudden death from play;
	now sudden-death-boolean is true;


Section - Tome of the Brightest Flame

The Tome of the Brightest Flame is a tome.
Tome of the Brightest Flame is paper.
Tome of the Brightest Flame is magical.

Brightest-flame-counter is a number that varies. Brightest-flame-counter is 0.

Carry out reading the tome of the brightest flame:
	say "You have chosen fame over a long life. Achieve it while you may!";
	now hit protection of the player is 50;
	now brightest-flame-counter is 31;
	remove tome of the brightest flame from play.
	
A physical damage reduction rule (this is the brightest flame damage reduction rule):
	if the test subject is the player and brightest-flame-counter is not 0:
		increase the pdr by 100.	
	
Every turn when brightest-flame-counter is not 0:
	if main actor is the player:
		decrease brightest-flame-counter by 1;
		if brightest-flame-counter is 30 or brightest-flame-counter is 20 or brightest-flame-counter is 10 or brightest-flame-counter is 5 or brightest-flame-counter is 1:
			say "You will [bold type]die[roman type] in [brightest-flame-counter] turn[unless brightest-flame-counter is 1]s[end if]!";
		if brightest-flame-counter is 0:
			end the story saying "Your moment of fame has come and gone.".

Victory message rule (this is the brightest flame message rule):
	if brightest-flame-counter is not 0:		
		end the story saying "You have destroyed your foe, and will be able to enjoy your victory for another [brightest-flame-counter] turns!";
		rule succeeds.

Section - Tome of Law

The Tome of Law is a tome.
Tome of Law is paper.
Tome of Low is magical.

Tome-of-law-number is a number that varies. Tome-of-law-number is 0.

Carry out reading the Tome of Law:
	now tome-of-law-number is a random number between 1 and 10;
	say "The page shows the number [tome-of-law-number]."

First special set attack strength rule (this is the tome of law attack roll rule):
	if the tome-of-law-number is not 0:
		now attack strength is tome-of-law-number;
		rule succeeds.


Section - Tome of Briar Roses

The Tome of Briar Roses is a tome.
Tome of Briar Roses is paper.
Tome of Briar Roses is magical.

Carry out reading Tome of Briar Roses:
	remove Tome of Briar Roses from play;
	say "Magical sleep descends on the world.";
	repeat with guy running through not off-stage persons:
		if guy is sleeper:
			now guy is asleep.



Kerkerkruip Items ends here.