instance creation
newOnMachine: machine

	"Transcript show: '{SSL-CREATED-HS: ' , self name , '}'."
	^ self new
		initializeOnMachine: machine;
		yourself