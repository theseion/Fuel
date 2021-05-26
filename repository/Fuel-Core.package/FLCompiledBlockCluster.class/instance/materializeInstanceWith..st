serialize/materialize
materializeInstanceWith: aDecoder
	| instance size header initialPC |
	header := self decodeHeaderWith: aDecoder.
	size := aDecoder nextEncodedUint32.

	instance := CompiledBlock
		newMethod: size
		header: header.
	initialPC := instance initialPC.
	initialPC
		to: initialPC + size - 1
		do: [ :index |
			instance
				at: index
				put: aDecoder nextEncodedByte ].
	^ instance