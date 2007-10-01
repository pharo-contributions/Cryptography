process
sendInitialMessages

	self promptNumber: 1.
	self responseData: OrderedCollection new.
	self sendPrompt: (self infoRequest prompts at: self promptNumber).
