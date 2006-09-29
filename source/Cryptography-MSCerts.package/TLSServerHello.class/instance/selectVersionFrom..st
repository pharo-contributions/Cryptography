services
selectVersionFrom: aClientHello
	"select a version from options in aClientHello"
	| clientVersion |
	clientVersion _ aClientHello protocolVersion.
	(#('0300' '0301' '0302') includes: clientVersion) ifTrue: [
			^clientVersion copy
	].
	('03*' match: clientVersion) ifTrue: [
		^'0302' copy
	].
	self raiseClientVersionNotSupportedAlert