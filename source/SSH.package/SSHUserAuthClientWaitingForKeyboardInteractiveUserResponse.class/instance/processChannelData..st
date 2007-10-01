process
processChannelData: dataMsg

	self responseData: self responseData, dataMsg data.
	dataMsg data last = Character cr asciiValue
		ifFalse: [^ false].
	self responseData removeLast.
	self infoResponse responses add: self responseData.
	self responseData: OrderedCollection new.
	self promptNumber = self infoRequest numPrompts
		ifTrue: [
			self machine sendMsg: self infoResponse.
			self addStateClass: SSHUserAuthClientWaitingForSuccess.
			^ true]
		ifFalse: [
			self promptNumber: self promptNumber + 1.
			self sendPrompt: (self infoRequest prompts at: self promptNumber).
			^ false].