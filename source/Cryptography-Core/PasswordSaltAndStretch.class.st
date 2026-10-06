"
A PasswordSaltAndStretch is way to increase the entropy of bad passwords.  The idea is to increase the amount of work needed for an attacker to try random passwords.  The class returns two values a hash and a salt value.  The salt value is random data used to calculate the hash.  If the hash is used as a key then store the salt value along with the encrypted data.  Then to calculate the key or verify a password use hashForPassword: aPassword s: theSalt.

So 

| result |
(result := PasswordSaltAndStretch hashForPassword: 'password') = (PasswordSaltAndStretch hashForPassword: 'password' s: result value)  

should be true.

Instance Variables
	r:		<integer>
	s:		<integer>

r
	- the number of rounds used to stretch the password

s
	- salt which is random data used to make the hash unique.  The salt should be stored with encrypted data, or with the hash because it is needed to verify the hash later.

"
Class {
	#name : #PasswordSaltAndStretch,
	#superclass : #Object,
	#instVars : [
		'r',
		's'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #LICENSE }
PasswordSaltAndStretch class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #constants }
PasswordSaltAndStretch class >> defaultR [
	"this value is way too low when there is a primitive SHA256 this should be increased"
	^250
]

{ #category : #'instance creation' }
PasswordSaltAndStretch class >> hashForPassword: aPassword [
	"the default for r is way to small.  Once we have a primitive SHA256 this should be increased so that this method takes at least 1 second"
	^self hashForPassword: aPassword r: self defaultR
		
]

{ #category : #'instance creation' }
PasswordSaltAndStretch class >> hashForPassword: aPassword r: aStretchInteger [
	^self hashForPassword: aPassword r: aStretchInteger s: (SecureRandom picker nextBytesNonZero: 32)
]

{ #category : #'instance creation' }
PasswordSaltAndStretch class >> hashForPassword: aPassword r: aStretchInteger s: salt [
	^self new
		r: aStretchInteger;
		s: salt;
		saltAndStretch: aPassword
]

{ #category : #'instance creation' }
PasswordSaltAndStretch class >> hashForPassword: aPassword s: salt [
	^self new
		r: self defaultR;
		s: salt;
		saltAndStretch: aPassword
]

{ #category : #accessing }
PasswordSaltAndStretch >> r [
	"Answer the value of r"

	^ r
]

{ #category : #accessing }
PasswordSaltAndStretch >> r: anObject [
	"Set the value of r"

	r := anObject
]

{ #category : #accessing }
PasswordSaltAndStretch >> s [
	"Answer the value of s"

	^ s
]

{ #category : #accessing }
PasswordSaltAndStretch >> s: anObject [
	"Set the value of s"

	s := anObject
]

{ #category : #services }
PasswordSaltAndStretch >> saltAndStretch: aPassword [
	| result |
	result := ByteArray new.
	1 to: r do: [:i |
		result := SHA256 new hashMessage: (result, aPassword asByteArray, self s)
	].
	^result -> self s
]
