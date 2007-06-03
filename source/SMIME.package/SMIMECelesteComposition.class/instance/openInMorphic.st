api
openInMorphic
	"open an interface for sending a mail message with the given initial 
	text "
	| textMorph buttonsList toFrame subjectFrame toField subjectField textFrame attachmentsFrame attachmentsField securityFrame mainFrame |
	morphicWindow := SystemWindow labelled: 'Mister SMIME Postman'.
	morphicWindow model: self.

	buttonsList := AlignmentMorph newRow color: Color veryLightGray.
	buttonsList wrapCentering: #center; cellPositioning: #leftCenter.
	buttonsList
		addMorphBack: ((AlignmentMorph newColumn color: Color veryLightGray)
			wrapCentering: #center; cellPositioning: #topCenter;
			addMorph: (SimpleButtonMorph new 
				color: Color veryLightGray;
				target: self; 
				actionSelector: #submit;
				label: 'send';
				setBalloonText: 'send this message')).
	buttonsList
		addMorphBack: ((AlignmentMorph newColumn color: Color veryLightGray)
			wrapCentering: #center; cellPositioning: #topCenter;
			addMorph: (SimpleButtonMorph new 
				color: Color veryLightGray;
				target: self; 
				actionSelector: #addAttachment;
				label: 'add attachment';
				setBalloonText: 'Send a file with the message')).
	buttonsList
		addMorphBack: ((AlignmentMorph newColumn color: Color veryLightGray)
			wrapCentering: #center; cellPositioning: #topCenter;
			addMorph: (SimpleButtonMorph new 
				color: Color veryLightGray;
				target: self; 
				actionSelector: #forgetIt;
				label: 'cancel';
				setBalloonText: 'forget about sending this message')).

	toFrame := AlignmentMorph newRow color: Color veryLightGray.
	toFrame wrapCentering: #center; cellPositioning: #leftCenter.
	toFrame
		addMorphBack: ((StringMorph contents: 'To:') lock).
	toFrame
		addMorphBack: ((toField := PluggableTextMorph
			on: self
			text: #to
			accept: #to:) hResizing: #spaceFill; vResizing: #rigid; height: 2; hideScrollBars; yourself).

	subjectFrame := AlignmentMorph newRow color: Color veryLightGray.
	subjectFrame wrapCentering: #center; cellPositioning: #leftCenter.
	subjectFrame
		addMorphBack: ((StringMorph contents: 'Subject:') lock).
	subjectFrame
		addMorphBack: ((subjectField := PluggableTextMorph
			on: self
			text: #subject
			accept: #subject:) hResizing: #spaceFill; vResizing: #rigid; height: 2; hideScrollBars; yourself).

	attachmentsFrame := AlignmentMorph newRow color: Color veryLightGray.
	attachmentsFrame wrapCentering: #center; cellPositioning: #leftCenter.
	attachmentsFrame
		addMorphBack: ((StringMorph contents: 'Attachments:') lock).
	attachmentsFrame
		addMorphBack: ((attachmentsField := PluggableTextMorph
			on: self
			text: #attachmentsText
			accept: #attachmentsText:) hResizing: #spaceFill; vResizing: #rigid; height: 20; hideScrollBars; yourself).

	securityFrame := AlignmentMorph newRow color: Color veryLightGray.
	securityFrame wrapCentering: #center; cellPositioning: #leftCenter.
	securityFrame
		addMorphBack: (UpdatingThreePhaseButtonMorph checkBox
			target: self;
			actionSelector: #toggleEncrypted;
			getSelector: #shouldEncrypt).
	securityFrame
		addMorphBack: ((StringMorph contents: 'encrypt      ') lock).
	securityFrame
		addMorphBack: (UpdatingThreePhaseButtonMorph checkBox
			target: self;
			actionSelector: #toggleSign;
			getSelector: #shouldSign).
	securityFrame
		addMorphBack: ((StringMorph contents: 'sign') lock).


	textFrame := AlignmentMorph newRow color: Color veryLightGray.
	textFrame wrapCentering: #center; cellPositioning: #leftCenter.
	textFrame
		addMorphBack: (textMorph := (PluggableTextMorph
			on: self
			text: #messageText
			accept: #messageText:)
				hResizing: #spaceFill;
				vResizing: #rigid;
				height: 150;
				yourself).

	textFields := {toField. subjectField. attachmentsField. textMorph}.

	mainFrame := (AlignmentMorph newColumn color: Color veryLightGray)
		wrapCentering: #center; cellPositioning: #topCenter;
		addMorphBack: buttonsList;
		addMorphBack: toFrame;
		addMorphBack: subjectFrame;
		addMorphBack: attachmentsFrame;
		addMorphBack: securityFrame;
		addMorphBack: textFrame;
		yourself.

	morphicWindow addMorph: mainFrame frame: (0 @ 0 extent: 1 @ 1).
	morphicWindow openInMVC