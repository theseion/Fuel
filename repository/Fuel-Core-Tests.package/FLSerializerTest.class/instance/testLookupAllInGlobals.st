tests-configuring-globals
testLookupAllInGlobals
	| globals global1 global2 marge |
	global1 := Object new.
	global2 := Object new.
	marge := 'Marge'.
	globals := { Object. Class. Smalltalk. #World. global1. marge }.
	self serializer lookUpAllInGlobals: globals.
	self environmentOfTest
		at: #global1 put: global1;
		at: global2 put: marge.
	
	{
		#Object -> Object.
		#Class -> Class.
		#Smalltalk -> Smalltalk.
		#World -> World.
		#global1 -> global1.
		global2 -> marge
	} do: [ :assoc |
		self assert: (self serializer globals includesAssociation: assoc) ]