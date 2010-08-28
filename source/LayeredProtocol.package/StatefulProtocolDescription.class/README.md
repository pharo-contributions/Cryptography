I am a collection of ProtocolStates constituting a transition graph for a StatefulProtocol.  See my class side for some examples of how I construct state machine descriptions for you.

Note that before I can be used to drive a StatefulProtocol you *must* send me #compile.  I will answer the initial ProtocolState in the compiled transition graph.  (I will also complain if your protocol is broken. ;-)  You subsequently pass this ProtocolState as the argument to StatefulProtocol class>>initialState: in order to instantiate a new StatefulProtocol.

Structure:
 initialState		Symbol	-- the name of the initial (root) node in my transition graph