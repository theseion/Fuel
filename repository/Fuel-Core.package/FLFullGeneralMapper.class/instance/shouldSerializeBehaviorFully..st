testing
shouldSerializeBehaviorFully: aBehavior
	^ (internalBehaviors includes: aBehavior instanceSide) or: [
		(internalBehaviors includes: aBehavior classSide) or: [
			self isBehaviorAnonymous: aBehavior ] ]