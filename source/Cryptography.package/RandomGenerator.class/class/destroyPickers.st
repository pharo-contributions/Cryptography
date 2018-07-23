initialize-release
destroyPickers
	self withAllSubclassesDo: 
		[ : each | 
		(each instVarNamed: 'picker') ifNotNil: [ : thePicker | thePicker destroy ].
		each 
			instVarNamed: 'picker'
			put: nil ]