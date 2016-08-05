# A makefile to download and compile git or glulxe

# Default to running multiple jobs
JOBS := $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)
MAKEFLAGS = "-j $(JOBS)"

CURL = curl -L -s -S

# Mark which rules are not actually generating files
.PHONY: all clean

all: dumb-git dumb-glulxe

clean:
	$(RM) -r cheapglk dumb-* git glulxe

cheapglk/Makefile:
	$(CURL) -o "cheapglk.tar.gz" https://github.com/erkyrath/cheapglk/archive/master.tar.gz
	tar xf cheapglk.tar.gz
	mv cheapglk-master cheapglk
	rm cheapglk.tar.gz

cheapglk/Make.cheapglk: cheapglk/Makefile
	$(MAKE) -C cheapglk

git:
	$(CURL) -o "Git.tar.gz" https://github.com/DavidKinder/Git/archive/master.tar.gz
	tar xf Git.tar.gz
	mv Git-master git
	rm Git.tar.gz
# gcc 5.4 needs the -lm option to be specified now
	sed -i '53s/.*/LIBS = -L$$(GLKLIBDIR) $$(GLKLIB) $$(LINKLIBS) -lm/' git/Makefile

glulxe:
	$(CURL) -o "glulxe.tar.gz" https://github.com/erkyrath/glulxe/archive/master.tar.gz
	tar xf glulxe.tar.gz
	mv glulxe-master glulxe
	rm glulxe.tar.gz

dumb-%: cheapglk/Make.cheapglk %
	$(MAKE) -C $*
	cp $*/$* dumb-$*
