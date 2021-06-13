serializing
serialize
	(FLCurrentConfiguration value isMemberOf: self class) ifTrue: [
		"prevent recursion"
		^ self ].
	
	self object: FLHeader forSerialization.
	
	super serialize