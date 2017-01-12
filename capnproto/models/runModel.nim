import capnp, capnp/gensupport, collections/iface

# file: runs.capnp

type
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


