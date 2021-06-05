materializing
materialize
	^ self configuration streamDo: [ :stream |
		self basicMaterializeFrom: stream ]
		