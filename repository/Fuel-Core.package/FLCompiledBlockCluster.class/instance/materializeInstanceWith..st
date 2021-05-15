serialize/materialize
materializeInstanceWith: aDecoder
	| instance size header |
	header := self decodeHeaderWith: aDecoder.
	size := aDecoder nextEncodedUint32.
	
	instance := CompiledBlock
		newMethod: size
		header: header.
	instance initialPC
		to: instance endPC
		do: [ :index |
			instance
				at: index
				put: aDecoder nextEncodedByte ].
	^ instance