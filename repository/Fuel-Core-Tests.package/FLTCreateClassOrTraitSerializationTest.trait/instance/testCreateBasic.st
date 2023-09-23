tests
testCreateBasic
	"Tests materialization of a class or trait not defined in the image."

	| aClassOrTrait materializedClassOrTrait environment category name |
	aClassOrTrait := self newClassOrTrait.
	environment := aClassOrTrait environment.
	category := aClassOrTrait category.
	name := aClassOrTrait name.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self deny: aClassOrTrait identicalTo: materializedClassOrTrait.
	self assert: environment identicalTo: materializedClassOrTrait environment.
	self assert: category equals: materializedClassOrTrait category.
	self assert: name equals: materializedClassOrTrait name.

	"It is important to notice that Fuel does not add the materialized class or trait into Smalltalk globals."
	self deny: (self environmentOfTest includesKey: name)