"
Reader for OpenSSL key derivation function
"
Class {
	#name : #OpenSSLKeyDerivationFunction,
	#superclass : #Object,
	#category : #'ASN1-Readers-OpenSSL'
}

{ #category : #accessing }
OpenSSLKeyDerivationFunction >> derivedKeyFromPassword: password salt: salt size: size [

	| result block digest |
	result := ByteArray new.
	digest := ByteArray new.
	(size + 15 // 16) timesRepeat: [
		block := digest, password, salt.
		digest := MD5 hashMessage: block.
		result := result, digest].
	^ result readStream next: size.


]
