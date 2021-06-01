testing
shouldSerializeBehaviorFully: aBehavior
	^ self shouldConsiderAllBehaviorsInternal or: [
		(internalBehaviors includes: aBehavior instanceSide) or: [
			(internalBehaviors includes: aBehavior classSide) or: [
				self isBehaviorAnonymous: aBehavior ] ] ]