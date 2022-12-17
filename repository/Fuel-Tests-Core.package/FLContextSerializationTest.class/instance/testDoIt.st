tests
testDoIt

	"Serialization of DoIt methods should be possible by default.
	Note: we store the context as a global instead of using a local variabl
			to avoid the creation of a closure that will include the test instance.
			If that happened it can pull in most of the image, depending on how the
			test was executed.
	Note: we run the evaluation in a separate process to minimize the number of
			contexts that will be serialized (potentially pulling in a large number
			of additional objects). In addition, we cut away some of the bottom
			contexts to reduce the number of serialized objects."

	[ [ Smalltalk compiler evaluate: 'self error' ]
		on: Error
		do: [ :error | 
			| bottomContext |
			bottomContext := error signalerContext findContextSuchThat: [ :ctxt | 
				ctxt selector = #evaluate: ].
			self environmentOfTest
				at: #FLGlobalVariableForTesting
				put: (error signalerContext cut: bottomContext) copyStack ] ]	forkAndWait.

	self serialize: (self environmentOfTest at: #FLGlobalVariableForTesting)