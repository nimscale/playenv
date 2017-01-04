set -ex
capnp compile -onim jobs.capnp > jobModelGen.nim
capnp compile -onim actions.capnp > actionModelGen.nim
capnp compile -onim runs.capnp > runModelGen.nim
