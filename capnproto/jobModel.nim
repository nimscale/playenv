import capnp, capnp/gensupport, collections/iface
import db

type
  Job* = ref object of RootObj
    runKey*: string
    actorName*: string
    actionName*: string
    actorFQDN*: string
    serviceName*: string
    # actionKey*: string
    # stateChanges*: seq[Job_StateChange]
    # logs*: seq[Job_LogEntry]
    # repoKey*: string
    # serviceKey*: string
    # argsData*: string
    args*: string
    state*: Job_State
    result*: string
    lastModDate*: uint32
    simulate*: bool
    debug*: bool
    profile*: bool
    profileData*: string

  Job_StateChange* = ref object
    epoch*: uint32
    state*: Job_State

  Job_LogEntry* = ref object
    epoch*: uint32
    log*: string
    level*: int8
    category*: Job_LogEntry_Cat
    tags*: string

  Job_LogEntry_Cat* {.pure.} = enum
    `out` = 0, err = 1, msg = 2, alert = 3, errormsg = 4, trace = 5

  Job_State* {.pure.} = enum
    new = 0, running = 1, ok = 2, error = 3

  Jobs = ref object
    db*: db.MemDB

#MY ADDED ITEMS


# proc test*(s: string): int  =





makeStructCoders(Job, [
  (state, 0, Job_State(0), true),
  (lastModDate, 4, 0, true)
  ], [
  (runKey, 0, PointerFlag.text, true),
  (actorName, 1, PointerFlag.text, true),
  (actionName, 2, PointerFlag.text, true),
  (actorFQDN, 3, PointerFlag.text, true),
  (serviceName, 4, PointerFlag.text, true),
  (actionKey, 5, PointerFlag.text, true),
  (stateChanges, 6, PointerFlag.none, true),
  (logs, 7, PointerFlag.none, true),
  (repoKey, 8, PointerFlag.text, true),
  (serviceKey, 9, PointerFlag.text, true),
  (argsData, 10, PointerFlag.none, true),
  (args, 11, PointerFlag.none, true),
  (result, 12, PointerFlag.none, true),
  (profileData, 13, PointerFlag.none, true)
  ], [
  (simulate, 16, false, true),
  (debug, 17, false, true),
  (profile, 18, false, true)
  ])

makeStructCoders(Job_StateChange, [
  (epoch, 0, 0, true),
  (state, 4, Job_State(0), true)
  ], [], [])

makeStructCoders(Job_LogEntry, [
  (epoch, 0, 0, true),
  (level, 4, 0, true),
  (category, 6, Job_LogEntry_Cat(0), true)
  ], [
  (log, 0, PointerFlag.text, true),
  (tags, 1, PointerFlag.text, true)
  ], [])
