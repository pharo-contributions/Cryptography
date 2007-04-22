instance creation
newOnConnectionSecurityState: state

	^ self new
		connSecurityState: state;
		yourself