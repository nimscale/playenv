# nim c -r test.nim --debugger:native
nim c --debuginfo --linedir:on test2.nim
lldb test2 -o 'b test2.nim:4' -o run
# rm -f test