serialize/materialize
afterMaterializationStepWith: aDecoder

	aDecoder configuration isMethodChangedWarningDisabled ifTrue: [
		^ self ].

	objects do: [ :obj |
		(obj class == CleanBlockClosure and: [ obj compiledBlock isNil ])
			ifTrue: [ FLMethodChanged signalWithBlock: obj ] ]