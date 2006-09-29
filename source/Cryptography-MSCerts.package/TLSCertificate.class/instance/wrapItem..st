services
wrapItem: aByteArray
	"wrap individual certificates with size"
	" Structure of this message:
       opaque ASN.1Cert<1..2^24-1>;  <size here>

       struct {
           ASN.1Cert certificate_list<0..2^24-1>;
       } Certificate;
"
	^(aByteArray size asByteArrayOfSize: 3), aByteArray