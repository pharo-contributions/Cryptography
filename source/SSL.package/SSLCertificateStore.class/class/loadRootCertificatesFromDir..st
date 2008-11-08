root certs
loadRootCertificatesFromDir: aPathString

	"
	SSLCertificateStore loadRootCertificatesFromDir: 'C:\Certs\'
	(FileDirectory on: 'C:\Certs\') fileNames
	"
	| aListOfFiles aLocalName |
	aListOfFiles := FileDirectory on: aPathString.
	aListOfFiles 
		withAllFilesDo:  
			[ :stream |
			aLocalName := stream localName. 
			((aLocalName copyFrom: (aLocalName size -4)
							 to: (aLocalName size)) = '.crt') 
				ifTrue:
				[
				self class
					compile: 
						((self makeMethodText: (aLocalName)), 
						stream contentsOfEntireFile, $')
					classified: self certCategoryName. 
				].
			]
		andDirectoriesDo: [:aDir | nil.].
		