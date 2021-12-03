tests-Getting Started
testFileShortcuts
	| materializedString |
	FLSerializer new
		filePath: 'demo.fuel';
		object: 'stringToSerialize';
		serialize.
	materializedString := FLMaterializer new
		filePath: 'demo.fuel';
		materializeRoot.
	self assert: materializedString equals: 'stringToSerialize'