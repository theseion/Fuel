private
vmInformationString
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'VM: ';
			nextPutAll: Smalltalk os name asString;
			nextPutAll: ' - ';	
			nextPutAll: Smalltalk os subtype asString;
			nextPutAll: ' - ';
			nextPutAll: Smalltalk os version asString;
			nextPutAll: ' - ';
			nextPutAll: Smalltalk vm version asString ]