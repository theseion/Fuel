tests
testAnonymousBehaviorIsSerializable
	| classOrTrait |
	classOrTrait := self newAnonymousClassOrTrait.
	self deny: (self environmentOfTest includes: classOrTrait).
	
	self serialize: classOrTrait.
	self
		shouldnt: [ self materialized ]
		raise: FLClassNotFound