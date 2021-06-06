serializing
serialize
	"Serialize the graph starting at the root object received and answers the FLSerialization object"
	^ self configuration hasMultipleObjects
		ifFalse: [ self basicSerialize ]
		ifTrue: [
			self context object do: [ :object |
				FLContext new
					stream: self context stream;
					object: object;
					useDuring: [ self basicSerialize ] ] ]