accessing
fieldStack
	"Answer the value of fieldStack"

	^ fieldStack ifNil: [fieldStack := Stack new].