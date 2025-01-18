serialize/materialize
materializeInstanceWith: aDecoder

	| methodClass selector method pathSize path theBlock |
	methodClass := self materializeGlobalClassFrom: aDecoder.
	selector := aDecoder nextEncodedString asSymbol.
	pathSize := aDecoder nextEncodedUint8.
	path := ByteArray new: pathSize.
	aDecoder nextEncodedBytesInto: path.

	"It's ok if the method was changed or removed."
	method := methodClass
		compiledMethodAt: selector
		ifAbsent: [
			FLMethodNotFound
				signalWith: methodClass name
				and: selector ].

	"Follow the saved path from the method to the compiled block"
	theBlock := method.
	path do: [ :index |
		theBlock := index = 0
			ifTrue: [
				"0 means it is in a Clean Block"
				theBlock compiledBlock ]
			ifFalse: [ theBlock literalAt: index ].
		"If at some point we find another object that is not a closure, we skip.
		Probably the code changed, we cannot get the block from old method."
		(theBlock isBlock or: [ theBlock isCompiledBlock ]) ifFalse: [ 
			"Do not throw an exception here, constant blocks are still possible to
				materialize as normal object."
			^ nil ] ].
	^ theBlock