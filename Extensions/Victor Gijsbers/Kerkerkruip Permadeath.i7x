Kerkerkruip Permadeath (for Glulx only) by Victor Gijsbers begins here.

Use authorial modesty.

[Note: This extension has been adapted from Erik Temple's Roguelike save & restore. See: http://www.intfiction.org/forum/viewtopic.php?f=7&t=2843]


Section - Roguelike mode

Roguelike mode is a truth state variable. Roguelike mode is usually true.


Section - Extensions to I7's external file system to cover saved games
[We take advantage of the existence of the I7 "external file" type to make declaring files easier, but we should only use saved game files with these three phrases; the built-in external file handling is not equipped to deal with them. If we didn't use the I7 type, we would need to declare the name the saved game file(s) in I6 using string arrays.]

To read (filename - external file) into memory:
	(- FileIO_LoadSavedGame({filename}); -).
	
To write game data to (filename - external file):
	(- FileIO_WriteSavedGame({filename}); -).
	
To decide whether (filename - external file) exists as a saved game:
	(- (FileIO_SavedGameExists({filename}, false)) -).

To delete (filename - external file):
	(- FileIO_DeleteSavedGame({filename}); -).
	

Section - File declaration

[Declare your own binary file like this:

The binary file of save data is called "savegame".]


Section - Automatic save and restore

Before reading a command when roguelike mode is true (this is the automatically save before input rule):
	write game data to the file of save data;
	continue the action.

When play begins when roguelike mode is true (this is the restore when play begins rule):
	if the file of save data exists as a saved game:
		read file of save data into memory.


Section - Activity declarations
[Reporting of successful and failed save/restore is handled by activities, in case we want to do more than simply print a message.]

Restoring from a saved game is an activity.
Failing to restore from a saved game is an activity.
Automatically saving the game is an activity.
Failing to automatically save the game is an activity.
Failing to delete a saved game is an activity.

Section - Default messages

Automatic save boolean is a truth state that varies. Automatic save boolean is true.

For restoring from a saved game (this is the default roguelike restore rule):
	say "[bracket]Game successfully restored.[close bracket][line break]";
	try looking.
	
For failing to restore from a saved game (this is the default roguelike restore failed rule):
	say "[bracket]Failed to restore existing game[close bracket][line break]".
	
For failing to automatically save the game (this is the default roguelike save failed rule):
	if automatic save boolean is true:
		say "[bracket]Could not save the game.[close bracket][line break]";
		now automatic save boolean is false.  [Because we don't want to hear this every time!]

For failing to delete a saved game (this is the default roguelike delete save failed rule):
	say "Failed to delete the saved game. Please remove by hand.".


Section - Blocking SAVE and RESTORE commands

Check saving the game when roguelike mode is true (this is the block saving rule):
	say "The game is saved and loaded automatically. There is no need to save it manually." instead.
	
Check restoring the game when roguelike mode is true (this is the block restore rule):
	say "The game is saved and loaded automatically. There is no need to restore your game manually." instead.


Section - Deleting the file when appropriate

After printing the player's obituary when roguelike mode is true (this is the delete save on finish rule):
	delete file of save data.

First carry out restarting the game (this is the delete save on restart rule):
	if roguelike mode is true:
		delete file of save data.


Section - I6 code for handling saved games

Include (-
	[ FileIO_LoadSavedGame extf struc fref res;
		if ((extf < 1) || (extf > NO_EXTERNAL_FILES))
			return FileIO_Error(extf, "tried to access a non-file");
		struc = TableOfExternalFiles-->extf;
		fref = glk_fileref_create_by_name(fileusage_SavedGame + fileusage_BinaryMode, Glulx_ChangeAnyToCString(struc-->AUXF_FILENAME), 0);
		if (fref == 0) jump RFailed;
		gg_savestr = glk_stream_open_file(fref, $02, GG_SAVESTR_ROCK);
		glk_fileref_destroy(fref);
		if (gg_savestr == 0) jump RFailed;
		@restore gg_savestr res;
		glk_stream_close(gg_savestr, 0);
		gg_savestr = 0;
		rtrue;
		.RFailed;
		CarryOutActivity( (+ failing to restore from a saved game +) );
	]; 
	
	[ FileIO_WriteSavedGame extf struc fref res;
		if (actor ~= player) rfalse;
		if ((extf < 1) || (extf > NO_EXTERNAL_FILES))
			return FileIO_Error(extf, "tried to access a non-file");
		struc = TableOfExternalFiles-->extf;
		fref = glk_fileref_create_by_name(fileusage_SavedGame + fileusage_BinaryMode, Glulx_ChangeAnyToCString(struc-->AUXF_FILENAME), 0);
		if (fref == 0) jump SFailed;
		gg_savestr = glk_stream_open_file(fref, $01, GG_SAVESTR_ROCK);
		glk_fileref_destroy(fref);
		if (gg_savestr == 0) jump SFailed;
		@save gg_savestr res;
		if (res == -1) {
			! The player actually just typed "restore". We have to recover all the Glk objects;
			! the values in our global variables are all wrong.
			GGRecoverObjects();
			glk_stream_close(gg_savestr, 0); ! stream_close
			gg_savestr = 0;
			CarryOutActivity( (+ restoring from a saved game +) );
			rtrue;
		}
		glk_stream_close(gg_savestr, 0); ! stream_close
		gg_savestr = 0;
		if (res == 0) rtrue;
		.SFailed;
		CarryOutActivity( (+ failing to automatically save the game  +) );
	];
	
[ FileIO_SavedGameExists extf  fref struc rv usage;
	if ((extf < 1) || (extf > NO_EXTERNAL_FILES)) rfalse;
	struc = TableOfExternalFiles-->extf;
	if ((struc == 0) || (struc-->AUXF_MAGIC ~= AUXF_MAGIC_VALUE)) rfalse;
	if (struc-->AUXF_BINARY) usage = fileusage_BinaryMode;
	else usage = fileusage_TextMode;
	fref = glk_fileref_create_by_name(fileusage_SavedGame + usage,
		Glulx_ChangeAnyToCString(struc-->AUXF_FILENAME), 0);
	rv = glk_fileref_does_file_exist(fref);
	glk_fileref_destroy(fref);
	return rv;
];

[ FileIO_DeleteSavedGame extf struc fref res;
	if ((extf < 1) || (extf > NO_EXTERNAL_FILES))
		return FileIO_Error(extf, "tried to access a non-file");
	struc = TableOfExternalFiles-->extf;
	fref = glk_fileref_create_by_name(fileusage_SavedGame + fileusage_BinaryMode, Glulx_ChangeAnyToCString(struc-->AUXF_FILENAME), 0);
	if (fref == 0) rfalse;
	if (glk_fileref_does_file_exist(fref)) {
		res = glk_fileref_delete_file(fref);
		if (res ~= 0)
			CarryOutActivity( (+ failing to delete a saved game +) ); 
	}
	glk_fileref_destroy(fref);
];
-).


Kerkerkruip Permadeath ends here.
