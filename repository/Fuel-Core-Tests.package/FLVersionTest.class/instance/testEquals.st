tests
testEquals
	| version1 version2 |
	version1 := FLVersion
		newWithMajor: 5
		minor: 0
		patch: 6.
	version2 := FLVersion
		newWithMajor: 5
		minor: 0
		patch: 6.
		
	self assert: version1 equals: version1.
	self assert: version1 equals: version2