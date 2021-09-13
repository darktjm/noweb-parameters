#!/bin/sh
cd test
for x in *.nw; do
  echo ${x}:
  notangle -filter ../nt-parm $x 2>/dev/null | diff -u - ${x%.nw}.out
  ( notangle -filter ../nt-parm $x >/dev/null) 2>&1 | diff -u - ${x%.nw}.err
  ../noroots-parm $x 2>/dev/null | diff -u - ${x%.nw}.roots
  noweave -filter ../nw-parm-preidx -index -filter ../nw-parm-postidx $x \
       2>/dev/null | diff -u - ${x%.nw}.tex
done
