tests
testContextThisContext
	| materializedContext context |
	context := thisContextSample.
	materializedContext := self resultOfSerializeAndMaterialize: context.

	self deny: context identicalTo: materializedContext.
	"I cannot compare by = because MethodContext do not implement it and it will finally use the identity."
	self assert: context pc equals: materializedContext pc.
	self assert: context stackPtr equals: materializedContext stackPtr.
	self assert: context method equals: materializedContext method.
	self assert: context receiver equals: materializedContext receiver.
	"I cannot compare by = because MethodContext do not implement it and it will finally use the identity."
	self deny: context sender identicalTo: materializedContext sender.
	self assert: context sender pc identicalTo: materializedContext sender pc.
	self assert: context sender stackPtr equals: materializedContext sender stackPtr
	"etc...."