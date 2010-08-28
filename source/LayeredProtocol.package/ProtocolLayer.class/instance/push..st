stack
push: aProtocol
	"Push aProtocol on top of the receiver."

	^(LayeredProtocol on: self) push: aProtocol