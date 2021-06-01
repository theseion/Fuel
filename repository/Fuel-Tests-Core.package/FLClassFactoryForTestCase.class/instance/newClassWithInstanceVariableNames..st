creating
newClassWithInstanceVariableNames: aString

	^ self 
		newSubclassOf: self defaultSuperclass
		instanceVariableNames: aString
		classVariableNames: ''