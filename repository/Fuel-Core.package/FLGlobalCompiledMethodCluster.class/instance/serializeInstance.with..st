serialize/materialize
serializeInstance: aCompiledMethod with: anEncoder
	self
		serializeGlobalClass: aCompiledMethod methodClass
		on: anEncoder.
	anEncoder
		encodeString: aCompiledMethod selector;
		encodeUint16: aCompiledMethod bytecodesHash