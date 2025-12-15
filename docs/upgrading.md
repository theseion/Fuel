# Upgrading Fuel
Each Fuel version has its own stream format. Furthermore, each version is considered incompatible with other versions. In Fuel 5 this requirement was changed, such that all versions with the same major version are considered compatible.

This means, in general, that when upgrading Fuel, we will need to convert our serialized streams.

**Notes**
1. We assume in these examples that the number of objects to migrate can be materialized all at the same time, which might not be possible in practice. In such a case, the script could split the list of files and perform the migration in batches.
2. It is necessary to fetch the materializer class dynamically after the desired Fuel version has been loaded. The binding of a static class reference might be stale and point to an old version of the class instead of the newly installed one.
3. This script should be evaluated in the original image, as versions are usually backwards-compatible, but not vice-versa.

Let's say, we have some files serialized with Fuel 3.0.0 and we want to migrate them to Fuel 3.0.3. The following example works in Pharo 8:
```smalltalk
| oldVersion newVersion fileNames objectsByFileName materializerClass serializerClass |
oldVersion := '3.0.0'.
newVersion := '3.0.3'.
fileNames := #('a.fuel' 'b.fuel' 'c.fuel' 'd.fuel' 'e.fuel').
objectsByFileName := Dictionary new.

materializerClass := Smalltalk at: #FLMaterializer.
fileNames do: [ :fileName | 
	objectsByFileName 
		at: fileName 
		put: (materializerClass materializeFromFileNamed: fileName) ].

Metacello new
	repository: 'github://theseion/Fuel:3.0.3/repository';
	baseline: 'Fuel';
	onConflictUseIncoming;
	load.

serializerClass := Smalltalk at: #FLSerializer.

objectsByFileName keysAndValuesDo: [ :fileName :objects |
	serializerClass 
		serialize: objects  
		toFileNamed: 'migrated-', fileName
	 ].
```

## Considerations
We know that it is possible to upgrade from Fuel 3.0.3 to Fuel 5.2.2 directly, using the method detailed above. However, due to the nature of Fuel and changes to the internal objects across different versions of Fuel and Squeak, we cannot guarantee that this will work for everyone. For example, Fuel version 5 has no concept of `BlockContext`, because it was renamed to `Context` in later versions. Hence, Fuel 5 in Pharo 8 will not be able to serialize `BlockContext`.