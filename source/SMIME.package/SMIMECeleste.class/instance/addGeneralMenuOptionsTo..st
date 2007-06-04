other
addGeneralMenuOptionsTo: aMenu 
	"add menu items that have no other home to aMenu"

	super addGeneralMenuOptionsTo: aMenu.
	aMenu addLine.
	aMenu add: 'load the SMIME owner cert' action: #loadSMIMEOwnerCert.
	aMenu add: 'append cert to SMIME owner cert chain' action: #appendCertToSMIMEOwnerCertChain.
	aMenu add: 'explore SMIME cert store' action: #exploreSMIMECertStore.
	^aMenu