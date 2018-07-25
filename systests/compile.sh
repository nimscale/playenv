# nim c -r test.nim --debugger:native
export NAME=test_process
nim c --debuginfo --linedir:on $NAME.nim
./$NAME
rm -f $NAME