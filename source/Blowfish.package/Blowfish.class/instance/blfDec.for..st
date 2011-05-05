as yet unclassified
blfDec: dataArray for: blocks
	| j newDataArray |
	newDataArray := Array new: dataArray size.
	j := 1.
	(1 to: blocks)
		do: [ :each | 
			xl := dataArray at: j.
			xr := dataArray at: j + 1.
			self decipher.
			newDataArray at: j put: xl.
			newDataArray at: j + 1 put: xr.
			j := j + 2 ].
	^ newDataArray