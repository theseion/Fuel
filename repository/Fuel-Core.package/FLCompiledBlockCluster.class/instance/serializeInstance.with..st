serialize/materialize
serializeInstance: aCompiledBlock with: anEncoder
	| header bytecode |
	bytecode := aCompiledBlock bytecode.
	header := aCompiledBlock header.

	self
		encodeHeader: header
		with: anEncoder.
	anEncoder
		encodeUint32: bytecode basicSize;
		encodeBytes: bytecode