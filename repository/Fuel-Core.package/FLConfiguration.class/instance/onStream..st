configuring-convenience
onStream: aStream
	"Takes a stream to use for serialization or materialization.
	
	This method allows the same serialization / materialization to be reused with
	different streams.
	
	It is the responsibility of the sender to close the stream."

	aStream isStream ifFalse: [ FLConfigurationError signal: 'Argument is not a stream.' ].
	
	map
		removeKey: #streamFactory ifAbsent: [ ];
		removeKey: #streamFinalizer ifAbsent: [ ].
		
	self
		streamFactory: [ aStream ];
		streamFinalizer: [ :stream | "do not close the stream" ]