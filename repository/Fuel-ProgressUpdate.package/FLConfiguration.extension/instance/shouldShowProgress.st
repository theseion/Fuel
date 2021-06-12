*Fuel-ProgressUpdate
shouldShowProgress
	^ map
		at: #showProgress
		ifAbsent: [ self class defaultShowProgress ]