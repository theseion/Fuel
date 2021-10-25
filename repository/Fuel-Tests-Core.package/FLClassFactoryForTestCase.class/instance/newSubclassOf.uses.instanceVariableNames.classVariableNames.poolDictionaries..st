creating
newSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames: classVarsString poolDictionaries: poolNamesString
	| newClass |		
	newClass := FLPlatform current
		newSubclassOf: aClass
		named: self defaultNewClassName
		uses: aTraitComposition
		instanceVariableNames: ivNamesString
		classVariableNames: classVarsString
		poolDictionaries: poolNamesString
		environment: self environment
		package: self defaultPackageAndTag.
		
	self createdClasses add: newClass.
	^ newClass