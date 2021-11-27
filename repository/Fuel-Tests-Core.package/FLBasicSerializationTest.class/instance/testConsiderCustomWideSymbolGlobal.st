tests-globals
testConsiderCustomWideSymbolGlobal
	"The same than #testConsiderCustomGlobal but with a WideSymbol."
	
	| aWideSymbol aPerson |
	aWideSymbol := (WideString streamContents: [ :stream |
		256 to: 280 do: [ :code | stream nextPut: code asCharacter ] ]) asSymbol.

	self analyzer considerGlobal: aWideSymbol.

	aPerson := FLPerson new.	
	[ 
		testingEnvironment at: aWideSymbol put: aPerson.
		self
			shouldnt: [ self resultOfSerializeAndMaterialize: aPerson ]
			raise: Error
	] ensure: [ 
		testingEnvironment removeKey: aWideSymbol ].