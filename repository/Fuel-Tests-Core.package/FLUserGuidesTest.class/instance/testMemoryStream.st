tests-Getting Started
testMemoryStream
	| anArray materializedString |
	anArray := FLSerializer serializeToByteArray: 'stringToSerialize'.
	materializedString := FLMaterializer
		materializeFromByteArray: anArray.
	self assert: materializedString equals: 'stringToSerialize'