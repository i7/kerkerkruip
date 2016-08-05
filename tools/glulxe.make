# A makefile to download and compile glulxe

# Default to running multiple jobs
JOBS := $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)
MAKEFLAGS = "-j $(JOBS)"

CURL = curl -L -s -S

# Mark which rules are not actually generating files
.PHONY: all clean

all: dumb-glulxe

clean:
	$(RM) -r cheapglk dumb-glulxe glulxe

cheapglk:
	$(CURL) -o "cheapglk.tar.gz" https://github.com/erkyrath/cheapglk/archive/master.tar.gz
	tar xf cheapglk.tar.gz
	mv cheapglk-master cheapglk
	rm cheapglk.tar.gz

glulxe:
	$(CURL) -o "glulxe.tar.gz" https://github.com/erkyrath/glulxe/archive/master.tar.gz
	tar xf glulxe.tar.gz
	mv glulxe-master glulxe
	rm glulxe.tar.gz

cheapglk/Make.cheapglk: cheapglk
	$(MAKE) -C cheapglk

dumb-glulxe: cheapglk/Make.cheapglk glulxe
	$(MAKE) -C glulxe
	cp glulxe/glulxe dumb-glulxe
