*smime-printing
printMIMEDayDateAndTime

	^ self dayOfWeekAbbreviation, 
		', ', 
		(self asDate printFormat: #(1 2 3 $  2 1)), 
		' ', 
		self asTime print24, 
		' ', 
		self offset printOffset.
