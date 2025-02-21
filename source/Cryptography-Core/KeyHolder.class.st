"
A KeyHolder is a construct that holds key information safely in memory.  The key is never stored in plain text in memory.  The system encrypts the key using two different objects and therefore two different memory locations.  A random key is generated and used to encrypt the key.  That random key is changed every 100ms.  To retrieve the key send the message #key.  You must send in a byteArray.  If you are storing a key that is a string then do:

KeyHolder holdKey: 'aPassword' asByteArray.  

when asking for key you will get back aByteArray so if you are looking for a string use

aByteArray := aKeyHolder key. 
pKey := aByteArray asString.
aByteArray destroy.

When you are done with the byteArray send the message destroy to it, to keep your secret key from being written to disk.  Never leave your key in memory for very log.  Get it, use it and destroy it as quickly as possible in the same message chain.

If you no longer need this keyHolder you must send the message destroy to it to stop the process and wipe the memory clean.

Instance Variables
	data:		KeyHolderData
	random:		aByteArray
	randomChangeProcess:		aProcess 

data
	- holds onto an instance of KeyHolderData which holds your encrypted key.

random
	- the key used to encrypt your key

randomChangeProcess
	- the process that changes random

"
Class {
	#name : #KeyHolder,
	#superclass : #Object,
	#instVars : [
		'data',
		'random',
		'randomChangeProcess'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #LICENSE }
KeyHolder class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #'instance creation' }
KeyHolder class >> holdKey: aKey [
	"store a key scrambled in memory"
	^self new
		data: (KeyHolderData new);
		encryptKey: aKey;
		randomChangeLoop;
		yourself
]

{ #category : #'instance creation' }
KeyHolder class >> readFromFile: aFileName password: aPassword [
	"this method takes a long time on purpose, the idea is to increase the amount of time and resources needed to crack password"
	| pwHash cipher cData pwHashAndSalt pwSalt eData aStream aKeyHolder |
	[eData := ((aStream := FileStream fileNamed: aFileName) ifNil: [^nil]) binary contents asByteArray] ensure: [aStream close].
	pwSalt := eData copyFrom: eData size - 31 to: eData size.
	eData := eData copyFrom: 1 to: eData size - 32.
	pwHashAndSalt := PasswordSaltAndStretch hashForPassword: aPassword s: pwSalt.
	pwHash := pwHashAndSalt key.
	pwSalt := pwHashAndSalt value.
	cipher := (TripleDES key: pwHash) cbc.
	cData := cipher decrypt: eData.
	aKeyHolder := self holdKey: cData.
	cData destroy.
	^aKeyHolder
	
]

{ #category : #accessing }
KeyHolder >> data [
	"Answer the value of data"

	^ data
]

{ #category : #accessing }
KeyHolder >> data: anObject [
	"Set the value of data"

	data := anObject
]

{ #category : #'initialize-release' }
KeyHolder >> destroy [
	self randomChangeProcess terminate.
	self randomChangeProcess: nil.
	self random destroy.
	self data key destroy.
	self data: nil.
]

{ #category : #services }
KeyHolder >> encryptKey: pKey [
	| eKey |
	eKey := (TripleDES key: self random) cbc encrypt: pKey.
	self data key: eKey
]

{ #category : #'initialize-release' }
KeyHolder >> initialize [
	
	super initialize.
	self random: (SecureRandom picker nextBytesNonZero: 32)
]

{ #category : #services }
KeyHolder >> key [
	^[(TripleDES key: self random) cbc decrypt: self data key] on: CryptographyError do: [:ex | ex retry]
]

{ #category : #accessing }
KeyHolder >> random [
	"Answer the value of random"

	^ random
]

{ #category : #accessing }
KeyHolder >> random: anObject [
	"Set the value of random"

	random := anObject
]

{ #category : #processes }
KeyHolder >> randomChangeLoop [
	"This loop changes the random and reencrypts the data every 100ms"
	| pKey randomGenerator |
	self randomChangeProcess: ([
		randomGenerator := SecureRandom picker.
		[
			pKey := self key.
			self random: (randomGenerator nextBytesNonZero: 32).
			self encryptKey: pKey.
			pKey destroy.
			(Delay forMilliseconds: 100) wait.
			true.
		] whileTrue.
	] forkAt: Processor highIOPriority)
]

{ #category : #accessing }
KeyHolder >> randomChangeProcess [
	"Answer the value of randomChangeProcess"

	^ randomChangeProcess
]

{ #category : #accessing }
KeyHolder >> randomChangeProcess: anObject [
	"Set the value of randomChangeProcess"

	randomChangeProcess := anObject
]

{ #category : #services }
KeyHolder >> writeToFile: aFileName password: aPassword [
	"this method takes a long time on purpose, the idea is to increase the amount of time and resources needed to crack password"
	| pwHash cipher cData pwHashAndSalt pwSalt |
	pwHashAndSalt := PasswordSaltAndStretch hashForPassword: aPassword.
	pwHash := pwHashAndSalt key.
	pwSalt := pwHashAndSalt value.
	cipher := (TripleDES key: pwHash) cbc.
	cData := cipher encrypt: self key.
	(FileStream forceNewFileNamed: aFileName)
		nextPutAll: cData;
		nextPutAll: pwSalt;
		close.
	
]
