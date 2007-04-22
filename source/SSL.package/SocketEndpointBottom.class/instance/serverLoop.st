process
serverLoop
	"I sit in a loop (usually in a background Process) waiting for data to arrive on my underlying connection then pass anything received up to my high protocol.  When #getData answers nil to inform me that my underlying connection has been destroyed I close down the entire endpoint, inform my session of the fact and then exit.  See also ProtocolEndpoint>>run."

	| buf | 
	[[(buf := self getData) notNil] whileTrue: [self receive: buf]]
		on: Error
		do: [:ex | self halt. self duplexStack notNil ifTrue: [self duplexStack processError: ex]].
	self kill.
