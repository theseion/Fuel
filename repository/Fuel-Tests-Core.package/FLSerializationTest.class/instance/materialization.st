helpers
materialization
	
	self streamFactory readStreamDo: [:aStream |
		^ self materializer materializeFrom: aStream ]