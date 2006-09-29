services
wrapAsServerHello: aByteArray
	"wrap the contents as a server hello"
	"       enum {
           hello_request(0), client_hello(1), server_hello(2),
           certificate(11), server_key_exchange (12),
           certificate_request(13), server_hello_done(14),
           certificate_verify(15), client_key_exchange(16),
           finished(20), certificate_url(21), certificate_status(22),
        (255)
       } HandshakeType;
	"
	^ 2 asByteArray, (aByteArray size asByteArrayOfSize: 3), aByteArray