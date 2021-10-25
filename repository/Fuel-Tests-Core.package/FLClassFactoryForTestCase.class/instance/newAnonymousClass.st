creating-anonymous
newAnonymousClass
	^ FLPlatform current
		newAnonymousSubclassOf: self defaultSuperclass
		named: 'ignored'