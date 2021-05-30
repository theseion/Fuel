testing
shouldSerializeBehaviorFully: aBehavior
	^ self shouldConsiderAllBehaviorsInternal or: [
		(internalBehaviors includes: aBehavior instanceSide) or: [
			(internalBehaviors includes: aBehavior classSide) or: [
					"anonymous behavior"
				(self class environment includes: aBehavior instanceSide) not ] ] ]
		" or: [
			self class environment
				associationAt: aBehavior instanceSide name
					ifPresent: [ :assoc | internalBehaviors includes: assoc ]
					ifAbsent: [ false ] ] ]"