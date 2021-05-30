class-factory
newAnonymousClassOrTrait
	| newTrait |	
	newTrait := Smalltalk anonymousClassInstaller make: [ :aBuilder | 
		aBuilder
			name: self classFactory newClassName;
			beTrait;
			package: (self classFactory packageName, '-', self classFactory defaultCategory) asSymbol ].	
		
	self registerBehavior: newTrait.
	^ newTrait