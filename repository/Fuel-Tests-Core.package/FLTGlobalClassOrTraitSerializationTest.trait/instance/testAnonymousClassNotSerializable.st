tests
testAnonymousClassNotSerializable
	| classOrTrait |
	classOrTrait := self newAnonymousClassOrTrait.
	self deny: (self environmentOfTest includes: classOrTrait).
	
	self serialize: classOrTrait.
	self
		should: [ self materialized ]
		raise: FLClassNotFound