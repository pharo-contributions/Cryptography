protocol
send: data 
	self isConnected
		ifTrue: [
			[self socket sendSomeData: data]
				on: Error
				do: [:ex | 
					self socket notNil
						ifTrue: [self socket closeAndDestroy].
					SSLSendError signal: ex messageText
				]
		]
		ifFalse: [
			self socket notNil
				ifTrue: [self socket closeAndDestroy]
		]