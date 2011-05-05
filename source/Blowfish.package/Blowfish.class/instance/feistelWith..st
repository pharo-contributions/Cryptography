as yet unclassified
feistelWith: otherHalf
| a b c d y byteArray |

"byteArray :=otherHalf asByteArrayOfSize: 4  .
a:=(byteArray at:1)+1.
b:=(byteArray at:2)+1.
c:=(byteArray at:3)+1.
d:=(byteArray at:4)+1.
"
a:=((otherHalf bitShift: -24) bitAnd:16rff)+1.
b:=((otherHalf bitShift: -16) bitAnd:16rff)+1.
c:=((otherHalf bitShift: -8) bitAnd:16rff)+1.
d:=(otherHalf bitAnd:16rff) +1.

y:= ((s0 at: a) + (s1 at: b)) \\  4294967296" (2 raisedTo: 32)".
y:= y bitXor: (s2 at: c).
y:=(y + (s3 at: d)) \\ 4294967296 "(2 raisedTo: 32)".

"Transcript cr; show: 'a: ' , (s0 at: a) hex greaseString ;
			 show: ' b: ' , (s1 at: b) hex greaseString ;
			show: ' c: ' , (s2 at: c) hex greaseString ;
			show: ' d: ' , (s3 at: d) hex greaseString ;
			show: ' F: ' , (y hex) greaseString; cr.
		self halt."
^y "asByteArray size <4 ifTrue:[(y asByteArrayOfSize: 4) unsignedLongAt: 1 bigEndian: true] ifFalse:[y]."

