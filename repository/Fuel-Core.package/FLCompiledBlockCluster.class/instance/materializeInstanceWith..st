serialize/materialize
materializeInstanceWith: aDecoder

	| compiledBlock header size |

	header := aDecoder nextEncodedInt64.
	size := aDecoder nextEncodedUint16.

	compiledBlock := CompiledBlock newMethod: size header: header.

	compiledBlock initialPC to: compiledBlock size
		do: [ :index | compiledBlock at: index put: aDecoder nextEncodedByte ].
		
	^ compiledBlock