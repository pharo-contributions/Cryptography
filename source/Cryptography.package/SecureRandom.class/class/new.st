instance creation
new
	^ self key: (RandomPool default next: 64)