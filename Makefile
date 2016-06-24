# Kerkerkruip makefile

# Some rules adapted from https://github.com/alerque/stack-verse-mapper/blob/master/Makefile
# (The only other makefile experience I've had)

# Default to running multiple jobs
JOBS := $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)
MAKEFLAGS = "-j $(JOBS)"

# Location of the project so we don't cross-wire relative paths.
BASE := $(shell cd "$(shell dirname $(lastword $(MAKEFILE_LIST)))/" && pwd)

CURL = curl -L -s -S

# Mark which rules are not actually generating files
.PHONY: all clean clean-setup setup

all: setup

clean: clean-setup
	$(RM) -r i7 Inform

# Setup the Inform 7 environment we need
setup: i7 Inform/Extensions

clean-setup:
	$(RM) *.gz *.zip
	$(RM) -r extensions-master inform7-6M62

# Download and install Inform 7
i7:
	$(CURL) -O http://inform7.com/download/content/6M62/I7_6M62_Linux_all.tar.gz
	tar -xzf I7_6M62_Linux_all.tar.gz
	cd inform7-6M62 && ./install-inform7.sh --prefix ../i7

# Download the extensions we need, pretending ~/Inform is in this directory
Inform/Extensions:
	mkdir -p Inform/Extensions
	$(CURL) -O https://github.com/i7/extensions/archive/master.zip
	unzip -o -q master.zip
	cp -R extensions-master/. Inform/Extensions/
	$(CURL) -o "Inform/Extensions/Aaron Reed/Numbered Disambiguation Choices.i7x" "http://www.emshort.com/pl/payloads/Aaron Reed/Numbered Disambiguation Choices.i7x"
