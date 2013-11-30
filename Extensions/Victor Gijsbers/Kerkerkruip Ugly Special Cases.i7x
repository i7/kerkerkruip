Kerkerkruip Ugly Special Cases by Victor Gijsbers begins here.

Use authorial modesty.


[For specific item combinations, for instance, that should, perhaps, one dayy, be implemented in a more robust fashion.]

Chapter - Armadillo and Drakul's lifeblood

[We should have a Corrosion event, and perhaps a Digestion event? to implement this cleanly.]

Last carry out the ravenous armadillo armadillo-eating:
	if the armadillo food is Drakul's lifeblood:
		remove Drakul's lifeblood from play;
		if the ravenous armadillo is in the location:
			say "The armadillo suddenly becomes deathly pale!";
		now the printed name of the ravenous armadillo is "vampire armadillo";
		increase melee of ravenous armadillo by 1;
		decrease defence of ravenous armadillo by 2;
		increase mind score of ravenous armadillo by 2;
		now ravenous armadillo is undead;
		now faction of ravenous armadillo is undead-faction.


Kerkerkruip Ugly Special Cases ends here.

Chapter - ghoulification in the Arena of the Gods

[This is the special report when Drakul is the opponent in the Arena of the Gods and the player reads the scroll of ghoulification. It informs the player that battle will still continue even though both are undead]

Last carry out reading a scroll of ghoulification when the location is the Arena of the Gods:
	now the playeroriginalfaction is the faction of the player;
	now the faction of the player is arena-faction.

Last report reading a scroll of ghoulification when the location is the Arena of the Gods:
	let godtest be a random god;
	repeat with pers running through gods:
		if the printed name of pers is godname:
			now godtest is pers;
	if godtest is Chton:
		say "Both [Random god worshipped by the player] and Chton won't accept a friendship! the battle continues!".



Chapter - Fixing Numbered Disambiguation Choices (for use with Numbered Disambiguation Choices by Aaron Reed)

[Hopefully, we can kick this out when Inform is updated!

Test with: The player carries a scroll of alteration. The player carries a scroll of the blade.

purloin analyser / drop analyser / put scroll in analyser / 2.

See issue #59]

Include (-

[ Descriptors  o x flag cto type n hold signal;
	hold = 0;
	signal = 0;
	ResetDescriptors();
	if (wn > num_words) return 0;

	for (flag=true : flag :) {
		o = NextWordStopped(); flag = false;

	   for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
			if (o == LanguageDescriptors-->x) {
				flag = true;
				type = LanguageDescriptors-->(x+2);
				if (type ~= DEFART_PK) indef_mode = true;
				indef_possambig = true;
				indef_cases = indef_cases & (LanguageDescriptors-->(x+1));

				if (type == POSSESS_PK) {
					cto = LanguageDescriptors-->(x+3);
					switch (cto) {
					  0: indef_type = indef_type | MY_BIT;
					  1: indef_type = indef_type | THAT_BIT;
					  default:
						indef_owner = PronounValue(cto);
						if (indef_owner == NULL) indef_owner = InformParser;
					}
				}

				if (type == light)  indef_type = indef_type | LIT_BIT;
				if (type == -light) indef_type = indef_type | UNLIT_BIT;
			}

		if (o == OTHER1__WD or OTHER2__WD or OTHER3__WD) {
			indef_mode = 1; flag = 1;
			indef_type = indef_type | OTHER_BIT;
			signal = 1;
		}
		if (o == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
			indef_mode = 1; flag = 1; indef_wanted = INDEF_ALL_WANTED;
			if (take_all_rule == 1) take_all_rule = 2;
			indef_type = indef_type | PLURAL_BIT;
			signal = 1;
		}
		if (allow_plurals) {
			if (NextWordStopped() ~= -1) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
			if (n == 1) { indef_mode = 1; flag = 1; }
			if (n > 1) {
				indef_guess_p = 1;
				indef_mode = 1; flag = 1; indef_wanted = n;
				indef_nspec_at = wn-1;
				indef_type = indef_type | PLURAL_BIT;
			}
		}
		if (flag == 1 && NextWordStopped() ~= OF1__WD or OF2__WD or OF3__WD or OF4__WD) {
			hold=1;
			wn--;  ! Skip 'of' after these
		}
	}
	wn--;
	if (hold == 1) {
		hold=0;
		if (signal == 0) {
			wn--;
		}
		else {
			signal = 0;
		}
	}
	return 0;
];

[ SafeSkipDescriptors;
	@push indef_mode; @push indef_type; @push indef_wanted;
	@push indef_guess_p; @push indef_possambig; @push indef_owner;
	@push indef_cases; @push indef_nspec_at;
	
	Descriptors();
	
	@pull indef_nspec_at; @pull indef_cases;
	@pull indef_owner; @pull indef_possambig; @pull indef_guess_p;
	@pull indef_wanted; @pull indef_type; @pull indef_mode;
];

-) instead of "Parsing Descriptors" in "Parser.i6t".