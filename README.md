Kerkerkruip
===========

http://kerkerkruip.org

Kerkerkruip is a short-form roguelike in the interactive fiction medium, featuring meaningful tactical and strategic depth, innovative game play, zero grinding, and a sword & sorcery setting that does not rehash tired clichés.

Setting up Kerkerkruip for development
--------------------------------------

After cloning the Kerkerkruip Git repository onto your computer you will need to do a few more things to prepare your system for developing it.

1. You will need to download a few extensions. Please check the [i7/extensions repository](https://github.com/i7/extensions), the [Inform 7 Public Library](http://www.emshort.com/pl/payloads/) and the old [Inform 7 extensions site](http://inform7.com/write/extensions/) for any missing extensions. Copy them to your Inform 7 extensions folder.
2. Run this script from the top folder of your Kerkerkruip working directory:
```
./tools/setup
```

Beta-testing Kerkerkruip
------------------------

If you just want to help beta-test Kerkerkruip you don't need to do that. We use [Travis CI](https://travis-ci.org/i7/kerkerkruip) to automatically build each commit. You will soon be able to download a beta-testing file here.

[![Build Status](https://travis-ci.org/i7/kerkerkruip.svg?branch=master)](https://travis-ci.org/i7/kerkerkruip)
