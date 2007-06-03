*smime
interfaceClass
	"return the class to use for the Celeste interface"
	^UseScaffoldingInterface ifTrue: [ SMIMECeleste ] ifFalse: [ GeneralCeleste ].