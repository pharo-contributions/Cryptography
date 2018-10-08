instance creation
fromPragma: aPragma
	^self new
		pragma: aPragma;
		asn1name: aPragma arguments first;
		method: aPragma method methodReference methodSymbol;
		systemClass: aPragma method methodReference classSymbol;
		classOfMutatorArgument: aPragma arguments second;
		yourself