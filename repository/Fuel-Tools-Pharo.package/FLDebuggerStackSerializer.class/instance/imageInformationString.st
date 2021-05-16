private
imageInformationString
	^ String streamContents: [ :stream |
		stream	
			nextPutAll: 'Image: ';
			nextPutAll:  SystemVersion current version asString;
			nextPutAll: ' [';
			nextPutAll: Smalltalk lastUpdateString asString;
			nextPutAll: ']' ]