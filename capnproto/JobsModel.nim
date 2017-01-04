import db
import JobModel

type
  JobsDB = ref object
    db*: db.MemDB

proc initDB*(): db.MemDB =
    var memdb=db.create()
    db.init(memdb, "mytable",
         """
         Name  VARCHAR(200) NOT NULL,
         i     INT(11),
         f     DECIMAL(18,10)
         """, @["descr","name"])

proc newJobsDB*(): JobsDB  =
    #return a jobs db
    let jobs = new(JobsDB)
    jobs.db=initDB()
    result = jobs

proc newJob*(): Job  =
    let p = new(Job)
    result = p

proc saveJob*(jobs:JobsDB,job:Job) =
    #save the job in the jobsdb
    jobs.db

proc index*(jobs:JobsDB,job:Job) =
    jobs.db
