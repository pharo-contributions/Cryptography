accessing
nextFrom: start to: end
	"Answer a random integer between start and end."
	| r |
	r := self nextInt: end-start+1.
	^ r+start-1