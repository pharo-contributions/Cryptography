as yet unclassified
blfEcbEncrypt: dataArray for: times

 |  newDataArray |
newDataArray:=dataArray copy.

	(1 to: times by: 8) do:[ :each | 
		
		xl:=((((newDataArray at: 1) bitShift: 24) bitOr: ((newDataArray at: 2) bitShift: 16) )bitOr: ((newDataArray at: 3) bitShift: 8)) bitOr: (newDataArray at: 4).  
		xr:=((((newDataArray at: 5) bitShift: 24) bitOr: ((newDataArray at: 6) bitShift: 16) )bitOr: ((newDataArray at: 7) bitShift: 8)) bitOr: (newDataArray at: 8).
		
		self encipher .
		
		newDataArray at: 1 put: ((xl  bitShift: -24) bitAnd: 16rff).		
		newDataArray at: 2 put: ((xl  bitShift: -16) bitAnd: 16rff).	
		newDataArray at: 3 put: ((xl  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 4 put: (xl bitAnd: 16rff).
		newDataArray at: 5 put: ((xr  bitShift: -24) bitAnd: 16rff).	
		newDataArray at: 6 put: ((xr  bitShift: -16) bitAnd: 16rff).
		newDataArray at: 7 put: ((xr  bitShift: -8) bitAnd: 16rff).	
		newDataArray at: 8 put: (xr bitAnd: 16rff).	
		]	.
		
	^newDataArray 