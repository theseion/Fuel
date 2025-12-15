# Migration
Often, we need to load objects whose class has changed since it was saved. This page documents how to load them in the different cases. Imagine we serialized an instance of `Point` and we need to materialize it when `Point` class has changed.

## Shape Changes
Let's start with the easier cases. If a variable was inserted, its value will be `nil`, as no value for this variable exists in the serialized state. If a variable is removed, it is also obvious: the serialized value will be ignored. In the case where variables retained their names but changed order, Fuel also handles this automatically.

A more interesting case is when variables were renamed, where the user can map old names to new ones. For example, to map the values of the old variable names `x` and `y` to `posX` and `posY`, respectively, we would write:
```smalltalk
FLMaterializer new
	migrateClassNamed: #Point
	variables: {'x' -> 'posX'. 'y' -> 'posY'}.
```

Not surprisingly, if variables were renamed and no migration operation was specified, the change will be understood by Fuel as two independent operations, a removal (old variable names no longer exist), and an insertion (two new variables, both with values `nil`).

Class renaming operations should be specified this way:
```smalltalk
FLMaterializer new
	migrateClassNamed: #Point
	toClass: Coordinate.
```

In addition to the methods mentioned above, the method `FLMaterializer>>#migrateClassNamed:toClass:variables:` can be used to combine both class and variable renaming operations.

Lastly, it is possible for clases to undergo layout changes. For example, `Point` could change from being fixed to variable. This specific case is also automatically handled by Fuel. Unfortunately, the inverse (variable to fixed) is not supported.

You can find tests related to this guide in `FLMigrationTest`. Additionally, the method `#FLMaterializer>>#environment:` can be useful for migrations: you can prepare an ad-hoc environment dictionary with the same keys that were used during serialization, but with the new classes as values.