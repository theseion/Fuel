private-hacks
addAbstractBinaryFileStream
	Smalltalk
		at: #AbstractBinaryFileStream
		ifPresent: [ :x | ^ self ].
		
	Object
		subclass: #AbstractBinaryFileStream
		instanceVariableNames: ''
		classVariableNames: ''
		category: self hacksCategoryName