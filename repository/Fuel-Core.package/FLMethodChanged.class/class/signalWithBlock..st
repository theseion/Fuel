signaling
signalWithBlock: aBlockWithoutOuterContext

	^ self signal: 'Clean block' , aBlockWithoutOuterContext
		  , ' cannot be materialized because its method was changed.'