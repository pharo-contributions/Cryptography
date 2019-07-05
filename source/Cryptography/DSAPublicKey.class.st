Class {
	#name : #DSAPublicKey,
	#superclass : #Object,
	#instVars : [
		'p',
		'q',
		'g',
		'y'
	],
	#category : 'Cryptography-DSA'
}

{ #category : #examples }
DSAPublicKey class >> notesOnAsnEncoding [

"Smalltalk at: #ASN1Constants put: Dictionary new!
ASN1Constants at: #classApplication put:  64!
ASN1Constants at: #classContextSpecific put:  128!
ASN1Constants at: #classPrivate put:  192!
ASN1Constants at: #classUniversal put:  0!
ASN1Constants at: #idBitString put:  3!
ASN1Constants at: #idBoolean put:  1!
ASN1Constants at: #idIA5String put:  22!
ASN1Constants at: #idInteger put:  2!
ASN1Constants at: #idNull put:  5!
ASN1Constants at: #idObjectIdentifier put:  6!
ASN1Constants at: #idOctetString put:  4!
ASN1Constants at: #idPrintableString put:  19!
ASN1Constants at: #idSequence put:  16!
ASN1Constants at: #idSet put:  17!
ASN1Constants at: #idUTCTime put:  23!
ASN1Constants at: #maskClass put:  192!
ASN1Constants at: #maskConstructed put:  32!
ASN1Constants at: #maskTag put:  31!
ASN1Constants at: #tagHigh put:  31!

Transcript show: 'ASN1ObjectIdentifiers'; cr!
Smalltalk at: #ASN1ObjectIdentifiers put: Dictionary new!
ASN1ObjectIdentifiers at: #x1x2x840x10040x4x1 put:  ('id-dsa')!
ASN1ObjectIdentifiers at: #x1x2x840x10040x4x3 put:  ('id-dsa-with-sha1')!
ASN1ObjectIdentifiers at: #x1x2x840x113533x7x65x0 put:  ('entrustVersion')!
ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x1 put:  ('rsaEncryption')!
ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x2 put:  ('md2WithRSAEncryption')!
ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x4 put:  ('md5WithRSAEncryption')!
ASN1ObjectIdentifiers at: #x1x2x840x113549x1x1x5 put:  ('sha-1WithRSAEncryption')!
ASN1ObjectIdentifiers at: #x1x2x840x113549x1x9x1 put:  ('e-mailAddress')!
ASN1ObjectIdentifiers at: #x1x3x14x3x2x12 put:  ('dsa')!
ASN1ObjectIdentifiers at: #x1x3x14x3x2x27 put:  ('dsa With SHA1')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x1 put:  ('netscapeCertificateType')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x12 put:  ('SslServerName')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x13 put:  ('netscapeCertificateComment')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x2 put:  ('BaseURL')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x3 put:  ('RevocationURL')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x4 put:  ('CARevocationURL')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x7 put:  ('renewalURL')!
ASN1ObjectIdentifiers at: #x2x16x840x1x113730x1x8 put:  ('netscapeCaPolicyURL')!
ASN1ObjectIdentifiers at: #x2x5x29x14 put:  ('subjectKeyIdentifier')!
ASN1ObjectIdentifiers at: #x2x5x29x15 put:  ('keyUsage')!
ASN1ObjectIdentifiers at: #x2x5x29x16 put:  ('privateKeyUsagePeriod')!
ASN1ObjectIdentifiers at: #x2x5x29x17 put:  ('subjectAlternativeName')!
ASN1ObjectIdentifiers at: #x2x5x29x18 put:  ('issuerAlternativeName')!
ASN1ObjectIdentifiers at: #x2x5x29x19 put:  ('basicConstraints')!
ASN1ObjectIdentifiers at: #x2x5x29x20 put:  ('cRLNumber')!
ASN1ObjectIdentifiers at: #x2x5x29x21 put:  ('reasonCode')!
ASN1ObjectIdentifiers at: #x2x5x29x23 put:  ('holdInstructionCode')!
ASN1ObjectIdentifiers at: #x2x5x29x24 put:  ('invalidityDate')!
ASN1ObjectIdentifiers at: #x2x5x29x27 put:  ('deltaCRLIndicator')!
ASN1ObjectIdentifiers at: #x2x5x29x28 put:  ('issuingDistributionPoint')!
ASN1ObjectIdentifiers at: #x2x5x29x29 put:  ('certificateIssuer')!
ASN1ObjectIdentifiers at: #x2x5x29x3 put:  ('certificate policies - old')!
ASN1ObjectIdentifiers at: #x2x5x29x30 put:  ('nameConstraints')!
ASN1ObjectIdentifiers at: #x2x5x29x31 put:  ('cRLDistributionPoints')!
ASN1ObjectIdentifiers at: #x2x5x29x32 put:  ('certificatePolicies')!
ASN1ObjectIdentifiers at: #x2x5x29x33 put:  ('policyMappings')!
ASN1ObjectIdentifiers at: #x2x5x29x35 put:  ('authorityKeyIdentifier')!
ASN1ObjectIdentifiers at: #x2x5x29x36 put:  ('policyConstraints')!
ASN1ObjectIdentifiers at: #x2x5x4x10 put:  ('O')!
ASN1ObjectIdentifiers at: #x2x5x4x11 put:  ('OU')!
ASN1ObjectIdentifiers at: #x2x5x4x13 put:  ('??')!
ASN1ObjectIdentifiers at: #x2x5x4x3 put:  ('CN')!
ASN1ObjectIdentifiers at: #x2x5x4x6 put:  ('C')!
ASN1ObjectIdentifiers at: #x2x5x4x7 put:  ('L')!
ASN1ObjectIdentifiers at: #x2x5x4x8 put:  ('S')!
ASN1ObjectIdentifiers at: #x2x5x8x1x1 put:  ('rsa')!
"
]

{ #category : #'instance creation' }
DSAPublicKey class >> p: p0 q: q0 g: g0 y: y0 [
	^ self new p: p0 q: q0 g: g0 y: y0
]

{ #category : #examples }
DSAPublicKey class >> test1 [

	| x509 key hash |
	x509 := #(48 130 1 184 48 130 1 44 6 7 42 134 72 206 56 4 1 48 130 1 31 2 129 129 0 253 127 83 129 29 117 18 41 82 223 74 156 46 236 228 231 246 17 183 82 60 239 68 0 195 30 63 128 182 81 38 105 69 93 64 34 81 251 89 61 141 88 250 191 197 245 186 48 246 203 155 85 108 215 129 59 128 29 52 111 242 102 96 183 107 153 80 165 164 159 159 232 4 123 16 34 194 79 187 169 215 254 183 198 27 248 59 87 231 198 168 166 21 15 4 251 131 246 211 197 30 195 2 53 84 19 90 22 145 50 246 117 243 174 43 97 215 42 239 242 34 3 25 157 209 72 1 199 2 21 0 151 96 80 143 21 35 11 204 178 146 185 130 162 235 132 11 240 88 28 245 2 129 129 0 247 225 160 133 214 155 61 222 203 188 171 92 54 184 87 185 121 148 175 187 250 58 234 130 249 87 76 11 61 7 130 103 81 89 87 142 186 212 89 79 230 113 7 16 129 128 180 73 22 113 35 232 76 40 22 19 183 207 9 50 140 200 166 225 60 22 122 139 84 124 141 40 224 163 174 30 43 179 166 117 145 110 163 127 11 250 33 53 98 241 251 98 122 1 36 59 204 164 241 190 168 81 144 137 168 131 223 225 90 229 159 6 146 139 102 94 128 123 85 37 100 1 76 59 254 207 73 42 3 129 133 0 2 129 129 0 209 171 224 141 87 74 186 36 200 200 42 40 228 114 112 206 104 250 213 194 178 215 57 23 135 248 223 239 188 97 167 102 105 90 234 151 109 222 24 29 72 142 144 0 11 95 96 125 132 94 155 201 238 92 229 249 108 218 81 237 57 70 21 226 217 118 235 29 215 214 73 236 204 148 72 7 26 167 85 90 96 4 15 232 157 127 208 172 107 241 4 180 137 245 183 54 97 233 185 114 47 14 37 221 10 6 183 240 46 247 196 150 223 119 107 80 145 214 222 138 248 230 247 102 1 229 209 193) asByteArray.
	key := DSAPublicKey fromAsnDerBytes: x509.
	(key asAsn1Bytes = x509)
		ifFalse: [self error: 'encodings different'].
	hash := SHA1 hashMessage: key asAsn1Bytes.
	^ (Base64MimeConverter mimeEncode: hash readStream) contents

]

{ #category : #'as yet unclassified' }
DSAPublicKey >> = anObject [

	(anObject isKindOf: self class) ifFalse: [^false].
	^ self asAsn1Bytes = anObject asAsn1Bytes
]

{ #category : #'as yet unclassified' }
DSAPublicKey >> base64CryptoHash [

	| encoded hash |
	encoded := self asAsn1Bytes.
	((encoded first bitAnd: 16r80) > 0)
		ifTrue: [encoded := #(0) asByteArray, encoded].
	hash := (SHA1 hashMessage: encoded) asByteArray reversed.
	((hash first bitAnd: 16r80) > 0)
		ifTrue: [hash := #(0) asByteArray, hash].
	^ hash toEBase64String

]

{ #category : #'as yet unclassified' }
DSAPublicKey >> dssSig [

	^ OrderedCollection with: p with: q with: g
]

{ #category : #'as yet unclassified' }
DSAPublicKey >> p: p0 q: q0 g: g0 y: y0 [
	p := p0.
	q := q0.
	g := g0.
	y := y0
]

{ #category : #'as yet unclassified' }
DSAPublicKey >> stringToSignature: aString [
	"Answer the signature stored in the given string. A signature string has the format:

		 '[DSA digital signature <r> <s>]'

	where <r> and <s> are large positive integers represented by strings of hexidecimal digits."

	| prefix stream r s |
	prefix := '[DSA digital signature '.
	(aString beginsWith: prefix) ifFalse: [self error: 'bad signature prefix'].
	stream := ReadStream on: aString.
	stream position: prefix size.
	r := Integer readFrom: stream base: 16.
	stream next.
	s := Integer readFrom: stream base: 16.
	^ Array with: r with: s

]

{ #category : #'as yet unclassified' }
DSAPublicKey >> verify: signatureString isSignatureOf: aStringOrStream [
	"Answer true if the given signature string signs the given message (a stream or string)."
	"Note: Random numbers are not needed for signature verification; thus, there is no need to call initRandomFromUser before verifying a signature."

	| hasher h sig |
	hasher := SHA1 new.
	(aStringOrStream class isBytes)
		ifTrue: [h := hasher hashMessage: aStringOrStream]
		ifFalse: [h := hasher hashStream: aStringOrStream].
	sig := self stringToSignature: signatureString.
	^ self verifySignature: sig ofMessageHash: h
]

{ #category : #'as yet unclassified' }
DSAPublicKey >> verifySignature: aSignature ofMessageHash: hash [
	"Answer true if the given signature is the authentic signature of the given message hash. That is, if the signature must have been computed using the private key set corresponding to the given public key."

	| r s w u1 u2 v0 v |
	r := aSignature first.
	s := aSignature last.
	((r > 0) and: [r < q]) ifFalse: [^ false].  "reject"
	((s > 0) and: [s < q]) ifFalse: [^ false].  "reject"

	w := s inverseModulo: q.
	u1 := (hash asInteger * w) \\ q.
	u2 := (r * w) \\ q.
	v0 := (g raisedTo: u1 modulo: p) * (y raisedTo: u2 modulo: p).
	v := ( v0 \\ p) \\ q.
	^ v = r
]
