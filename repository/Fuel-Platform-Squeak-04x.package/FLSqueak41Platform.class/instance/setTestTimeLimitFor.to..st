accessing-tests
setTestTimeLimitFor: aTest to: aDuration
	| testProcess |
	testProcess := Processor activeProcess.	
	[ aDuration asDelay wait.
	testProcess isTerminated ifFalse: [
		testProcess signalException: (Error new
			messageText: 'Test timed out';
			yourself) ] ] forkAt: Processor activePriority + 1