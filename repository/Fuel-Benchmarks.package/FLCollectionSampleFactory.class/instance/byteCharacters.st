samples
byteCharacters

	^ (1 to: self problemSize)
		collect: [ :i | Character value: (i \\ 256) ]