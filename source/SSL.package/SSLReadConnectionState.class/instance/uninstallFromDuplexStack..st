control
uninstallFromDuplexStack: stack

	| list proto |
	list := OrderedCollection new.
	[
		list add: (proto := stack popUp).
		proto isMsgDefragmenter] 
			whileFalse.
	proto readState: nil.
	stack popUp.
	stack popUp.
	stack popUp.
	[list isEmpty] whileFalse: [stack pushUp: list removeLast]
