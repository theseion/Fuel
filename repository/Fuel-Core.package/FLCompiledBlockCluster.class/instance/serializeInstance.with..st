serialize/materialize
serializeInstance: aCompiledBlock with: anEncoder
	| header bytecode |
	bytecode := aCompiledBlock bytecodes.
	header := aCompiledBlock header.

	self
		encodeHeader: header
		with: anEncoder.
	anEncoder
		encodeUint32: bytecode basicSize;
		encodeBytes: bytecode