tests-configuring-globals
testLookUpInGlobalsMustBeGlobal
	| value |
	value := Object new.
	self serializer lookUpInGlobals: value.
	self
		should: [ self serializer serialize ]
		raise: FLConfigurationError.
		
	self environmentOfTest
		at: #aGlobal
		put: value.
	serializer := FLSerializer new
		streamFactory: [ ByteArray new writeStream ];
		object: Object new;
		lookUpInGlobals: value;
		yourself.
	self
		should: [ serializer serialize ]
		raise: FLConfigurationError.
		
	serializer := FLSerializer new
		streamFactory: [ ByteArray new writeStream ];
		object: Object new;
		environment: self environmentOfTest;
		lookUpInGlobals: value;
		yourself.
	self
		shouldnt: [ serializer serialize ]
		raise: FLConfigurationError