Extension { #name : #ThirtyTwoBitRegister }

{ #category : #'*openPGP-accumulator ops' }
ThirtyTwoBitRegister >> -= aThirtyTwoBitRegister [
	"Replace my contents with the difference of the given register and my current contents."

	| carry |
	low := low - aThirtyTwoBitRegister low.
	low < 0
		ifTrue: [low := low + 65536. carry := 1]
		ifFalse: [carry := 0].
	hi := (hi - aThirtyTwoBitRegister hi - carry+ 65536) bitAnd: 16rFFFF
]

{ #category : #'*openPGP-accessing' }
ThirtyTwoBitRegister >> castXorFrom: anSBox index: anInteger [
	self bitXor: (anSBox at: anInteger+1)
]

{ #category : #'*openPGP-accessing' }
ThirtyTwoBitRegister >> d0 [
	^ hi bitShift: -8
]

{ #category : #'*openPGP-accessing' }
ThirtyTwoBitRegister >> d1 [
	^ hi bitAnd: 16rFF
]

{ #category : #'*openPGP-accessing' }
ThirtyTwoBitRegister >> d2 [
	^ low bitShift: -8
]

{ #category : #'*openPGP-accessing' }
ThirtyTwoBitRegister >> d3 [
	^ low bitAnd: 16rFF
]
