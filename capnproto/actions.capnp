@0xc95b52bf39888c7d;


#is one specific piece of code which can be executed
#is owned by a ACTOR_TEMPLATE specified by actor_name e.g. node.ssh
#this is used to know which code was executed and what exactly the code was
struct Action {

  #name of the method e.g. install
  name @0 :Text;

  actorName @1 :Text;

  code @2 :Text;

  lastModDate @3: UInt32;

  args @4 :Text;

  #documentation string in markdown of the action
  doc @5 :Text;

  #is optional, could be e.g. sourcefile+linenr
  origin @6 :Text;

  #unique key for this capnp obj
  key @7 :Text;

  debug @8: Bool;

  #modules to import
  imports @9 :List(Text);

  log @10: Bool;

  logStdout @11: Bool;

  remember @12: Bool;

  language @13 :Language;
  enum Language {
      python @0;
      lua @1;
  }

  #is optional, capnp schema of arguments for this method
  capnpIn @14 : Text;
  #is optional, capnp schema of result for this method
  capnpOut @15 : Text;

}
