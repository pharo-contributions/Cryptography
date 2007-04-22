buttons
workspaceButton

	^ (PluggableButtonMorph 
		on: self
		getState: nil
		action: #openWorkspace)
			borderWidth: 2;
			borderColor: #raised;
			color: Color blue muchLighter;
			label: 'SSL Workspace';
			useRoundedCorners;
			vResizing: #spaceFill;
			hResizing: #shrinkWrap;
			setBalloonText: 'open a workspace for the SSL classes';
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			startSteppingSelector: #update:;
			yourself.
