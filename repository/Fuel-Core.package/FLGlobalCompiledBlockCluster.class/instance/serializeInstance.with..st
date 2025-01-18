serialize/materialize
serializeInstance: aCompiledBlock with: anEncoder
	"The method will be looked up on the existing class upon materialization
	and the block:
	  - will be compiled as part of that method (possibly with a different set of instructions than this one but that's expected behavior).
	  - or the method will have a Clean Block with the compiled block inside (that's why we save the full path from the method)
	See #testBlockClosureChangeDifferendBytecodes and #testBlockClosureChangeSameBytecodes on FLBlockClosureSerializationTest."

	| method path |
	method := aCompiledBlock method.
	self serializeGlobalClass: aCompiledBlock methodClass on: anEncoder.
	path := aCompiledBlock pathOfLiteralIndexes.
	anEncoder
		encodeString: method selector;
		encodeUint8: path size;
		encodeBytes: path