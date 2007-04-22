buttons
browseButton

	^ (PluggableButtonMorph 
		on: self
		getState: nil
		action: #openBrowser)
			borderWidth: 2;
			borderColor: #raised;
			color: Color blue muchLighter;
			label: 'SSL Browser';
			useRoundedCorners;
			vResizing: #spaceFill;
			hResizing: #shrinkWrap;
			setBalloonText: 'open a browser for the SSL classes';
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			startSteppingSelector: #update:;
			yourself.
