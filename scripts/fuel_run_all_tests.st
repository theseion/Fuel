"find test classes and prepare test suite"
packages := PackageOrganizer default packages select: [ :package |
	((package packageName findString: 'Fuel') > 0)
	and: [ (package packageName findString: 'Test') > 0] ].
testClasses := packages gather: [ :package | package classes ].
suite := TestSuite new.
testClasses do: [ :class | 
	(class theNonMetaClass inheritsFrom: TestCase) ifTrue: [
		class addToSuiteFromSelectors: suite ] ].

"run tests visually (with open test runner GUI)"
TestRunner open model runSuite: suite.
