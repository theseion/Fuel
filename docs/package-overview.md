Fuel is a general purpose serializer and it is highly customizable to cope with different objects and scenarios. Below we describe the main packages that are available in our repository. For simplicitly we omit testing packages.

## Fuel
This is the "core" of Fuel. It works as a general purpose serializer and all it does is serialize and materialize. If the graph you provide to serialize contains classes, they will all be considered as "global". That is, in serialization we just store its global name and during materialization we read the global name and we search it in Smalltalk globals. Therefore, classes have to be present in the image you are materializing. For most users this package should be enough.

## FuelMetalevel
This is an extension to Fuel package and what it does is to add the knowledge of how to correctly serialize and materialize classes, traits, method dictionaries, compiled methods etc. It knows how to serialize a class and correctly materialize it. However, FuelMetalevel just do that: serialize and materialize. Nothing else. It does not send class side #initialize, it does not notify the system, it does not add the class to Smalltalk globals, no nothing.

## FuelPreview
It is a package to visualize the objects graphs being serialized. This is very useful to understand the transitive closure it is being serialized. This package depends on Roassal, a new visualization engine. FuelPreview is not installed by default, see more information in our Debugging guide.

## FuelBenchmarks
Fuel contains a large suite of benchmarks that analyzes the speed of the serialization/materialization and the resulted size of the stream. It can be used to benchmark itself by comparing the results with previous versions or after certain change. For important changes we always run these benchmarks to see if we have not significantly decreased in performance. In addition, we have created adaptors so that we can benchmark Fuel agains other serializers. For more details read the class comments of FLBenchmarks.

## FuelExamples
It is a small package that just contains some examples so that you can get started. Nevertheless, we recommend you to read the tests in case of more detailed scenarios.

## FuelProgressUpdate
This is a small package that adds to Fuel the possibility of showing a smart progress bar while the graph is being serialized or materialized. This is very useful for really large serializations like the case of Moose models where you want to inform the user the progress.