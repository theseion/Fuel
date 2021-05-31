creating
newClassWithClassVariableNames: aString

	^ self 
		newSubclassOf: self defaultSuperclass
		instanceVariableNames: ''
		classVariableNames: aString