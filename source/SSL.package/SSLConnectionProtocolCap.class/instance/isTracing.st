accessing
isTracing
	"Answer the value of isTracing"

	isTracing isNil ifTrue: [self isTracing: false].
	^ isTracing