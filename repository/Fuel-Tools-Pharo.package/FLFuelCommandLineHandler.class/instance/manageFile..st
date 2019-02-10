manage
manageFile: aFileReference
	Stdio stdout
		nextPutAll: 'Materializing from file: ';
		nextPutAll: aFileReference fullName;
		lf.
	aFileReference readStreamDo: [ :stream |
		stream binary.
		FLMaterializer new materializeFrom: stream ].
	Stdio stdout
		nextPutAll: 'Materialization finished';
		lf