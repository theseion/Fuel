serialize/materialize
serializeInstance: aCompiledBlock with: anEncoder
	"The method will be looked up on the existing class upon materialization
	and the block will be compiled as part of that method (possibly with a different
	set of instructions than this one but that's expected behavior).
	
	See #testBlockClosureChangeDifferendBytecodes and #testBlockClosureChangeSameBytecodes
	on FLBlockClosureSerializationTest."
	| method literalIndex |
	method := aCompiledBlock method.
	literalIndex := method literals indexOf: aCompiledBlock.
	
	self
		serializeGlobalClass: aCompiledBlock methodClass
		on: anEncoder.
	anEncoder
		encodeString: method selector;
		encodeUint8: literalIndex