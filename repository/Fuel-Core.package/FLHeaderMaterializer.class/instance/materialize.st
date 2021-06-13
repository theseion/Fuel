serializing
materialize
	(FLCurrentConfiguration value isMemberOf: self class) ifTrue: [
		"prevent recursion"
		^ FLHeader forMaterialization ].
	
	^ super materialize
		ifNil: [ FLHeader forMaterialization ]
		ifNotNil: [ :header | header ]