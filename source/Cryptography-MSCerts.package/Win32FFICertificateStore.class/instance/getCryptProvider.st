primitives
getCryptProvider

	| handleBuffer result |
	handleBuffer := (ExternalAddress allocate: 4).
	handleBuffer unsignedLongAt: 1 put: 0.
	self getCertProviderInfo.
	"#define CRYPT_MACHINE_KEYSET    0x00000020"
	result := self class cryptAcquireContext: handleBuffer asInteger
		containerName: self certProviderInfo containerName asByteArrayNullTerminated
		providerName: self certProviderInfo provName asByteArrayNullTerminated
		providerType: self certProviderInfo dwProvType 
		null: 32.
	self cryptProvider: (handleBuffer unsignedLongAt: 1).
	handleBuffer free.
	^result
	