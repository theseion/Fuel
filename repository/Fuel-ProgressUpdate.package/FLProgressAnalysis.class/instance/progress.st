progress handling
progress

	^ 100 * (1 - (remainingCheckpoints size / totalNumberOfCheckpoints))