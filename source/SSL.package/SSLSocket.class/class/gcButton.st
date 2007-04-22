buttons
gcButton

	^ (PluggableButtonMorph 
		on: Smalltalk
		getState: nil
		action: #garbageCollect)
			borderWidth: 2;
			borderColor: #raised;
			color: Color green muchLighter;
			label: 'GC';
			useRoundedCorners;
			vResizing: #spaceFill;
			hResizing: #shrinkWrap;
			setBalloonText: 'Garbage Collect';
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			startSteppingSelector: #update:;
			yourself.
