control
installMsgTracing

	| msg comp mac crypt |
	self isTracing ifTrue: [^ self].

	msg := self duplexStack popUp.
	comp := self duplexStack popUp.
	mac := self duplexStack popUp.
	crypt := self duplexStack popUp.
	self duplexStack pushUp: (TraceProtocol newTag: '
wire in').
	self duplexStack pushUp: crypt.
	self duplexStack pushUp: mac.
	self duplexStack pushUp: comp.
	self duplexStack pushUp: msg.

	msg := self duplexStack popDown.
	comp := self duplexStack popDown.
	mac := self duplexStack popDown.
	crypt := self duplexStack popDown.
	self duplexStack pushDown: (TraceProtocol newTag: '
wire out').
	self duplexStack pushDown: crypt.
	self duplexStack pushDown: mac.
	self duplexStack pushDown: comp.
	self duplexStack pushDown: msg.

