materializing
materializeHeader
	| aDecoder |
	aDecoder := FLDecoder new.
	self verifySignatureFrom: aDecoder.
	self verifyVersionFrom: aDecoder.
	^ self decodeHeaderWith: aDecoder