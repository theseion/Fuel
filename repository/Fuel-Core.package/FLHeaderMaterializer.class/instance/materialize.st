serializing
materialize
	| materializedObjects |
	(FLCurrentConfiguration value isMemberOf: self class) ifTrue: [
		"prevent recursion"
		^ FLCurrentContext value materializedObjects
			addRoot: FLHeader forMaterialization;
			yourself ].
	
	
	
	materializedObjects := super materialize.
	materializedObjects root ifNil: [
		materializedObjects addRoot: FLHeader forMaterialization ].
	^ materializedObjects