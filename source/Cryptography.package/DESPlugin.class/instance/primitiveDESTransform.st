primitives
primitiveDESTransform
	"encrypt/decrypt some data

	param1 = data key: ByteArray[8]
	param2 = cooked key:  WordArray[32]"

	| data work cooked |
	self export: true.
	self var: 'data' declareC: 'unsigned char *data'.
	self var: 'cooked' declareC: 'unsigned long *cooked'.
	self var: 'work' declareC: 'unsigned long work[2]'.
	self cCode: '/* Hi ho, Hi ho...*/' inSmalltalk: [work _ 1].
	interpreterProxy methodArgumentCount = 2
		ifFalse:[^interpreterProxy primitiveFail].
	data _ self checkedBytePtrOf: (interpreterProxy stackValue: 1).
	cooked _ self checkedWordPtrOf: (interpreterProxy stackValue: 0).
	interpreterProxy failed
		ifTrue: [ ^nil ].
	self scrunch: data to: work.
	self encrypt: work with: cooked.
	self unscrunch: work to: data.
	interpreterProxy pop: 2
	