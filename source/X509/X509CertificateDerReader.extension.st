Extension { #name : #X509CertificateDerReader }

{ #category : #'*X509' }
X509CertificateDerReader >> asCertificate [

	^ X509Certificate fromBytes: self derBytes.

]
