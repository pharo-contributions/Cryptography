protocol
processHandshakeFragment: fragment

	| stream msg |
	stream := fragment readStream.
	[stream atEnd]
		whileFalse: [
			self pendingHandshakeMsg notNil 
				ifTrue: [msg := self pendingHandshakeMsg appendFromStream: stream]
				ifFalse: [msg := (SSLMessage messageAtType: 22) fromStream: stream].
			msg isFullHandshake 
				ifTrue: [self pendingHandshakeMsg: nil.
					self basicProcess: msg]
				ifFalse: [self pendingHandshakeMsg: msg]].
