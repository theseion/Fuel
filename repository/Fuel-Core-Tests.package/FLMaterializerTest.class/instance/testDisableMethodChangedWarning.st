tests-configuring
testDisableMethodChangedWarning
	self deny: self materializer isMethodChangedWarningDisabled.
	
	self materializer disableMethodChangedWarning.
	self assert: self materializer isMethodChangedWarningDisabled