primitives
getCertProviderInfoSize

	"#define CERT_KEY_PROV_INFO_PROP_ID          2"
	
	| buffer |
	buffer := (ExternalAddress allocate: 4).
	self class certGetCertificateContextProperty: self selectedCertificate getHandle asInteger property: 2 structPointerOrNull: nil buffer: buffer asInteger.
	^buffer