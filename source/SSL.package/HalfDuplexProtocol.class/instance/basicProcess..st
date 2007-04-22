protocol
basicProcess: data

	self link notNil
		ifTrue: [ self link process: data].
