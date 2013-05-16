Kerkerkruip Glimmr Additions by Erik Temple begins here.

Use authorial modesty.

Include version 1/130420 of Glimmr Graphic Hyperlinks by Erik Temple.[Get the latest version at https://glimmr-i7x.googlecode.com/svn/trunk/Glimmr%20Graphic%20Hyperlinks.i7x]
Include Glimmr Canvas Animation by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Kerkerkruip Image Fonts by Erik Temple.
Include Glimmr Animation Fader - Black by Erik Temple.
[Include Glimmr Debugging Console by Erik Temple.

[Use animation debugging.]
Use Glimmr debugging.

To say >console:
	say echo stream of main-window.

To say <:
 	say stream of main-window;
	say run paragraph on.
	
[First for showing the title screen:
	Try switching the story transcript on;
	continue the action.]]


Chapter - Simplifying Glimmr credits

The announce colophon rule is not listed in any rulebook.


Chapter - Dealing with restore

After restoring from a saved game:
	reset the Glulx timer.[Kerkerkruip doesn't use the standard library restore code, so we need to reproduce Glimmr Canvas Animation's restore protection here.]


Chapter - Setting background colors for Gargoyle

To open up the graphics-window:
	if graphics-window is g-unpresent and the main-window is ancestral to graphics-window:
		set the Gargoyle background color to the color g-black;
		open up graphics-window;

Before window-shutting the graphics-window:
	if the graphics-window is g-present:
		set the Gargoyle background color to the color g-white;


Chapter - Assets

A figure name has a number called the y-offset. The y-offset of a figure-name is usually 0.[It is not necessary for all figure-names to get this property, but a bug in Inform--http://inform7.com/mantis/view.php?id=1067--prevents us from referring to the property if it is not defined in this way.]

[Section - Sounds

Sound of Klezmer is the file "Los_Jekes_-_Klezmer_de_Coiro.ogg".
Sound of Persian is the file "Christian__Kiane__Fromentin_-_Ilk_Bahar.ogg".
Sound of Spanish gypsy is the file "Los_Jekes_-_Romani.ogg".][****]


Section - Minimovies

Figure of minimovie_blank_frame is the file "minimovie_blank_frame.jpg".

Figure of minimovie_Close Call_00001 is the file "minimovie_Close Call_00001.jpg".
Figure of minimovie_Close Call_00002 is the file "minimovie_Close Call_00002.jpg".
Figure of minimovie_Close Call_00003 is the file "minimovie_Close Call_00003.jpg".
Figure of minimovie_Close Call_00004 is the file "minimovie_Close Call_00004.jpg".
Figure of minimovie_Close Call_00005 is the file "minimovie_Close Call_00005.jpg".
Figure of minimovie_Close Call_00006 is the file "minimovie_Close Call_00006.jpg".
Figure of minimovie_Close Call_00007 is the file "minimovie_Close Call_00007.jpg".
Figure of minimovie_Close Call_00008 is the file "minimovie_Close Call_00008.jpg".
Figure of minimovie_Close Call_00009 is the file "minimovie_Close Call_00009.jpg".
Figure of minimovie_Close Call_00010 is the file "minimovie_Close Call_00010.jpg".
Figure of minimovie_Close Call_00011 is the file "minimovie_Close Call_00011.jpg".
Figure of minimovie_Close Call_00012 is the file "minimovie_Close Call_00012.jpg".
Figure of minimovie_Close Call_00013 is the file "minimovie_Close Call_00013.jpg".
Figure of minimovie_Close Call_00014 is the file "minimovie_Close Call_00014.jpg".
Figure of minimovie_Close Call_00015 is the file "minimovie_Close Call_00015.jpg".
Figure of minimovie_Close Call_00016 is the file "minimovie_Close Call_00016.jpg".
Figure of minimovie_Close Call_00017 is the file "minimovie_Close Call_00017.jpg".
Figure of minimovie_Close Call_00018 is the file "minimovie_Close Call_00018.jpg".
Figure of minimovie_Close Call_00019 is the file "minimovie_Close Call_00019.jpg".
Figure of minimovie_Close Call_00020 is the file "minimovie_Close Call_00020.jpg".
Figure of minimovie_Close Call_00021 is the file "minimovie_Close Call_00021.jpg".
Figure of minimovie_Close Call_00022 is the file "minimovie_Close Call_00022.jpg".
Figure of minimovie_Close Call_00023 is the file "minimovie_Close Call_00023.jpg".
Figure of minimovie_Close Call_00024 is the file "minimovie_Close Call_00024.jpg".
Figure of minimovie_Close Call_00025 is the file "minimovie_Close Call_00025.jpg".
Figure of minimovie_Close Call_00026 is the file "minimovie_Close Call_00026.jpg".
Figure of minimovie_Close Call_00027 is the file "minimovie_Close Call_00027.jpg".
Figure of minimovie_Close Call_00028 is the file "minimovie_Close Call_00028.jpg".
Figure of minimovie_Close Call_00029 is the file "minimovie_Close Call_00029.jpg".
Figure of minimovie_Close Call_00030 is the file "minimovie_Close Call_00030.jpg".
Figure of minimovie_Close Call_00031 is the file "minimovie_Close Call_00031.jpg".
Figure of minimovie_Close Call_00032 is the file "minimovie_Close Call_00032.jpg".

Figure of minimovie_Eldritch Insanity_00001 is the file "minimovie_Eldritch Insanity_00001.jpg".
Figure of minimovie_Eldritch Insanity_00002 is the file "minimovie_Eldritch Insanity_00002.jpg".
Figure of minimovie_Eldritch Insanity_00003 is the file "minimovie_Eldritch Insanity_00003.jpg".
Figure of minimovie_Eldritch Insanity_00004 is the file "minimovie_Eldritch Insanity_00004.jpg".
Figure of minimovie_Eldritch Insanity_00005 is the file "minimovie_Eldritch Insanity_00005.jpg".
Figure of minimovie_Eldritch Insanity_00006 is the file "minimovie_Eldritch Insanity_00006.jpg".
Figure of minimovie_Eldritch Insanity_00007 is the file "minimovie_Eldritch Insanity_00007.jpg".
Figure of minimovie_Eldritch Insanity_00008 is the file "minimovie_Eldritch Insanity_00008.jpg".
Figure of minimovie_Eldritch Insanity_00009 is the file "minimovie_Eldritch Insanity_00009.jpg".
Figure of minimovie_Eldritch Insanity_00010 is the file "minimovie_Eldritch Insanity_00010.jpg".
Figure of minimovie_Eldritch Insanity_00011 is the file "minimovie_Eldritch Insanity_00011.jpg".
Figure of minimovie_Eldritch Insanity_00012 is the file "minimovie_Eldritch Insanity_00012.jpg".
Figure of minimovie_Eldritch Insanity_00013 is the file "minimovie_Eldritch Insanity_00013.jpg".
Figure of minimovie_Eldritch Insanity_00014 is the file "minimovie_Eldritch Insanity_00014.jpg".
Figure of minimovie_Eldritch Insanity_00015 is the file "minimovie_Eldritch Insanity_00015.jpg".
Figure of minimovie_Eldritch Insanity_00016 is the file "minimovie_Eldritch Insanity_00016.jpg".
Figure of minimovie_Eldritch Insanity_00017 is the file "minimovie_Eldritch Insanity_00017.jpg".
Figure of minimovie_Eldritch Insanity_00018 is the file "minimovie_Eldritch Insanity_00018.jpg".
Figure of minimovie_Eldritch Insanity_00019 is the file "minimovie_Eldritch Insanity_00019.jpg".
Figure of minimovie_Eldritch Insanity_00020 is the file "minimovie_Eldritch Insanity_00020.jpg".
Figure of minimovie_Eldritch Insanity_00021 is the file "minimovie_Eldritch Insanity_00021.jpg".
Figure of minimovie_Eldritch Insanity_00022 is the file "minimovie_Eldritch Insanity_00022.jpg".
Figure of minimovie_Eldritch Insanity_00023 is the file "minimovie_Eldritch Insanity_00023.jpg".
Figure of minimovie_Eldritch Insanity_00024 is the file "minimovie_Eldritch Insanity_00024.jpg".
Figure of minimovie_Eldritch Insanity_00025 is the file "minimovie_Eldritch Insanity_00025.jpg".
Figure of minimovie_Eldritch Insanity_00026 is the file "minimovie_Eldritch Insanity_00026.jpg".
Figure of minimovie_Eldritch Insanity_00027 is the file "minimovie_Eldritch Insanity_00027.jpg".
Figure of minimovie_Eldritch Insanity_00028 is the file "minimovie_Eldritch Insanity_00028.jpg".
Figure of minimovie_Eldritch Insanity_00029 is the file "minimovie_Eldritch Insanity_00029.jpg".
Figure of minimovie_Eldritch Insanity_00030 is the file "minimovie_Eldritch Insanity_00030.jpg".
Figure of minimovie_Eldritch Insanity_00031 is the file "minimovie_Eldritch Insanity_00031.jpg".
Figure of minimovie_Eldritch Insanity_00032 is the file "minimovie_Eldritch Insanity_00032.jpg".
Figure of minimovie_Eldritch Insanity_00033 is the file "minimovie_Eldritch Insanity_00033.jpg".

Figure of minimovie_I Am Murdered_00001 is the file "minimovie_I Am Murdered_00001.jpg".
Figure of minimovie_I Am Murdered_00002 is the file "minimovie_I Am Murdered_00002.jpg".
Figure of minimovie_I Am Murdered_00003 is the file "minimovie_I Am Murdered_00003.jpg".
Figure of minimovie_I Am Murdered_00004 is the file "minimovie_I Am Murdered_00004.jpg".
Figure of minimovie_I Am Murdered_00005 is the file "minimovie_I Am Murdered_00005.jpg".
Figure of minimovie_I Am Murdered_00006 is the file "minimovie_I Am Murdered_00006.jpg".
Figure of minimovie_I Am Murdered_00007 is the file "minimovie_I Am Murdered_00007.jpg".
Figure of minimovie_I Am Murdered_00008 is the file "minimovie_I Am Murdered_00008.jpg".
Figure of minimovie_I Am Murdered_00009 is the file "minimovie_I Am Murdered_00009.jpg".
Figure of minimovie_I Am Murdered_00010 is the file "minimovie_I Am Murdered_00010.jpg".
Figure of minimovie_I Am Murdered_00011 is the file "minimovie_I Am Murdered_00011.jpg".
Figure of minimovie_I Am Murdered_00012 is the file "minimovie_I Am Murdered_00012.jpg".
Figure of minimovie_I Am Murdered_00013 is the file "minimovie_I Am Murdered_00013.jpg".
Figure of minimovie_I Am Murdered_00014 is the file "minimovie_I Am Murdered_00014.jpg".
Figure of minimovie_I Am Murdered_00015 is the file "minimovie_I Am Murdered_00015.jpg".
Figure of minimovie_I Am Murdered_00016 is the file "minimovie_I Am Murdered_00016.jpg".
Figure of minimovie_I Am Murdered_00017 is the file "minimovie_I Am Murdered_00017.jpg".
Figure of minimovie_I Am Murdered_00018 is the file "minimovie_I Am Murdered_00018.jpg".
Figure of minimovie_I Am Murdered_00019 is the file "minimovie_I Am Murdered_00019.jpg".
Figure of minimovie_I Am Murdered_00020 is the file "minimovie_I Am Murdered_00020.jpg".
Figure of minimovie_I Am Murdered_00021 is the file "minimovie_I Am Murdered_00021.jpg".
Figure of minimovie_I Am Murdered_00022 is the file "minimovie_I Am Murdered_00022.jpg".
Figure of minimovie_I Am Murdered_00023 is the file "minimovie_I Am Murdered_00023.jpg".
Figure of minimovie_I Am Murdered_00024 is the file "minimovie_I Am Murdered_00024.jpg".
Figure of minimovie_I Am Murdered_00025 is the file "minimovie_I Am Murdered_00025.jpg".
Figure of minimovie_I Am Murdered_00026 is the file "minimovie_I Am Murdered_00026.jpg".
Figure of minimovie_I Am Murdered_00027 is the file "minimovie_I Am Murdered_00027.jpg".
Figure of minimovie_I Am Murdered_00028 is the file "minimovie_I Am Murdered_00028.jpg".
Figure of minimovie_I Am Murdered_00029 is the file "minimovie_I Am Murdered_00029.jpg".
Figure of minimovie_I Am Murdered_00030 is the file "minimovie_I Am Murdered_00030.jpg".
Figure of minimovie_I Am Murdered_00031 is the file "minimovie_I Am Murdered_00031.jpg".
Figure of minimovie_I Am Murdered_00032 is the file "minimovie_I Am Murdered_00032.jpg".
Figure of minimovie_I Am Murdered_00033 is the file "minimovie_I Am Murdered_00033.jpg".
Figure of minimovie_I Am Murdered_00034 is the file "minimovie_I Am Murdered_00034.jpg".
Figure of minimovie_I Am Murdered_00035 is the file "minimovie_I Am Murdered_00035.jpg".
Figure of minimovie_I Am Murdered_00036 is the file "minimovie_I Am Murdered_00036.jpg".
Figure of minimovie_I Am Murdered_00037 is the file "minimovie_I Am Murdered_00037.jpg".
Figure of minimovie_I Am Murdered_00038 is the file "minimovie_I Am Murdered_00038.jpg".
Figure of minimovie_I Am Murdered_00039 is the file "minimovie_I Am Murdered_00039.jpg".
Figure of minimovie_I Am Murdered_00040 is the file "minimovie_I Am Murdered_00040.jpg".
Figure of minimovie_I Am Murdered_00041 is the file "minimovie_I Am Murdered_00041.jpg".
Figure of minimovie_I Am Murdered_00042 is the file "minimovie_I Am Murdered_00042.jpg".
Figure of minimovie_I Am Murdered_00043 is the file "minimovie_I Am Murdered_00043.jpg".
Figure of minimovie_I Am Murdered_00044 is the file "minimovie_I Am Murdered_00044.jpg".
Figure of minimovie_I Am Murdered_00045 is the file "minimovie_I Am Murdered_00045.jpg".
Figure of minimovie_I Am Murdered_00046 is the file "minimovie_I Am Murdered_00046.jpg".
Figure of minimovie_I Am Murdered_00047 is the file "minimovie_I Am Murdered_00047.jpg".
Figure of minimovie_I Am Murdered_00048 is the file "minimovie_I Am Murdered_00048.jpg".
Figure of minimovie_I Am Murdered_00049 is the file "minimovie_I Am Murdered_00049.jpg".


Section - Title animation

Figure of title_00001 is the file "title_00001.jpg".
Figure of title_00002 is the file "title_00002.jpg".
Figure of title_00003 is the file "title_00003.jpg".
Figure of title_00004 is the file "title_00004.jpg".
Figure of title_00005 is the file "title_00005.jpg".
Figure of title_00006 is the file "title_00006.jpg".
Figure of title_00007 is the file "title_00007.jpg".
Figure of title_00008 is the file "title_00008.jpg".
Figure of title_00009 is the file "title_00009.jpg".
Figure of title_00010 is the file "title_00010.jpg".
Figure of title_00011 is the file "title_00011.jpg".
Figure of title_00012 is the file "title_00012.jpg".
Figure of title_00013 is the file "title_00013.jpg".
Figure of title_00014 is the file "title_00014.jpg".
Figure of title_00015 is the file "title_00015.jpg".
Figure of title_00016 is the file "title_00016.jpg".
Figure of title_00017 is the file "title_00017.jpg".
Figure of title_00018 is the file "title_00018.jpg".
Figure of title_00019 is the file "title_00019.jpg".
Figure of title_00020 is the file "title_00020.jpg".
Figure of title_00021 is the file "title_00021.jpg".
Figure of title_00022 is the file "title_00022.jpg".
Figure of title_00023 is the file "title_00023.jpg".
Figure of title_00024 is the file "title_00024.jpg".
Figure of title_00025 is the file "title_00025.jpg".
Figure of title_00026 is the file "title_00026.jpg".
Figure of title_00027 is the file "title_00027.jpg".
Figure of title_00028 is the file "title_00028.jpg".
Figure of title_00029 is the file "title_00029.jpg".
Figure of title_00030 is the file "title_00030.jpg".
Figure of title_00031 is the file "title_00031.jpg".
Figure of title_00032 is the file "title_00032.jpg".
Figure of title_00033 is the file "title_00033.jpg".
Figure of title_00034 is the file "title_00034.jpg".
Figure of title_00035 is the file "title_00035.jpg".
Figure of title_00036 is the file "title_00036.jpg".
Figure of title_00037 is the file "title_00037.jpg".
Figure of title_00038 is the file "title_00038.jpg".
Figure of title_00039 is the file "title_00039.jpg".
Figure of title_00040 is the file "title_00040.jpg".[Hold here - basic title]
Figure of title_00041 is the file "title_00041.jpg".
Figure of title_00042 is the file "title_00042.jpg".
Figure of title_00043 is the file "title_00043.jpg".
Figure of title_00044 is the file "title_00044.jpg".
Figure of title_00045 is the file "title_00045.jpg".
Figure of title_00046 is the file "title_00046.jpg".
Figure of title_00047 is the file "title_00047.jpg".
Figure of title_00048 is the file "title_00048.jpg".
Figure of title_00049 is the file "title_00049.jpg".
Figure of title_00050 is the file "title_00050.jpg".
Figure of title_00051 is the file "title_00051.jpg".
Figure of title_00052 is the file "title_00052.jpg".
Figure of title_00053 is the file "title_00053.jpg".
Figure of title_00054 is the file "title_00054.jpg".[Loop starts here]
Figure of title_00055 is the file "title_00055.jpg".
Figure of title_00056 is the file "title_00056.jpg".
Figure of title_00057 is the file "title_00057.jpg".
Figure of title_00058 is the file "title_00058.jpg".
Figure of title_00059 is the file "title_00059.jpg".
Figure of title_00060 is the file "title_00060.jpg".
Figure of title_00061 is the file "title_00061.jpg".
Figure of title_00062 is the file "title_00062.jpg".
Figure of title_00063 is the file "title_00063.jpg".
Figure of title_00064 is the file "title_00064.jpg".
Figure of title_00065 is the file "title_00065.jpg".[Loop ends here]


Section - Rogues Gallery transition

Figure of transition_RoguesGallery_00001 is the file "transition_RoguesGallery_00001.jpg".
Figure of transition_RoguesGallery_00002 is the file "transition_RoguesGallery_00002.jpg".
Figure of transition_RoguesGallery_00003 is the file "transition_RoguesGallery_00003.jpg".
Figure of transition_RoguesGallery_00004 is the file "transition_RoguesGallery_00004.jpg".
Figure of transition_RoguesGallery_00005 is the file "transition_RoguesGallery_00005.jpg".
Figure of transition_RoguesGallery_00006 is the file "transition_RoguesGallery_00006.jpg".
Figure of transition_RoguesGallery_00007 is the file "transition_RoguesGallery_00007.jpg".
Figure of transition_RoguesGallery_00008 is the file "transition_RoguesGallery_00008.jpg".
Figure of transition_RoguesGallery_00009 is the file "transition_RoguesGallery_00009.jpg".
Figure of transition_RoguesGallery_00010 is the file "transition_RoguesGallery_00010.jpg".
Figure of transition_RoguesGallery_00011 is the file "transition_RoguesGallery_00011.jpg".
Figure of transition_RoguesGallery_00012 is the file "transition_RoguesGallery_00012.jpg".
Figure of transition_RoguesGallery_00013 is the file "transition_RoguesGallery_00013.jpg".
Figure of transition_RoguesGallery_00014 is the file "transition_RoguesGallery_00014.jpg".
Figure of transition_RoguesGallery_00015 is the file "transition_RoguesGallery_00015.jpg".
Figure of transition_RoguesGallery_00016 is the file "transition_RoguesGallery_00016.jpg".
Figure of transition_RoguesGallery_00017 is the file "transition_RoguesGallery_00017.jpg".
Figure of transition_RoguesGallery_00018 is the file "transition_RoguesGallery_00018.jpg".
Figure of transition_RoguesGallery_00019 is the file "transition_RoguesGallery_00019.jpg".
Figure of transition_RoguesGallery_00020 is the file "transition_RoguesGallery_00020.jpg".
Figure of transition_RoguesGallery_00021 is the file "transition_RoguesGallery_00021.jpg".
Figure of transition_RoguesGallery_00022 is the file "transition_RoguesGallery_00022.jpg".
Figure of transition_RoguesGallery_00023 is the file "transition_RoguesGallery_00023.jpg".
Figure of transition_RoguesGallery_00024 is the file "transition_RoguesGallery_00024.jpg".
Figure of transition_RoguesGallery_00025 is the file "transition_RoguesGallery_00025.jpg".
Figure of transition_RoguesGallery_00026 is the file "transition_RoguesGallery_00026.jpg".
Figure of transition_RoguesGallery_00027 is the file "transition_RoguesGallery_00027.jpg".
Figure of transition_RoguesGallery_00028 is the file "transition_RoguesGallery_00028.jpg".
Figure of transition_RoguesGallery_00029 is the file "transition_RoguesGallery_00029.jpg".
Figure of transition_RoguesGallery_00030 is the file "transition_RoguesGallery_00030.jpg".
Figure of transition_RoguesGallery_00031 is the file "transition_RoguesGallery_00031.jpg".
Figure of transition_RoguesGallery_00032 is the file "transition_RoguesGallery_00032.jpg".
Figure of transition_RoguesGallery_00033 is the file "transition_RoguesGallery_00033.jpg".
Figure of transition_RoguesGallery_00034 is the file "transition_RoguesGallery_00034.jpg".
Figure of transition_RoguesGallery_00035 is the file "transition_RoguesGallery_00035.jpg".
Figure of transition_RoguesGallery_00036 is the file "transition_RoguesGallery_00036.jpg".
Figure of transition_RoguesGallery_00037 is the file "transition_RoguesGallery_00037.jpg".


Section - Main Menu

[Buttons for main menu]
Figure of Button-Continue is the file "button-Continue.png".
Figure of Button-Help is the file "button-Help.png".
Figure of Button-New Game is the file "button-New Game.png".
Figure of Button-Options is the file "button-Options.png".
Figure of Button-Quit is the file "button-Quit.png".
[Figure of Button-Reset is the file "button-Reset.png".]
Figure of Button-Score Info is the file "button-Score-Info.png".
Figure of Button-Skip Apprentice is the file "button-Skip-to-Apprentice.png".
[Pressed buttons]
Figure of button-Continue_pressed is the file "button-Continue_pressed.png".
Figure of button-Help_pressed is the file "button-Help_pressed.png".
Figure of button-New Game_pressed is the file "button-New Game_pressed.png".
Figure of button-Options_pressed is the file "button-Options_pressed.png".
Figure of button-Quit_pressed is the file "button-Quit_pressed.png".
Figure of button-Score-Info_pressed is the file "button-Score-Info_pressed.png".
Figure of button-Skip-to-Apprentice_pressed is the file "button-Skip-to-Apprentice_pressed.png".

[Type slugs for main menu]
Figure of Score-Slug is the file "slug-Score.png".

[Tooltips]
Figure of Tooltip-Score is the file "tooltip-Score.png".

[Type slugs for difficulty levels]
Figure of Diff-Adept is the file "slug-Difficulty-Adept.png".
Figure of Diff-Angel is the file "slug-Difficulty-Angel.png".
Figure of Diff-Apprentice is the file "slug-Difficulty-Apprentice.png". 
Figure of Diff-Demon is the file "slug-Difficulty-Demon.png".
Figure of Diff-Emperor is the file "slug-Difficulty-Emperor.png".
Figure of Diff-Empress is the file "slug-Difficulty-Empress.png".
Figure of Diff-Expert is the file "slug-Difficulty-Expert.png".
Figure of Diff-God is the file "slug-Difficulty-God.png".
Figure of Diff-Goddess is the file "slug-Difficulty-Goddess.png".
Figure of Diff-Grandmaster is the file "slug-Difficulty-Grandmaster.png".
Figure of Diff-King is the file "slug-Difficulty-King.png".
Figure of Diff-Master is the file "slug-Difficulty-Master.png".
Figure of Diff-Novice is the file "slug-Difficulty-Novice.png".
Figure of Diff-Prince is the file "slug-Difficulty-Prince.png".
Figure of Diff-Princess is the file "slug-Difficulty-Princess.png".
Figure of Diff-Queen is the file "slug-Difficulty-Queen.png".


Section - Monster cards

[Type slug for stats]
Figure of slug-Card-stats is the file "slug-Card-stats.png".

[Card art]
Figure of card-Armadillo is the file "card_Armadillo.jpg".
Figure of card-Chain_Golem is the file "card_Chain-Golem.jpg".
Figure of card-Daggers is the file "card_Daggers.jpg".
Figure of card-Mindslug is the file "card_Mindslug.jpg".
Figure of card-Miranda is the file "card_Miranda.jpg".
Figure of card-Reaper is the file "card_Reaper.jpg".
Figure of card-Tentacle is the file "card_Tentacle.jpg".

[Placeholders]
Figure of card_Malygris is the file "card_Malygris.jpg".
Figure of card_Bodmall is the file "card_Bodmall.jpg".
Figure of card_Fanatics-of-Aite is the file "card_Fanatics-of-Aite.jpg".
Figure of card_Minotaur is the file "card_Minotaur.jpg".
Figure of card_Hound is the file "card_Hound.jpg".
Figure of card_Demon-of-Rage is the file "card_Demon-of-Rage.jpg".
Figure of card_Blood-Ape is the file "card_Blood-Ape.jpg".
Figure of card_Jumping-Bomb is the file "card_Jumping-Bomb.jpg".
Figure of card_Wisps-of-Pain is the file "card_Wisps-of-Pain.jpg".


Section - Map

[tiles]
Figure of map_room_background_current_location is the file "map_room_background_current_location.png".
Figure of map_tunnel_background_current_location is the file "map_tunnel_background_current_location.png".
Figure of map_room_stairs_down is the file "map_room_stairs_down.png".
Figure of map_room_stairs_up_down is the file "map_room_stairs_up_down.png".
Figure of map_room_stairs_up is the file "map_room_stairs_up.png".
Figure of map_room is the file "map_room.png".
Figure of map_room_lava is the file "map_room_lava.png".
Figure of map_tile is the file "map_tile.png".
Figure of map_tunnel_stairs_down is the file "map_tunnel_stairs_down.png".
Figure of map_tunnel_stairs_up_down is the file "map_tunnel_stairs_up_down.png".
Figure of map_tunnel_stairs_up is the file "map_tunnel_stairs_up.png".
Figure of map_tunnel is the file "map_tunnel.png".

[Room labels]
Figure of map_label_Entrance is the file "map_label_Entrance.png".
Figure of map_label_Mirrors is the file "map_label_Mirrors.png".
Figure of map_label_Phantasmagoria is the file "map_label_Phantasmagoria.png".
Figure of map_label_Lava_lake is the file "map_label_Lava_lake.png".
Figure of map_label_Bridge is the file "map_label_Bridge.png".
Figure of map_label_Nomos is the file "map_label_Nomos.png".
Figure of map_label_Aite is the file "map_label_Aite.png".
Figure of map_label_Sul is the file "map_label_Sul.png".
Figure of map_label_Isatzo is the file "map_label_Isatzo.png".
Figure of map_label_Crypt is the file "map_label_Crypt.png".
Figure of map_label_Workshop is the file "map_label_Workshop.png".
Figure of map_label_Discontinuum is the file "map_label_Discontinuum.png".
Figure of map_label_Staircase is the file "map_label_Staircase.png".
Figure of map_label_Laboratory is the file "map_label_Laboratory.png".
Figure of map_label_Vapours is the file "map_label_Vapours.png".
Figure of map_label_Portal is the file "map_label_Portal.png".
Figure of map_label_Library is the file "map_label_Library.png".
Figure of map_label_Drawing is the file "map_label_Drawing.png".
Figure of map_label_Quartering is the file "map_label_Quartering.png".
Figure of map_label_Banshees is the file "map_label_Banshees.png".
Figure of map_label_Sweat_lodge is the file "map_label_Sweat_lodge.png".
Figure of map_label_Columns is the file "map_label_Columns.png".
Figure of map_label_Prison is the file "map_label_Prison.png".
Figure of map_label_Treasury is the file "map_label_Treasury.png".
Figure of map_label_Rust is the file "map_label_Rust.png".
Figure of map_label_Smoke_portal is the file "map_label_Smoke_portal.png".
Figure of map_label_Imp_s_Lair is the file "map_label_Imp_s_Lair.png".
Figure of map_label_Maze is the file "map_label_Maze.png".
Figure of map_label_Vault is the file "map_label_Vault.png".
Figure of map_label_Smoke is the file "map_label_Smoke.png".
Figure of map_label_Arena is the file "map_label_Arena.png".
Figure of map_label_Zen is the file "map_label_Zen.png".

[Enemy labels]
Figure of map_monster_Miranda is the file "map_monster_Miranda.png".
Figure of map_monster_swarm_of_daggers is the file "map_monster_swarm_of_daggers.png".
Figure of map_monster_ravenous_armadillo is the file "map_monster_ravenous_armadillo.png".
Figure of map_monster_wisps_of_pain is the file "map_monster_wisps_of_pain.png".
Figure of map_monster_blood_ape is the file "map_monster_blood_ape.png".
Figure of map_monster_chain_golem is the file "map_monster_chain_golem.png".
Figure of map_monster_reaper is the file "map_monster_reaper.png".
Figure of map_monster_jumping_bomb is the file "map_monster_jumping_bomb.png".
Figure of map_monster_hound is the file "map_monster_hound.png".
Figure of map_monster_demon_of_rage is the file "map_monster_demon_of_rage.png".
Figure of map_monster_mindslug is the file "map_monster_mindslug.png".
Figure of map_monster_minotaur is the file "map_monster_minotaur.png".
Figure of map_monster_giant_tentacle is the file "map_monster_giant_tentacle.png".
Figure of map_monster_Bodmall is the file "map_monster_Bodmall.png".
Figure of map_monster_healer_of_Aite is the file "map_monster_healer_of_Aite.png".
Figure of map_monster_tormentor_of_Aite is the file "map_monster_tormentor_of_Aite.png".
Figure of map_monster_defender_of_Aite is the file "map_monster_defender_of_Aite.png".
Figure of map_monster_overmind is the file "map_monster_overmind.png".
Figure of map_monster_Malygris is the file "map_monster_Malygris.png".
Figure of map_monster_Fafhrd is the file "map_monster_Fafhrd.png".
Figure of map_monster_Mouser is the file "map_monster_Mouser.png".
Figure of map_monster_Nameless_Horror is the file "map_monster_Nameless_Horror.png".
Figure of map_monster_rotting_corpse is the file "map_monster_rotting_corpse.png".
Figure of map_monster_aswang is the file "map_monster_aswang.png".
Figure of map_monster_mummified_priest is the file "map_monster_mummified_priest.png".
Figure of map_monster_abyss_of_the_soul is the file "map_monster_abyss_of_the_soul.png".
Figure of map_monster_demonic_assassin is the file "map_monster_demonic_assassin.png".
Figure of map_monster_smoke_demon is the file "map_monster_smoke_demon.png".
Figure of map_monster_imp is the file "map_monster_imp.png".
Figure of map_monster_demonic_mistress is the file "map_monster_demonic_mistress.png".

[Legend labels]
Figure of map_legend_Miranda is the file "map_legend_Miranda.png".
Figure of map_legend_swarm_of_daggers is the file "map_legend_swarm_of_daggers.png".
Figure of map_legend_ravenous_armadillo is the file "map_legend_ravenous_armadillo.png".
Figure of map_legend_wisps_of_pain is the file "map_legend_wisps_of_pain.png".
Figure of map_legend_blood_ape is the file "map_legend_blood_ape.png".
Figure of map_legend_chain_golem is the file "map_legend_chain_golem.png".
Figure of map_legend_reaper is the file "map_legend_reaper.png".
Figure of map_legend_jumping_bomb is the file "map_legend_jumping_bomb.png".
Figure of map_legend_hound is the file "map_legend_hound.png".
Figure of map_legend_demon_of_rage is the file "map_legend_demon_of_rage.png".
Figure of map_legend_mindslug is the file "map_legend_mindslug.png".
Figure of map_legend_minotaur is the file "map_legend_minotaur.png".
Figure of map_legend_giant_tentacle is the file "map_legend_giant_tentacle.png".
Figure of map_legend_Bodmall is the file "map_legend_Bodmall.png".
Figure of map_legend_healer_of_Aite is the file "map_legend_healer_of_Aite.png".
Figure of map_legend_tormentor_of_Aite is the file "map_legend_tormentor_of_Aite.png".
Figure of map_legend_defender_of_Aite is the file "map_legend_defender_of_Aite.png".
Figure of map_legend_overmind is the file "map_legend_overmind.png".
Figure of map_legend_Malygris is the file "map_legend_Malygris.png".
Figure of map_legend_Fafhrd is the file "map_legend_Fafhrd.png".
Figure of map_legend_Mouser is the file "map_legend_Mouser.png".
Figure of map_legend_Nameless_Horror is the file "map_legend_Nameless_Horror.png".
Figure of map_legend_rotting_corpse is the file "map_legend_rotting_corpse.png".
Figure of map_legend_aswang is the file "map_legend_aswang.png".
Figure of map_legend_mummified_priest is the file "map_legend_mummified_priest.png".
Figure of map_legend_abyss_of_the_soul is the file "map_legend_abyss_of_the_soul.png".
Figure of map_legend_demonic_assassin is the file "map_legend_demonic_assassin.png".
Figure of map_legend_smoke_demon is the file "map_legend_smoke_demon.png".
Figure of map_legend_imp is the file "map_legend_imp.png".
Figure of map_legend_demonic_mistress is the file "map_legend_demonic_mistress.png".

[Titles and UI]
Figure of map_text_title is the file "map_text_title.png".
Figure of map_text_legend_title is the file "map_text_legend_title.png".
Figure of map_text_any_key is the file "map_text_any_key.png".
Figure of map_text_arrow_keys is the file "map_text_arrow_keys.png".
Figure of map_text_compass_rose is the file "map_text_compass_rose.png".
Figure of map_ellipsis is the file "map_ellipsis.png".

Figure of map_button_down_arrow_active is the file "map_button_down_arrow_active.png".
Figure of map_button_down_arrow_inactive is the file "map_button_down_arrow_inactive.png".
Figure of map_button_left_arrow_active is the file "map_button_left_arrow_active.png".
Figure of map_button_left_arrow_inactive is the file "map_button_left_arrow_inactive.png".
Figure of map_button_right_arrow_active is the file "map_button_right_arrow_active.png".
Figure of map_button_right_arrow_inactive is the file "map_button_right_arrow_inactive.png".
Figure of map_button_up_arrow_active is the file "map_button_up_arrow_active.png".
Figure of map_button_up_arrow_inactive is the file "map_button_up_arrow_inactive.png".



Chapter - Mini-movie definitions

A mini-movie is a kind of animation track.
A mini-movie has an indexed text called the command-string.


Section - I Am Murdered (Daggers)

I-Am-Murdered is a mini-movie. The command-string is ">attack". The image-reel is {Figure of minimovie_I Am Murdered_00001, Figure of minimovie_I Am Murdered_00002, Figure of minimovie_I Am Murdered_00003, Figure of minimovie_I Am Murdered_00004, Figure of minimovie_I Am Murdered_00005, Figure of minimovie_I Am Murdered_00006, Figure of minimovie_I Am Murdered_00007, Figure of minimovie_I Am Murdered_00008, Figure of minimovie_I Am Murdered_00009, Figure of minimovie_I Am Murdered_00010, Figure of minimovie_I Am Murdered_00011, Figure of minimovie_I Am Murdered_00012, Figure of minimovie_I Am Murdered_00013, Figure of minimovie_I Am Murdered_00014, Figure of minimovie_I Am Murdered_00015, Figure of minimovie_I Am Murdered_00016, Figure of minimovie_I Am Murdered_00017, Figure of minimovie_I Am Murdered_00018, Figure of minimovie_I Am Murdered_00019, Figure of minimovie_I Am Murdered_00020, Figure of minimovie_I Am Murdered_00021, Figure of minimovie_I Am Murdered_00022, Figure of minimovie_I Am Murdered_00023, Figure of minimovie_I Am Murdered_00024, Figure of minimovie_I Am Murdered_00025, Figure of minimovie_I Am Murdered_00026, Figure of minimovie_I Am Murdered_00027, Figure of minimovie_I Am Murdered_00028, Figure of minimovie_I Am Murdered_00029, Figure of minimovie_I Am Murdered_00030, Figure of minimovie_I Am Murdered_00031, Figure of minimovie_I Am Murdered_00032, Figure of minimovie_I Am Murdered_00033, Figure of minimovie_I Am Murdered_00034, Figure of minimovie_I Am Murdered_00035, Figure of minimovie_I Am Murdered_00036, Figure of minimovie_I Am Murdered_00037, Figure of minimovie_I Am Murdered_00038, Figure of minimovie_I Am Murdered_00039, Figure of minimovie_I Am Murdered_00040, Figure of minimovie_I Am Murdered_00041, Figure of minimovie_I Am Murdered_00042, Figure of minimovie_I Am Murdered_00043, Figure of minimovie_I Am Murdered_00044, Figure of minimovie_I Am Murdered_00045, Figure of minimovie_I Am Murdered_00046, Figure of minimovie_I Am Murdered_00047, Figure of minimovie_I Am Murdered_00048, Figure of minimovie_I Am Murdered_00049, Figure of minimovie_blank_frame}.


Section - Close Call (Daggers)

Close-Call is a mini-movie. The command-string is ">dodge". The image-reel is {Figure of minimovie_Close Call_00001, Figure of minimovie_Close Call_00002, Figure of minimovie_Close Call_00003, Figure of minimovie_Close Call_00004, Figure of minimovie_Close Call_00005, Figure of minimovie_Close Call_00006, Figure of minimovie_Close Call_00007, Figure of minimovie_Close Call_00008, Figure of minimovie_Close Call_00009, Figure of minimovie_Close Call_00010, Figure of minimovie_Close Call_00011, Figure of minimovie_Close Call_00012, Figure of minimovie_Close Call_00013, Figure of minimovie_Close Call_00014, Figure of minimovie_Close Call_00015, Figure of minimovie_Close Call_00016, Figure of minimovie_Close Call_00017, Figure of minimovie_Close Call_00018, Figure of minimovie_Close Call_00019, Figure of minimovie_Close Call_00020, Figure of minimovie_Close Call_00021, Figure of minimovie_Close Call_00022, Figure of minimovie_Close Call_00023, Figure of minimovie_Close Call_00024, Figure of minimovie_Close Call_00025, Figure of minimovie_Close Call_00026, Figure of minimovie_Close Call_00027, Figure of minimovie_Close Call_00028, Figure of minimovie_Close Call_00029, Figure of minimovie_Close Call_00030, Figure of minimovie_Close Call_00031, Figure of minimovie_Close Call_00032, Figure of minimovie_blank_frame}.


Section - Eldritch Insanity (Armadillo)

Eldritch Insanity is a mini-movie. The command-string is ">sprout 4". The image-reel is {Figure of minimovie_Eldritch Insanity_00001, Figure of minimovie_Eldritch Insanity_00002, Figure of minimovie_Eldritch Insanity_00003, Figure of minimovie_Eldritch Insanity_00004, Figure of minimovie_Eldritch Insanity_00005, Figure of minimovie_Eldritch Insanity_00006, Figure of minimovie_Eldritch Insanity_00007, Figure of minimovie_Eldritch Insanity_00008, Figure of minimovie_Eldritch Insanity_00009, Figure of minimovie_Eldritch Insanity_00010, Figure of minimovie_Eldritch Insanity_00011, Figure of minimovie_Eldritch Insanity_00012, Figure of minimovie_Eldritch Insanity_00013, Figure of minimovie_Eldritch Insanity_00014, Figure of minimovie_Eldritch Insanity_00015, Figure of minimovie_Eldritch Insanity_00016, Figure of minimovie_Eldritch Insanity_00017, Figure of minimovie_Eldritch Insanity_00018, Figure of minimovie_Eldritch Insanity_00019, Figure of minimovie_Eldritch Insanity_00020, Figure of minimovie_Eldritch Insanity_00021, Figure of minimovie_Eldritch Insanity_00022, Figure of minimovie_Eldritch Insanity_00023, Figure of minimovie_Eldritch Insanity_00024, Figure of minimovie_Eldritch Insanity_00025, Figure of minimovie_Eldritch Insanity_00026, Figure of minimovie_Eldritch Insanity_00027, Figure of minimovie_Eldritch Insanity_00028, Figure of minimovie_Eldritch Insanity_00029, Figure of minimovie_Eldritch Insanity_00030, Figure of minimovie_Eldritch Insanity_00031, Figure of minimovie_Eldritch Insanity_00032, Figure of minimovie_Eldritch Insanity_00033, Figure of minimovie_blank_frame}.


Chapter - Title animation

The title-animation is an animation track. The image-reel is {Figure of title_00001, Figure of title_00002, Figure of title_00003, Figure of title_00004, Figure of title_00005, Figure of title_00006, Figure of title_00007, Figure of title_00008, Figure of title_00009, Figure of title_00010, Figure of title_00011, Figure of title_00012, Figure of title_00013, Figure of title_00014, Figure of title_00015, Figure of title_00016, Figure of title_00017, Figure of title_00018, Figure of title_00019, Figure of title_00020, Figure of title_00021, Figure of title_00022, Figure of title_00023, Figure of title_00024, Figure of title_00025, Figure of title_00026, Figure of title_00027, Figure of title_00028, Figure of title_00029, Figure of title_00030, Figure of title_00031, Figure of title_00032, Figure of title_00033, Figure of title_00034, Figure of title_00035, Figure of title_00036, Figure of title_00037, Figure of title_00038, Figure of title_00039, Figure of title_00040}.


Chapter - Title instructions

[Display the start button text and the rogues gallery info, for use only until some level 1 or greater enemies have been killed.]
The title-instruction track is an animation track. The image-reel is {Figure of title_00041, Figure of title_00042, Figure of title_00043, Figure of title_00044, Figure of title_00045, Figure of title_00046, Figure of title_00047, Figure of title_00048, Figure of title_00049, Figure of title_00050, Figure of title_00051, Figure of title_00052, Figure of title_00053}.

[Flash the start button text]
The start-button track is an animation track. The image-reel is {Figure of title_00054, Figure of title_00055, Figure of title_00056, Figure of title_00057, Figure of title_00058, Figure of title_00059, Figure of title_00060, Figure of title_00061, Figure of title_00062, Figure of title_00063, Figure of title_00064, Figure of title_00065}.


Section - Rogues Gallery transition

The gallery-transition is an animation track. The image-reel is {Figure of transition_RoguesGallery_00001, Figure of transition_RoguesGallery_00002, Figure of transition_RoguesGallery_00003, Figure of transition_RoguesGallery_00004, Figure of transition_RoguesGallery_00005, Figure of transition_RoguesGallery_00006, Figure of transition_RoguesGallery_00007, Figure of transition_RoguesGallery_00008, Figure of transition_RoguesGallery_00009, Figure of transition_RoguesGallery_00010, Figure of transition_RoguesGallery_00011, Figure of transition_RoguesGallery_00012, Figure of transition_RoguesGallery_00013, Figure of transition_RoguesGallery_00014, Figure of transition_RoguesGallery_00015, Figure of transition_RoguesGallery_00016, Figure of transition_RoguesGallery_00017, Figure of transition_RoguesGallery_00018, Figure of transition_RoguesGallery_00019, Figure of transition_RoguesGallery_00020, Figure of transition_RoguesGallery_00021, Figure of transition_RoguesGallery_00022, Figure of transition_RoguesGallery_00023, Figure of transition_RoguesGallery_00024, Figure of transition_RoguesGallery_00025, Figure of transition_RoguesGallery_00026, Figure of transition_RoguesGallery_00027, Figure of transition_RoguesGallery_00028, Figure of transition_RoguesGallery_00029, Figure of transition_RoguesGallery_00030, Figure of transition_RoguesGallery_00031, Figure of transition_RoguesGallery_00032, Figure of transition_RoguesGallery_00033, Figure of transition_RoguesGallery_00034, Figure of transition_RoguesGallery_00035, Figure of transition_RoguesGallery_00036, Figure of transition_RoguesGallery_00037}.


Chapter - Graphics support and preferences

Full graphics support is a truth state variable.

Rule for starting the virtual machine (this is the graphics support rule):
	if glulx graphics is supported and glulx graphic-window mouse input is supported and glulx timekeeping is supported and glulx PNG transparency is supported:
		now full graphics support is true.

Before showing the title screen (this is the request graphics preferences rule):
	if data value 5 is 0[i.e., no value] and full graphics support is true:
		say "[italic type]If you are using a screen reader to play the game, you should answer NO. The main menu graphics are not compatible with screen readers. The graphics preference can also be changed from the Options menu.[roman type][paragraph break]";
		say "[bold type]Would you like menu graphics?[roman type] ";
		if the player consents:
			set data value 5 to 1;
		otherwise:
			set data value 5 to -1;
		clear the main-window.

The request graphics preferences rule is listed after the load the file of data storage rule in the before showing the title screen rules.


Section - Setting graphics preferences from the command line

Setting graphics on is an action out of world. Understand "graphics on" as setting graphics on.

Carry out setting graphics on:
	if data value 5 is 1:
		say "Graphics are already turned on.";
	otherwise:
		set data value 5 to 1;
		if data value 5 is not 1:
			say "Warning: Could not set graphics preference.";
		otherwise:
			say "Graphics will be used to display the main menu."

Setting graphics off is an action out of world. Understand "graphics off" as setting graphics off.

Carry out setting graphics off:
	if data value 5 is -1:
		say "Graphics are already turned off.";
	otherwise:
		set data value 5 to -1;
		if data value 5 is not -1:
			say "Warning: Could not set graphics preference.";
		otherwise:
			say "Graphics will no longer be used to display the main menu."


Chapter - Session flag

Carry out restarting the game (this is the set session flag on restart rule):
	[This sets a flag that we can check--and reset--to decide whether or not to show the title animation before the main menu.]
	set data value 6 to 1.

[We need to do the same thing in the immediately restart the game rule, which is a bit trickier since it is an I6 rule in the template layer. We need to replace the template rule with a routine that will set the session flag.]

Include (-
[ IMMEDIATELY_RESTART_VM_R;
	((+ data-value setting +)-->1)(6,1);
	@restart; 
];
-) instead of "Immediately Restart VM Rule" in "OrderOfPlay.i6t".

First carry out quitting the game (this is the set session flag on quit rule):
	[We set the session flag to 0 on quit. This will almost never be necessary, but it helps assure that we will see the animated title on starting a new session.]
	set data value 6 to 0.


Chapter - Set up the graphics window
[We don't want to see the main text window at all until the game proper begins. Strictly speaking, we should probably hack the Inform library to allow for this--but that is not a minor undertaking. Instead, we will simply open the graphics window so that it covers the main text window entirely (note the 100 measurement below--this indicates that the graphics window will be split off from the main window at 100% of the latter's height). The Glulx Status Window Control extension suppresses the opening of the status window; we will open it later, only after closing the graphics window.]

The graphics-window is a graphics g-window spawned by the main-window. The position of the graphics-window is g-placeabove. The measurement of the graphics-window is 100. The back-colour of the graphics-window is g-black. The graphics-window is g-graphlinked.


Chapter - Animation code support

Section - Easy delays

The pause track is an animation track.

To pause for (T - number) milliseconds/ms, accepting input:
	animate the pause track as a temporalizing animation at 130 ms per frame[8fps] with a duration of (T / 130)frames;
	if accepting input:
		wait for main menu input until all animations are complete;
	otherwise:
		delay input until all animations are complete.

[For updating graphics windows for animation when pause track is animation-active (this is the don't refresh windows while we are merely holding rule):
	#if utilizing animation debugging;
	say "[>console][bracket]Kerkerkruip[close bracket]: Graphics drawing suppressed (don't refresh windows while we are merely holding rule).[<]";
	#end if;
	do nothing.]
	

Chapter - Menu control

Menu-active is a truth state variable.
Redraw-menu is a truth state variable. Redraw-menu is false.

[To decide what sound-name is the music selected by the player:
	say "Please select background music: [line break]";
	let count be a number;
	repeat with tune running through sound-names:
		increment count;
		let T be indexed text;
		let T be "[tune]";
		replace the text "Sound of " in T with "";
		say "   ([count]) [T][line break]";
	while 1 is 1:
		let k be the character code entered in the main-window - 48;
		if k is less than (count + 1) and k is greater than 0:
			now count is 0;
			repeat with tune running through sound-names:
				increment count;
				if k is count:
					decide on tune.]

For showing the title screen when full graphics support is true and data value 5 is 1 (this is the graphic title screen rule):
	[let theme music be the music selected by the player;]
	close the status window;[needed on restart]
	close side windows;[needed on restart]
	let session flag be false;
	open up the graphics-window;
	if data value 6 is 1:
		now session flag is true;
		set data value 6 to 0;
	if session flag is false:
		show a minimovie;	
		[play the theme music;][****]
		show the title;
	set JUMP POINT redraw_menu;
	now menu-active is true;
	now redraw-menu is false;
	close the status window;[for returning from a text menu]
	close side windows;[probably not necessary here, but added for future-proofing.]
	open up the graphics-window;[it is possible that it may be closed on return from a menu]
	fade in the main menu;
	pause for 2000 milliseconds, accepting input;
	if the number of entries in the monster-card queue is greater than 0:
		if menu-active is true:
			transition to monster card gallery;
		if menu-active is true:
			animate monster cards;
	otherwise if menu-active is true:
		show startup instructions;
	if redraw-menu is true:
		JUMP to redraw_menu;
	otherwise:
		clear the main-window;[we don't want to see old content in the main window when the menu closes]
		close title screen;
		[open the status window.]

To set jump point redraw_menu:
	(- .RedrawMenu; -)
	
To jump to redraw_menu:
	(- jump RedrawMenu; -)

To menu-start new game:
	if the file of save data exists:
		delete file of save data;
		unless difficulty is less than 2:
			set difficulty to (difficulty - 1);

To menu-continue game:
	do nothing.

To menu-quit game:
	clear the main-window;[Some interpreters will show the main window after we've quit, so we handle that.]
	say "Thank you for playing Kerkerkruip!";
	close title screen;
	stop game abruptly.

To menu-request help menu:
	now the current menu is the Table of Kerkerkruip Help;
	close title screen;
	carry out the displaying activity.

To menu-request options menu:
	now the current menu is Table of Options Menu;
	close title screen;
	carry out the displaying activity.

To menu-skip novice:
	set difficulty to 1;
	delete file of save data.


Chapter - Title animation

Section - Show a minimovie

The opening-canvas is a g-canvas. The canvas-width is 500. The canvas-height is 300.
The associated canvas of the graphics-window is the opening-canvas.

The command-container is a bitmap-rendered string. The bit-size is 2. The associated font is Glimmr C&C. The origin is {200, 143}. The associated canvas is the opening-canvas.

Command-movie is an animation track. The command-movie has a number called the cursor-position. The command-movie has a number called string-length. The command-movie has an indexed text called the full-string.

To show a minimovie:
	let the film be a random mini-movie;
	now the full-string of the command-movie is the command-string of the film;
	now the text-string of the command-container is character number 1 in the command-string of the film;
	now the cursor-position of the command-movie is 1;
	now the string-length of the command-movie is the number of characters in the command-string of the film;
	animate the command-movie as a custom animation at 6 fps, cycling;
	delay input until all animations are complete;
	deactivate the command-container;
	animate the film as a reel animation targeting the opening-canvas at 8 fps;
	delay input until all animations are complete.[input is not allowed during the minimovie.]
	

Animation rule for the command-movie:
	let cur-frame be the current-frame of the command-movie;
	if cur-frame - 6 is greater than 0:
		if the remainder after dividing (cur-frame - 6) by 2 is 0:
			increase the cursor-position of the command-movie by 1;
			if the cursor-position of the command-movie > string-length of the command-movie:
				cease animating the command-movie;
				rule succeeds;
			now the text-string of the command-container is "[text-string of the command-container][character number (cursor-position of the command-movie) in full-string of the command-movie]";
	if the current-frame of the command-movie is 1 or the remainder after dividing the cur-frame by 4 is 0:[show the cursor once every 4 frames, after the first]
		now the cursor of the command-container is the number of characters in the text-string of the command-container;
	otherwise:
		now the cursor of the command-container is -99;
	

Section - Show the title

The title-screen is a g-canvas. The canvas-width is 660. The canvas-height is 718.[Same as the main menu, for convenience's sake, since the final frame of the title image will carry forward into the menu.]

The title-container is a sprite. It is center-aligned. The origin is {330, 359}. The associated canvas is the title-screen.

To show the title:
	now the associated canvas of the graphics-window is the title-screen;
	animate the title-animation as a reel animation targeting the title-container at 8 fps;
	[play sound of music;]
	delay input until all animations are complete.[Input is not allowed during the title animation.]


Chapter - Main menu

The main-menu is a g-canvas. The canvas-width is 660. The canvas-height is 718.


Section - Element declarations for main menu

A type-slug is a kind of sprite. The display status of a type-slug is g-active. The display-layer of a type-slug is 3. The associated canvas of a type-slug is the main-menu. Some type-slugs are defined by the Table of Non-Interactive Elements.

Table of Non-Interactive Elements
sprite	image-ID	origin
Score-slug	Figure of Score-Slug	{56, 646}
Difficulty-slug	Figure of Diff-Novice	{138, 647}
Best-Difficulty-slug	Figure of Diff-Novice	{411, 647}


A button is a kind of sprite. A button has a figure-name called the depressed state. The display status of a button is g-active. The associated canvas of a button is the main-menu. The graphlink status of a button is g-active. The display-layer of a button is 3. Some buttons are defined by the Table of Interactive Elements.

Table of Interactive Elements
sprite	image-ID	origin	depressed state	resting state	
Continue_Game	Figure of Button-Continue	{50, 13}	Figure of button-Continue_pressed	Figure of Button-Continue
Help_Button	Figure of Button-Help	{231, 49}	Figure of button-Help_pressed	Figure of Button-Help
New_Game	Figure of Button-New Game	{51, 49}	Figure of button-New Game_pressed	Figure of Button-New Game
Options_Button	Figure of Button-Options	{333, 49}	Figure of button-Options_pressed	Figure of Button-Options
Quit_Game	Figure of Button-Quit	{477, 49}	Figure of button-Quit_pressed	Figure of Button-Quit
ScoreInfo_Button	Figure of Button-Score Info	{580, 665}	Figure of button-Score-Info_pressed	Figure of Button-Score Info
Skip_Button	Figure of Button-Skip Apprentice	{63, 670}	Figure of button-Skip-to-Apprentice_pressed	Figure of Button-Skip Apprentice

[Reset_Victories	Figure of Button-Reset	{521, 674}[without a modal confirmation, it seems best to leave this for the Options menu]]


A type-container is a kind of image-rendered string. The associated canvas of a type-container is the main-menu. Some type-containers are defined by the Table of Image String Boxes. The display-layer of a type-container is 3.

Table of Image String Boxes
image-rendered string	origin	associated font	text-string	display status
current-difficulty	{144, 650}	Humanist-small-crimson	"(0)"	g-active
highest-difficulty	{416, 650}	Humanist-small-crimson	"(0)"	g-active
total-victories	{488, 674}	Humanist-small-crimson	"0"	g-active


Chapter - Monster cards

slug-Card-stats is a type-slug. The image-ID is Figure of slug-Card-stats. The origin is {456, 284}. The display status is g-inactive. The display-layer is 2. [401, 189]
The slug-Card-stats has a number called the y-standard. The y-standard of the slug-Card-stats is 284.

A card-type-container is a kind of type-container. The display-layer of a card-type-container is usually 4. A card-type-container is usually center-aligned. The display status of a card-type-container is g-inactive. The associated font of a card-type-container is usually Humanist-large-crimson.

A card-type-container has a number called the y-standard.

Some card-type-containers are defined by the Table of Monster Card Type Containers.

Table of Monster Card Type Containers
card-type-container	origin	y-standard	text-string
kill-counter	{520, 334}	334	"0"
death-counter	{520, 425}	425	"0"



Section - Fading in the main menu

The menu fade-up track is an animation track.

To fade in the main menu:
	now the associated canvas of the graphics-window is the main-menu;
	prepare central zone;
	prepare type slugs;
	prepare difficulty levels for display;
	prepare monster cards;
	repeat with el running through card-type-containers:
		deactivate el;[hides type slug for cards; they will be turned on when card display begins]
	animate the menu fade-up track as a fade animation targeting the main-menu and using the Black-Fader from 100 % to 0 % at 8 fps with a duration of 6 frames;
	[play sound of music;]
	wait for main menu input until all animations are complete.[Input is allowed once we are fading in to the menu.]

To prepare central zone:
	now the image-ID of the transition-container is [the image-ID of the title-container]Figure of title_00040;
	deactivate card-container;
	activate transition-container.


Section - Show the startup instructions
[The animation here will also trigger, via callback, a second animation that will loop until we provide input.]

To show startup instructions:
	animate the title-instruction track as a reel animation targeting the transition-container at 8 fps;
	wait for main menu input until all animations are complete;
	animate the start-button track as a reel animation targeting the transition-container at 8 fps, cycling;
	wait for main menu input until all animations are complete.


Section - Transition animation
[The transition links the title image to the rogues gallery. If there are no enemies in the gallery yet, we have a different treatment.]

The transition-container is a sprite. It is center-aligned. The image-ID is Figure of Null. The origin is {330, 359}. The display-layer is 10000. The associated canvas is the main-menu.

To transition to monster card gallery:
	animate the gallery-transition as a reel animation targeting the transition-container at 8 fps;
	wait for main menu input until all animations are complete;
	pause for 1000 milliseconds, accepting input;
	now the image-ID of the transition-container is the image-ID of the card-container.


Section - Animate cards

The card-container is a sprite. It is center-aligned. The image-ID is Figure of Null. The origin is {330, 359}. The display-layer is 1. The associated canvas is the main-menu.

The card-occluder is a rectangle primitive. The tint is g-black. The origin is {55, 95}. The endpoint is {610, 623}. The display status is g-inactive. The display-layer is 9998. The associated canvas is the main-menu.

The card-fader track is an animation track.

The card-iteration track is an animation track.[ The card-iteration track has a number called animation-index.]

To animate monster cards:
	deactivate the transition-container;
	activate slug-Card-stats;
	repeat with item running through card-type-containers:
		activate item;
	let index be 0;
	while menu-active is true:
		close the status window;[on returning from a text menu]
		close side windows;[probably not necessary, but included for future-proofing]
		open up the graphics-window;[it is possible that it may be closed on return from a menu]
		increase index by 1;
		if index > number of entries in the monster-card queue:
			now index is 1;
		let current-creature be entry index of the monster-card queue;
		let card-image be the card of the current-creature;
		if card-image is Figure of Null:
			next;
		now image-ID of the card-container is the card-image;
		let y be vertical-offset of card-image;
		now entry 2 of the origin of slug-Card-stats is y + y-standard of slug-Card-stats;
		repeat with item running through card-type-containers:
			now entry 2 of the origin of the item is y + y-standard of item;
		now text-string of kill-counter is "[died count of current-creature]";
		now text-string of death-counter is "[kill count of current-creature]";
		deactivate the card-occluder;
		now the animation-callback of the card-fader is "";
		animate the card-fader track as a fade animation targeting the card-container and using the Black-Fader from 100 % to 0 % at 8 fps with a duration of 6 frames;
		wait for main menu input until all animations are complete;
		pause for 4000 milliseconds, accepting input;
		animate the card-fader track as a fade animation targeting the card-container and using the Black-Fader from 0 % to 100 % at 8 fps with a duration of 6 frames;
		now the animation-callback of the card-fader is "[@ activate the card-occluder]";
		wait for main menu input until all animations are complete.
		
To decide what number is vertical-offset of (F - figure-name):
	if F provides the property y-offset:
		decide on y-offset of F;
	decide on 0.


Section - Preparing menu display

To prepare type slugs:
	if the file of save data exists:
		activate Continue_Game;
	otherwise:
		deactivate Continue_Game;
	if difficulty is 0:
		activate Skip_Button;
	otherwise:
		deactivate Skip_Button.

To prepare difficulty levels for display:
	now the image-ID of Difficulty-slug is the proper slug for the difficulty;
	now entry 1 of the origin of current-difficulty is 144 + (image-width of the image-ID of Difficulty-slug);
	now the text-string of current-difficulty is "([difficulty])";
	let best-level be data value 3;
	now the image-ID of Best-Difficulty-slug is the the proper slug for best-level;
	now entry 1 of the origin of highest-difficulty is 416 + (image-width of the image-ID of Best-Difficulty-slug);
	now the text-string of highest-difficulty is "([best-level])";
	now the text-string of total-victories is "[data value 1]";

To decide which figure name is the proper slug for (n - a number):
	if n is 0:
		decide on Figure of Diff-Novice;
	if n is 1: 
		decide on Figure of Diff-Apprentice;
	if n is 2: 
		decide on Figure of Diff-Adept;
	if n is 3: 
		decide on Figure of Diff-Expert;
	if n is 4: 
		decide on Figure of Diff-Master;
	if n is 5: 
		decide on Figure of Diff-Grandmaster;
	if n is 6:
		if player is female: 
			decide on Figure of Diff-Princess; 
		decide on Figure of Diff-Prince;
	if n is 7: 
		if player is female: 
			decide on Figure of Diff-Queen;
		decide on Figure of Diff-King;
	if n is 8: 
		if player is female: 
			decide on Figure of Diff-Empress;
		decide on Figure of Diff-Emperor;
	if n is 9:
		decide on Figure of Diff-Demon;
	if n is 10:
		decide on Figure of Diff-Angel;
	if n is greater than 10:
		if player is female: 
			decide on Figure of Diff-Goddess;
		decide on Figure of Diff-God;
	decide on Figure of Diff-Novice.


Section - Preparing monster cards

A person has a figure-name called the card. The card of a person is usually Figure of Null.

The card of Miranda is figure of card-Miranda.
The card of the swarm of daggers is figure of card-Daggers.
The card of the ravenous armadillo is figure of card-Armadillo.
The card of the chain golem is figure of card-Chain_Golem.
The card of the mindslug is the figure of card-Mindslug.
The card of the reaper is the figure of card-Reaper.
The card of the giant tentacle is the figure of card-Tentacle.
[placeholders]
The card of Malygris is the figure of card_Malygris.
The card of Bodmall is the figure of card_Bodmall.
The card of the healer of Aite is figure of card_Fanatics-of-Aite.
The card of the minotaur is figure of card_Minotaur.
The card of the hound is figure of card_Hound.
The card of the demon of rage is figure of card_Demon-of-Rage.
The card of the blood ape is figure of card_Blood-Ape.
The card of the jumping bomb is figure of card_Jumping-Bomb.
The card of the wisps of pain is figure of card_Wisps-of-Pain.

The monster-card queue is a list of people variable.

To prepare monster cards:
	now the monster-card queue is {};
	repeat with villain running through npc people:
		if the level of villain > 0 and the level of villain < 6 and the died count of villain > 0:
			add villain to monster-card queue;
	sort monster-card queue in level order.


Chapter - Input to main menu

Event-handled is a truth state variable.

To wait for main menu input until all animations are complete:
	while animation is queued and menu-active is true:[We don't want any new animations to start if our input is moving us out of the main menu]
		cancel character input in the main-window;
		request character input in the main-window;
		now event-handled is false;
		wait for glk input;
		if the current glk event is glk-initiated or the current glk event is mouse-event or the current glk event is char-event:
			let event-outcome be glk event handled in null-event context;
			if event-handled is true:	
				break.

To move on from main menu, deactivating it:
	now event-handled is true;
	now menu-active is false;
	unless deactivating it:
		now redraw-menu is true.

Glulx character input rule when the graphics-window is g-present (this is the graphical menu keyboard input rule):
	if the showing the title screen activity is going on:
		let key be the character code returned;
		#if utilizing animation debugging;
		say "[>console][CA]Key pressed ([key]).[<]";
		#end if;
		if key means continue or key means new game:
			if file of save data exists and key means new game:
				follow the graphlink processing rules for New_Game;
			otherwise unless file of save data exists:
				follow the graphlink processing rules for New_Game;
			otherwise:
				follow the graphlink processing rules for Continue_Game;
		if key means show help menu:
			follow the graphlink processing rules for Help_Button;
		if key means show options:
			follow the graphlink processing rules for Options_Button;
		if key means quit game:
			follow the graphlink processing rules for Quit_Game;
		if key means skip novice mode and difficulty is 0:
			follow the graphlink processing rules for Skip_Button;
		if key means show score info tooltip:
			follow the graphlink processing rules for ScoreInfo_Button.


Section - Key codes

To decide whether (keypress - a number) means continue:
	if keypress is 32 or keypress is 67 or keypress is 99 or keypress is -6:
		decide yes.
	
To decide whether (keypress - a number) means new game[N(ew) or space]:
	if keypress is 78 or keypress is 110, decide yes.

To decide whether (keypress - a number) means show options:[O(ptions)]
	if keypress is 79 or keypress is 111, decide yes.
	
To decide whether (keypress - a number) means show help menu:[H(elp) or M(enu)]
	if keypress is 72 or keypress is 104 or keypress is 77 or keypress is 109, decide yes.
	
To decide whether (keypress - a number) means quit game:[Q(uit)]
	if keypress is 81 or keypress is 113, decide yes.
	
To decide whether (keypress - a number) means skip novice mode:[S(kip)]
	if keypress is 83 or keypress is 115 and difficulty is 0, decide yes.

To decide whether (keypress - a number) means show score info tooltip:[(I)nfo]
	if keypress is 73 or keypress is 105, decide yes.
	
[To decide whether (keypress - a number) means reset victories:[R(eset)]
	if keypress is 82 or keypress is 114, decide yes.

To decide whether (keypress - a number) means unlock all content:[U(nlock)]
	if keypress is 85 or keypress is 117 and (data value 4) is not 100, decide yes.]


Section - Graphic links

Graphlink processing rule for New_Game:
	cease animating all tracks but the button-press track;
	menu-start new game;
	move on from main menu, deactivating it.
	
Graphlink processing rule for Continue_Game:
	cease animating all tracks but the button-press track;
	move on from main menu, deactivating it.
	
Graphlink processing rule for Quit_Game:
	cease animating all tracks but the button-press track;
	now menu-active is false;
	menu-quit game.

Graphlink processing rule for Options_Button:
	cease animating all tracks but the button-press track;
	menu-request options menu;
	move on from main menu.

Graphlink processing rule for Help_Button:
	cease animating all tracks but the button-press track;
	menu-request help menu;
	move on from main menu.

Graphlink processing rule for Skip_Button:
	menu-skip novice;
	animate the button-fade track as a fade animation targeting the Skip_Button and using the Black-fader from 0 percent to 100 percent at 8 fps with a duration of 3 frames.

The button-fade track is an animation track. The animation-callback is "[@ process visuals after skipping difficulty]".

To process visuals after skipping difficulty:
	deactivate the animation-target of the button-fade track;
	prepare difficulty levels for display;
	prepare type slugs.

Section - Visual button response
[We use visual button response for both keypresses and for clicks: keyboard input triggers the graphlink rules for the appropriate button.]

The button-press track is an animation track.

Animation rule for the button-press track:
	let depressed be the animation-target of the button-press track;
	if the current-frame of the button-press track is:
		-- 1: now the image-ID of the depressed is the depressed state of the depressed;
		-- 3: now the image-ID of the depressed is the resting state of the depressed;
	if the depressed is ScoreInfo_Button and current-frame of the button-press track is 3:
		if the display status of the Score-Tip is g-inactive:
			activate the Score-Tip;
		otherwise:
			deactivate the Score-Tip.
			
First graphlink processing rule for a button (called the depressed):
	now the animation-target of the button-press track is the depressed;
	animate the button-press track as a custom animation at 8 fps with a duration of 3 frames.


Section - Tooltips

A tooltip is a kind of sprite. The associated canvas of a tooltip is the main-menu. The display-layer of a tooltip is 10000. The display status of a tooltip is g-inactive. Some tooltips are defined by the Table of Tool-Tips.

Table of Tool-Tips
sprite	image-ID	origin
Score-Tip	Figure of Tooltip-Score	{343, 474}[482]


Chapter - Closing the title screen

The window-fading track is an animation track. The animation-callback of the window-fading track is "[@ now the associated canvas of the graphics-window is the g-null-canvas]".
The music-fading track is an animation track. The animation-callback of the music-fading track is "[@ stop background channel]".

To close title screen:
	open up the graphics-window;[window may be closed.]
	cease animating all tracks but the button-press track;[allows the button-press animation to complete];
	repeat with tip running through tooltips:
		deactivate tip;[turn off all tooltips]
	cancel character input in the main-window;[just in case we're somehow waiting for input]
	now the display-layer of the black-fader is 10001;[need to put fader above transition container to fade out whole menu]
	let fade-length be 6;
	if menu-active is false:
		now fade-length is the maximum sound volume;
	animate the window-fading track as a fade animation targeting the graphics-window and using the Black-Fader from 0 % to 100 % at 8 fps with a duration of (fade-length) frames;
	[if menu-active is false:[fade out music only if we're leaving menu for good.]
		animate the music-fading track as a custom animation at 8 fps with a duration of (fade-length) frames;][****]
	delay input until all animations are complete;
	now the display-layer of the black-fader is 9999;
	shut down the graphics-window;
	[open the status window.]
	
To cease animating all tracks but (target - an animation track):
	repeat with track running through animation-active animation tracks:
		if track is not target:
			deactivate track.

Animation rule for the music-fading track:
	decrement the volume of the background;
	set simple volume for background channel to volume of background.


Chapter - Sound

The maximum sound volume is a number variable. The maximum sound volume is 10.

A sound-channel is a kind of thing.
A sound-channel has a number called the ref-number. 
A sound-channel has a number called the volume. The volume of a sound-channel is usually 10.

Foreground and background are sound-channels.

To play the theme music:
	set up sound channels;
	[play sound of Persian in background channel, looping.][****]

To say resource number of (S - a sound name):
	(- print ResourceIDsOfSounds-->{S} ; -).

To set up sound channels:
	repeat with item running through sound-channels:
		now the ref-number of item is the internal number of item.

To decide what number is internal number of (foreground - a sound-channel):
	(- gg_foregroundchan -);

To decide what number is internal number of (background - a sound-channel):
	(- gg_backgroundchan -);

To play (sound - a sound-name) in (channel - a sound-channel) channel, looping, with notification:
	(- SoundPlay(ResourceIDsOfSounds-->{sound},{channel},{phrase options}); -)

To set simple volume for (channel - a sound-channel) channel to (volume - a number):
	(- SetVolume({channel},{volume}); -)

To stop (channel - a sound-channel) channel:
	(- SoundCease({channel}); -)


Include (- 

[ SoundPlay sound chan loop notify;
	if (glk_gestalt(gestalt_Sound,0)) {
		glk_schannel_play_ext(chan.ref_number,sound,0-loop,notify); 
	}
];

[ SetVolume chan vol;
	if (glk_gestalt(gestalt_SoundVolume,0)) {
		if ((vol <= (+ maximum sound volume +)) && (vol > 0)) {
			glk_schannel_set_volume(chan.ref_number, (vol * (65535 / (+ maximum sound volume +)))+1);
		}
		else {
			glk_schannel_set_volume(chan.ref_number, 0);
		}
	}
];

[ SoundCease chan;
	if (glk_gestalt(gestalt_Sound,0)) {
		glk_schannel_stop(chan.ref_number);
	}
];

-) after "Figures.i6t".


Chapter - The map window
[The map is available even if the player has indicated that he doesn't want main menu graphics. There is no reason to disable it, since a player can always choose whether she wants it. It is of course not available if there are no graphics at all.

The map window is modal--the game can't be played while the window is open, and the game text is not visible.]

The map-window is a graphics g-window spawned by the main-window. The position is g-placebelow. The measurement is 100. The back-colour is g-black. The arbitrary scaling factor is 1.0000. The map-window is g-graphlinked.

The map-canvas is a g-canvas. The associated canvas of the map-window is the map-canvas.

Table of Common Color Values (continued)
glulx color value	assigned number
g-deep-blue	10846
g-sky-blue	12444924[#bde4fc]


After constructing the map-window (this is the prevent drawing the map window on opening rule):
	rule succeeds.

The start looking for graphlinks rule is listed before the prevent drawing the map window on opening rule in the after constructing rules.


Section - Command to show the map

Showing the map is an action out of world. Understand "map" and "show the/-- map" and "m" as showing the map.

Check showing the map:
	unless the map can be shown:
		say "Your interpreter does not offer full graphics support, so the map is not available. Try using the REMEMBER command (R for short). Here it is:[paragraph break][input-style-for-glulx]>REMEMBER[roman type][line break]";
		try remembering instead.

Carry out showing the map:
	follow the dungeon extent calculation rules;
	close the status window;
	close side windows;
	set the Gargoyle background color to the color g-black;
	open up the map-window;
	follow the glulx arranging rules;
	while true is true:
		let keystroke be the character code entered in the main-window;
		if the display status of the left_arrow is g-active:
			if keystroke is -2[left arrow]:
				scroll map west;
				next;
			if keystroke is -3[right arrow]:
				scroll map east;
				next;
		if the display status of the up_arrow is g-active:
			if keystroke is -4[up arrow]:
				scroll map north;
				next;
			if keystroke is -5[down arrow]:
				scroll map south;
				next;
		break.

To scroll map (dir - direction):
	if dir is north[up arrow]:
		now scroll-offset-y of the map-renderer is scroll-offset-y of the map-renderer + map-tile-height;
	if dir is south[down arrow]:
		now scroll-offset-y of the map-renderer is scroll-offset-y of the map-renderer - map-tile-height;
	if dir is east[right arrow]:
		now scroll-offset-x of the map-renderer is scroll-offset-x of the map-renderer - map-tile-width;
	if dir is west[left arrow]:
		now scroll-offset-x of the map-renderer is scroll-offset-x of the map-renderer + map-tile-width;
	if scroll-offset-x of the map-renderer is greater than max-scroll-offset-x of the map-renderer:
		now scroll-offset-x of the map-renderer is max-scroll-offset-x of the map-renderer;
	if the scroll-offset-x of the map-renderer is less than (0 - the max-scroll-offset-x of the map-renderer):
		now scroll-offset-x of the map-renderer is (0 - max-scroll-offset-x of the map-renderer);
	if scroll-offset-y of the map-renderer is greater than max-scroll-offset-y of the map-renderer:
		now scroll-offset-y of the map-renderer is max-scroll-offset-y of the map-renderer;
	if the scroll-offset-y of the map-renderer is less than (0 - the max-scroll-offset-y of the map-renderer):
		now scroll-offset-y of the map-renderer is (0 - max-scroll-offset-y of the map-renderer);
	follow the window-drawing rules for the map-window.

Report showing the map:
	shut down the map-window;
	set the Gargoyle background color to the color g-white;
	open side windows;
	open the status window;
	if there is a display-inactive size-sensitive g-element[i.e., if we have had to hide any of the UI elements, the map window was too small]:
		say "[bracket]The window was too small to show the map comfortably. Try increasing the size of your game window.[close bracket][line break]";
	say "Map consulted.";
	


Section - Calculating the size of the dungeon

The ordered dungeon manifest is a list of rooms variable.

The dungeon extent calculation rules are a rulebook.

A dungeon extent calculation rule (this is the basic dungeon extent rule):
	calculate the extent of the dungeon;
	order the manifest of dungeon rooms;
	#if utilizing Glimmr debugging;
	say "[>console]Kerkerkruip: Dungeon extent:[line break]x: [Extent-minimum-x] / [Extent-maximum-x][line break]y: [Extent-minimum-y] / [Extent-maximum-y][line break]z: [Extent-minimum-z] / [Extent-maximum-z].[<]";
	#end if;
		
To order the manifest of dungeon rooms:
	now the ordered dungeon manifest is {};
	repeat with z running from extent-maximum-z down to extent-minimum-z:
		repeat with x running from extent-maximum-x down to extent-minimum-x:
			repeat with y running from extent-minimum-y to extent-maximum-y:
				repeat with place running through map-ready rooms:
					if x-coordinate of place is x and y-coordinate of place is y and z-coordinate of place is z:
						add place to the ordered dungeon manifest.

To repeat with (loopvar - nonexisting K variable)
	running from (v - arithmetic value of kind K) down to (w - K) begin -- end
	(documented at ph_repeat):
		(- for ( {loopvar}={v}: {loopvar}>={w}: {loopvar}-- )  -).


Section - Scaling rule for the map window

Map-tile-width is a number variable. Map-tile-width is usually 32.
Map-tile-height is a number variable. Map-tile-height is usually 16.

For scaling the map-window (this is the resize canvas to map viewport rule):
	now the canvas-width of the map-canvas is the width of the map-window;
	now the canvas-height of the map-canvas is the height of the map-window;
	#if utilizing Glimmr debugging;
	say "[>console]Kerkerkruip: Scaling the map-canvas to [canvas-width of the map-canvas] x [canvas-height of the map-canvas].[<]";
	#end if;
	continue the action.


Section - Drawing rule for the map object

The map-renderer is a g-element. The associated canvas is the map-canvas. The graphlink status of the map-renderer is usually g-active. The display-layer is 1.

[The map-offset is a number, dynamically set, that allows us to center the map in the window.]
The map-renderer has a number called map-offset-x.
The map-renderer has a number called map-offset-y.
[The scroll-offset is a number that allows us to adjust the placement of the map in response to player input.]
The map-renderer has a number called scroll-offset-x.
The map-renderer has a number called scroll-offset-y.
[The max-scroll-offset is the maximum the map can scroll in any direction.]
The map-renderer has a number called max-scroll-offset-x.
The map-renderer has a number called max-scroll-offset-y.
[The width and height of the map are stored each time the map is displayed. They will mostly be useful for applying effects to the finished map.]
The map-renderer has a number called map-width.
The map-renderer has a number called map-height.
[Now, local coordinate min-max for the map as whole. (Local in the sense that it doesn't take account of the offsets needed to center in the window, or to scroll the map using keys.)]
The map-renderer has a number called map-min-x.
The map-renderer has a number called map-max-x.
The map-renderer has a number called map-min-y.
The map-renderer has a number called map-max-y.

[The z-shift is changed as the map is drawn--we use it to increase screen-y to place each successive floor beneath the floor above.]
The map-renderer has a number called z-shift.

[The level-y-adjustment is the amount that we need to subtract from the vertical offset for each level of the dungeon. This ensures that levels do not contain empty vertical space above the drawing.]
The map-renderer has a number called level-y-adjustment.

The map-renderer has a table name called the avatar-table.

The enemies list is a list of people variable.

To reset the scrolling offsets:
	now the scroll-offset-x of the map-renderer is 0;
	now the scroll-offset-y of the map-renderer is 0;
	now the max-scroll-offset-x of the map-renderer is 0;
	now the max-scroll-offset-y of the map-renderer is 0.

An element display rule for the map-renderer (this is the map display rule):
[In the room coordinates, the y-coordinate refers to west-east, whereas y in the screen model is top-bottom, so the room coordinates must be swapped between x and y. The x-axis must also be reversed for drawing, since it increases in the wrong direction vis-a-vis the screen model.]
	let x-adjust be (0 - extent-minimum-x) + 1;[These numbers will allow us to transform the coordinates so that each starts with 1]
	let y-adjust be (0 - extent-minimum-y) + 1;
	let z-adjust be (0 - extent-minimum-z) + 1;
	calculate the per-level extents of the map using adjustments x-adjust and y-adjust and z-adjust;
	now map-offset-x of the map-renderer is ((width of the map-window - legend-width of the map-legend) / 2) - (map-max-x of the map-renderer - ((map-max-x of the map-renderer - map-min-x of the map-renderer) / 2)) + scroll-offset-x of the map-renderer;
	now map-offset-y of the map-renderer is (height of the map-window / 2) - (map-height  of the map-renderer / 2) + scroll-offset-y of the map-renderer;
	compensate for small map window;
	set up the map keyboard instructions;
	let z be map-offset-y of the map-renderer;
	repeat with index running from the number of entries of the level-specific y-extents down to 1:
		if entry (index) of the level-specific y-extents is {}:
			display the image Figure of map_ellipsis in map-window at (((width of the map-window - legend-width of the map-legend) / 2) - (image-width of Figure of map_ellipsis / 2)) by ((z - map-tile-height) - (image-height of Figure of map_ellipsis / 2));
		otherwise:
			now z is z + (map-tile-height * 2) + (entry 2 of entry index of the level-specific y-extents - entry 1 of entry index of the level-specific y-extents);
	[let z be 0;
	repeat with index running from the number of entries of the level-specific y-extents down to 1:			
		let x1 be (map-offset-x of the map-renderer - ((map-max-x of the map-renderer - map-min-x of the map-renderer) / 2)) - 20;
		let x2 be (map-offset-x of the map-renderer + (map-max-x of the map-renderer - map-min-x of the map-renderer)) + 20;
		draw a rectangle (11316396[40% gray]) in the map-window at x1 by (map-offset-y of the map-renderer + z)  with dimensions 10 by 1;
		draw a rectangle (11316396[40% gray]) in the map-window at (x2 - 10) by (map-offset-y of the map-renderer + z)  with dimensions 10 by 1;
		if entry (index) of the level-specific y-extents is not {}:
			let y be (entry 2 of entry index of the level-specific y-extents - entry 1 of entry index of the level-specific y-extents);
			draw a rectangle (11316396[40% gray]) in the map-window at x1 by (map-offset-y of the map-renderer + z)  with dimensions 1 by y;
			draw a rectangle (11316396[40% gray]) in the map-window at x1 by (map-offset-y of the map-renderer + z + y)  with dimensions 10 by 1;
			draw a rectangle (11316396[40% gray]) in the map-window at x2 by (map-offset-y of the map-renderer + z)  with dimensions 1 by y;
			draw a rectangle (11316396[40% gray]) in the map-window at (x2 - 10) by (map-offset-y of the map-renderer + z + y)  with dimensions 10 by 1;
		now z is z + (map-tile-height * 2) + (entry 2 of entry index of the level-specific y-extents - entry 1 of entry index of the level-specific y-extents);
	say "level-specific y-extents: [level-specific y-extents].";]
	now z-shift of the map-renderer is 0;
	let z-stage be (z-coordinate of entry 1 of the ordered dungeon manifest + z-adjust);
	[++++++++++First we place backgrounds only.]
	repeat with place running through ordered dungeon manifest:
		if z-coordinate of place + z-adjust is less than z-stage:
			now z-shift of map-renderer is z-shift of the map-renderer + (map-tile-height * 2) + (entry 2 of entry z-stage of the level-specific y-extents - entry 1 of entry z-stage of the level-specific y-extents);
			[say "z-shift: [z-shift of the map-renderer] (z-stage: [z-stage]).";]
			now z-stage is z-coordinate of place + z-adjust;
		if map-background of place is Figure of Null and place is not location:
			next;
		let grid-x be the grid coordinate for y-coordinate of place with adjustment y-adjust and maximum (extent-maximum-y + y-adjust);
		let grid-y be the grid coordinate for x-coordinate of place with adjustment x-adjust and maximum (extent-maximum-x + x-adjust), reversed;
		now level-y-adjustment of the map-renderer is entry 1 of entry z-stage of the level-specific y-extents;
		let y-coord be screen-y coordinate for (grid-x - 1) and (grid-y + 1);
		if place is the location:
			if place is not tunnel-drawn:
				display the image (figure of map_room_background_current_location) in map-window at (screen-x coordinate for (grid-x - 1) and (grid-y + 1)) - 7 by y-coord - 7;
			otherwise:
				draw tunnel for place using Figure of map_tunnel_background_current_location at grid-x by grid-y with offsets -7 and -7;
		if (place is visited or place is map-revealed) and map-background of place is not figure of null:
			if map-background of place provides the property y-offset:
				now y-coord is y-coord - y-offset of map-background of place;
			display the image (map-background of place) in map-window at screen-x coordinate for (grid-x - 1) and (grid-y + 1) by y-coord;
	[++++++++++Reset z and go through again, this time to render rooms.]
	now z-shift of the map-renderer is 0;
	let z-stage be (z-coordinate of entry 1 of the ordered dungeon manifest + z-adjust);
	repeat with place running through ordered dungeon manifest:
		let grid-x be the grid coordinate for y-coordinate of place with adjustment y-adjust and maximum (extent-maximum-y + y-adjust);
		let grid-y be the grid coordinate for x-coordinate of place with adjustment x-adjust and maximum (extent-maximum-x + x-adjust), reversed;
		if z-coordinate of place + z-adjust is less than z-stage:
			now z-shift of map-renderer is z-shift of the map-renderer + (map-tile-height * 2) + (entry 2 of entry z-stage of the level-specific y-extents - entry 1 of entry z-stage of the level-specific y-extents);
			[say "z-shift: [z-shift of the map-renderer] (z-stage: [z-stage]).";]
			now z-stage is z-coordinate of place + z-adjust;
		now level-y-adjustment of the map-renderer is entry 1 of entry z-stage of the level-specific y-extents;
		now the enemies list is {};
		if place is visited or place is enemy-revealed:
			repeat with adversary running through the persons in place:
				if adversary is not the player and (the last-seen-location of the adversary is place or place is enemy-revealed):
					add adversary to the enemies list;
		if place is visited or place is map-revealed or place is enemy-revealed:
			if place is visited or place is map-revealed:
				#if utilizing Glimmr debugging;
				say "[>console]Kerkerkruip: Drawing [place] at ([grid-x],[grid-y],[grid coordinate for z-coordinate of place with adjustment z-adjust and maximum (extent-maximum-z + z-adjust)]).[<]";
				#end if;
				if the room north of place is unvisited not nogo:
					display the image Figure of map_tile in map-window at screen-x coordinate for (grid-x + 1) and (grid-y - 1) by screen-y coordinate for (grid-x + 1) and (grid-y - 1);
				if the room west of place is unvisited not nogo:
					display the image Figure of map_tile in map-window at screen-x coordinate for (grid-x - 1) and (grid-y + 1) by screen-y coordinate for (grid-x - 1) and (grid-y + 1);
				let y-coord be screen-y coordinate for (grid-x - 1) and (grid-y + 1);
				if place is not tunnel-drawn:
					display the image (appropriate graphic for place) in map-window at screen-x coordinate for (grid-x - 1) and (grid-y + 1) by y-coord;
				otherwise:
					draw tunnel for place using Figure of map_tile at grid-x by grid-y with offsets 0 and 0;
				if the room east of place is a not nogo room:
					display the image Figure of map_tile in map-window at screen-x coordinate for (grid-x + 3) and (grid-y + 1) by screen-y coordinate for (grid-x + 3) and (grid-y + 1);
				if the room south of place is a not nogo room:
					display the image Figure of map_tile in map-window at screen-x coordinate for (grid-x + 1) and (grid-y + 3) by screen-y coordinate for (grid-x + 1) and (grid-y + 3);
			if the number of entries of the enemies list is greater than 0 and (place is visited or place is enemy-revealed):
				if place is tunnel-drawn:
					now the avatar-table of the map-renderer is the Table of Tunnel Avatar Placements;
				otherwise:
					now the avatar-table of the map-renderer is the Table of Avatar Placements;
				let base-row be 1;
				repeat with adversary running through enemies list:
					repeat with count running from base-row to the number of rows in the avatar-table of the map-renderer:
						choose row (count) in the avatar-table of the map-renderer;
						if place is tunnel-drawn and count is less than 5 and the room (placement entry) of place is not a not nogo room:[if we're looking at the cardinal directions for the first time and we see one that leads somewhere, we have a tunnel tile and should put a monster there--otherwise move on.]
							next;
						if place is tunnel-drawn and count is greater than 4 and count is less than 9 and the room (placement entry) of place is a not nogo room:[If we are looking at the cardinal directions for the second time, that means that all tunnel tiles in the room boundaries have been filled, so we need to skip any tunnel tile to avoid doubling up.]
							next;
						display image (avatar of adversary) in map-window at (screen-x coordinate for (grid-x + x-off entry) and (grid-y + y-off entry)) + (map-tile-width / 9) by (screen-y coordinate for (grid-x + x-off entry) and (grid-y + y-off entry)) - (map-tile-height / 8);
						now base-row is count + 1;
						if base-row is greater than the number of rows in the avatar-table:
							now base-row is 1;
						break;
			if place is visited and place is not a tunnel:
				display the image (map-label of place) in map-window at (screen-x coordinate for (grid-x + 2) and (grid-y )) + (map-tile-width / 10) by (screen-y coordinate for (grid-x + 2) and (grid-y)) + (map-tile-height / 8).

Table of Tunnel Avatar Placements
placement (an object)	x-off (a number)	y-off (a number)
south	1	2
west	0	1
north	1	0
east	2	1
south	1	2
west	0	1
north	1	0
east	2	1
southwest	0	2
northwest	0	0
southeast	2	2
northeast	2	0
east[far]	3	1
south[far]	1	3
west[far]	-1	1
north[far]	1	-1



Table of Avatar Placements
placement (an object)	x-off (a number)	y-off (a number)
southwest	0	2
northwest	0	0
southeast	2	2
south	1	2
west	0	1
north	1	0
east	2	1
east[far]	3	1
south[far]	1	3
west[far]	-1	1
north[far]	1	-1


To draw tunnel for (place - room) using (img - figure name) at (grid-x - number) by (grid-y - number) with offsets (x - number) and (y - number):
	if img is not Figure of map_tile and map-background of place is not figure of null:
		display the image Figure of map_room_background_current_location in map-window at ((screen-x coordinate for (grid-x - 1) and (grid-y + 1)) + x) by ((screen-y coordinate for (grid-x - 1) and (grid-y + 1)) + y);
		rule succeeds;
	if the room north of place is a not nogo room:
		display the image (img) in map-window at ((screen-x coordinate for (grid-x + 1) and (grid-y)) + x) by ((screen-y coordinate for (grid-x + 1) and (grid-y)) + y);
	if the room west of place is a not nogo room:
		display the image (img) in map-window at ((screen-x coordinate for (grid-x) and (grid-y + 1)) + x) by ((screen-y coordinate for (grid-x) and (grid-y + 1)) + y);
	if img is Figure of map_tile:
		display the image (appropriate graphic for place) in map-window at screen-x coordinate for (grid-x - 1) and (grid-y + 1) by ((screen-y coordinate for (grid-x - 1) and (grid-y + 1)) + y);
	otherwise:
		display the image (img) in map-window at ((screen-x coordinate for (grid-x + 1) and (grid-y + 1)) + x) by ((screen-y coordinate for (grid-x + 1) and (grid-y + 1)) + y);
	if the room east of place is a not nogo room:
		display the image (img) in map-window at ((screen-x coordinate for (grid-x + 2) and (grid-y + 1)) + x) by ((screen-y coordinate for (grid-x + 2) and (grid-y + 1)) + y);
	if the room south of place is a not nogo room:
		display the image (img) in map-window at ((screen-x coordinate for (grid-x + 1) and (grid-y + 2)) + x) by ((screen-y coordinate for (grid-x + 1) and (grid-y + 2)) + y).

The level-specific x-extents are a list of lists of numbers variable.
The level-specific y-extents are a list of lists of numbers variable.

To calculate the per-level extents of the map using adjustments (x-adjust - number) and (y-adjust - number) and (z-adjust - number):
	now the level-specific x-extents are {};
	now the level-specific y-extents are {};
	now the map-width of the map-renderer is -100000;
	now the map-height of the map-renderer is -100000;
	now the map-min-x of the map-renderer is 100000;
	now the map-max-x of the map-renderer is -100000;
	now the map-min-y of the map-renderer is 100000;
	now the map-max-y of the map-renderer is -100000;
	[say "Manifest: [ordered dungeon manifest in brace notation].";]
	repeat with z-track running from 1 to (z-coordinate of entry 1 of the ordered dungeon manifest + z-adjust):
		let min-x be 100000;
		let min-y be 100000;
		let max-x be -100000;
		let max-y be -100000;
		let x be 0;
		let y be 0;
		add {{ }} to level-specific x-extents;
		add {{ }} to level-specific y-extents;
		repeat with place running through the ordered dungeon manifest:
			if (z-coordinate of place + z-adjust) is z-track:
				[the dungeon's x-y coordinates are reversed from the screen coordinates, so we swap them here for ease]
				let grid-x be the grid coordinate for y-coordinate of place with adjustment y-adjust and maximum (extent-maximum-y + y-adjust);
				let grid-y be the grid coordinate for x-coordinate of place with adjustment x-adjust and maximum (extent-maximum-x + x-adjust), reversed;
				[say "[Place]: [y-coordinate of place], [x-coordinate of place].";]
				now x is ((grid-x - 1) * (map-tile-width / 2)) - ((grid-y + 1) * (map-tile-width / 2));
				[say "Calculating x: (([grid-x](x) - 1) * [map-tile-width / 2]) - (([grid-y](y) + 1) * [map-tile-width / 2]) = [x].";]
				if x is less than min-x:
					now min-x is x;
				if x + (map-tile-width * 3) is greater than max-x:
					now max-x is x + (map-tile-width * 3);
				now y is ((grid-y + 1) * (map-tile-height / 2)) + ((grid-x - 1) * (map-tile-height / 2));
				[say "Calculating y: (([grid-y](y) + 1) * [map-tile-height / 2]) + (([grid-x](x) - 1) * [map-tile-height / 2]) = [y].";]
				if y is less than min-y:
					now min-y is y;
				if y + (map-tile-height * 3) is greater than max-y:
					now max-y is y + (map-tile-height * 3);
		if min-x is not 100000:
			add min-x to entry (z-track) of level-specific x-extents;
			add max-x to entry (z-track) of level-specific x-extents;
			add min-y to entry (z-track) of level-specific y-extents;
			add max-y to entry (z-track) of level-specific y-extents;
			if min-x is less than map-min-x of the map-renderer:
				now map-min-x of the map-renderer is min-x;
			if max-x is greater than map-max-x of the map-renderer:
				now map-max-x of the map-renderer is max-x;
			if ABS (max-x - min-x) is greater than map-width of map-renderer:
				now map-width of map-renderer is ABS (max-x - min-x);
	let y be 0;
	repeat with level running through the level-specific y-extents:
		if level is not {}:
			now y is y + ABS (entry 2 of level - entry 1 of level);
	now map-height of the map-renderer is y + (((z-coordinate of entry 1 of the ordered dungeon manifest + z-adjust) - 1) * (map-tile-height * 2));
	[say "x-extents: [level-specific x-extents in brace notation].";
	say "y-extents: [level-specific y-extents in brace notation].";
	say "map width: [map-width of map-renderer].";
	say "map height: [map-height of map-renderer].";]

To decide what number is grid coordinate for (coord - a number) with adjustment (adjust - a number) and maximum (max - a number), reversed:
	let n be coord + adjust;
	if reversed:
		decide on (((0 - n) + max) * 4) + 1;
	otherwise:
		decide on ((n - 1) * 4) + 1.

To decide what number is screen-x coordinate for (x-coord - a number) and (y-coord - a number):
	decide on map-offset-x of the map-renderer + (x-coord * (map-tile-width / 2)) - (y-coord * (map-tile-width / 2)).

To decide what number is screen-y coordinate for (x-coord - a number) and (y-coord - a number):
	decide on (map-offset-y of the map-renderer - level-y-adjustment of the map-renderer) + z-shift of the map-renderer + (y-coord * (map-tile-height / 2)) + (x-coord * (map-tile-height / 2)).

To decide what figure name is the appropriate graphic for (place - room):
	if place is not visited and place is not map-revealed:
		decide on Figure of Null;
	if place is the Lake of Lava:
		decide on Figure of map_room_lava;
	if the room up from place is a not nogo room and the room down from place is a not nogo room:
		if place is tunnel-drawn:
			decide on Figure of map_tunnel_stairs_up_down;
		decide on Figure of map_room_stairs_up_down;
	if room up from place is a not nogo room:
		if place is tunnel-drawn:
			decide on Figure of map_tunnel_stairs_up;
		decide on Figure of map_room_stairs_up;
	if room down from place is a not nogo room:
		if place is tunnel-drawn:
			decide on Figure of map_tunnel_stairs_down;
		 decide on Figure of map_room_stairs_down;
	if place is tunnel-drawn:
		decide on Figure of map_tunnel;
	decide on Figure of map_room.


Section - Small Map Window
[If the map window is too small, we hide some elements to make it maximally useful.]

A g-element can be size-sensitive. A g-element is usually not size-sensitive.

To compensate for small map window:
	if the width of the map-window is less than 690:
		repeat with item running through size-sensitive g-elements:
			deactivate the item;
	otherwise:
		repeat with item running through size-sensitive g-elements:
			activate the item.


Section - Map Title

The map-title is a sprite. The associated canvas is the map-canvas. The origin is {25, 10}. The image-ID is Figure of map_text_title. The display-layer is 10. The map-title is size-sensitive.


Section - Compass rose

The map-compass-rose is a sprite. The associated canvas is the map-canvas. The origin is {15, 10}. The image-ID is Figure of map_text_compass_rose. The display-layer is 10. The map-compass-rose is size-sensitive.

First element scaling rule for the map-compass-rose (this is the position compass rose at bottom of screen rule):
	now entry 2 of the origin of the map-compass-rose is (height of the map-window - 66).

The position compass rose at bottom of screen rule is listed first in the element scaling rules.


Section - Keyboard instructions

The map-keyboard-instructions are a sprite. The associated canvas is the map-canvas. The origin is {0, 0}. The image-ID is Figure of map_text_arrow_keys. The display-layer is 10. The map-keyboard-instructions are center-aligned.


Section - Scroll buttons
[Scroll buttons are not quite like the buttons on the main menu--they don't have a depressed state, and they are shown as either active or inactive. So we define a new kind for them.]

A map-button is a kind of sprite. A map-button has a figure-name called the active state. A map-button has a figure-name called the inactive state.  A map-button has a number called the x-off. A map-button has a number called the y-off. The display status of a map-button is g-inactive. The associated canvas of a map-button is the map-canvas. The graphlink status of a map-button is g-active. The display-layer of a map-button is 11. 

Some map-buttons are defined by the Table of Arrow Buttons.

Table of Arrow Buttons
sprite	image-ID	active state	inactive state	x-off	y-off
down_arrow	Figure of map_button_down_arrow_active	Figure of map_button_down_arrow_active	Figure of map_button_down_arrow_inactive	124	11
left_arrow	Figure of map_button_left_arrow_active	Figure of map_button_left_arrow_active	Figure of map_button_left_arrow_inactive	109	-6
right_arrow	Figure of map_button_right_arrow_active	Figure of map_button_right_arrow_active	Figure of map_button_right_arrow_inactive	141	-5
up_arrow	Figure of map_button_up_arrow_active	Figure of map_button_up_arrow_active	Figure of map_button_up_arrow_inactive	124	-21


To set up the map keyboard instructions:
	now the image-ID of the map-keyboard-instructions is Figure of map_text_any_key;
	repeat with item running through map-buttons:
		now the image-ID of the item is the active state of the item;
		deactivate the item;
	if the map-width of the map-renderer is greater than (width of the map-window - legend-width of the map-legend) - map-tile-width:
		now the max-scroll-offset-x of the map-renderer is (map-tile-width * 3) + (((map-width of the map-renderer - (width of the map-window - legend-width of the map-legend)) / map-tile-width) * map-tile-width);
		now the image-ID of the map-keyboard-instructions is Figure of map_text_arrow_keys;
		activate the left_arrow;
		activate the right_arrow;
		if the scroll-offset-x of the map-renderer is greater than the max-scroll-offset-x of the map-renderer - 1:
			now the image-ID of the left_arrow is the inactive state of the left_arrow;
		if the scroll-offset-x of the map-renderer is less than (1 - the max-scroll-offset-x of the map-renderer):
			now the image-ID of the right_arrow is the inactive state of the right_arrow;
	if the map-height of the map-renderer is greater than (height of the map-window - 142):
		now the max-scroll-offset-y of the map-renderer is MAX (map-tile-height) or (map-height of the map-renderer - (height of the map-window - 142));
		now the image-ID of the map-keyboard-instructions is Figure of map_text_arrow_keys;
		activate the up_arrow;
		activate the down_arrow;
		if the scroll-offset-y of the map-renderer is greater than the max-scroll-offset-y of the map-renderer - 1:
			now the image-ID of the up_arrow is the inactive state of the up_arrow;
		if the scroll-offset-y of the map-renderer is less than (1 - the max-scroll-offset-y of the map-renderer):
			now the image-ID of the down_arrow is the inactive state of the down_arrow;
	let horizontal center be (width of the map-window - legend-width of the map-legend) / 2;
	let vertical anchor be the height of the map-window - 42;
	now entry 1 of the origin of the map-keyboard-instructions is the horizontal center;
	now entry 2 of the origin of the map-keyboard-instructions is the vertical anchor;
	if the image-ID of the map-keyboard-instructions is Figure of map_text_arrow_keys:
		repeat with item running through map-buttons:
			now entry 1 of the origin of the item is the horizontal center + the x-off of the item;
			now entry 2 of the origin of the item is the vertical anchor + the y-off of the item.


Section - Graphic links for scrolling

Graphlink processing rule for up_arrow:
	scroll map north.

Graphlink processing rule for down_arrow:
	scroll map south.

Graphlink processing rule for right_arrow:
	scroll map east.

Graphlink processing rule for left_arrow:
	scroll map west.


Section - Map Legend

The map-legend is a g-element. The associated canvas is the map-canvas. The display-layer is 2.

The map-legend has a number called the legend-width. The legend-width is 250.

An element display rule for the map-legend (this is the map legend display rule):
	draw a rectangle (11316396[40% gray]) in the map-window at (width of the map-window - legend-width of the map-legend) by 0 with dimensions legend-width of the map-legend by (height of the map-window);
	draw a rectangle (6447714[70% gray]) in the map-window at (width of the map-window - legend-width of the map-legend) by 0 with dimensions 2 by (height of the map-window);
	let x be (width of the map-window - legend-width of the map-legend) + 10;
	let y be 93;
	display Figure of map_text_legend_title in the map-window at ((x - 10) + (legend-width of the map-legend / 2) - (image-width of Figure of map_text_legend_title / 2)) by (y - 90);
	repeat with villain running through alive seen not off-stage persons:
		unless the villain is the player:
			display the legend-label of the villain in the map-window at x by y;
			increase y by the image-height of the legend-label of the villain plus 0;
	unless the number of dead persons is 0:
		if the number of alive seen not off-stage persons is greater than 0 and y is less than (height of map-window / 2):
			increase y by 12;
		repeat with villain running through dead seen persons:
			let offset be the image-height of the legend-label of the villain / 2;
			display the legend-label of the villain in the map-window at x by y;
			draw a rectangle (15461355[10% gray]) in map-window from x by (y + offset) to (x + image-width of the legend-label of the villain) by (y + offset) + 1;
			increase y by the image-height of the legend-label of the villain plus 0.


Section - Map window redraw

A glulx redrawing rule when the map-window is g-present (this is the reset map scrolling offsets on forced redraw rule):
	reset the scrolling offsets;
	compensate for small map window;
	set up the map keyboard instructions;
	continue the action.

A glulx arranging rule when the map-window is g-present (this is the reset map scrolling offsets on window arranging rule):
	reset the scrolling offsets;
	compensate for small map window;
	set up the map keyboard instructions;
	continue the action.


Section - Test command for map window (for use with Extended Debugging by Erik Temple)

Revealing the entire map is an action out of world. Understand "reveal map" or "reveal full map" or "full map" as revealing the entire map.

Carry out revealing the entire map:
	now all placed not nogo rooms are map-revealed;
	now all placed not nogo rooms are visited;
	now all placed not nogo rooms are enemy-revealed;
	now all alive not off-stage persons are seen;
	if the eternal prison is not placed, now the nameless horror is not seen;
	try showing the map.


Section - Testing for map assets (for use with Extended Debugging by Erik Temple)

Last when play begins:
	repeat with place running through rooms:
		if place is not a tunnel and place is placeable:
			if place provides the property map-label:
				if the map-label of place is Figure of Null:
					say "[place] has no map label image.";
			otherwise:
				say "[place] does not provide the map-label property. Check to be sure that it will be labeled properly on the map.";
	repeat with villain running through persons:
		if villain is not the player:
			if villain provides the property avatar:
				if the avatar of villain is Figure of Null:
					say "[villain] has no avatar image.";
			otherwise:
				say "[villain] does not provide the avatar property. Check to be sure that it will be labeled properly on the map.";
			if villain provides the property legend-label:
				if the legend-label of villain is Figure of Null:
					say "[villain] has no legend label image.";
			otherwise:
				say "[villain] does not provide the legend-label property. Check to be sure that it will be labeled properly in the map legend."


Kerkerkruip Glimmr Additions ends here.

---- DOCUMENTATION ----

Summary of menu graphic elements and their z-ordering:

	##Canvases
	opening-canvas
	title-screen
	main-menu

	##Sprites
	title-container (1)
	transition-container (10,000) - needs to float above fader
	card-container (1)

	##Buttons (3)
	Continue_Game
	Help_Button
	New_Game
	Options_Button
	Quit_Game
	ScoreInfo_Button
	Skip_Button

	##Slugs (3)
	Score-slug
	Difficulty-slug
	Best-Difficulty-slug
	-- monster cards only --
	slug-Card-stats (2)

	##Strings (3)
	command-container
	current-difficulty
	highest-difficulty
	total-victories
	-- monster cards only --
	kill-counter (4)
	death-counter (4)

	##Primitives
	card-occluder (9,998)

	##Tooltips (10,000) - tooltips float above everything else
	Score-Tip

	##Fader
	9,999 (default)
