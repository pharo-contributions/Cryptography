Class {
	#name : #BaselineOfCryptography,
	#superclass : #BaselineOf,
	#category : #BaselineOfCryptography
}

{ #category : #baselines }
BaselineOfCryptography >> baseline: spec [     
	<baseline>
        
	spec for: #common do: [
		spec package: 'Cryptography'.
		spec 
			package: 'ASN1-Core' with: [ spec requires: #(#'Cryptography' ) ];
			package: 'ASN1-Tests' with: [ spec requires: #(#'ASN1-Core' ) ];
			package: 'ASN1-Readers' with: [ spec requires: #(#'Cryptography' #'ASN1-Core') ];
			package: 'ASN1-Readers-Tests' with: [ spec requires: #(#'ASN1-Readers') ];
			package: 'PKCS12' with: [ spec requires: #(#'Cryptography' #'ASN1-Core') ];
			package: 'PKCS12-Tests' with: [ spec requires: #(#'PKCS12') ];
			package: 'X509' with: [ spec requires: #(#'Cryptography' #'ASN1-Core' ) ];
			package: 'X509-Tests' with: [ spec requires: #(#'X509' ) ];
			package: 'PBKDF2' with: [ spec requires: #(#'Cryptography') ];
			package: 'PBKDF2-Tests' with: [ spec requires: #(#'PBKDF2' )  ];
			package: 'Blowfish' with: [ spec requires: #(#'Cryptography') ];
			package: 'OpenPGP' with: [ spec requires: #(#'Cryptography') ];
			package: 'LayeredProtocol' with: [ spec requires: #(#'Cryptography') ].
		
		spec
			group: 'core' with: #('Cryptography');
			group: 'default' with: #('legacy');
			group: 'legacy' with: #('Cryptography' 'ASN1-Tests' 'ASN1-Readers-Tests' 'PKCS12-Tests' 'X509-Tests' );
			group: 'all' with: #('Cryptography' 'ASN1-Tests' 'ASN1-Readers-Tests' 'PKCS12-Tests' 'X509-Tests' 'PBKDF2-Tests' 'Blowfish' 'OpenPGP' 'LayeredProtocol')
	]. 
]
