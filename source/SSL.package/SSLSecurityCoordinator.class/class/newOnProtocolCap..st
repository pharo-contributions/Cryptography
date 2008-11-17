instance creation
newOnProtocolCap: cap
	"Transcript show: '{SSL-CREATED-SC: ' , self name , '}'."
	^ self new
		protocolCap: cap;
		yourself
