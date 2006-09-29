inquires
maxFragmentLength
    "enum{
             2^9(1), 2^10(2), 2^11(3), 2^12(4), (255)
         } MaxFragmentLength;
	"
	(#(1 2 3 4) includes: self extensionData) ifFalse: [self raiseIllgealParameterAlert].
	^2 raisedTo: (8 + self extensionData).