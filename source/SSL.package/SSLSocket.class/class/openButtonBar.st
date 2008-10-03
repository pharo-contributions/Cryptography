buttons
openButtonBar
	"self openButtonBar"

	| buttons row |
	buttons := OrderedCollection new
		add: self browseButton;
		add: self browseCryptoButton;
		add: self workspaceButton;
		add: self gcButton;
		yourself.
	row := AlignmentMorph newRow
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		addAllMorphs: buttons asArray;
		extent: 300@25.
	row 
		openInWorld;
		position: row world topCenter.

	buttons do: [:b | 
		b 
			startStepping: #update: 
			at: Time millisecondClockValue 
			arguments: #(nil) 
			stepTime: nil].
