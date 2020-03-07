accessing
nextIndexPut: v
	1 to: digits do: [ :i | stream nextPut: (v byteAt: digits + 1 - i) ]