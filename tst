#!/bin/sh
cd test
for x in *.nw; do
  echo ${x}:
  notangle -filter ../nt-parm $x 2>/dev/null | diff - ${x%.nw}.out
  ( notangle -filter ../nt-parm $x >/dev/null) 2>&1 | diff - ${x%.nw}.err
done
