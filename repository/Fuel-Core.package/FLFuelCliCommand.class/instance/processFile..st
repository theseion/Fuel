execution
processFile: aFileReference

	self context stdout
		nextPutAll: 'Materializing from file: ';
		nextPutAll: aFileReference fullName;
		lf.
	FLMaterializer new
		filePath: aFileReference pathString;
		materializeRoot.
	self context stdout
		nextPutAll: 'Materialization finished';
		lf