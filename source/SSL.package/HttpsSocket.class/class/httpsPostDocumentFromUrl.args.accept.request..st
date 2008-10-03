get the page
httpsPostDocumentFromUrl: url args: argsDict accept: mimeType request: requestString
	"Return the exact contents of a web object. Asks for the given MIME 
type. If mimeType is nil, use 'text/html'. An extra requestString may be 
submitted and must end with crlf.  The parsed header is saved. Use a 
proxy server if one has been registered.  tk 7/23/97 17:12"
	"Note: To fetch raw data, you can use the MIME type 
'application/octet-stream'."

	| serverName serverAddr port sock header page type stream length newUrl argString |
	Socket initializeNetwork.
	serverName := url authority.
	url port isNil
		ifTrue: [port := self defaultPort]
		ifFalse: [port := url port].
	page := url fullPath.
	argString := argsDict
		ifNotNil: [
			argString := self argString: argsDict.
			argString first = $? ifTrue: [ argString := argString copyFrom: 2 to: argString size]]
		ifNil: [''].

	serverAddr := NetNameResolver addressForName: serverName timeout: 20.
	serverAddr ifNil: [^ 'Could not resolve the server named: ', serverName].

	3 timesRepeat: [
		sock := HttpsSocket new.
		sock connectTo: serverAddr port: port.
		(sock waitForConnectionUntil: (Time millisecondClockValue + (30000) truncated)) ifTrue: [
			sock sendCommand: 'POST ', page, ' HTTP/1.0', String crlf, 
				(mimeType ifNotNil: ['ACCEPT: ', mimeType, String crlf] ifNil: ['']),
				'ACCEPT: text/html', String crlf,	"Always accept plain text"
				requestString, String crlf,	"extra user request. Authorization"
				'Content-type: application/x-www-form-urlencoded', String crlf,
				'Content-length: ', argString size printString, String crlf,
				'Host: ', serverName, ':', port printString, String crlf.
			sock sendCommand: argString.

			stream := sock getData readStream.
			header := stream upToAll: String crlf, String crlf. 
			sock header: header.
			length := sock getHeader: 'content-length'.
			length ifNotNil: [ length := length asNumber ].
			type := sock getHeader: 'content-type'.
			sock responseCode first = $3 ifTrue: [
				newUrl := sock getHeader: 'location'.
				newUrl ifNotNil: [ 
					sock destroy.
					newUrl := HttpsUrl absoluteFromText: (self 
						expandUrl: newUrl 
						ip: serverAddr 
						port: port).
					(url = newUrl) ifTrue: [^ 'Could not redirect to a new page on server: ', serverName].
					^newUrl retrieveContentsArgs: argsDict accept: mimeType] ].
			^ MIMEDocument contentType: type content: stream upToEnd url: url]].

	Socket deadServer: serverName.  sock destroy.
	^ 'Server ',serverName,' is not responding'.

