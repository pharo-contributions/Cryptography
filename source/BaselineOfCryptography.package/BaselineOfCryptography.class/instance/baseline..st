baselines
baseline: spec     
	<baseline>
        
	spec for: #common do: [
		spec package: 'Cryptography'.
		spec package: 'ASN1'.
		spec package: 'X509' with: [ spec requires: #(#'Cryptography' #'ASN1' )].
		
		spec
			group: 'default' with: #('all');
			group: 'all' with: #('Cryptography')
	].