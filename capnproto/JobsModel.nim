import capnp, capnp/gensupport, collections/iface

# file: jobs.capnp

type
  Job* = ref object
    runKey*: string
    actorName*: string
    actionName*: string
    actorFQDN*: string
    serviceName*: string
    actionKey*: string
    stateChanges*: seq[Job_StateChange]
    logs*: seq[Job_LogEntry]
    repoKey*: string
    serviceKey*: string
    argsData*: string
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

  Run* = ref object
    currentStep*: uint16
    aysControllerFQDN*: string
    steps*: seq[Run_RunStep]
    state*: Run_State
    lastModDate*: uint32
    repo*: string

  Run_RunStep* = ref object
    epoch*: uint32
    state*: Run_State
    number*: uint32
    jobs*: seq[Run_RunStep_Job]

  Run_RunStep_Job* = ref object
    key*: string
    actorName*: string
    actionName*: string
    serviceName*: string
    serviceKey*: string

  Run_State* {.pure.} = enum
    new = 0, running = 1, ok = 2, error = 3



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

makeStructCoders(Run, [
  (currentStep, 0, 0, true),
  (state, 2, Run_State(0), true),
  (lastModDate, 4, 0, true)
  ], [
  (aysControllerFQDN, 0, PointerFlag.text, true),
  (steps, 1, PointerFlag.none, true),
  (repo, 2, PointerFlag.text, true)
  ], [])

makeStructCoders(Run_RunStep, [
  (epoch, 0, 0, true),
  (state, 4, Run_State(0), true),
  (number, 8, 0, true)
  ], [
  (jobs, 0, PointerFlag.none, true)
  ], [])

makeStructCoders(Run_RunStep_Job, [], [
  (key, 0, PointerFlag.text, true),
  (actorName, 1, PointerFlag.text, true),
  (actionName, 2, PointerFlag.text, true),
  (serviceName, 3, PointerFlag.text, true),
  (serviceKey, 4, PointerFlag.text, true)
  ], [])


