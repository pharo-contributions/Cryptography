protocol
transitionEvent: anEvent with: anObject

	currentState := (currentState transitionAt: anEvent)
		transitionFrom: currentState for: client with: anObject