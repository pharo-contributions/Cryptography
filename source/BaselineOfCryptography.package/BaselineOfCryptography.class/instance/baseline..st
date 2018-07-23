baselines
baseline: spec     
	<baseline>
        
	spec for: #common do: [
		spec package: 'Cryptography'.
		
		spec
			group: 'default' with: #('all');
			group: 'all' with: #('Cryptography')
	].