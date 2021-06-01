classes and traits
removeKey: aKey
	^ overlay
		at: aKey
		ifPresent: [
			overlay
				at: aKey
				put: sentinel ]
		ifAbsent: [
			environment
				at: aKey
				ifPresent: [
					overlay
						at: aKey
						put: sentinel ]
				ifAbsent: [
					KeyNotFound signalFor: aKey ] ]