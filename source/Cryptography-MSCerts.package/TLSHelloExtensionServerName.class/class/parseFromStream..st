parsing
parseFromStream: aStream
	"create server names represented in aStream"
	| serverNameExtension serverNamesStream aServerName aServerNameStream |
	serverNameExtension _ self new.
	serverNameExtension rawData: (aStream next: (aStream next: 2) asInteger).
	serverNamesStream _ serverNameExtension rawData readStream.
	[serverNamesStream atEnd] whileFalse: [
	 	aServerName _ TLSServerName new.
		aServerNameStream _ (serverNamesStream next: (serverNamesStream next: 2) asInteger) readStream.
		aServerName nameType: aServerNameStream next.
		aServerName serverName: (aServerNameStream next: (aServerNameStream next: 2) asInteger) asString.
		serverNameExtension serverNames add: aServerName.
	].
	^serverNameExtension
	