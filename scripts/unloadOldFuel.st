"Images with integrated Fuel will not be able to load a new package structure"
PackageOrganizer default packages
  select: [ :package | package name beginsWith: 'Fuel' ]
  thenDo: [ :package |
    (package class canUnderstand: #removeFromSystem)
       ifTrue: [ package removeFromSystem ]
       ifFalse: [
         package definedClasses do:[ :classToRemove |
           classToRemove removeFromSystem ].
         package organizer unregisterPackage: package ] ].

"FLFuelCliHandler is sometimes not cleaned up and the pragma cache
still references the #commandSpecification method"
((Pragma allNamed: #commandline)
  detect: [ :pragma | 
    pragma methodClass isObsolete ]
  ifNone: []) methodClass removeSelector: #commandSpecification.
Smalltalk garbageCollect.
self assert: ((Pragma allNamed: #commandline) noneSatisfy: [ :pragma |
  pragma methodClass isObsolete ])


