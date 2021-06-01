testing
expectedFailures
	^ #(
		"Global values are expected to be of type String. We'd need to modify string
		encoding to support String and WideString or treat the value as an arbitrary
		object and let the engine decide how to serialize."
		testWideStringGlobal
		testConsiderCustomWideSymbolGlobal
		testWideStringClassName)