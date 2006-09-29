services
wrapAsTLSHandShakeMessage: aByteArray
	"wrap the contents as a server hello"
	"enum {
           change_cipher_spec(20), alert(21), handshake(22),
           application_data(23), (255)
       } ContentType;
	"
	^ 22 asByteArray, self serverVersionByteArray, (aByteArray size asByteArrayOfSize: 2), aByteArray