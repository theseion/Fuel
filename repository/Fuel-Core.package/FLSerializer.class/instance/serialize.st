serializing
serialize
	"Serialize the graph starting at the root object received and answers the FLSerialization object"
	^ self configuration streamDo: [ :stream |
		self configuration hasMultipleObjects
			ifFalse: [ self basicSerializeOn: stream ]
			ifTrue: [
				self configuration object do: [ :object |
					FLCurrentConfiguration
						value: (self configuration copy
							object: object;
							yourself)
						during: [ self basicSerializeOn: stream ] ] ] ]