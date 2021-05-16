class-factory
newSubclassNamed: nameString of: aClass  instanceVariableNames: ivNamesString classVariableNames: classVarsString
	| class |
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		class := self class classInstaller make: [ :aBuilder | 
			aBuilder 
				name: nameString;
				superclass: aClass;
				slots: ivNamesString asSlotCollection;
				sharedVariablesFromString: classVarsString ] ].
	self classFactory createdClasses add: class.
	^ class