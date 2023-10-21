+++
+++
<div style="margin: 1rem 0; padding: 0.5rem 1rem 0.5rem 0.75rem; border-inline-start: 0.25rem solid yellow; border-radius:0.25">
    <span style="color=yellow">IMPORTANT</span>
    <p>
        The debugging packages are no longer being maintained. The documentation below was written for version 1.8.1 but is left here for posterity.
    </p>
</div    

There are a couple of packages that help us debugging Fuel. To understand the output of the tools in this guide, you should know some basics of how Fuel internally works.
# Serialization
The most important thing to remark is that serialization is split in two main steps: analysis and encoding.
## Analysis
It consists in a graph iteration, mapping each traversed object to its correspondent grouping, called cluster.
## Encoding
After analysis, we linearly write on the stream, in these steps:
1. header
1. for each cluster, instances part
1. for each cluster, references part
1. trailer

# Materialization
It consists on progressively recreating the graph.
## Decoding
This is done by linearly reading from the stream. So, steps are obviously analogous to the ones above:
1. header
1. for each cluster, instances part
1. for each cluster, references part
1. trailer

# Debug Tools
Ensure you have them with:
```smalltalk
(ConfigurationOfFuel project version: '1.8.1') 
    load: #(FuelDebug FuelPreview).
Next, a transcript of some useful class comments.
FLGraphViewBuilder
I add draw capabilities to analysis in FuelDebug package.Right-click a node for inspect it. Some examples:
(FLAnalyzer newDefault
    setDebug;
    analysisFor: #((1) (2) (3) (4)))
    open.
(FLAnalyzer newDefault
    setDebug;
    analysisFor: #((1) (2) (3) (4)))
    openPathsTo: 3.
(FLAnalyzer newDefault
    setDebug;
    analysisFor: #((1) (2) (3) (4)))
    openPathsToEvery: [:o | o isNumber and: [o > 2] ].
```
They look like: {{< figure src="/static/fuel-preview.png" title="Fuel Preview" >}}

## FLDebugSerialization
I am a serialization which facilitates debugging, by logging the stream position before and after main steps of `FLSerialization`, including cluster information. Obviously, you should be familiar with such class and the algorithm to understand the output log.To use, send #setDebug to your serializer and run as usually. For example:
```smalltalk
FileStream forceNewFileNamed: 'debug.fuel' do: [:aFile |
    FLSerializer newDefault
        setDebug;
        serialize: ''hello'' on: aFile binary ]
```
Then, inspect the output log:
```smalltalk
FLDebugSerialization last log
```

## FLDebugMaterialization
I am a materialization which facilitates debugging, by logging the stream position before and after main steps of `FLMaterialization`, including cluster information. Obviously, you should be familiar with such class and the algorithm to understand the output log.To use, send `#setDebug` to your serializer and run as usually. For example:
```smalltalk
FileStream oldFileNamed: 'debug.fuel' do: [:aFile |
    FLMaterializer newDefault
        setDebug;
        materializeFrom: aFile binary ]
```
Then, inspect the output log:
```smalltalk
FLDebugMaterialization last log
```

There are a couple of packages that help us debugging Fuel. To understand the output of the tools in this guide, you should know some basics of how Fuel internally works.