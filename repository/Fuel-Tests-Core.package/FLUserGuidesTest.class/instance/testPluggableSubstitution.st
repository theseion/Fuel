tests-Customizing Graph
testPluggableSubstitution
	| objectToSerialize materializedObject |
	objectToSerialize := Array with: 'hello' with: '' writeStream.
	FLSerializerConfiguration new
		when: [ :o | o isStream ] substituteBy: [ :o | nil ];
		object: objectToSerialize;
		fileName: 'demo.fuel';
		serialize.
	materializedObject := FLMaterializerConfiguration new
		fileName: 'demo.fuel';
		materialize.
		
	self
		assert: materializedObject
		equals: (Array with: 'hello' with: nil)