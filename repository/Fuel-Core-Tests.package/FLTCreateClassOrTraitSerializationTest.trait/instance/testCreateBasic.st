tests
testCreateBasic
	"Tests materialization of a class or trait not defined in the image."

	| aClassOrTrait materializedClassOrTrait environment name package packageTag |
	aClassOrTrait := self newClassOrTrait.
	environment := aClassOrTrait environment.
	package := aClassOrTrait package.
	packageTag := aClassOrTrait packageTag.
	name := aClassOrTrait name.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self deny: aClassOrTrait identicalTo: materializedClassOrTrait.
	self assert: environment identicalTo: materializedClassOrTrait environment.
	self assert: package identicalTo: materializedClassOrTrait package.
	self assert: packageTag name equals: materializedClassOrTrait packageTag name.
	self assert: name equals: materializedClassOrTrait name.

	"It is important to notice that Fuel does not add the materialized class or trait into Smalltalk globals."
	self deny: (self environmentOfTest includesKey: name)