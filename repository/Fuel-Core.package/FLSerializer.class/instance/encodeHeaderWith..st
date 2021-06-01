protected
encodeHeaderWith: anEncoder
	| headerSerializer |
	"todo: fix how header is encoded"
	anEncoder encodeByte: (header isEmpty ifTrue: [0] ifFalse: [1]).

	header isEmpty ifTrue: [ ^ self ].
	
	headerSerializer := self class newDefault.
	headerSerializer analyzer
		globalSymbols: self analyzer globalSymbols;
		globalEnvironment: self analyzer globalEnvironment;
		yourself.
		
	headerSerializer serializationFactory value: header value: anEncoder