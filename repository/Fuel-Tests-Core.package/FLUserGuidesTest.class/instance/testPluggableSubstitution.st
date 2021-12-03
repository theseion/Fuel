tests-Customizing Graph
testPluggableSubstitution
	| objectToSerialize materializedObject |
	objectToSerialize := Array with: 'hello' with: '' writeStream.
	FLSerializer new
		when: [ :o | o isStream ] substituteBy: [ :o | nil ];
		object: objectToSerialize;
		filePath: 'demo.fuel';
		serialize.
	materializedObject := FLMaterializer new
		filePath: 'demo.fuel';
		materializeRoot.
		
	self
		assert: materializedObject
		equals: (Array with: 'hello' with: nil)