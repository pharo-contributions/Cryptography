services
freeCertContext
	self selectedCertificate ifNil: [^true].
	self freeCertContext: self selectedCertificate.
	self selectedCertificate free.
	self selectedCertificate: nil.