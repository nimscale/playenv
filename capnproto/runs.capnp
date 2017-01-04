@0xc95b52bf39888c77;


struct Run {
    #this object is hosted by actor based on FQDN

    #which step is running right now, can only move to next one if previous one was completed
    currentStep @0: UInt16;

    #FQDN of a specific actor which can run multiple jobs & orchestrate work
    aysControllerFQDN @1 :Text;

    steps @2 :List(RunStep);
    struct RunStep {
      epoch @0: UInt32;
      state @1 :State;
      # number of the step in the run
      number @2 :UInt32;
      #list of jobs which need to be executed, key alone is enough to fetch the job info
      jobs @3 :List(Job);
      struct Job {
          key @0 :Text;

          #NEXT IS CACHED INFO, THE MAIN SOURCE OF NEXT INFO IS IN Job
          #BUT is good practice will make all run very much faster& allow fast vizualization
          #e.g. node.ssh
          actorName @1 :Text;
          #name e.g. install
          actionName @2 :Text;
          #name of service run by actor e.g. myhost
          serviceName @3 :Text;

          serviceKey @4:Text;
      }
    }

    #state of run in general
    state @3 :State;
    enum State {
        new @0;
        running @1;
        ok @2;
        error @3;
    }

    lastModDate @4: UInt32;

    #key of repo where run is created
    repo @5 :Text;
}
