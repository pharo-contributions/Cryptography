class variables
certificateCache
	^CertificateCacheVariable ifNil: [CertificateCacheVariable :=  Dictionary new. CertificateCacheVariable]