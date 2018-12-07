tests
testDoIt
	"Serialization of DoIt methods should be possible by default.
	Note: apparently this test didn't use to terminate some times."

	| context |
	self timeLimit: 30 seconds.
	[ Smalltalk compiler evaluate: 'self error' ]
		on: Error
		do: [ :error | context := error signalerContext copyStack ].
	self serialize: context