snapshot
startUp: resuming
	"We're coming back from snapshot and quit.  Close any connections that were left open in the snapshot."

	(resuming and: [InstanceList notEmpty])
		ifTrue: [InstanceList do: [ :sock | sock close]]