tests
testDoesNotCreatePackage
	"Tests materialization of a package not defined in the image."

	| undefinedPackage aClassOrTrait materializedClassOrTrait package packageTag wasSilent |
	undefinedPackage := self packageOrganizer undefinedPackage.
	aClassOrTrait := self newClassOrTrait.
	package := aClassOrTrait package.
	packageTag := aClassOrTrait packageTag.
	
	self deny: package identicalTo: undefinedPackage.

	self fullySerialize: aClassOrTrait.
	wasSilent := self classFactory createdSilently includes: aClassOrTrait.
	self classFactory delete: aClassOrTrait.
	
	package removeFromSystem.
	self deny: (self packageOrganizer hasPackage: package).
	
	materializedClassOrTrait := self materializeSilently: wasSilent.

	self deny: package identicalTo: materializedClassOrTrait package.
	self assert: materializedClassOrTrait package identicalTo: undefinedPackage.
	self deny: packageTag name equals: materializedClassOrTrait packageTag name.
	self assert: materializedClassOrTrait packageTag identicalTo: undefinedPackage undefinedTag