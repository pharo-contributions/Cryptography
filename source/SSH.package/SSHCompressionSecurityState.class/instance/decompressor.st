converting
decompressor

	^ SSHDecompressor new
		compressionState: self;
		yourself