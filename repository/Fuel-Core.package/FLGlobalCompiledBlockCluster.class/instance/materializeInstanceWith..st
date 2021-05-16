serialize/materialize
materializeInstanceWith: aDecoder
	| methodClass selector method literalIndex |
	methodClass := self materializeGlobalClassFrom: aDecoder.
	selector := aDecoder nextEncodedString asSymbol.
	"It's ok if the method was changed or removed."
	method := methodClass  
		compiledMethodAt: selector
		ifAbsent: [ ^ nil ].
	literalIndex := aDecoder nextEncodedUint8.
	^ literalIndex > method numLiterals
		ifTrue: [ nil ]
		ifFalse: [ method literalsAt: literalIndex ]