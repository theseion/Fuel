samples
wideCharacters

	^ self byteCharacters collectWithIndex: [:char :i | (char asciiValue + 256 + (i \\ 16r3FFFFF)) asCharacter ]