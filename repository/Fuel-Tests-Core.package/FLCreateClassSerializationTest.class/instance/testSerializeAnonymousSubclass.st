tests-bugs
testSerializeAnonymousSubclass
	| anonymous |
	anonymous := Object newAnonymousSubclass.
	
	self
		shouldnt: [ self resultOfSerializeRemoveAndMaterializeAll: {anonymous} ]
		raise: FLObjectNotFound