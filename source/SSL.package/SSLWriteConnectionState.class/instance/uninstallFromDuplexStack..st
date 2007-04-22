control
uninstallFromDuplexStack: stack

	| list proto |
	list := OrderedCollection new.
	[
		list add: (proto := stack popDown).
		proto isMsgFragmenter] 
			whileFalse.
	proto writeState: nil.
	stack popDown.
	stack popDown.
	stack popDown.
	[list isEmpty] whileFalse: [stack pushDown: list removeLast]
