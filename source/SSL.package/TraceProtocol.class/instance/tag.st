accessing
tag
	"Answer the value of tag"

	tag isNil ifTrue: [tag := 'trace'].
	^ tag