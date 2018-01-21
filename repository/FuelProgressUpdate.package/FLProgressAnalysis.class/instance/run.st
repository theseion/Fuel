analyzing
run

	^ self title
		displayProgressFrom: 0 to: 100 
		during: [ :bar | 
			progressBar := bar.
			remainingCheckpoints := self checkpoints.
			totalNumberOfCheckpoints := remainingCheckpoints size.
			super run ]