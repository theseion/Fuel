I am a wrapper for the results of a serialization.

I make it easy to access all objects that might be of interest after a materialization:
- the header
- the additional objects stored in the header
- the root object
When the materialization materialized multiple root objects (see FLMaterializer>>materializeObjectCollection) I hold collections of headers and root objects, with #header and #root answering the respective objects from the last materialization.

Instances of myself is answered by FLMaterializer>>materialize, #materializeObjectCollection and #materializeHeader.

Use #header, #root and #additionalObjectAt: to retrieve objects from a materialization. If my instance was the answer to #materializeObjectCollection you can retrieve all of the objects with #objects and the respective headers with #headers.