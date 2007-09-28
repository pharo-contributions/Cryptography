process
fromStream: stream

	super fromStream: stream.
	self userName: (self fromStringOnStream: stream).
	self serviceName: (self fromStringOnStream: stream).
	self methodName: (self fromStringOnStream: stream).
	self methodName = 'none'
		ifTrue: [^ self].
	self methodName = 'password'
		ifTrue: [
			self subMsg: (SSHUserAuthPasswordRequestSubMessage new fromStream: stream)].
