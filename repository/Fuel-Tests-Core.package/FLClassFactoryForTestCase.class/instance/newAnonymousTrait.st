creating-traits-anonymous
newAnonymousTrait
	^ Smalltalk anonymousClassInstaller make: [ :builder |
		builder
			"The name is necessary to not break Pharo"
			name: self defaultNewTraitName;
			beTrait ]