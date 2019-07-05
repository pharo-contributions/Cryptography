Extension { #name : #String }

{ #category : #'*ASN1' }
String >> asn1Tag [

	^ 12

]

{ #category : #'*ASN1' }
String >> formatASN1 [
	"return a asn1 tab formed string
	'30818513818154686973206973206120313239206279746520737472696E672C2062757420746861742069732061207265616C6C79206C6F6E6720737472696E6720736F204920686176652061206C6F7420746F20747970652E20204E6F7065204920616D206E6F7420646F6E65207965742C207374696C6C206E6F7420646F6E6520616C6D6F' formatASN1
	"
	^self formatASN1TabLevel: 0
]

{ #category : #'*ASN1' }
String >> formatASN1TabLevel: aTabLevel [
	| aReadStream aWriteStream | 
	"return a asn1 tab formed string
	'30818513818154686973206973206120313239206279746520737472696E672C2062757420746861742069732061207265616C6C79206C6F6E6720737472696E6720736F204920686176652061206C6F7420746F20747970652E20204E6F7065204920616D206E6F7420646F6E65207965742C207374696C6C206E6F7420646F6E6520616C6D6F' formatASN1
	"
	aReadStream := ((self copyWithoutAll: {Character space. Character tab. Character cr}) divideBySize: 2) readStream.
	aWriteStream := String new writeStream.
	aWriteStream nextPutAll: (aReadStream formatASN1TabLevel: aTabLevel).
	^aWriteStream contents
]

{ #category : #'*ASN1' }
String >> tokensBasedOn: aChar [
	"Answer an array of the substrings that compose the receiver."
	| result end begin |

	result := WriteStream on: (Array new: 10).

	begin := 1.
	"find one substring each time through this loop"
	[ 
		"find the beginning of the next substring"
		end := self indexOf: aChar startingAt: begin ifAbsent: [ nil ].
		end ~~ nil ] 
	whileTrue: [
		result nextPut: (self copyFrom: begin to: end - 1).
		begin := end + 1].
	result nextPut: (self copyFrom: begin to: self size).
	^result contents

]
