serialize/materialize
serializeInstance: aCompiledMethodToSerialize with: anEncoder
	| header bytecodesPlusTrailerSize cmSize cmInitialPC aCompiledMethod |
	aCompiledMethod := self class transformationForSerializing value: aCompiledMethodToSerialize.

	header := aCompiledMethod header.
	cmSize := aCompiledMethod size.
	cmInitialPC := aCompiledMethod initialPC.
	bytecodesPlusTrailerSize := cmSize - cmInitialPC + 1.

	self
		encodeHeader: header
		with: anEncoder.
	anEncoder encodeUint16: bytecodesPlusTrailerSize.	

	cmInitialPC
		to: cmSize
		do: [ :index |	anEncoder encodeByte: (aCompiledMethod at: index) ]