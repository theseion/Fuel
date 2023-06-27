renaming-silently
silentlyRename: aClass to: aName
	^ self silentlyDo: [ aClass rename: aName asSymbol ]