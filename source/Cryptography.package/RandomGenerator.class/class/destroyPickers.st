initialize-release
destroyPickers
	self withAllSubclassesDo: 
		[ : each | 
		(each instVarNamed: 'picker') ifNotNilDo: [ : thePicker | thePicker destroy ].
		each 
			instVarNamed: 'picker'
			put: nil ]