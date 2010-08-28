I am a single state within a cyclic graph of states.  My values are edges leading to another state in the graph.  If the edge has an action associated with it then I perform the method of that name in my client object, passing the object which stepped me as argument, before following the edge.

Structure:
 name		Symbol				-- my state's name
 keys		Object				-- the input tokens that cause me to step
 values		#(Symbol1 Symbol2)	-- an edge: the next state and a client action selector
 default		#(Symbol1 Symbol2)	-- the edge I follow if no key matches the stepping object

I am intended to be inserted somewhere in the middle of a LayeredProtocol stack.