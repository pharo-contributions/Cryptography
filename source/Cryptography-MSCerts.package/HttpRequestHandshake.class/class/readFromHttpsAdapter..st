instance creation
readFromHttpsAdapter: aHttpsAdapter

	^self new httpsAdapter: aHttpsAdapter; initializeFromStream: aHttpsAdapter readStream.