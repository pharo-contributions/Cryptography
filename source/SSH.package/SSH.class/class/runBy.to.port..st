process
runBy: userName to: hostName port: port
	"
		SSH runBy: 'guest' to: 'www.croquetcollaborative.org' port: 22
	"

	| ep tty |
	ep := SSHSocketEndpoint newConnection: hostName port: port.
	ep userName: userName.
	TeletypeWindow new openOn: (tty := TeletypeMorph new).
	ep asProtocolStack
		push:	VT102Emulator new;
		push:	tty;
		install;
		run.
