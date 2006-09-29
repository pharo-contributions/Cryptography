processing
writeResponse: response for: request
	"send out ssl specific responses"
	request isHandshakeRequest ifTrue: [^self writeHandShakeResponse: response].
	^super writeResponse: response for: request.
