*Fuel-ProgressUpdate
shouldShowProgress
	^ self
		at: #showProgress
		ifAbsent: [ self class defaultShowProgress ]