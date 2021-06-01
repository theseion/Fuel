testing
isBehaviorAnonymous: aBehavior
	^ (self environment includes: aBehavior instanceSide)
		ifTrue: [ false ]
		ifFalse: [
			aBehavior isObsolete ifTrue: [
				FLObsolete signalWithName: aBehavior name ].
			 true ]