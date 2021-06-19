tests
testWhenSubstituteBy
	| condition substitute substitution |
	condition := [ :x | x - 3 ].
	substitute := [ :y | 1 + 2 ].
	self assert: self serializer substitutions isEmpty.
	
	self serializer
		when: condition
		substituteBy: substitute.
		
	self deny: self serializer substitutions isEmpty.
	self assert: self serializer substitutions size equals: 1.
	
	substitution := self serializer substitutions anyOne.
	self assert: substitution key compiledBlock identicalTo: condition compiledBlock.
	self assert: substitution value compiledBlock identicalTo: substitute compiledBlock