tests
testLessThanOrEqual
	| version1 version2 |
	version1 := FLVersion
		newWithMajor: 3
		minor: 4
		patch: 5.
	version2 := FLVersion
		newWithMajor: 3
		minor: 4
		patch: 5.
		
	self assert: version1 <= version1.
	self assert: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 4
		minor: 4
		patch: 5.
	self assert: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 2
		minor: 4
		patch: 5.
	self deny: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 3
		minor: 5
		patch: 5.
	self assert: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 3
		minor: 3
		patch: 5.
	self deny: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 3
		minor: 4
		patch: 6.
	self assert: version1 <= version2.
	
	version2 := FLVersion
		newWithMajor: 3
		minor: 4
		patch: 4.
	self deny: version1 <= version2