helper
benchmarkNameForSelector: selector
	^ (super benchmarkNameForSelector: selector), '--', sample title, '--', (streamFactory className copyWithoutAll: ' ')