as yet unclassified
blfEnc: dataArray for: blocks
	| j newDataArray |
	newDataArray := dataArray copy.
	j := 1.
	(1 to: blocks)
		do: [ :each | 
			xl := newDataArray at: j.
			xr := newDataArray at: j + 1.
			self encipher.
			newDataArray at: j put: xl.
			newDataArray at: j + 1 put: xr.
			j := j + 2 ].
	^ newDataArray