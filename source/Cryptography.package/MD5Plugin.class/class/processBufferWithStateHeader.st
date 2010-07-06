code generation
processBufferWithStateHeader

	^ 'processBuffer: buffer withState: state
	"This method is generated. See #compileMethods on the class side."
	
	| a b c d |
	self static: false.
	self var: #buffer type: #''unsigned int*''.
	self var: #state type: #''unsigned int*''.
	self var: #a type: #''unsigned int''.
	self var: #b type: #''unsigned int''.
	self var: #c type: #''unsigned int''.
	self var: #d type: #''unsigned int''.
	a := state at: 0.
	b := state at: 1.
	c := state at: 2.
	d := state at: 3.'