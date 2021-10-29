serialize/materialize
materializeInstanceWith: aDecoder
	| methodClass selector method serializedHash |
	methodClass := self materializeGlobalClassFrom: aDecoder.
	selector := aDecoder nextEncodedString asSymbol.
	method := methodClass  
		compiledMethodAt: selector
		ifAbsent: [
			FLMethodNotFound
				signalWith: methodClass name
				and: selector ].
	
	serializedHash := aDecoder nextEncodedUint16.
	aDecoder configuration isMethodChangedWarningDisabled ifFalse: [
		method bytecodesHash = serializedHash ifFalse: [
			FLMethodChanged
				signalWith: methodClass name
				and: selector ] ].
	^ method