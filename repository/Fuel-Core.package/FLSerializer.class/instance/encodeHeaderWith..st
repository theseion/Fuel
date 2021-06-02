protected
encodeHeaderWith: anEncoder
	| headerSerializer |
	"todo: fix how header is encoded"
	anEncoder encodeByte: (header isEmpty ifTrue: [0] ifFalse: [1]).

	header isEmpty ifTrue: [ ^ self ].
	
	headerSerializer := self class new
		analyzer: self analyzer;
		yourself.
	headerSerializer serializationFactory value: header value: anEncoder