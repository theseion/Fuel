tests
testAnonymousObjectIsSerializable
	| class |
	class := self classFactory newAnonymousClass.
	self deny: (self environmentOfTest includes: class).
	
	self serialize: class new.
	self
		shouldnt: [ self materialized ]
		raise: FLClassNotFound