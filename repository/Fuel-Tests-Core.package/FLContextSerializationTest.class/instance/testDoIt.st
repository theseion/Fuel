tests
testDoIt
	"Serialization of DoIt methods should be possible by default.
	Note: we store the context as a global instead of using a local variabl
			to avoid the creation of a closure that will include the test instance.
			If that happened it can pull in most of the image, depending on how the
			test was executed."

	[ [ Smalltalk compiler evaluate: 'self error' ]
		on: Error
		do: [ :error |
			self environmentOfTest
				at: #FLGlobalVariableForTesting
				put: error signalerContext copyStack ] ] forkAndWait.
		
	self serialize: (self environmentOfTest at: #FLGlobalVariableForTesting)