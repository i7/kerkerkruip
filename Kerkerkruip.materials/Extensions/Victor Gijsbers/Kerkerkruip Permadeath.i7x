Kerkerkruip Permadeath (for Glulx only) by Victor Gijsbers begins here.

Use authorial modesty.

[ Note: This extension has been adapted from Erik Temple's Roguelike save & restore. See: http://www.intfiction.org/forum/viewtopic.php?f=7&t=2843 ]

Use undo prevention.



Section - Roguelike mode

Roguelike mode is a truth state variable. Roguelike mode is usually true.



Section - The save file

[ We mark save files with this property. ]
An external file can be save file.

The binary file of save data is called "KerkerkruipSaves".
The file of save data is a save file.



Section - Automatic save and restore

Automatic save boolean is a truth state that varies. Automatic save boolean is true.

Before reading a command when roguelike mode is true (this is the automatically save before input rule):
	write game data to the file of save data;
	continue the action.

After showing the title screen when roguelike mode is true (this is the restore if we have a savefile rule):
	if the file of save data exists:
		read file of save data into memory.



Section - Default messages

Restoring from a saved game is an activity.

For restoring from a saved game (this is the default roguelike restore rule):
	say "[bracket]Game successfully restored.[close bracket][line break]";
	try looking.



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



Section - Phrases for working with save files

[We take advantage of the existence of the I7 "external file" type to make declaring files easier, but we should only use saved game files with these three phrases; the built-in external file handling is not equipped to deal with them. If we didn't use the I7 type, we would need to declare the name the saved game file(s) in I6 using string arrays.]

To read (filename - save file external file) into memory:
	(- FileIO_LoadSavedGame({filename}); -).

To write game data to (filename - save file external file):
	(- FileIO_WriteSavedGame({filename}); -).

To delete (filename - save file external file):
	(- FileIO_DeleteSavedGame({filename}); -).

To decide if (filename - external file) exists:
	if filename is a save file:
		set filename as a save file;
	decide on whether or not filename exists part b;

To set (filename - external file) as a save file:
	(- FileIO_SetSaveFile( {filename} ); -).

To decide if (filename - external file) exists part b:
	(- (FileIO_Exists({filename}, false)) -).

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
	print "[Failed to restore existing game.]^^";
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
	if ( (+ Automatic save boolean +) )
	{
		print "[Could not save the game.]^^";
		(+ Automatic save boolean +) = 0;
	}
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
		{
			print "[Failed to delete the saved game. Please remove by hand.]^^";
		}
	}
	glk_fileref_destroy(fref);
];

[ FileIO_SetSaveFile extf struc;
	if ((extf < 1) || (extf > NO_EXTERNAL_FILES))
		return FileIO_Error(extf, "tried to access a non-file");
	struc = TableOfExternalFiles-->extf;
	struc-->AUXF_BINARY = struc-->AUXF_BINARY | 2;
];

-).

[ We will alter the built in if (external file) exists phrase so that we don't confuse matters with two similar phrases. ]
Include (-

[ FileIO_Exists extf fref struc rv usage;
	if ((extf < 1) || (extf > NO_EXTERNAL_FILES)) rfalse;
	struc = TableOfExternalFiles-->extf;
	if ((struc == 0) || (struc-->AUXF_MAGIC ~= AUXF_MAGIC_VALUE)) rfalse;
	if ( struc-->AUXF_BINARY )
	{
		usage = fileusage_BinaryMode;
	} else {
		usage = fileusage_TextMode;
	}
	if ( struc-->AUXF_BINARY & 2 == 2 )
	{
		usage = usage + fileusage_SavedGame;
	} else {
		usage = usage + fileusage_Data;
	}
	fref = glk_fileref_create_by_name( usage, Glulx_ChangeAnyToCString(struc-->AUXF_FILENAME), 0 );
	rv = glk_fileref_does_file_exist(fref);
	glk_fileref_destroy(fref);
	return rv;
];

-) instead of "Existence" in "FileIO.i6t".

Kerkerkruip Permadeath ends here.