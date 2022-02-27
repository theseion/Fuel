*Fuel-Core
serializeToFileNamed: aFilename
	^ FLSerializer new
		filePath: aFilename;
		object: self;
		serialize;
		yourself