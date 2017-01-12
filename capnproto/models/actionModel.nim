import capnp, capnp/gensupport, collections/iface

# file: actions.capnp

type
  Action* = ref object
    name*: string
    actorName*: string
    code*: string
    lastModDate*: uint32
    args*: string
    doc*: string
    origin*: string
    key*: string
    debug*: bool
    imports*: seq[string]
    log*: bool
    logStdout*: bool
    remember*: bool
    language*: Action_Language
    capnpIn*: string
    capnpOut*: string

  Action_Language* {.pure.} = enum
    python = 0, lua = 1



makeStructCoders(Action, [
  (lastModDate, 0, 0, true),
  (language, 6, Action_Language(0), true)
  ], [
  (name, 0, PointerFlag.text, true),
  (actorName, 1, PointerFlag.text, true),
  (code, 2, PointerFlag.text, true),
  (args, 3, PointerFlag.text, true),
  (doc, 4, PointerFlag.text, true),
  (origin, 5, PointerFlag.text, true),
  (key, 6, PointerFlag.text, true),
  (imports, 7, PointerFlag.text, true),
  (capnpIn, 8, PointerFlag.text, true),
  (capnpOut, 9, PointerFlag.text, true)
  ], [
  (debug, 32, false, true),
  (log, 33, false, true),
  (logStdout, 34, false, true),
  (remember, 35, false, true)
  ])


