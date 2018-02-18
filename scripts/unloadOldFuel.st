"Images with integrated Fuel will not be able to load a new package structure"
RPackageOrganizer default packages
  select: [ :package | package packageName beginsWith: 'Fuel' ]
  thenDo: [ :package |
    (package class canUnderstand: #removeFromSystem)
       ifTrue: [ package removeFromSystem ]
       ifFalse: [
         package definedClasses do:[ :classToRemove |
           classToRemove removeFromSystem ].
         package organizer unregisterPackage: package ] ]
