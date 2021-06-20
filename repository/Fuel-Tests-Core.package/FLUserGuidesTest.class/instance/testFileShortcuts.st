tests-Getting Started
testFileShortcuts
	| materializedString |
	FLSerializer new
		fileName: 'demo.fuel';
		object: 'stringToSerialize';
		serialize.
	materializedString := FLMaterializer new
		fileName: 'demo.fuel';
		materializeRoot.
	self assert: materializedString equals: 'stringToSerialize'