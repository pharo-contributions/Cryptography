protocol
handShakeProtocol
	"Client                                               Server

      ClientHello                  -------->
                                                      ServerHello
                                                     Certificate*
                                               CertificateStatus*
                                               ServerKeyExchange*
                                              CertificateRequest*
                                   <--------      ServerHelloDone
      Certificate*
      CertificateURL*
      ClientKeyExchange
      CertificateVerify*
      [ChangeCipherSpec]
      Finished                     -------->
                                               [ChangeCipherSpec]
                                   <--------             Finished
      Application Data             <------->     Application Data"



	self processClientHello.
	self sendServerHello.
	self sendPublicCertificate.
	self verifyCertificateStatus.
	self exchangeKeys.
	self requestCertificate.
	self sendServerHelloDone.
	self setCipherSpec.
	