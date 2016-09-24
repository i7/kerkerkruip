#!/bin/sh

if [ ! -f Kerkerkruip.gblorb -o ! -f COMMIT ]
then
  if git status --porcelain | egrep -q "^\s*M "
  then
    [ -f Kerkerkruip.gblorb ] && rm Kerkerkruip.gblorb
    echo "Modified files are present. Commit first."
    exit 1
  fi
  COMMIT=$(git log --pretty=format:"%h" HEAD^!)
  echo "$COMMIT" >COMMIT
  echo "Building Kerkerkruip commit $COMMIT..."
  pushd ..
  make Kerkerkruip.gblorb
  MAKE_RESULT=$?
  popd
  if [ $MAKE_RESULT -ne 0 ]
  then
    #TODO: make this actually work
    echo "make failed."
  fi
  cp ../Kerkerkruip.gblorb Kerkerkruip.gblorb
fi
