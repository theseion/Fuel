creating
newClassWithInstanceVariableNames: aString classVariableNames: anotherString

	^ self 
		newSubclassOf: self defaultSuperclass
		instanceVariableNames: aString
		classVariableNames: anotherString