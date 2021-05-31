serializing-shortcuts
serializeToByteArray: anObject
	"No stream is needed by the user. An internal in-memory stream will be used. This method returns a ByteArray representing the serialization"
	
	^ ByteArray
		new: 100
		streamContents: [ :stream |
			self
				serialize: anObject
				on: stream ]