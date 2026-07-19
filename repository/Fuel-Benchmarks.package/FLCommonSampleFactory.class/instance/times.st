samples
times

	^ (1 to: self problemSize) collect: [ :index |
		Time seconds: index \\ (60*60*24) nanoSeconds: index ]