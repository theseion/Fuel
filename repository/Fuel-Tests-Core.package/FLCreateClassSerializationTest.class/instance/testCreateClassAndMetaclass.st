tests
testCreateClassAndMetaclass
	"Tests materialization a class or trait not defined in the image and that the metaclass is also created."

	| class materializedClassOrTrait environment category name metaclassName metaclass |
	class := self classFactory silentlyNewClass.
	environment := class environment.
	category := class category.
	name := class name.
	metaclassName := class class name.
	metaclass := class class.
	
	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: class.
	
	self assert: environment == materializedClassOrTrait environment.
		"Classes are not direclty inserted in the system organization so we can only test #basicCategory and not #category."
	self assert: category = materializedClassOrTrait basicCategory.
	self assert: name = materializedClassOrTrait name.
	"Notice that the metaclass is serialized by Fuel and a new one will be created."
	self assert: metaclassName = materializedClassOrTrait class name.
	self deny: metaclass == materializedClassOrTrait class.

    "It is important to notice that (at this moment) Fuel does not add the materialized class or trait into Smalltalk globals"
    self should: [Smalltalk at: name] raise: Error.
