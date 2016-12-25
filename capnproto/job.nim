import JobsModel, capnp
# import nimscale.nsyaml
import json

let p = new(Job)
p.actorName="this is a test"
p.actionName="sasa"

let llog=new(Job_LogEntry)
llog.epoch=2323
llog.log="alog message"
p.logs = @[]
p.logs.add llog

# let packed = packPointer(p)
# # echo packed.repr
#
# let unpacker = newUnpackerFlat(packed)
# let res = unpacker.unpackPointer(0, Job)
#
#
# let value=[1,2]
# let res2 = nsyaml.dumps(value)
#
# echo res2
#

# proc `$`(node: JsonNode): string {..}

var body = ""
let jsb = %* p

echo pretty(jsb,indent=2 )
