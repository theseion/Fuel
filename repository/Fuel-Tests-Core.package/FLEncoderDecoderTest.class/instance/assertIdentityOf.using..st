running
assertIdentityOf: aSmallInteger using: anArray
	stream resetToStart.
	
	encoder
		perform: anArray first with: aSmallInteger;
		flush.
	stream reset.
	self assert: (decoder perform: anArray second) identicalTo: aSmallInteger