protected
encodeHeaderWith: anEncoder
	<todo: 'fix how header is encoded'>
	anEncoder encodeByte: (header isEmpty ifTrue: [0] ifFalse: [1]).

	header isEmpty ifTrue: [ ^ self ].
	
	self configuration copy
		object: header;
		useDuring: [ FLSerialization runWith: anEncoder ]