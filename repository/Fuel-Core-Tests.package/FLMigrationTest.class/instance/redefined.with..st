running
redefined: aClass with: instanceVariableNames
	| name |
	name := aClass name.
	self classFactory deleteBehavior: aClass.
	"In this case we need to create a class with notifications"
	^ self classFactory
		silentlyRename: (self classFactory newClassWithInstanceVariableNames: instanceVariableNames)
		to: name