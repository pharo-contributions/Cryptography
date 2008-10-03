snapshot
shutDown: quitting
	"We're about to snapshot and quit: shut down any open connections."

	InstanceList := InstanceList select: [ :sock | sock isConnected].
	(quitting and: [InstanceList notEmpty]) ifTrue:
		[(self confirm: (String streamContents: [ :str |
				str nextPutAll: 'Open network connections exist to the following hosts:'.
				InstanceList do: [ :sock | str cr; tab; nextPutAll: sock name].
				str cr; nextPutAll: 'Do you want to shut them down before quitting?']))
			ifTrue: [InstanceList do: [:sock | sock close]]]