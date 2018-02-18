serializing
run

	^ self title
		displayProgressFrom: 0 to: 100 
		during: [ :bar | 
			progressBar := bar.
			super run ]
