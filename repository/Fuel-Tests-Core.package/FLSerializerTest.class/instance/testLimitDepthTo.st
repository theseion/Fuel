tests-configuring
testLimitDepthTo
	self deny: self serializer hasDepthLimit.

	self serializer limitDepthTo: -4.
	self deny: self serializer hasDepthLimit.
	
	self serializer limitDepthTo: 0.
	self deny: self serializer hasDepthLimit.
	
	self serializer limitDepthTo: 1.
	self assert: self serializer hasDepthLimit