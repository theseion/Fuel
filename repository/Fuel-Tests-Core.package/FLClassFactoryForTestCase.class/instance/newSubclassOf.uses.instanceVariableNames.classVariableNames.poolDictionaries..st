creating
newSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames: classVarsString poolDictionaries: poolNamesString
	| newClass |		
	newClass := self class classInstaller make: [ :aBuilder | 
		aBuilder 
			environment: self environment;
			name: self defaultNewClassName;
			superclass: aClass;
			traitComposition: aTraitComposition asTraitComposition;
			classTraitComposition: aTraitComposition asTraitComposition classComposition;
			slots: ivNamesString asSlotCollection;
			sharedVariablesFromString: classVarsString;
			sharedPools: poolNamesString;
			package: self defaultPackageAndTag ].	
		
	self createdClasses add: newClass.
	^ newClass