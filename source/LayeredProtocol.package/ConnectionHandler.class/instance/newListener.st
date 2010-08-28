private
newListener
	| listener |

	self flag: #todo. "listener _ self socketClass newTCP."
	listener := Socket newTCP.
	listener setOption: 'SO_REUSEADDR' value: true.
	"listener setOption: 'SO_LINGER' value: false."
	"backlog is how many simultaneous connections to accept at the same time"
	listener listenOn: portNumber backlogSize: 10.
	^listener
