code generation
methodHeader

	^'processBuffer: x withState: h

	| a b c d |
	self var: #x type: ''unsigned int*''.
	self var: #h type: ''unsigned int*''.
	self var: #a type: ''unsigned int''.
	self var: #b type: ''unsigned int''.
	self var: #c type: ''unsigned int''.
	self var: #d type: ''unsigned int''.
	a := h at: 0.
	b := h at: 1.
	c := h at: 2.
	d := h at: 3.'