Kerkerkruip Glimmr Additions by Erik Temple begins here.

Use authorial modesty.

Include Glulx Status Window Control by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Canvas Animation by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
[Include Glimmr Debugging Console by Erik Temple.

Use animation debugging.

To say >console:
	say echo stream of main-window.

To say <:
 	say stream of main-window;
	say run paragraph on.
	
First when play begins:
	Try switching the story transcript on.]


Chapter - Graphics
[Still to do here: Add a question before the title screen: "Do you want graphics? (Graphics are not compatible with screen readers.)" This would appear only for first-time players, and would only be shown if the interpreter supports graphics. We save the decision into the data table.]

Title-graphics is a truth state variable.

Rule for starting the virtual machine (this is the graphics support rule):
	[This rule will change to also check whether the player has made a choice about graphics, i.e. whether data value 5 exists. We'll probably need to move it to a new rulebook.]
	if glulx graphics is supported and glulx graphic-window mouse input is supported and glulx timekeeping is supported and glulx PNG transparency is supported:
		now title-graphics is true.


Chapter - Set up the graphics window
[We don't want to see the main text window at all until the game proper begins. Strictly speaking, we should probably hack the Inform library to allow for this--but that is not a minor undertaking. Instead, we will simply open the graphics window so that it covers the main text window entirely (note the 100 measurement below--this indicates that the graphics window will be split off from the main window at 100% of the latter's height). The Glulx Status Window Control extension suppresses the opening of the status window; we will open it later, only after closing the graphics window.]

The graphics-window is a graphics g-window spawned by the main-window. The position of the graphics-window is g-placeabove. The measurement of the graphics-window is 100. The back-colour of the graphics-window is g-black. The graphics-window is g-graphlinked.


Chapter - Animation code support

Section - Easy delays
[This code allows us to trigger a delay using a short phrase ("pause for ### milliseconds"), implementing the delay using the "temporalizing" animation preset: a single frame is requested, "displaying" for the number of milliseconds given. While this is intended solely to pause the game for a given amount of time and makes no change to the display, it does result in an extra--and strictly unnecessary--refresh of the graphics window. This causes no performance issues in practice, but is probably worth mentioning.]

The pause track is an animation track.

To pause for (T - number) milliseconds/ms:
	animate the pause track as a temporalizing animation at T ms per frame with a duration of 1 frame;
	delay input until all animations are complete.


Chapter - Basic graphic title screen rule

For showing the title screen when title-graphics is true (this is the graphic title screen rule):
	open up the graphics-window;
	clear the main-window;
	display animated titles.


Chapter - Main title

To display animated titles:
	show a minimovie;[will later have a test to determine whether a movie should be shown--we only display the movie and title on the first game in a given play session. Subsequent restarts will return directly to the main menu.]
	show the title;
	shut down the graphics-window;
	open the status window.


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
	delay input until all animations are complete.
	

Animation rule for the command-movie:
	let cur-frame be the current-frame of the command-movie;
	if cur-frame - 3 is greater than 0:
		if the remainder after dividing (cur-frame - 3) by 2 is 0:
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

The main-menu is a g-canvas. The canvas-width is 660. The canvas-height is 718.

The title-container is a sprite. It is center-aligned. The origin is {330, 359}. The associated canvas is the main-menu.

To show the title:
	now the associated canvas of the graphics-window is the main-menu;
	animate the title-animation as a reel animation targeting the title-container at 8 fps;
	delay input until all animations are complete.


Chapter - Assets

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
Figure of title_00040 is the file "title_00040.jpg".


Chapter - Mini-movies

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


Kerkerkruip Glimmr Additions ends here.
