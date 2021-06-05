tests-Getting Started
testFileShortcuts
	| materializedString |
	FLSerializerConfiguration new
		fileName: 'demo.fuel';
		object: 'stringToSerialize';
		serialize.
	materializedString := FLMaterializerConfiguration new
		fileName: 'demo.fuel';
		materialize.
	self assert: materializedString equals: 'stringToSerialize'