Kerkerkruip
===========

Kerkerkruip is a dungeon crawling game that brings together the interactive fiction medium with the roguelike genre. You take on the role of an adventurer in a randomly generated dungeon, whose only hope of escape is to destroy the mighty wizard Malygris. The game has been designed to offer a diverse array of meaningful tactical and strategical options, and combines the thrill of random combat with the skill of complex puzzle solving.

Setting up Kerkerkruip for development
--------------------------------------

After cloning the Kerkerkruip Git repository onto your computer you will need to do a few more things to prepare your system for developing it.

1. You will also need to clone the [ATTACK repository](https://github.com/i7/ATTACK)
2. Copy all the Inform 7 Extensions from both working directories to your own Inform 7 folder (in My Documents/Home etc)
3. Run this script from the top folder of your Kerkerkruip working directory:
```
./tools/setup
```

Using Inform 7 and Git
----------------------

Unfortunately Inform 7 doesn't currently play well with Git (though this will change in the future!) Although the Kerkerkruip.inform folder can be located anywhere, the many Extensions we use can only be found if they're in the user's own Inform 7 folder. So after cloning/pulling changes you will need to copy the files to your Inform 7 folder, and then copy them back before you commit your work.