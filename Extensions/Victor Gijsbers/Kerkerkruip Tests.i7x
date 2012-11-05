Kerkerkruip Tests by Victor Gijsbers begins here.

Use authorial modesty.

[ Tests for various things ]

Chapter - Tests (not for release)

Section - Person IDs

Last when play begins (this is the check person IDs rule):
	repeat with X running through npc people:
		if the ID of X is 0:
			say "[X] does not have an ID.[line break]";
		otherwise:
			repeat with Y running through npc people:
				if X is not Y and the ID of X is the ID of Y:
					say "[X] has the same ID as [Y].[line break]";

Kerkerkruip Tests ends here.
