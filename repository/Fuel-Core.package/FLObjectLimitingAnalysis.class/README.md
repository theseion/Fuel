I am a specialized analysis that limits the size of the serialized graph to a configured number of objects.

I know how many object have been analyzed and when the configured limit is reached. When the limit has been reached I can signal an exception (if configured) and will ignore all further objects.

I am used by FLSerialization to build the graph of objects to serialize.