services
askUserForCertificateOn: aHttpService
	"open certificate store to select a certificate and cache it with the HttpService"
	self certificateCache at: aHttpService put: CertificateStoreAbstract getCertificate.