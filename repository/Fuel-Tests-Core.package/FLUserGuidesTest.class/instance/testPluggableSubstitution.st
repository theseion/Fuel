tests-Customizing Graph
testPluggableSubstitution
	| objectToSerialize materializedObject |
	objectToSerialize := Array with: 'hello' with: '' writeStream.
	FLSerializer new
		when: [ :o | o isStream ] substituteBy: [ :o | nil ];
		object: objectToSerialize;
		fileName: 'demo.fuel';
		serialize.
	materializedObject := FLMaterializer new
		fileName: 'demo.fuel';
		materializeRoot.
		
	self
		assert: materializedObject
		equals: (Array with: 'hello' with: nil)