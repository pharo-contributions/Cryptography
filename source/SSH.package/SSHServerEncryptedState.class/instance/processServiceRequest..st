process
processServiceRequest: msg

	| acceptMsg pipe upConn |
	pipe := SSHUserAuthPipe new.
	upConn := self connection connection.
	self connection connection: pipe.
	pipe transportCap: self connection.
	pipe socket: upConn.
	upConn connPipe: pipe.
	acceptMsg := SSHServiceAcceptMessage new
		serviceName: msg serviceName;
		yourself.
	self machine sendMsg: acceptMsg.
	^ false