stack
processBuffer

	| pallet |
	[self session isNil 
		ifTrue: [^ nil].
	(self bufferList notEmpty and: [down notNil])
		ifTrue: [
			pallet := self bufferList.
			bufferList := OrderedCollection new: 10.
			self basicDowncallAll: pallet]
		ifFalse: [(Delay forMilliseconds: 100) wait]]
			repeat.
