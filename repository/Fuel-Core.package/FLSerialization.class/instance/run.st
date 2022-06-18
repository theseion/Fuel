serializing
run
	"Serialize the graph starting at the root object received and answers the FLSerialization object"
	^ self configuration hasMultipleObjects
		ifFalse: [ self runSteps ]
		ifTrue: [
			| numberOfObjects |
			numberOfObjects := self context object size.
			self context object withIndexDo: [ :object :index |
				FLContext new
					stream: self context stream;
					object: object;
					shouldFinalizeStream: index = numberOfObjects;
					useDuring: [ self runSteps ] ] ]