accessing
printOn: aStream
	aStream
		print: self major;
		nextPut: $.;
		print: self minor;
		nextPut: $.;
		print: self patch