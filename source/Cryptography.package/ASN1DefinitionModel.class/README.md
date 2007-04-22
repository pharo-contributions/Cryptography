This class is used to parse an asn1Definition of a class.  

Use the prama syntax to define the asn1 encoding
    <ans1Definition: 'put definition here'>

for example:
	<asn1Definition: 'CertificateList  ::=  SEQUENCE  {
        tbsCertList          TBSCertList,
        signatureAlgorithm   AlgorithmIdentifier,
        signatureValue       BIT STRING  }'>