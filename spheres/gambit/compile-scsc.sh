#!/usr/bin/env sh
cd scsc
if test -e syntax-case.o1; then rm syntax-case.o1; fi
gsi -f boot.scm
gsc -f -e "(parameterize ((current-readtable (readtable-sharing-allowed?-set (current-readtable) 'serialize))) (compile-file \"syntax-case\" cc-options: \"-ftrack-macro-expansion=0 -save-temps -D___SINGLE_HOST -D___OPTIMIZE_SPACE -O0\"))"
cp syntax-case.o1 ..
