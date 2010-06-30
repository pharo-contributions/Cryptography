class list
selectedClass
	"Answer the class that is currently selected. Answer nil if no selection 
	exists."

	| name |
	(name := self selectedClassName) ifNil: [^ nil].
	"(envt := self selectedEnvironment) ifNil: [^ nil]."
	^ Smalltalk at: name