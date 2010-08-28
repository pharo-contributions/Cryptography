protocol
upcall: anObject

	currentState := (currentState transitionAt: anObject)
		transitionFrom: currentState for: client with: anObject