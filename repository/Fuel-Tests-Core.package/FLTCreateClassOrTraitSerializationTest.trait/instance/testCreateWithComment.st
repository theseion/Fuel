tests
testCreateWithComment
	"Tests materialization of the comment of a class or trait not defined in the image."
	
	| aClassOrTrait materializedClassOrTrait |	
	aClassOrTrait := self newClass.
	aClassOrTrait comment: 'test comment' stamp: 'test stamp'.
	
	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self assert: 'test comment' = materializedClassOrTrait comment asString.
	self assert: 'test stamp' = materializedClassOrTrait organization commentStamp.