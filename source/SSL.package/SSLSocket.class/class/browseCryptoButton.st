buttons
browseCryptoButton

	^ (PluggableButtonMorph 
		on: self
		getState: nil
		action: #openCryptoBrowser)
			borderWidth: 2;
			borderColor: #raised;
			label: 'Crypto Browser';
			useRoundedCorners;
			vResizing: #spaceFill;
			hResizing: #shrinkWrap;
			setBalloonText: 'open a browser for the Crypto classes';
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			startSteppingSelector: #update:;
			yourself.
