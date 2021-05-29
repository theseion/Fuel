class-factory
newAnonymousClassOrTrait
	| newClass |	
	newClass := Smalltalk anonymousClassInstaller make: [ :aBuilder | 
		aBuilder
			name: self classFactory newClassName;
			superclass: Object;
			package: (self classFactory packageName, '-', self classFactory defaultCategory) asSymbol ].	
		
	self registerBehavior: newClass.
	^ newClass