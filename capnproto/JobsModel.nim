import nimscale.memsqlite as memsqlite
import models.JobModel as model

type
  JobsDB = ref object
    index*: memsqlite.MemDB

proc initDB*(): MemDB =
    var memdb= memsqlite.create()
    memsqlite.init(memdb, "mytable",
         """
         Name  VARCHAR(200) NOT NULL,
         i     INT(11),
         f     DECIMAL(18,10)
         """, @["descr","name"])

proc newJobsDB*(): JobsDB  =
    #return a jobs db
    let db = new(JobsDB)
    db.index=initDB()
    result = db


proc newJob*(): Job  =
    let obj = new(Job)
    result = obj

proc saveJob*(jobs:JobsDB,job:model.Job) =
    #save the job in the jobsdb
    jobs.db


# proc index*(jobs:JobsDB,job:Job) =
#     jobs.db
