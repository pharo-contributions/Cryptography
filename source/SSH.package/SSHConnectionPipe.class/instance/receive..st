protocol
receive: msg

	Transcript 
		cr; 
		nextPutAll: self transportCap securityCoordinator endpointString;
		nextPutAll: '>>';
		nextPutAll: 'receiving... ';
		nextPutAll: msg asString;
		flush.
	msg type >= 80
		ifTrue: [msg process: self]
		ifFalse: [self error: 'bad msg number'].
