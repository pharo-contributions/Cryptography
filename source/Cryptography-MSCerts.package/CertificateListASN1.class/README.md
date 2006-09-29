http://www.ietf.org/rfc/rfc2459.txt
5.1  CRL Fields

   The X.509 v2 CRL syntax is as follows.  For signature calculation,
   the data that is to be signed is ASN.1 DER encoded.  ASN.1 DER
   encoding is a tag, length, value encoding system for each element.

   CertificateList  ::=  SEQUENCE  {
        tbsCertList          TBSCertList,
        signatureAlgorithm   AlgorithmIdentifier,
        signatureValue       BIT STRING  }

