protected
encodeHeaderWith: anEncoder
	<todo: 'fix how header is encoded'>
	anEncoder encodeByte: (header isEmpty ifTrue: [0] ifFalse: [1]).

	header isEmpty ifTrue: [ ^ self ].
	
	FLCurrentConfiguration
		value: (self configuration copy
			object: header;
			yourself)
		during: [ FLSerialization runWith: anEncoder ]