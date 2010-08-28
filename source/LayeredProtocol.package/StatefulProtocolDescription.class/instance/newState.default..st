initialize-release
newState: stateName default: transition

	^self at: stateName put: (ProtocolState name: stateName default: transition)