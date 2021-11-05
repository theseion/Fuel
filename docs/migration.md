Often, we need to load objects whose class has changed since it was saved. In this document how to load them in the different cases. The figure below is useful to explain some of them. Imagine we serialized an instance of `Point` and we need to materialize it when `Point` class has changed.

# ShapeChanges
Let's start with the easier cases. If a variable was inserted, its value will be nil. If removed, it is also obvious: the serialized value will be ignored. In the case the variables are the same the the order changed, Fuel also tolerates it automatically. A more interesting case is when a variable was renamed, where the user can map old names to new ones. In our example:
```smalltalk
FLMaterializer newDefault
	migrateClassNamed: #Point
	variables: {'x' -> 'posX'. 'y' -> 'posY'}.
```
Not surprisingly, if nothing specified the change will be understood by Fuel as two independent operations, an insertion and a removal.The last change in the figure is a class rename. This should be specified this way:
```smalltalk
FLMaterializer newDefault
	migrateClassNamed: #Point
	toClass: Coordinate.
```
It is also available `#migrateClassNamed:toClass:variables:` to combine both class and variable rename.Although not illustrated in the figure, a class could also change its layout. For example, `Point` could change from being fixed to variable. This should be also automatically tolerated by Fuel. Unfortunately, the inverse (variable to fixed) is not supported so far.You can find tests related to this guide in `FLMigrationTest`. Additionally, the method `globalEnvironment:`, showed in [Managing Globals](managing-globals.md), might be useful for migrations: you can prepare an ad-hoc environment dictionary with the same keys that were used during serialization, but with the new classes as values.