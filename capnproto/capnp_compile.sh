set -ex
cd models
capnp compile -onim jobs.capnp > jobModel.nim
capnp compile -onim actions.capnp > actionModel.nim
capnp compile -onim runs.capnp > runModel.nim
cd ..


#make sure capnp tool is installed
#brew install capnp
#to make sure that capnpc-nim exists
#ln -s ~/.nimble/bin/capnpc ~/.nimble/bin/capnpc-nim
