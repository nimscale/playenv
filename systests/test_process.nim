import osproc
import streams

var p = startProcess("python3", options={poStdErrToStdOut,poEvalCommand,poUsePath,poInteractive})

# echo(p.peekExitCode())#will print -1 if no exit yet

echo(p.running())
echo 1

var i = p.inputStream()
i.flush()
i.write("print(1)\n")
echo 2

#BLOCKS HERE, Don't know why
echo p.hasData()
echo 3

var line=""

var s = p.outputStream()
if not isNil(s):
    while s.readLine(line):
      echo line
    s.close()