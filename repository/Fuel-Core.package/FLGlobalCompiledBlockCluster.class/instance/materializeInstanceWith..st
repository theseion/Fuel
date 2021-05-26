serialize/materialize
materializeInstanceWith: aDecoder
	| methodClass selector method literalIndex |
	methodClass := self materializeGlobalClassFrom: aDecoder.
	selector := aDecoder nextEncodedString asSymbol.
	literalIndex := aDecoder nextEncodedUint8.
	
	"It's ok if the method was changed or removed."
	method := methodClass  
		compiledMethodAt: selector
		ifAbsent: [ ^ nil ].
	^ literalIndex > method numLiterals
		ifTrue: [ nil ]
		ifFalse: [ method literalAt: literalIndex ]