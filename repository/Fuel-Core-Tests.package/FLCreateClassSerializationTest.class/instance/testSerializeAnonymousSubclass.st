tests-bugs
testSerializeAnonymousSubclass
	| anonymous |
	anonymous := self classFactory newAnonymousClass.
	
	self
		shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: {anonymous} ]
		raise: FLObjectNotFound