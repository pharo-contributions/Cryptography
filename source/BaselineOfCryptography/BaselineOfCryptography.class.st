"
Baseline for [https://github.com/pharo-contributions/Cryptography](https://github.com/pharo-contributions/Cryptography)
"
Class {
	#name : #BaselineOfCryptography,
	#superclass : #BaselineOf,
	#category : #BaselineOfCryptography
}

{ #category : #baselines }
BaselineOfCryptography >> baseline: spec [     
	<baseline>
        
	spec for: #common do: [
		spec 
			package: 'Cryptography-Core';
			package: 'Cryptography-Core-Tests' with: [ spec requires: #(#'Cryptography-Core' ) ].
			
		spec 
			"ASN1"
			package: 'ASN1-Core' with: [ spec requires: #(#'Cryptography-Core' ) ];
			package: 'ASN1-Core-Tests' with: [ spec requires: #(#'ASN1-Core' ) ];
			package: 'ASN1-Readers' with: [ spec requires: #(#'Cryptography-Core' #'ASN1-Core') ];
			package: 'ASN1-Readers-Tests' with: [ spec requires: #(#'ASN1-Readers') ];
			
			"PKCS"
			package: 'PKCS12' with: [ spec requires: #(#'Cryptography-Core' #'ASN1-Core') ];
			package: 'PKCS12-Tests' with: [ spec requires: #(#'PKCS12') ];

			"X509"
			package: 'X509' with: [ spec requires: #(#'Cryptography-Core' #'ASN1-Core' ) ];
			package: 'X509-Tests' with: [ spec requires: #(#'X509' ) ];
			
			"PBKDF2"
			package: 'PBKDF2' with: [ spec requires: #(#'Cryptography-Core') ];
			package: 'PBKDF2-Tests' with: [ spec requires: #(#'PBKDF2' )  ];
			
			"Other"
			package: 'Blowfish' with: [ spec requires: #(#'Cryptography-Core') ];
			package: 'OpenPGP' with: [ spec requires: #(#'Cryptography-Core') ];
			package: 'LayeredProtocol' with: [ spec requires: #(#'Cryptography-Core') ].
		
		spec
			group: 'core' with: #('Cryptography-Core');
			group: 'default' with: #('legacy');
			group: 'legacy' with: #('Cryptography-Core' 'Cryptography-Core-Tests' 'ASN1-Core-Tests' 'ASN1-Readers-Tests' 'PKCS12-Tests' 'X509-Tests' );
			group: 'all' with: #('Cryptography-Core' 'Cryptography-Core-Tests' 'ASN1-Core-Tests' 'ASN1-Readers-Tests' 'PKCS12-Tests' 'X509-Tests' 'PBKDF2-Tests' 'Blowfish' 'OpenPGP' 'LayeredProtocol')
 ]. 
]
