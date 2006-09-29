primitives
getCertProviderInfo

	"#define CERT_KEY_PROV_INFO_PROP_ID          2"
	
	| providerInfo aHandle buffer |
	aHandle := ExternalAddress allocate: ((buffer := self getCertProviderInfoSize) unsignedLongAt: 1).
	providerInfo := Win32FFICertKeyProviderInfo fromHandle: aHandle.
	self class certGetCertificateContextProperty: self selectedCertificate getHandle asInteger property: 2 structPointerOrNull: aHandle asInteger buffer: buffer asInteger.
	self certProviderInfo: providerInfo. 
	buffer free