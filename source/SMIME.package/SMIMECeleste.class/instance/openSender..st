sending mail
openSender: initialText
	| msg to subject body |
	msg := MailMessage from: initialText.
	to := msg to.
	subject := msg subject.
	body := msg bodyText.
	SMIMECelesteComposition new
		celeste: self to: to subject: subject initialText: body;
		openInMorphic.
