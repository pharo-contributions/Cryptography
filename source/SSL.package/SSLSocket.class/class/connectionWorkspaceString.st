buttons
connectionWorkspaceString

	^
'''https://www.equifax.com/'' asUrl retrieveContents.
''https://www.usaa.com'' asUrl retrieveContents.
''https://www.wamu.com'' asUrl retrieveContents.
''https://www.fidelity.com'' asUrl retrieveContents.
''https://investing.schwab.com/'' asUrl retrieveContents.


SSLSocket allInstances do: [:e | e close].
SSLServer allInstances do: [:e | e stop]


SSLServer new 
	certificateStore: SSLCertificateStore testStore;
	handler: [:conn | SSLEchoConnHandler newOnConn: conn];
	startAtPort: 1443.

| conn |
conn := SSLSocket newConnection: NetNameResolver localHostName port: 1443.
(SSLTracingConnHandler newOnConn: conn)
	send: ''hello world''.

| conn |
conn := SSLSocket newConnection: NetNameResolver localHostName port: 1443.
conn send: (ByteArray new: 65000 withAll: 65).

| conn |
conn := SSLSocket 
	newConnection: NetNameResolver localHostName 
	port: 1443 
	version: SSLProtocolVersion ssl30 
	suite: TlsDheRsaWith3DesEdeCbcSha new.
(SSLTracingConnHandler newOnConn: conn)
	send: ''hello world''.



SSLSocket newConnection: ''www.cacert.org'' port: 443.
SSLSocket newConnection: ''www.cacert.org'' port: 443 version: SSLProtocolVersion ssl30.

SSLSocket newConnection: ''tls.secg.org'' port: 40023.
SSLSocket newConnection: ''tls.secg.org'' port: 40023 version: SSLProtocolVersion ssl30.


SSLServer new
	loadRSACertificateFile: ''certificates/rsa.cert'' privateKeyFile: ''certificates/rsa.key'';
	handler: [:conn | SSLEchoConnHandler newOnConn: conn];
	startAtPort: 1443.

'