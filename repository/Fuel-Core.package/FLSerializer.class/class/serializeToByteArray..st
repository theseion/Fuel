convenience
serializeToByteArray: anObject
	^ ByteArray
		new: 100
		streamContents: [ :stream |
			self new
				object: anObject;
				onStream: stream;
				serialize ]