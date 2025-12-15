+++
+++
<div style="margin: 1rem 0; padding: 0.5rem 1rem 0.5rem 0.75rem; border-inline-start: 0.25rem solid yellow; border-radius:0.25">
    <span style="color=yellow">IMPORTANT</span>
    <p>
        The information on this page refers to versions < 5.
    </p>
</div>

# Built-in Header Support
Since the graph of objects serialized in a file can be large, and it can be useful to query some small extra info, Fuel supports the possibility to easily add such information in a header. The following examples show this set of features:
```smalltalk
| serializer |
serializer := FLSerializer newDefault.

serializer header 
	at: #timestamp
	putAdditionalObject: TimeStamp now.

serializer header
	addPreMaterializationAction: [ 
		Transcript show: 'Before serializing'; cr ].

serializer header
	addPostMaterializationAction: [ :materialization | 
		Transcript 
			show: 'Serialized at ';
			show: (materialization additionalObjectAt: #timestamp); 
			cr;
			show: 'Materialized at ';
			show: TimeStamp now; 
			cr ].
	
serializer 
	serialize: 'a big amount of data' 
	toFileNamed: 'demo.fl'
```

Then, you can just materialize the header info:
```smalltalk
| aHeader |
aHeader := FLMaterializer materializeHeaderFromFileNamed: 'demo.fl'.
aHeader additionalObjectAt: #timestamp.
```

Printing it, the result is:
```smalltalk
'28 March 2013 12:44:54 pm'
```
If we normally materialize the whole file with:
```smalltalk
FLMaterializer materializeFromFileNamed: 'demo.fl' 
```

Then, the print of the results is:
```smalltalk
'a big amount of data'
```

And this is shown in Transcript:
```
Before serializing
Serialized at 28 March 2013 12:50:50 pm
Materialized at 28 March 2013 1:01:21 pm
For additional examples, you can see tests in FLHeaderSerializationTest.
```